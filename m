From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 13 Oct 2018 09:50:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/mjpg-streamer: Fix build without c++
Message-ID: <20181013075001.28039-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/1da/1da75a9d9b6e4d04d39117d2915c1d195dcae002/
http://autobuild.buildroot.net/results/3da/3da3f4099ccf62a314c099c5720dd5b1e9463914/
http://autobuild.buildroot.net/results/104/10438190453bd7ef7cc157929e74a9ffce9f7fdf/
http://autobuild.buildroot.net/results/91f/91fa80348db0c248649fe003df2dfa854f37a5a2/
http://autobuild.buildroot.net/results/4d7/4d7e722cf85a54d2813715e6b4ca1dd793e6d237/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-plugins-input_opencv-needs-c.patch   | 31 ++++++++++++++
 ...o-not-require-c-for-the-whole-projec.patch | 42 +++++++++++++++++++
 2 files changed, 73 insertions(+)
 create mode 100644 package/mjpg-streamer/0001-plugins-input_opencv-needs-c.patch
 create mode 100644 package/mjpg-streamer/0002-CMakeLists.txt-Do-not-require-c-for-the-whole-projec.patch

diff --git a/package/mjpg-streamer/0001-plugins-input_opencv-needs-c.patch b/package/mjpg-streamer/0001-plugins-input_opencv-needs-c.patch
new file mode 100644
index 0000000000..5eb66bd986
--- /dev/null
+++ b/package/mjpg-streamer/0001-plugins-input_opencv-needs-c.patch
@@ -0,0 +1,31 @@
+From 3b7d04d28a39bc697f5bd77f1072430692ac9f8b Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 13 Oct 2018 09:30:34 +0200
+Subject: [PATCH] plugins/input_opencv: needs c++
+
+This commit enables c++ for this plugin and is needed in preparation
+for the next commit which removes the c++ dependency for the whole
+mpjg-streamer project. Only this plugin needs c++.
+
+Patch sent upstream as PR 168.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ mjpg-streamer-experimental/plugins/input_opencv/CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/mjpg-streamer-experimental/plugins/input_opencv/CMakeLists.txt b/mjpg-streamer-experimental/plugins/input_opencv/CMakeLists.txt
+index 94ee26a..69e95e0 100644
+--- a/mjpg-streamer-experimental/plugins/input_opencv/CMakeLists.txt
++++ b/mjpg-streamer-experimental/plugins/input_opencv/CMakeLists.txt
+@@ -7,6 +7,7 @@ MJPG_STREAMER_PLUGIN_OPTION(input_opencv "OpenCV input plugin"
+                             ONLYIF OpenCV_FOUND)
+ 
+ if (PLUGIN_INPUT_OPENCV)
++    enable_language(CXX)
+     include_directories(${OpenCV_INCLUDE_DIRS})
+ 
+     MJPG_STREAMER_PLUGIN_COMPILE(input_opencv input_opencv.cpp)
+-- 
+2.19.1
+
diff --git a/package/mjpg-streamer/0002-CMakeLists.txt-Do-not-require-c-for-the-whole-projec.patch b/package/mjpg-streamer/0002-CMakeLists.txt-Do-not-require-c-for-the-whole-projec.patch
new file mode 100644
index 0000000000..3334c9098e
--- /dev/null
+++ b/package/mjpg-streamer/0002-CMakeLists.txt-Do-not-require-c-for-the-whole-projec.patch
@@ -0,0 +1,42 @@
+From 588db286da461ac5c02277b511ab58a7bf3f752f Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 13 Oct 2018 09:13:49 +0200
+Subject: [PATCH] CMakeLists.txt: Do not require c++ for the whole project
+
+Fixes buildroot build without c++ compiler:
+http://autobuild.buildroot.net/results/1da/1da75a9d9b6e4d04d39117d2915c1d195dcae002/build-end.log
+
+CMake Error at CMakeLists.txt:4 (project):
+  The CMAKE_CXX_COMPILER:
+
+    /home/buildroot/autobuild/run/instance-3/output/host/bin/arm-linux-g++
+
+  is not a full path to an existing compiler tool.
+
+  Tell CMake where to find the compiler by setting either the environment
+  variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full path
+  to the compiler, or to the compiler name if it is in the PATH.
+
+Patch sent upstream as PR 168.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ mjpg-streamer-experimental/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mjpg-streamer-experimental/CMakeLists.txt b/mjpg-streamer-experimental/CMakeLists.txt
+index 187b4e6..7b91729 100644
+--- a/mjpg-streamer-experimental/CMakeLists.txt
++++ b/mjpg-streamer-experimental/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ cmake_minimum_required(VERSION 2.8.3)
+ set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake ${CMAKE_MODULE_PATH})
+ 
+-project("mjpg-streamer")
++project("mjpg-streamer" C)
+ 
+ # If the user doesn't manually specify a build type, use 'Release'
+ message("CMAKE_BUILD_TYPE = ${CMAKE_BUILD_TYPE}")
+-- 
+2.19.1
+
-- 
2.19.1
