import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'package:pics/src/models/image_model.dart';

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;

  void fetchImage() async {
    counter++;
    var response = await get(
        Uri.https('https://jsonplaceholder.typicode.com', '/photos/$counter'));
    var imageModel = ImageModel.fromJson(json.decode(response.body));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tap "+" to see images!'),
        ),
        body: Text('$counter'),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: fetchImage,
        ),
      ),
    );
  }
}
