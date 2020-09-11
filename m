From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Sep 2020 23:04:30 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/brotli: security
 update to version 1.0.9
Message-ID: <20200911210024.C596D890BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=79efa92da63c9a6c4117f50f9e6f5fe63978ffeb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Contains fixes for overflows when input chunks are larger than 2 GiB,
an uninitialized data access, and minor correctness and performance
improvements. There does not seem to be any CVEs filed, but there is
a security notice in the release notes at:

  https://github.com/google/brotli/releases/tag/v1.0.9

Patch "0001-CMake-Allow-using-BUILD_SHARED_LIBS-to-choose-static.patch"
is rebased against the latest upstream changes.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 777bbd1b07f0279230acd925a83035aa3d7793d6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-using-BUILD_SHARED_LIBS-to-choose-static.patch | 92 +++++++++-------------
 package/brotli/brotli.hash                         |  2 +-
 package/brotli/brotli.mk                           |  2 +-
 3 files changed, 41 insertions(+), 55 deletions(-)

diff --git a/package/brotli/0001-CMake-Allow-using-BUILD_SHARED_LIBS-to-choose-static.patch b/package/brotli/0001-CMake-Allow-using-BUILD_SHARED_LIBS-to-choose-static.patch
index ae5386b1ce..2a3204fc34 100644
--- a/package/brotli/0001-CMake-Allow-using-BUILD_SHARED_LIBS-to-choose-static.patch
+++ b/package/brotli/0001-CMake-Allow-using-BUILD_SHARED_LIBS-to-choose-static.patch
@@ -1,6 +1,6 @@
-From 7289e5a378ba13801996a84d89d8fe95c3fc4c11 Mon Sep 17 00:00:00 2001
+From 6cb16322decd643fed9de332d9cda77f7738b7af Mon Sep 17 00:00:00 2001
 From: Adrian Perez de Castro <aperez@igalia.com>
-Date: Mon, 26 Mar 2018 19:08:31 +0100
+Date: Mon, 7 Sep 2020 12:14:22 +0300
 Subject: [PATCH] CMake: Allow using BUILD_SHARED_LIBS to choose static/shared
  libs
 
@@ -18,16 +18,16 @@ This way, the following will both work as expected:
 
 This is helpful for distributions which need (or want) to build only
 static libraries.
