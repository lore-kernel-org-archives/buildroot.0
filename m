From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 5 May 2020 20:11:34 +0200
Subject: [Buildroot] [PATCH v1] package/qt5base: fix input_event related
 compile failure
In-Reply-To: <20200504214552.26570-1-ps.report@gmx.net>
References: <20200504214552.26570-1-ps.report@gmx.net>
Message-ID: <20200505201134.1a188f53@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  4 May 2020 23:45:52 +0200, Peter Seiderer <ps.report@gmx.net> wrote:

> Fixes:
> 
>   - http://autobuild.buildroot.net/results/af76190876656252eb6f60220cdb1d627a03b7c3
> 
>   evdevkeyboard/qevdevkeyboardhandler.cpp: In member function ?void QEvdevKeyboardHandler::switchLed(int, bool)?:
>   evdevkeyboard/qevdevkeyboardhandler.cpp:153:28: error: ?struct input_event? has no member named ?time?; did you mean ?type??
>        ::gettimeofday(&led_ie.time, 0);
>                               ^~~~
>                               type
> 
>   evdevtouch/qevdevtouchhandler.cpp: In member function ?void QEvdevTouchScreenData::processInputEvent(input_event*)?:
>   evdevtouch/qevdevtouchhandler.cpp:579:29: error: ?struct input_event? has no member named ?time?; did you mean ?type??
>            m_timeStamp = data->time.tv_sec + data->time.tv_usec / 1000000.0;
>                                ^~~~
>                                type
>   evdevtouch/qevdevtouchhandler.cpp:579:49: error: ?struct input_event? has no member named ?time?; did you mean ?type??
>            m_timeStamp = data->time.tv_sec + data->time.tv_usec / 1000000.0;
>                                                    ^~~~
>                                                    type
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...fix-input_event-time-related-compile.patch | 56 +++++++++++++++++++
>  ...fix-input_event-time-related-compile.patch | 56 +++++++++++++++++++
>  2 files changed, 112 insertions(+)
>  create mode 100644 package/qt5/qt5base/0005-evdevkeyboard-fix-input_event-time-related-compile.patch
>  create mode 100644 package/qt5/qt5base/0006-evdevtouch-fix-input_event-time-related-compile.patch
> 
> diff --git a/package/qt5/qt5base/0005-evdevkeyboard-fix-input_event-time-related-compile.patch b/package/qt5/qt5base/0005-evdevkeyboard-fix-input_event-time-related-compile.patch
> new file mode 100644
> index 0000000000..b1f64660eb
> --- /dev/null
> +++ b/package/qt5/qt5base/0005-evdevkeyboard-fix-input_event-time-related-compile.patch
> @@ -0,0 +1,56 @@
> +From e3821efb37d64d599760b82beac024804188b824 Mon Sep 17 00:00:00 2001
> +From: Peter Seiderer <ps.report@gmx.net>
> +Date: Mon, 4 May 2020 23:17:45 +0200
> +Subject: [PATCH 5/6] evdevkeyboard: fix input_event time related compile
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Fixes:
> +
> +  evdevkeyboard/qevdevkeyboardhandler.cpp: In member function ?void QEvdevKeyboardHandler::switchLed(int, bool)?:
> +  evdevkeyboard/qevdevkeyboardhandler.cpp:153:28: error: ?struct input_event? has no member named ?time?; did you mean ?type??
> +       ::gettimeofday(&led_ie.time, 0);
> +                              ^~~~
> +                              type
> +

Upstream: https://codereview.qt-project.org/c/qt/qtbase/+/299345

> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> +---
> + .../input/evdevkeyboard/qevdevkeyboardhandler.cpp   | 13 ++++++++++++-
> + 1 file changed, 12 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/platformsupport/input/evdevkeyboard/qevdevkeyboardhandler.cpp b/src/platformsupport/input/evdevkeyboard/qevdevkeyboardhandler.cpp
> +index 3555763b..de37f5e2 100644
> +--- a/src/platformsupport/input/evdevkeyboard/qevdevkeyboardhandler.cpp
> ++++ b/src/platformsupport/input/evdevkeyboard/qevdevkeyboardhandler.cpp
> +@@ -58,6 +58,14 @@
> + #include <linux/input.h>
> + #endif
> + 
> ++#ifndef input_event_sec
> ++#define input_event_sec time.tv_sec
> ++#endif
> ++
> ++#ifndef input_event_usec
> ++#define input_event_usec time.tv_usec
> ++#endif
> ++
> + QT_BEGIN_NAMESPACE
> + 
> + Q_LOGGING_CATEGORY(qLcEvdevKey, "qt.qpa.input")
> +@@ -149,8 +157,11 @@ void QEvdevKeyboardHandler::switchLed(int led, bool state)
> + {
> +     qCDebug(qLcEvdevKey, "switchLed %d %d", led, int(state));
> + 
> ++    struct timeval tv;
> ++    ::gettimeofday(&tv, 0);
> +     struct ::input_event led_ie;
> +-    ::gettimeofday(&led_ie.time, 0);
> ++    led_ie.input_event_sec = tv.tv_sec;
> ++    led_ie.input_event_usec = tv.tv_usec;
> +     led_ie.type = EV_LED;
> +     led_ie.code = led;
> +     led_ie.value = state;
> +-- 
> +2.26.2
> +
> diff --git a/package/qt5/qt5base/0006-evdevtouch-fix-input_event-time-related-compile.patch b/package/qt5/qt5base/0006-evdevtouch-fix-input_event-time-related-compile.patch
> new file mode 100644
> index 0000000000..8acbb905c5
> --- /dev/null
> +++ b/package/qt5/qt5base/0006-evdevtouch-fix-input_event-time-related-compile.patch
> @@ -0,0 +1,56 @@
> +From c9adb999cdb21f991f2c70b1d3b40e16d4fed2c0 Mon Sep 17 00:00:00 2001
> +From: Peter Seiderer <ps.report@gmx.net>
> +Date: Mon, 4 May 2020 23:19:25 +0200
> +Subject: [PATCH 6/6] evdevtouch: fix input_event time related compile
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Fixes:
> +
> +  evdevtouch/qevdevtouchhandler.cpp: In member function ?void QEvdevTouchScreenData::processInputEvent(input_event*)?:
> +  evdevtouch/qevdevtouchhandler.cpp:579:29: error: ?struct input_event? has no member named ?time?; did you mean ?type??
> +           m_timeStamp = data->time.tv_sec + data->time.tv_usec / 1000000.0;
> +                               ^~~~
> +                               type
> +  evdevtouch/qevdevtouchhandler.cpp:579:49: error: ?struct input_event? has no member named ?time?; did you mean ?type??
> +           m_timeStamp = data->time.tv_sec + data->time.tv_usec / 1000000.0;
> +                                                   ^~~~
> +                                                   type
> +

Upstream: https://codereview.qt-project.org/c/qt/qtbase/+/299345

Regards,
Peter

> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> +---
> + .../input/evdevtouch/qevdevtouchhandler.cpp            | 10 +++++++++-
> + 1 file changed, 9 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/platformsupport/input/evdevtouch/qevdevtouchhandler.cpp b/src/platformsupport/input/evdevtouch/qevdevtouchhandler.cpp
> +index c51db59e..94a9b103 100644
> +--- a/src/platformsupport/input/evdevtouch/qevdevtouchhandler.cpp
> ++++ b/src/platformsupport/input/evdevtouch/qevdevtouchhandler.cpp
> +@@ -58,6 +58,14 @@
> + #include <linux/input.h>
> + #endif
> + 
> ++#ifndef input_event_sec
> ++#define input_event_sec time.tv_sec
> ++#endif
> ++
> ++#ifndef input_event_usec
> ++#define input_event_usec time.tv_usec
> ++#endif
> ++
> + #include <math.h>
> + 
> + #if QT_CONFIG(mtdev)
> +@@ -576,7 +584,7 @@ void QEvdevTouchScreenData::processInputEvent(input_event *data)
> + 
> +         // update timestamps
> +         m_lastTimeStamp = m_timeStamp;
> +-        m_timeStamp = data->time.tv_sec + data->time.tv_usec / 1000000.0;
> ++        m_timeStamp = data->input_event_sec + data->input_event_usec / 1000000.0;
> + 
> +         m_lastTouchPoints = m_touchPoints;
> +         m_touchPoints.clear();
> +-- 
> +2.26.2
> +
