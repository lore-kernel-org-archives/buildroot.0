From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Dec 2020 09:44:13 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/apitrace: disable
 unit tests
Message-ID: <20201224083318.4FF72888C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a76c9fd92db34266843dcecc441af97bd3800b3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

This will avoid the following build failure with xtensa:

[ 62%] Linking CXX executable ../../guids_test
[ 62%] Building CXX object retrace/CMakeFiles/retrace_common.dir/retrace.cpp.o
CMakeFiles/guids_test.dir/guids_test.cpp.o:(.debug_line+0xf7b): dangerous relocation: overflow after relaxation
collect2: error: ld returned 1 exit status
lib/guids/CMakeFiles/guids_test.dir/build.make:85: recipe for target 'guids_test' failed

Fixes:
 - http://autobuild.buildroot.org/results/8fea93a88bb34e98e391a048c3b996b45ebac803

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0d209dce35d3484ac94d949cfd656d81c21cd41d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-CMakeLists.txt-respect-BUILD_TESTING-OFF.patch | 104 +++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/package/apitrace/0003-CMakeLists.txt-respect-BUILD_TESTING-OFF.patch b/package/apitrace/0003-CMakeLists.txt-respect-BUILD_TESTING-OFF.patch
new file mode 100644
index 0000000000..8cc1f8bb0b
--- /dev/null
+++ b/package/apitrace/0003-CMakeLists.txt-respect-BUILD_TESTING-OFF.patch
@@ -0,0 +1,104 @@
+From 7f0f1e7e34f997eef697856804dd478b54bb365e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 22 Dec 2020 10:45:21 +0100
+Subject: [PATCH] CMakeLists.txt: respect BUILD_TESTING=OFF
+
+Allow the user to disable unit tests through BUILD_TESTING=OFF:
+https://cmake.org/cmake/help/latest/command/enable_testing.html
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/apitrace/apitrace/pull/698]
+---
+ CMakeLists.txt           | 6 +++++-
+ gui/CMakeLists.txt       | 6 ++++--
+ lib/guids/CMakeLists.txt | 6 ++++--
+ lib/os/CMakeLists.txt    | 6 ++++--
+ lib/trace/CMakeLists.txt | 6 ++++--
+ 5 files changed, 21 insertions(+), 9 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 4a07f069..ee401887 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -41,6 +41,8 @@ option (ENABLE_FRAME_POINTER "Disable frame pointer omission" ON)
+ 
+ option (ENABLE_ASAN "Enable Address Sanitizer" OFF)
+ 
++option (BUILD_TESTING "Enable unit tests" ON)
++
+ option (ENABLE_TESTS "Enable additional tests" OFF)
+ 
+ if (ANDROID)
+@@ -433,7 +435,9 @@ endmacro ()
+ # which subdirectory they are declared
+ set (CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
+ 
+-enable_testing ()
++if (BUILD_TESTING)
++    enable_testing ()
++endif ()
+ if (CMAKE_CROSSCOMPILING)
+     add_custom_target (check)
+ elseif (DEFINED CMAKE_BUILD_TYPE)
+diff --git a/gui/CMakeLists.txt b/gui/CMakeLists.txt
+index 5baf3552..ad6ee501 100644
+--- a/gui/CMakeLists.txt
++++ b/gui/CMakeLists.txt
+@@ -13,8 +13,10 @@ add_library (qubjson STATIC
+     qubjson.cpp
+ )
+ 
+-add_gtest (qubjson_test qubjson_test.cpp)
+-target_link_libraries (qubjson_test qubjson)
++if (BUILD_TESTING)
++    add_gtest (qubjson_test qubjson_test.cpp)
++    target_link_libraries (qubjson_test qubjson)
++endif ()
+ 
+ set(qapitrace_SRCS
+    apisurface.cpp
+diff --git a/lib/guids/CMakeLists.txt b/lib/guids/CMakeLists.txt
+index ce0f86da..ea28a18f 100644
+--- a/lib/guids/CMakeLists.txt
++++ b/lib/guids/CMakeLists.txt
+@@ -5,5 +5,7 @@ add_library (guids STATIC
+     guids.hpp
+ )
+ 
+-add_gtest (guids_test guids_test.cpp)
+-target_link_libraries (guids_test guids)
++if (BUILD_TESTING)
++    add_gtest (guids_test guids_test.cpp)
++    target_link_libraries (guids_test guids)
++endif ()
+diff --git a/lib/os/CMakeLists.txt b/lib/os/CMakeLists.txt
+index 222411e0..b7134b57 100644
+--- a/lib/os/CMakeLists.txt
++++ b/lib/os/CMakeLists.txt
+@@ -36,5 +36,7 @@ if (APPLE)
+     )
+ endif ()
+ 
+-add_gtest (os_thread_test os_thread_test.cpp)
+-target_link_libraries (os_thread_test os)
++if (BUILD_TESTING)
++    add_gtest (os_thread_test os_thread_test.cpp)
++    target_link_libraries (os_thread_test os)
++endif ()
+diff --git a/lib/trace/CMakeLists.txt b/lib/trace/CMakeLists.txt
+index c68bd00f..d95df978 100644
+--- a/lib/trace/CMakeLists.txt
++++ b/lib/trace/CMakeLists.txt
+@@ -34,5 +34,7 @@ target_link_libraries (common
+     brotli_dec brotli_common
+ )
+ 
+-add_gtest (trace_parser_flags_test trace_parser_flags_test.cpp)
+-target_link_libraries (trace_parser_flags_test common)
++if (BUILD_TESTING)
++    add_gtest (trace_parser_flags_test trace_parser_flags_test.cpp)
++    target_link_libraries (trace_parser_flags_test common)
++endif ()
+-- 
+2.29.2
+
