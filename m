From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Sun,  1 Nov 2020 17:32:58 +0100
Subject: [Buildroot] [PATCH] package/gnuradio: fix qtgui build when
 gr-analog is not set
Message-ID: <20201101163258.32192-1-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

gr-qtgui examples needs to have gr-analog enabled, without this dependency
compile crash with:

In file included from
/x/output/build/gnuradio-3.8.1.0/gr-qtgui/examples/c++/display_qt.cc:22:
/x/output/build/gnuradio-3.8.1.0/gr-qtgui/examples/c++/display_qt.h:24:10:
fatal error: gnuradio/analog/noise_source.h: No such file or directory
24 | #include <gnuradio/analog/noise_source.h>
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [gr-qtgui/examples/c++/CMakeFiles/display_qt.dir/build.make:67:
gr-qtgui/examples/c++/CMakeFiles/display_qt.dir/display_qt.cc.o] Error 1
make[3]: *** Waiting for unfinished jobs....
In file included from
/somewhere/gnuradio/build/gr-qtgui/examples/c++/moc_display_qt.cpp:10:
/somewhere/gnuradio/build/gr-qtgui/examples/c++/../../../../gr-qtgui/examples/c++/display_qt.h:24:10:
fatal error: gnuradio/analog/noise_source.h: No such file or directory
24 | #include <gnuradio/analog/noise_source.h>
| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.

GR_ANALOG is not an explicit dependency of GR_QTGUI, so disable c++ examples if
user has not selected this option.

[backported from 7470a7a3771dd90defb826b464dfe62977cb1eb6]

Fixes:
- http://autobuild.buildroot.net/results/fde670499289f3d7d47379eebccf6e0f92c6d200/

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 ...add-examples-c-subdirectory-when-gr-.patch | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 package/gnuradio/0004-gr-qtgui-dont-t-add-examples-c-subdirectory-when-gr-.patch

diff --git a/package/gnuradio/0004-gr-qtgui-dont-t-add-examples-c-subdirectory-when-gr-.patch b/package/gnuradio/0004-gr-qtgui-dont-t-add-examples-c-subdirectory-when-gr-.patch
new file mode 100644
index 0000000000..034c10c5cc
--- /dev/null
+++ b/package/gnuradio/0004-gr-qtgui-dont-t-add-examples-c-subdirectory-when-gr-.patch
@@ -0,0 +1,55 @@
+From 268b1a599304f58bd56c86ff09041b5912c24a0c Mon Sep 17 00:00:00 2001
+From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+Date: Sun, 1 Nov 2020 17:24:36 +0100
+Subject: [PATCH] gr-qtgui: dont't add examples/c++ subdirectory when gr-analog
+ is disabled
+
+gr-qtgui examples needs to have gr-analog enabled, without this dependency
+compile crash with:
+
+In file included from
+/x/output/build/gnuradio-3.8.1.0/gr-qtgui/examples/c++/display_qt.cc:22:
+/x/output/build/gnuradio-3.8.1.0/gr-qtgui/examples/c++/display_qt.h:24:10:
+fatal error: gnuradio/analog/noise_source.h: No such file or directory
+24 | #include <gnuradio/analog/noise_source.h>
+| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+compilation terminated.
+make[3]: *** [gr-qtgui/examples/c++/CMakeFiles/display_qt.dir/build.make:67:
+gr-qtgui/examples/c++/CMakeFiles/display_qt.dir/display_qt.cc.o] Error 1
+make[3]: *** Waiting for unfinished jobs....
+In file included from
+/somewhere/gnuradio/build/gr-qtgui/examples/c++/moc_display_qt.cpp:10:
+/somewhere/gnuradio/build/gr-qtgui/examples/c++/../../../../gr-qtgui/examples/c++/display_qt.h:24:10:
+fatal error: gnuradio/analog/noise_source.h: No such file or directory
+24 | #include <gnuradio/analog/noise_source.h>
+| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+compilation terminated.
+
+GR_ANALOG is not an explicit dependency of GR_QTGUI, so disable c++ examples if
+user has not selected this option.
+
+[backported from 7470a7a3771dd90defb826b464dfe62977cb1eb6]
+
+Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+---
+ gr-qtgui/CMakeLists.txt | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/gr-qtgui/CMakeLists.txt b/gr-qtgui/CMakeLists.txt
+index 8831f3ad9..561186fbd 100644
+--- a/gr-qtgui/CMakeLists.txt
++++ b/gr-qtgui/CMakeLists.txt
+@@ -68,7 +68,9 @@ if(ENABLE_GR_QTGUI)
+ add_subdirectory(include/gnuradio/qtgui)
+ add_subdirectory(lib)
+ add_subdirectory(docs)
+-add_subdirectory(examples/c++)
++if (ENABLE_GR_ANALOG)
++	add_subdirectory(examples/c++)
++endif(ENABLE_GR_ANALOG)
+ if(ENABLE_PYTHON)
+     add_subdirectory(swig)
+     add_subdirectory(python/qtgui)
+-- 
+2.26.2
+
-- 
2.20.1
