import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat_flutter/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat_flutter/screens/welcome_screen.dart';
import 'package:flash_chat_flutter/screens/login_screen.dart';
import 'package:flash_chat_flutter/screens/registration_screen.dart';
import 'package:flash_chat_flutter/screens/chat_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // FirestoreSerivce notes = FirestoreSerivce();
    // notes.addNote('Nigga');
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomeScreen(),
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          ChatScreen.id: (context) => ChatScreen(),
        });
  }
}


class FirestoreSerivce{
  final CollectionReference notes = FirebaseFirestore.instance.collection('notes');
  Future<void> addNote(String note){
    return  notes.add({
      'note': note,
      'timestamp': Timestamp.now(),
    });
  }
}