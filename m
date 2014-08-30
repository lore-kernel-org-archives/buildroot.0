From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 30 Aug 2014 11:52:23 +0200
Subject: [Buildroot] [PATCH 1/5] package/libiqrf: fix static link
Message-ID: <1409392347-16392-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- libiqrf depends on pthread, so add a patch fixing the build-system that way
- disable shared object build when BR2_PREFER_STATIC_LIB is set

Fixes:
  http://autobuild.buildroot.net/results/210/2108f37e4a41af0b527c78e646e82f1cafa0353d/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 ...e-static-library-and-find-required-thread.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/libiqrf/libiqrf-0001-cmake-handle-static-library-and-find-required-thread.patch

diff --git a/package/libiqrf/libiqrf-0001-cmake-handle-static-library-and-find-required-thread.patch b/package/libiqrf/libiqrf-0001-cmake-handle-static-library-and-find-required-thread.patch
new file mode 100644
index 0000000..cfd7d54
--- /dev/null
+++ b/package/libiqrf/libiqrf-0001-cmake-handle-static-library-and-find-required-thread.patch
@@ -0,0 +1,45 @@
+From 46660112b76664473cc98b8ae6c863fd27c27d2d Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Fri, 29 Aug 2014 23:40:59 +0200
+Subject: [PATCH 1/1] cmake: handle static library and find required thread
+ module
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ CMakeLists.txt     | 2 ++
+ src/CMakeLists.txt | 4 +++-
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 79f644c..7779a2a 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -6,7 +6,9 @@ enable_testing()
+ # use local module (for Findlibusb-1.0.cmake)
+ set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/Modules/")
+ 
++find_package(Threads REQUIRED)
+ find_package(libusb-1.0 REQUIRED)
++
+ if (NOT LIBUSB_1_FOUND)
+ 	message(FATAL_ERROR "libusb-1.0 not installed. (try apt-get install libusb-1.0-0-dev)")
+ endif (NOT LIBUSB_1_FOUND)
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 149d198..0597ccd 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -18,8 +18,10 @@ set (iqrf_sources
+ 
+ include_directories ("${LIBUSB_1_INCLUDE_DIRS}")
+ 
+-add_library(iqrf SHARED ${iqrf_sources} ${iqrf_headers})
++add_library(iqrf ${iqrf_sources} ${iqrf_headers})
++
+ target_link_libraries(iqrf ${LIBUSB_1_LIBRARIES})
++target_link_libraries(iqrf ${CMAKE_THREAD_LIBS_INIT})
+ 
+ set_target_properties(iqrf PROPERTIES
+ 	VERSION "${iqrf_version_major}.${iqrf_version_minor}"
+-- 
+2.1.0
+
-- 
2.1.0
