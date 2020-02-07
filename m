From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 7 Feb 2020 15:59:07 +0100
Subject: [Buildroot] [git commit] package/ninja: fix build for cmake 3.10
Message-ID: <20200207144916.95B008D4D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb5ffe3c907ac2abc12d2d09d913c2fccaa71330
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If the host cmake is 3.10, the configuration step produces
the following error:

CMake Error at CMakeLists.txt:87 (target_link_libraries):
Target "libninja" of type OBJECT_LIBRARY may not be linked into another
target. One may link only to STATIC or SHARED libraries, or to executables
with the ENABLE_EXPORTS property set.

This patch fixes CMakeLists.txt to use the object library as it was intended
in cmake 3.10.

Fixes:
https://bugs.busybox.net/show_bug.cgi?id=12546

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Tested-by: Damian Tometzki <dti@familie-tometzki.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0003-CMake-fix-object-library-usage.patch      | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/package/ninja/0003-CMake-fix-object-library-usage.patch b/package/ninja/0003-CMake-fix-object-library-usage.patch
new file mode 100644
index 0000000000..8f8fac994e
--- /dev/null
+++ b/package/ninja/0003-CMake-fix-object-library-usage.patch
@@ -0,0 +1,56 @@
+From 7982ecebe1c1c41e82779a65fa2d93f19ffd755f Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Wed, 5 Feb 2020 12:28:44 +0100
+Subject: [PATCH] CMake: fix object library usage
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
+	src/subprocess_test.cc
+	src/test.cc
+	src/util_test.cc
++	$<TARGET_OBJECTS:libninja>
++	$<TARGET_OBJECTS:libninja-re2c>
+ )
+ if(WIN32)
+	target_sources(ninja_test PRIVATE src/includes_normalize_test.cc src/msvc_helper_test.cc)
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
