From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 23:14:37 +0200
Subject: [Buildroot] [git commit] package/qt5/qt5base: fix input_event
 related compile failure
Message-ID: <20200509205857.3B97A912B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bbd91e41c8531a0ae06049cf6fdb9383c803e67f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  - http://autobuild.buildroot.net/results/af76190876656252eb6f60220cdb1d627a03b7c3

  evdevkeyboard/qevdevkeyboardhandler.cpp: In member function ???void QEvdevKeyboardHandler::switchLed(int, bool)???:
  evdevkeyboard/qevdevkeyboardhandler.cpp:153:28: error: ???struct input_event??? has no member named ???time???; did you mean ???type????
       ::gettimeofday(&led_ie.time, 0);
                              ^~~~
                              type

  evdevtouch/qevdevtouchhandler.cpp: In member function ???void QEvdevTouchScreenData::processInputEvent(input_event*)???:
  evdevtouch/qevdevtouchhandler.cpp:579:29: error: ???struct input_event??? has no member named ???time???; did you mean ???type????
           m_timeStamp = data->time.tv_sec + data->time.tv_usec / 1000000.0;
                               ^~~~
                               type
  evdevtouch/qevdevtouchhandler.cpp:579:49: error: ???struct input_event??? has no member named ???time???; did you mean ???type????
           m_timeStamp = data->time.tv_sec + data->time.tv_usec / 1000000.0;
                                                   ^~~~
                                                   type

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...oard-fix-input_event-time-related-compile.patch | 57 ++++++++++++++++++++++
 ...ouch-fix-input_event-time-related-compile.patch | 57 ++++++++++++++++++++++
 2 files changed, 114 insertions(+)

diff --git a/package/qt5/qt5base/0005-evdevkeyboard-fix-input_event-time-related-compile.patch b/package/qt5/qt5base/0005-evdevkeyboard-fix-input_event-time-related-compile.patch
new file mode 100644
index 0000000000..1ed397870c
--- /dev/null
+++ b/package/qt5/qt5base/0005-evdevkeyboard-fix-input_event-time-related-compile.patch
@@ -0,0 +1,57 @@
+From e3821efb37d64d599760b82beac024804188b824 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Mon, 4 May 2020 23:17:45 +0200
+Subject: [PATCH] evdevkeyboard: fix input_event time related compile
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+  evdevkeyboard/qevdevkeyboardhandler.cpp: In member function ???void QEvdevKeyboardHandler::switchLed(int, bool)???:
+  evdevkeyboard/qevdevkeyboardhandler.cpp:153:28: error: ???struct input_event??? has no member named ???time???; did you mean ???type????
+       ::gettimeofday(&led_ie.time, 0);
+                              ^~~~
+                              type
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+Upstream: https://github.com/qt/qtbase/commit/c5b8b662105cc5ced968da9f567fe1134c52d6b5
+---
+ .../input/evdevkeyboard/qevdevkeyboardhandler.cpp   | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/src/platformsupport/input/evdevkeyboard/qevdevkeyboardhandler.cpp b/src/platformsupport/input/evdevkeyboard/qevdevkeyboardhandler.cpp
+index 3555763b..de37f5e2 100644
+--- a/src/platformsupport/input/evdevkeyboard/qevdevkeyboardhandler.cpp
++++ b/src/platformsupport/input/evdevkeyboard/qevdevkeyboardhandler.cpp
+@@ -58,6 +58,14 @@
+ #include <linux/input.h>
+ #endif
+ 
++#ifndef input_event_sec
++#define input_event_sec time.tv_sec
++#endif
++
++#ifndef input_event_usec
++#define input_event_usec time.tv_usec
++#endif
++
+ QT_BEGIN_NAMESPACE
+ 
+ Q_LOGGING_CATEGORY(qLcEvdevKey, "qt.qpa.input")
+@@ -149,8 +157,11 @@ void QEvdevKeyboardHandler::switchLed(int led, bool state)
+ {
+     qCDebug(qLcEvdevKey, "switchLed %d %d", led, int(state));
+ 
++    struct timeval tv;
++    ::gettimeofday(&tv, 0);
+     struct ::input_event led_ie;
+-    ::gettimeofday(&led_ie.time, 0);
++    led_ie.input_event_sec = tv.tv_sec;
++    led_ie.input_event_usec = tv.tv_usec;
+     led_ie.type = EV_LED;
+     led_ie.code = led;
+     led_ie.value = state;
+-- 
+2.26.2
+
diff --git a/package/qt5/qt5base/0006-evdevtouch-fix-input_event-time-related-compile.patch b/package/qt5/qt5base/0006-evdevtouch-fix-input_event-time-related-compile.patch
new file mode 100644
index 0000000000..a24ac4f184
--- /dev/null
+++ b/package/qt5/qt5base/0006-evdevtouch-fix-input_event-time-related-compile.patch
@@ -0,0 +1,57 @@
+From c9adb999cdb21f991f2c70b1d3b40e16d4fed2c0 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Mon, 4 May 2020 23:19:25 +0200
+Subject: [PATCH] evdevtouch: fix input_event time related compile
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+  evdevtouch/qevdevtouchhandler.cpp: In member function ???void QEvdevTouchScreenData::processInputEvent(input_event*)???:
+  evdevtouch/qevdevtouchhandler.cpp:579:29: error: ???struct input_event??? has no member named ???time???; did you mean ???type????
+           m_timeStamp = data->time.tv_sec + data->time.tv_usec / 1000000.0;
+                               ^~~~
+                               type
+  evdevtouch/qevdevtouchhandler.cpp:579:49: error: ???struct input_event??? has no member named ???time???; did you mean ???type????
+           m_timeStamp = data->time.tv_sec + data->time.tv_usec / 1000000.0;
+                                                   ^~~~
+                                                   type
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+Upstream: https://github.com/qt/qtbase/commit/71fb4d081c7f3675939ac8c62063631a18175fd1
+---
+ .../input/evdevtouch/qevdevtouchhandler.cpp            | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/src/platformsupport/input/evdevtouch/qevdevtouchhandler.cpp b/src/platformsupport/input/evdevtouch/qevdevtouchhandler.cpp
+index c51db59e..94a9b103 100644
+--- a/src/platformsupport/input/evdevtouch/qevdevtouchhandler.cpp
++++ b/src/platformsupport/input/evdevtouch/qevdevtouchhandler.cpp
+@@ -58,6 +58,14 @@
+ #include <linux/input.h>
+ #endif
+ 
++#ifndef input_event_sec
++#define input_event_sec time.tv_sec
++#endif
++
++#ifndef input_event_usec
++#define input_event_usec time.tv_usec
++#endif
++
+ #include <math.h>
+ 
+ #if QT_CONFIG(mtdev)
+@@ -576,7 +584,7 @@ void QEvdevTouchScreenData::processInputEvent(input_event *data)
+ 
+         // update timestamps
+         m_lastTimeStamp = m_timeStamp;
+-        m_timeStamp = data->time.tv_sec + data->time.tv_usec / 1000000.0;
++        m_timeStamp = data->input_event_sec + data->input_event_usec / 1000000.0;
+ 
+         m_lastTouchPoints = m_touchPoints;
+         m_touchPoints.clear();
+-- 
+2.26.2
+
