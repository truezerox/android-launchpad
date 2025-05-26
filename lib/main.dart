import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: "LaunchPad",
            debugShowCheckedModeBanner: false, // remove the debug banner
            home: SafeArea(
                child: Scaffold(
                    appBar: AppBar( //changing the color inside the text var)
                        title: Text("LaunchPad",
                            style: GoogleFonts.orbitron(),

                        ),
                        backgroundColor: Colors.black,
                    ),

                    // wrap the body
                    body: Center(
                        child: Wrap(
                            spacing: 6,
                            runSpacing: 6,
                            alignment: WrapAlignment.center,
                            children: [
                                Pad(Color(0xffADCBFC), Color(0xff067CCB), "1.mp3"),
                                Pad(Color(0xffff2525), Color(0xffc40050), "2.mp3"),
                                Pad(Color(0xffADCBFC), Color(0xff067CCB), "3.mp3"),
                                Pad(Color(0xffE247FC), Color(0xffA23AB7), "4.mp3"),
                                Pad(Color(0xffADCBFC), Color(0xff067CCB), "5.mp3"),
                                Pad(Color(0xffff2525), Color(0xffc40050), "6.mp3"),
                                Pad(Color(0xffADCBFC), Color(0xff067CCB), "7.mp3"),
                                Pad(Color(0xffE247FC), Color(0xffA23AB7), "8.mp3"),
                                Pad(Color(0xffADCBFC), Color(0xff067CCB), "9.mp3"),
                                Pad(Color(0xffff2525), Color(0xffc40050), "10.mp3"),
                                Pad(Color(0xffADCBFC), Color(0xff067CCB), "11.mp3"),
                                Pad(Color(0xffE247FC), Color(0xffA23AB7), "12.mp3"),
                                Pad(Color(0xffADCBFC), Color(0xff067CCB), "13.mp3"),
                                Pad(Color(0xffff2525), Color(0xffc40050), "14.mp3"),
                                Pad(Color(0xffADCBFC), Color(0xff067CCB), "15.mp3"),
                                Pad(Color(0xffE247FC), Color(0xffA23AB7), "16.mp3"),
                                Pad(Color(0xffADCBFC), Color(0xff067CCB), "17.mp3"),
                                Pad(Color(0xffff2525), Color(0xffc40050), "18.mp3"),
                                Pad(Color(0xffADCBFC), Color(0xff067CCB), "19.mp3"),
                                Pad(Color(0xffE247FC), Color(0xffA23AB7), "20.wav"),
                                Pad(Color(0xffADCBFC), Color(0xff067CCB), "21.mp3"),
                                Pad(Color(0xffff2525), Color(0xffc40050), "22.wav"),
                                Pad(Color(0xffADCBFC), Color(0xff067CCB), "23.wav"),
                                Pad(Color(0xffE247FC), Color(0xffA23AB7), "24.wav"),
                                Pad(Color(0xffADCBFC), Color(0xff067CCB), "25.wav"),
                                Pad(Color(0xffff2525), Color(0xffc40050), "26.wav"),
                                Pad(Color(0xffADCBFC), Color(0xff067CCB), "27.wav"),
                                Pad(Color(0xffE247FC), Color(0xffA23AB7), "28.wav"),

                            ],

                        ),
                    ),
                    backgroundColor: Colors.black,
                ),

            )
        );
    }
}

// end of start

//stateful widget with the color vars
class Pad extends StatefulWidget {
    final colorCenter;
    final colorOutline;
    final note;
    const Pad(this.colorCenter, this.colorOutline, this.note, {Key? key});

    @override
    State<Pad> createState() => _PadState();
}
// classes and stuff
class _PadState extends State<Pad> {
    late Color _colorCenter;
    late Color _colorOutline;
    final player = AudioPlayer();

    //second stage of the app
    @override
    void initState() {
        _colorCenter = widget.colorCenter;
        _colorOutline = widget.colorOutline;
        super.initState();
    }

    //execution of the app
    @override
    Widget build(BuildContext context) {
        double width = MediaQuery.of(context).size.width;
        double height = MediaQuery.of(context).size.height;
        return GestureDetector(
            onTap: () async {
                setState(() {
                        _colorCenter = Colors.white;
                        _colorOutline = Colors.white;
                        player.play(AssetSource(widget.note),);
                    }
                );

                await Future.delayed(const Duration(milliseconds: 500));
                setState(() {
                        _colorCenter = widget.colorCenter;
                        _colorOutline = widget.colorOutline;

                    }
                );
            },
            child: Container(

                // calls for code on line 101 and 102
                height: height / 8.2,
                width: width / 4.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    gradient: RadialGradient(
                        colors: [_colorCenter,
                            _colorOutline],
                        radius: 0.5,
                    ),
                    boxShadow: [
                        BoxShadow(
                            color: Colors.pink,
                            blurRadius: 5.0,
                        )
                    ]
                ) ,
            )

        );
    }
}

