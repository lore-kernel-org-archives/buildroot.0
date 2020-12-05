From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Dec 2020 21:23:53 +0100
Subject: [Buildroot] [git commit] package/ninja: bump version to 1.10.2
Message-ID: <20201205201041.90A1F81944@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c1b71d184b0c104d49889c8d3f2460e1b3dd856
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- rebased 0001-set-minimum-cmake-version-to-3.10.patch

- removed 0002-remove-fdiagnostics-color-from-make-command.patch
  (superseeded by upstream commit [1])

- rebased package/ninja/0003-CMake-fix-object-library-usage.patch

[1] https://github.com/ninja-build/ninja/commit/418d59b8a6054ce9ef1a28c07c41d3a0bb386836

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-set-minimum-cmake-version-to-3.10.patch   | 20 ++++---
 ...move-fdiagnostics-color-from-make-command.patch | 29 ----------
 .../0003-CMake-fix-object-library-usage.patch      | 67 +++++++++++-----------
 package/ninja/ninja.hash                           |  4 +-
 package/ninja/ninja.mk                             |  2 +-
 5 files changed, 49 insertions(+), 73 deletions(-)

diff --git a/package/ninja/0001-set-minimum-cmake-version-to-3.10.patch b/package/ninja/0001-set-minimum-cmake-version-to-3.10.patch
index d75b78fde9..e53a136a94 100644
--- a/package/ninja/0001-set-minimum-cmake-version-to-3.10.patch
+++ b/package/ninja/0001-set-minimum-cmake-version-to-3.10.patch
@@ -1,4 +1,4 @@
-From 4645f74eb668cc1cf876d1e9bef933591da7575c Mon Sep 17 00:00:00 2001
+From 386fa849157dabde42ab39de7acb31750956490c Mon Sep 17 00:00:00 2001
 From: Adam Duskett <aduskett@gmail.com>
 Date: Mon, 3 Feb 2020 06:21:57 -0800
 Subject: [PATCH] set minimum cmake version to 3.10
