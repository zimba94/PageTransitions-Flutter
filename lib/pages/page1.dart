import 'package:flutter/material.dart';
import 'package:transition_app/pages/page2.dart';

class Page1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transitions"),
      ),
      body: Center(
        child: Text('Pagina 1'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow_outlined),
        onPressed: () {
          Navigator.push(context, _crearRuta());
        },
      ),
    );
  }

  Route _crearRuta() {
    return PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            Page2Page(),
        transitionDuration: Duration(seconds: 1),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curvedAnimation =
              CurvedAnimation(parent: animation, curve: Curves.easeInOut);

          // return SlideTransition(
          //     child: child,
          //     position: Tween<Offset>(begin: Offset(0.5, 1.0), end: Offset.zero)
          //         .animate(curvedAnimation));
          //

          // return ScaleTransition(
          //   scale: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
          //   child: child,
          // );

          // return RotationTransition(
          //   child: child,
          //   turns: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
          // );
          return RotationTransition(
            child: FadeTransition(
              child: child,
              opacity:
                  Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
            ),
            turns: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
          );
        });
  }
}