----
- CMakeLists.txt        | 42 ++++++++++++++----------------------------
- c/fuzz/test_fuzzer.sh |  6 +++---
- 2 files changed, 17 insertions(+), 31 deletions(-)
 
 Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-Upstream-Status: Submitted [https://github.com/google/brotli/pull/655]
+[Upstream status: https://github.com/google/brotli/pull/655]
+---
+ CMakeLists.txt        | 46 ++++++++++++++-----------------------------
+ c/fuzz/test_fuzzer.sh |  6 +++---
+ 2 files changed, 18 insertions(+), 34 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index fc45f80..3f87f13 100644
+index 4ff3401..f889311 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -6,6 +6,8 @@ cmake_minimum_required(VERSION 2.8.6)
@@ -36,10 +36,10 @@ index fc45f80..3f87f13 100644
  
 +option(BUILD_SHARED_LIBS "Build shared libraries" ON)
 +
- # If Brotli is being bundled in another project, we don't want to
- # install anything.  However, we want to let people override this, so
- # we'll use the BROTLI_BUNDLED_MODE variable to let them do that; just
-@@ -114,10 +116,6 @@ set(BROTLI_LIBRARIES_CORE brotlienc brotlidec brotlicommon)
+ if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
+   message(STATUS "Setting build type to Release as none was specified.")
+   set(CMAKE_BUILD_TYPE "Release" CACHE STRING "Choose the type of build." FORCE)
+@@ -137,10 +139,6 @@ set(BROTLI_LIBRARIES_CORE brotlienc brotlidec brotlicommon)
  set(BROTLI_LIBRARIES ${BROTLI_LIBRARIES_CORE} ${LIBM_LIBRARY})
  mark_as_advanced(BROTLI_LIBRARIES)
  
@@ -50,14 +50,20 @@ index fc45f80..3f87f13 100644
  if(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
    add_definitions(-DOS_LINUX)
  elseif(${CMAKE_SYSTEM_NAME} MATCHES "FreeBSD")
-@@ -137,24 +135,22 @@ endfunction()
- transform_sources_list("scripts/sources.lst" "${CMAKE_CURRENT_BINARY_DIR}/sources.lst.cmake")
+@@ -161,29 +159,25 @@ transform_sources_list("scripts/sources.lst" "${CMAKE_CURRENT_BINARY_DIR}/source
  include("${CMAKE_CURRENT_BINARY_DIR}/sources.lst.cmake")
  
--add_library(brotlicommon SHARED ${BROTLI_COMMON_C})
--add_library(brotlidec SHARED ${BROTLI_DEC_C})
--add_library(brotlienc SHARED ${BROTLI_ENC_C})
--
+ if(BROTLI_EMSCRIPTEN)
+-  set(BROTLI_SHARED_LIBS "")
+-else()
+-  set(BROTLI_SHARED_LIBS brotlicommon brotlidec brotlienc)
+-  add_library(brotlicommon SHARED ${BROTLI_COMMON_C})
+-  add_library(brotlidec SHARED ${BROTLI_DEC_C})
+-  add_library(brotlienc SHARED ${BROTLI_ENC_C})
++  set(BUILD_SHARED_LIBS OFF)
+ endif()
+ 
+-set(BROTLI_STATIC_LIBS brotlicommon-static brotlidec-static brotlienc-static)
 -add_library(brotlicommon-static STATIC ${BROTLI_COMMON_C})
 -add_library(brotlidec-static STATIC ${BROTLI_DEC_C})
 -add_library(brotlienc-static STATIC ${BROTLI_ENC_C})
@@ -68,27 +74,27 @@ index fc45f80..3f87f13 100644
  # Older CMake versions does not understand INCLUDE_DIRECTORIES property.
  include_directories(${BROTLI_INCLUDE_DIRS})
  
+-foreach(lib IN LISTS BROTLI_SHARED_LIBS)
+-  target_compile_definitions(${lib} PUBLIC "BROTLI_SHARED_COMPILATION" )
+-  string(TOUPPER "${lib}" LIB)
+-  set_target_properties (${lib} PROPERTIES DEFINE_SYMBOL "${LIB}_SHARED_COMPILATION")
+-endforeach()
 +if(BUILD_SHARED_LIBS)
 +  foreach(lib brotlicommon brotlidec brotlienc)
 +    target_compile_definitions(${lib} PUBLIC "BROTLI_SHARED_COMPILATION" )
 +    string(TOUPPER "${lib}" LIB)
-+    set_target_properties (${lib} PROPERTIES DEFINE_SYMBOL "${LIB}_SHARED_COMPILATION" )
++    set_target_properties (${lib} PROPERTIES DEFINE_SYMBOL "${LIB}_SHARED_COMPILATION")
 +  endforeach()
 +endif()
-+
- foreach(lib brotlicommon brotlidec brotlienc)
--  target_compile_definitions(${lib} PUBLIC "BROTLI_SHARED_COMPILATION" )
--  string(TOUPPER "${lib}" LIB)
--  set_target_properties (${lib} PROPERTIES DEFINE_SYMBOL "${LIB}_SHARED_COMPILATION" )
--endforeach()
--
--foreach(lib brotlicommon brotlidec brotlienc brotlicommon-static brotlidec-static brotlienc-static)
+ 
+-foreach(lib IN LISTS BROTLI_SHARED_LIBS BROTLI_STATIC_LIBS)
++foreach(lib brotlicommon brotlidec brotlienc)
    target_link_libraries(${lib} ${LIBM_LIBRARY})
    set_property(TARGET ${lib} APPEND PROPERTY INCLUDE_DIRECTORIES ${BROTLI_INCLUDE_DIRS})
    set_target_properties(${lib} PROPERTIES
-@@ -167,9 +163,6 @@ endforeach()
- target_link_libraries(brotlidec brotlicommon)
+@@ -200,9 +194,6 @@ target_link_libraries(brotlidec brotlicommon)
  target_link_libraries(brotlienc brotlicommon)
+ endif()
  
 -target_link_libraries(brotlidec-static brotlicommon-static)
 -target_link_libraries(brotlienc-static brotlicommon-static)
@@ -96,7 +102,7 @@ index fc45f80..3f87f13 100644
  # For projects stuck on older versions of CMake, this will set the
  # BROTLI_INCLUDE_DIRS and BROTLI_LIBRARIES variables so they still
  # have a relatively easy way to use Brotli:
-@@ -183,7 +176,7 @@ endif()
+@@ -216,7 +207,7 @@ endif()
  
  # Build the brotli executable
  add_executable(brotli ${BROTLI_CLI_C})
@@ -104,8 +110,8 @@ index fc45f80..3f87f13 100644
 +target_link_libraries(brotli ${BROTLI_LIBRARIES})
  
  # Installation
- if(NOT BROTLI_BUNDLED_MODE)
-@@ -199,13 +192,6 @@ if(NOT BROTLI_BUNDLED_MODE)
+ if(NOT BROTLI_EMSCRIPTEN)
+@@ -233,13 +224,6 @@ if(NOT BROTLI_BUNDLED_MODE)
      RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"
    )
  
@@ -119,26 +125,6 @@ index fc45f80..3f87f13 100644
    install(
      DIRECTORY ${BROTLI_INCLUDE_DIRS}/brotli
      DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
-diff --git a/c/fuzz/test_fuzzer.sh b/c/fuzz/test_fuzzer.sh
-index 9985194..4b99947 100755
---- a/c/fuzz/test_fuzzer.sh
-+++ b/c/fuzz/test_fuzzer.sh
-@@ -13,12 +13,12 @@ mkdir bin
- cd bin
- 
- cmake $BROTLI -DCMAKE_C_COMPILER="$CC" \
--    -DBUILD_TESTING=OFF -DENABLE_SANITIZER=address
--make -j$(nproc) brotlidec-static
-+    -DBUILD_TESTING=OFF -DBUILD_SHARED_LIBS=OFF -DENABLE_SANITIZER=address
-+make -j$(nproc) brotlidec
- 
- ${CC} -o run_decode_fuzzer -std=c99 -fsanitize=address -I$SRC/include \
-     $SRC/fuzz/decode_fuzzer.c $SRC/fuzz/run_decode_fuzzer.c \
--    ./libbrotlidec-static.a ./libbrotlicommon-static.a
-+    ./libbrotlidec.a ./libbrotlicommon.a
- 
- mkdir decode_corpora
- unzip $BROTLI/java/org/brotli/integration/fuzz_data.zip -d decode_corpora
 -- 
-2.19.1
+2.28.0
 
diff --git a/package/brotli/brotli.hash b/package/brotli/brotli.hash
index 82163040d1..22f894c403 100644
--- a/package/brotli/brotli.hash
+++ b/package/brotli/brotli.hash
@@ -1,5 +1,5 @@
 # Locally generated:
-sha512  a82362aa36d2f2094bca0b2808d9de0d57291fb3a4c29d7c0ca0a37e73087ec5ac4df299c8c363e61106fccf2fe7f58b5cf76eb97729e2696058ef43b1d3930a  v1.0.7.tar.gz
+sha512  b8e2df955e8796ac1f022eb4ebad29532cb7e3aa6a4b6aee91dbd2c7d637eee84d9a144d3e878895bb5e62800875c2c01c8f737a1261020c54feacf9f676b5f5  v1.0.9.tar.gz
 
 # Hash for license files:
 sha512  bae78184c2f50f86d8c727826d3982c469454c42b9af81f4ef007e39036434fa894cf5be3bf5fc65b7de2301f0a72d067a8186e303327db8a96bd14867e0a3a8  LICENSE
diff --git a/package/brotli/brotli.mk b/package/brotli/brotli.mk
index 134f480895..5209d3186b 100644
--- a/package/brotli/brotli.mk
+++ b/package/brotli/brotli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BROTLI_VERSION = 1.0.7
+BROTLI_VERSION = 1.0.9
 BROTLI_SOURCE = v$(BROTLI_VERSION).tar.gz
 BROTLI_SITE = https://github.com/google/brotli/archive
 BROTLI_LICENSE = MIT