@@ -10,21 +10,23 @@ Because we are not building ninja for Microsoft, it is safe to remove this
 macro and set the minimum version to 3.10.
 
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
+[Rebased for ninja-1.10.2 - CMP0091 usage was removed upstream by
+https://github.com/ninja-build/ninja/commit/e6f5bcffb3c561d228d88ff26edab26575b7d520]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
- CMakeLists.txt | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 60fd8a1..a040e0b 100644
+index 7f03c35..4b61479 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -1,5 +1,4 @@
+@@ -1,4 +1,4 @@
 -cmake_minimum_required(VERSION 3.15)
--cmake_policy(SET CMP0091 NEW)
 +cmake_minimum_required(VERSION 3.10)
- project(ninja)
  
- if(CMAKE_BUILD_TYPE MATCHES "Release")
+ include(CheckIncludeFileCXX)
+ include(CheckIPOSupported)
 -- 
-2.24.1
+2.29.2
 
diff --git a/package/ninja/0002-remove-fdiagnostics-color-from-make-command.patch b/package/ninja/0002-remove-fdiagnostics-color-from-make-command.patch
deleted file mode 100644
index d419ab48dc..0000000000
--- a/package/ninja/0002-remove-fdiagnostics-color-from-make-command.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 87caa8c4bc536f745aceed757ce8a492fbdba84f Mon Sep 17 00:00:00 2001
-From: Adam Duskett <aduskett@gmail.com>
-Date: Mon, 3 Feb 2020 07:36:58 -0800
-Subject: [PATCH] remove fdiagnostics-color from make command
-
--fdiagnostics-color was introduced in gcc 4.9 and the minimum supported version
-that Buildroot supports is 4.8.
-
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index a040e0b..af8010f 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -18,7 +18,7 @@ if(MSVC)
- 	set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")
- 	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /W4 /GR- /Zc:__cplusplus")
- else()
--	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-deprecated -fdiagnostics-color")
-+	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-deprecated")
- endif()
- 
- find_program(RE2C re2c)
--- 
-2.24.1
-
diff --git a/package/ninja/0003-CMake-fix-object-library-usage.patch b/package/ninja/0003-CMake-fix-object-library-usage.patch
index 8f8fac994e..9b9fe506a4 100644
--- a/package/ninja/0003-CMake-fix-object-library-usage.patch
+++ b/package/ninja/0003-CMake-fix-object-library-usage.patch
@@ -1,4 +1,4 @@
-From 7982ecebe1c1c41e82779a65fa2d93f19ffd755f Mon Sep 17 00:00:00 2001
+From 17539ae9d09ded695167911f9e3ec0cf4bc9fed9 Mon Sep 17 00:00:00 2001
 From: Yegor Yefremov <yegorslists@googlemail.com>
 Date: Wed, 5 Feb 2020 12:28:44 +0100
 Subject: [PATCH] CMake: fix object library usage
@@ -10,47 +10,50 @@ of object files.
 See add_library() definition for details.
 
 Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+[Rebased for for ninja-1.10.2]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
  CMakeLists.txt | 9 ++++-----
  1 file changed, 4 insertions(+), 5 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index af8010f..028a7bb 100644
+index 4b61479..3701f3a 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -83,8 +83,7 @@ target_compile_definitions(libninja PRIVATE _WIN32_WINNT=0x0601 __USE_MINGW_ANSI
+@@ -132,8 +132,7 @@ if(CMAKE_SYSTEM_NAME STREQUAL "OS400" OR CMAKE_SYSTEM_NAME STREQUAL "AIX")
  endif()
-
+ 
  # Main executable is library plus main() function.
 -add_executable(ninja src/ninja.cc)
 -target_link_libraries(ninja PRIVATE libninja libninja-re2c)
 +add_executable(ninja src/ninja.cc $<TARGET_OBJECTS:libninja> $<TARGET_OBJECTS:libninja-re2c>)
+ 
+ # Adds browse mode into the ninja binary if it's supported by the host platform.
+ if(platform_supports_ninja_browse)
+@@ -183,11 +182,12 @@ if(BUILD_TESTING)
+     src/subprocess_test.cc
+     src/test.cc
+     src/util_test.cc
++    $<TARGET_OBJECTS:libninja>
++    $<TARGET_OBJECTS:libninja-re2c>
+   )
+   if(WIN32)
+     target_sources(ninja_test PRIVATE src/includes_normalize_test.cc src/msvc_helper_test.cc)
+   endif()
+-  target_link_libraries(ninja_test PRIVATE libninja libninja-re2c)
+ 
+   foreach(perftest
+     build_log_perftest
+@@ -197,8 +197,7 @@ if(BUILD_TESTING)
+     hash_collision_bench
+     manifest_parser_perftest
+   )
+-    add_executable(${perftest} src/${perftest}.cc)
+-    target_link_libraries(${perftest} PRIVATE libninja libninja-re2c)
++    add_executable(${perftest} src/${perftest}.cc $<TARGET_OBJECTS:libninja> $<TARGET_OBJECTS:libninja-re2c>)
+   endforeach()
+ 
+   if(CMAKE_SYSTEM_NAME STREQUAL "AIX" AND CMAKE_SIZEOF_VOID_P EQUAL 4)
+-- 
+2.29.2
 
- # Tests all build into ninja_test executable.
- add_executable(ninja_test
-@@ -106,11 +105,12 @@ add_executable(ninja_test
-	src/subprocess_test.cc
-	src/test.cc
-	src/util_test.cc
-+	$<TARGET_OBJECTS:libninja>
-+	$<TARGET_OBJECTS:libninja-re2c>
- )
- if(WIN32)
-	target_sources(ninja_test PRIVATE src/includes_normalize_test.cc src/msvc_helper_test.cc)
- endif()
--target_link_libraries(ninja_test PRIVATE libninja libninja-re2c)
-
- foreach(perftest
-   build_log_perftest
-@@ -120,8 +120,7 @@ foreach(perftest
-   hash_collision_bench
-   manifest_parser_perftest
- )
--  add_executable(${perftest} src/${perftest}.cc)
--  target_link_libraries(${perftest} PRIVATE libninja libninja-re2c)
-+  add_executable(${perftest} src/${perftest}.cc $<TARGET_OBJECTS:libninja> $<TARGET_OBJECTS:libninja-re2c>)
- endforeach()
-
- enable_testing()
---
-2.17.0
diff --git a/package/ninja/ninja.hash b/package/ninja/ninja.hash
index cd9bb08832..fd2c594a77 100644
--- a/package/ninja/ninja.hash
+++ b/package/ninja/ninja.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 3810318b08489435f8efc19c05525e80a993af5a55baa0dfeae0465a9d45f99f ninja-1.10.0.tar.gz
-sha256 eb7e9ab9690124c5c9f42bdc81383d886a3dede26345b6ed15bbad7caf81f7ea COPYING
+sha256  ce35865411f0490368a8fc383f29071de6690cbadc27704734978221f25e2bed  ninja-1.10.2.tar.gz
+sha256  eb7e9ab9690124c5c9f42bdc81383d886a3dede26345b6ed15bbad7caf81f7ea  COPYING
diff --git a/package/ninja/ninja.mk b/package/ninja/ninja.mk
index 060893d85f..ab1941023e 100644
--- a/package/ninja/ninja.mk
+++ b/package/ninja/ninja.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NINJA_VERSION = 1.10.0
+NINJA_VERSION = 1.10.2
 NINJA_SITE = $(call github,ninja-build,ninja,v$(NINJA_VERSION))
 NINJA_LICENSE = Apache-2.0
 NINJA_LICENSE_FILES = COPYING
