From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed,  5 Feb 2020 15:49:55 +0100
Subject: [Buildroot] [PATCH] package/ninja: fix build for cmake 3.10
Message-ID: <20200205144955.31918-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

If the host cmake is 3.10, the configuration step produces
the following error:

CMake Error at CMakeLists.txt:87 (target_link_libraries):
Target "libninja" of type OBJECT_LIBRARY may not be linked into another
target. One may link only to STATIC or SHARED libraries, or to executables
with the ENABLE_EXPORTS property set.

This patch fixes CMakeLists.txt to use the object library as it was intended
in cmake 3.10.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 .../0003-CMake-fix-object-library-usage.patch | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 package/ninja/0003-CMake-fix-object-library-usage.patch

diff --git a/package/ninja/0003-CMake-fix-object-library-usage.patch b/package/ninja/0003-CMake-fix-object-library-usage.patch
new file mode 100644
index 0000000000..7a23b82895
--- /dev/null
+++ b/package/ninja/0003-CMake-fix-object-library-usage.patch
@@ -0,0 +1,57 @@
+From 7982ecebe1c1c41e82779a65fa2d93f19ffd755f Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Wed, 5 Feb 2020 12:28:44 +0100
+Subject: [PATCH 3/3] CMake: fix object library usage
+
+Object libraries cannot be use in target_link_libraries() command
+as they are no normal binary files like *.a or *.so but a collection
+of object files.
+
+See add_library() definition for details.
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ CMakeLists.txt | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index af8010f..028a7bb 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -83,8 +83,7 @@ target_compile_definitions(libninja PRIVATE _WIN32_WINNT=0x0601 __USE_MINGW_ANSI
+ endif()
+ 
+ # Main executable is library plus main() function.
+-add_executable(ninja src/ninja.cc)
+-target_link_libraries(ninja PRIVATE libninja libninja-re2c)
++add_executable(ninja src/ninja.cc $<TARGET_OBJECTS:libninja> $<TARGET_OBJECTS:libninja-re2c>)
+ 
+ # Tests all build into ninja_test executable.
+ add_executable(ninja_test
+@@ -106,11 +105,12 @@ add_executable(ninja_test
+ 	src/subprocess_test.cc
+ 	src/test.cc
+ 	src/util_test.cc
++	$<TARGET_OBJECTS:libninja>
++	$<TARGET_OBJECTS:libninja-re2c>
+ )
+ if(WIN32)
+ 	target_sources(ninja_test PRIVATE src/includes_normalize_test.cc src/msvc_helper_test.cc)
+ endif()
+-target_link_libraries(ninja_test PRIVATE libninja libninja-re2c)
+ 
+ foreach(perftest
+   build_log_perftest
+@@ -120,8 +120,7 @@ foreach(perftest
+   hash_collision_bench
+   manifest_parser_perftest
+ )
+-  add_executable(${perftest} src/${perftest}.cc)
+-  target_link_libraries(${perftest} PRIVATE libninja libninja-re2c)
++  add_executable(${perftest} src/${perftest}.cc $<TARGET_OBJECTS:libninja> $<TARGET_OBJECTS:libninja-re2c>)
+ endforeach()
+ 
+ enable_testing()
+-- 
+2.17.0
+
-- 
2.17.0
