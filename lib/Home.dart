import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }

}

class HomeState extends State<Home> {

  int radioGroup = 0;
  double weight = 0.0;
  String userWeight;

  TextEditingController _userWeightController = new TextEditingController();


  void radioButtonHandler(int val){
    setState(() {
      radioGroup = val;
      userWeight = _userWeightController.text;

      switch(val){
        case 0:
          weight = calculateWeight(userWeight, 0.30);
          break;

        case 1:
          weight = calculateWeight(userWeight, 0.42);
          break;

        case 2:
          weight = calculateWeight(userWeight, 0.20);
          break;
      }

    });

  }

  double calculateWeight(String weight, double multiplier){
    return int.parse(weight) * multiplier;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: new AppBar(
        title: new Text("Weight of Planet X"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),

      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset(
                "images/planet.png",
              height: 133,
              width: 200,
            ),

            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[

                  new TextField(
                    controller: _userWeightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Your weight on Earth",
                      hintText: "In Pounds",
                      icon: new Icon(Icons.person_outline)
                    ),

                  ),

                  new Padding(padding: new EdgeInsets.all(5.0)),

                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      new Radio<int>(
                        activeColor: Colors.brown,
                          value: 0, groupValue: radioGroup, onChanged: radioButtonHandler,),

                      new Text("Pluto", style: new TextStyle(color: Colors.white30, fontSize: 17.0),),

                      new Radio<int>(
                        activeColor: Colors.red,
                          value: 1, groupValue: radioGroup, onChanged: radioButtonHandler),

                      new Text("Mars", style: new TextStyle(color: Colors.white30, fontSize: 17.0),),

                      new Radio<int>(
                        activeColor: Colors.orange,
                          value: 2, groupValue: radioGroup, onChanged: radioButtonHandler),

                      new Text("Venus", style: new TextStyle(color: Colors.white30, fontSize: 17.0),),

                    ],
                  ),

                  new Padding(padding: new EdgeInsets.all(15.6)),

                  new Text(
                    "Your weight in pounds is: $weight",
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 19.4,
                      fontWeight: FontWeight.w500
                    ),
                  ),

                ],
              ),
            )

          ],
        ),

      ),
    );
  }
}