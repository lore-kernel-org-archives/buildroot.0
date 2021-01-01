From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 Jan 2021 10:47:16 +0100
Subject: [Buildroot] [git commit] package/ninja: drop workarounds for
 cmake-3.10
Message-ID: <20210101093016.BDF5E8380D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0fed2d6e7a7a3b85b3e9b052d5c964541319749
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we require cmake-3.15, which is what upstream ninja requires,
we can drop the workarounds we carry to build with cmake-3.10.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Philippe REYNES <philippe.reynes@softathome.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-set-minimum-cmake-version-to-3.10.patch   | 32 ------------
 .../0003-CMake-fix-object-library-usage.patch      | 59 ----------------------
 2 files changed, 91 deletions(-)

diff --git a/package/ninja/0001-set-minimum-cmake-version-to-3.10.patch b/package/ninja/0001-set-minimum-cmake-version-to-3.10.patch
deleted file mode 100644
index e53a136a94..0000000000
--- a/package/ninja/0001-set-minimum-cmake-version-to-3.10.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 386fa849157dabde42ab39de7acb31750956490c Mon Sep 17 00:00:00 2001
-From: Adam Duskett <aduskett@gmail.com>
-Date: Mon, 3 Feb 2020 06:21:57 -0800
-Subject: [PATCH] set minimum cmake version to 3.10
-
-The CMakeLists.txt file uses the CMP0091 which is an MSVC runtime library flag
-abstraction macro.
-
-Because we are not building ninja for Microsoft, it is safe to remove this
-macro and set the minimum version to 3.10.
-
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
-[Rebased for ninja-1.10.2 - CMP0091 usage was removed upstream by
-https://github.com/ninja-build/ninja/commit/e6f5bcffb3c561d228d88ff26edab26575b7d520]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 7f03c35..4b61479 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.15)
-+cmake_minimum_required(VERSION 3.10)
- 
- include(CheckIncludeFileCXX)
- include(CheckIPOSupported)
--- 
-2.29.2
-
diff --git a/package/ninja/0003-CMake-fix-object-library-usage.patch b/package/ninja/0003-CMake-fix-object-library-usage.patch
deleted file mode 100644
index 9b9fe506a4..0000000000
--- a/package/ninja/0003-CMake-fix-object-library-usage.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 17539ae9d09ded695167911f9e3ec0cf4bc9fed9 Mon Sep 17 00:00:00 2001
-From: Yegor Yefremov <yegorslists@googlemail.com>
-Date: Wed, 5 Feb 2020 12:28:44 +0100
-Subject: [PATCH] CMake: fix object library usage
-
-Object libraries cannot be use in target_link_libraries() command
-as they are no normal binary files like *.a or *.so but a collection
-of object files.
-
-See add_library() definition for details.
-
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
-[Rebased for for ninja-1.10.2]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- CMakeLists.txt | 9 ++++-----
- 1 file changed, 4 insertions(+), 5 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 4b61479..3701f3a 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -132,8 +132,7 @@ if(CMAKE_SYSTEM_NAME STREQUAL "OS400" OR CMAKE_SYSTEM_NAME STREQUAL "AIX")
- endif()
- 
- # Main executable is library plus main() function.
--add_executable(ninja src/ninja.cc)
--target_link_libraries(ninja PRIVATE libninja libninja-re2c)
-+add_executable(ninja src/ninja.cc $<TARGET_OBJECTS:libninja> $<TARGET_OBJECTS:libninja-re2c>)
- 
- # Adds browse mode into the ninja binary if it's supported by the host platform.
- if(platform_supports_ninja_browse)
-@@ -183,11 +182,12 @@ if(BUILD_TESTING)
-     src/subprocess_test.cc
-     src/test.cc
-     src/util_test.cc
-+    $<TARGET_OBJECTS:libninja>
-+    $<TARGET_OBJECTS:libninja-re2c>
-   )
-   if(WIN32)
-     target_sources(ninja_test PRIVATE src/includes_normalize_test.cc src/msvc_helper_test.cc)
-   endif()
--  target_link_libraries(ninja_test PRIVATE libninja libninja-re2c)
- 
-   foreach(perftest
-     build_log_perftest
-@@ -197,8 +197,7 @@ if(BUILD_TESTING)
-     hash_collision_bench
-     manifest_parser_perftest
-   )
--    add_executable(${perftest} src/${perftest}.cc)
--    target_link_libraries(${perftest} PRIVATE libninja libninja-re2c)
-+    add_executable(${perftest} src/${perftest}.cc $<TARGET_OBJECTS:libninja> $<TARGET_OBJECTS:libninja-re2c>)
-   endforeach()
- 
-   if(CMAKE_SYSTEM_NAME STREQUAL "AIX" AND CMAKE_SIZEOF_VOID_P EQUAL 4)
--- 
-2.29.2
-
