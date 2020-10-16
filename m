From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 16 Oct 2020 23:43:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/opencv3: bump to version 3.4.12
Message-ID: <20201016214339.2521997-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Drop patches (already in version)
- Update LICENSE hash, update in year:
  https://github.com/opencv/opencv/commit/039f5ca42e32dd11605d81e909c3bdad16c4cdbc
- Update indentation in hash file (two spaces)

https://github.com/opencv/opencv/wiki/ChangeLog#version3412

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...0001-Fix-build-of-grfmt_jpeg2000-cpp.patch | 37 -------------
 ...th-with-ipa-cp-unit-growth-on-gcc-10.patch | 53 -------------------
 package/opencv3/opencv3.hash                  |  4 +-
 package/opencv3/opencv3.mk                    |  2 +-
 4 files changed, 3 insertions(+), 93 deletions(-)
 delete mode 100644 package/opencv3/0001-Fix-build-of-grfmt_jpeg2000-cpp.patch
 delete mode 100644 package/opencv3/0002-carotene-Replace-ipcp-unit-growth-with-ipa-cp-unit-growth-on-gcc-10.patch

diff --git a/package/opencv3/0001-Fix-build-of-grfmt_jpeg2000-cpp.patch b/package/opencv3/0001-Fix-build-of-grfmt_jpeg2000-cpp.patch
deleted file mode 100644
index e54fab852a..0000000000
--- a/package/opencv3/0001-Fix-build-of-grfmt_jpeg2000-cpp.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From f66fc199a20882c546fa31142e9c0f5a8b3cf983 Mon Sep 17 00:00:00 2001
-From: Florian Jung <flo@windfis.ch>
-Date: Wed, 29 Jul 2020 18:51:55 +0200
-Subject: [PATCH] Fix build of grfmt_jpeg2000.cpp
-
-libjasper has recently changed `jas_matrix_get` from a macro to an inline function
-(389951d071 in https://github.com/jasper-software/jasper), causing the build to fail.
-
-[Retrieved from:
-https://github.com/opencv/opencv/commit/f66fc199a20882c546fa31142e9c0f5a8b3cf983]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- modules/imgcodecs/src/grfmt_jpeg2000.cpp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/modules/imgcodecs/src/grfmt_jpeg2000.cpp b/modules/imgcodecs/src/grfmt_jpeg2000.cpp
-index fe69f80c86f..0f4d28d6f4d 100644
---- a/modules/imgcodecs/src/grfmt_jpeg2000.cpp
-+++ b/modules/imgcodecs/src/grfmt_jpeg2000.cpp
-@@ -377,7 +377,7 @@ bool  Jpeg2KDecoder::readComponent8u( uchar *data, void *_buffer,
- 
-     for( y = 0; y < yend - ystart; )
-     {
--        jas_seqent_t* pix_row = &jas_matrix_get( buffer, y / ystep, 0 );
-+        jas_seqent_t* pix_row = jas_matrix_getref( buffer, y / ystep, 0 );
-         uchar* dst = data + (y - yoffset) * step - xoffset;
- 
-         if( xstep == 1 )
-@@ -443,7 +443,7 @@ bool  Jpeg2KDecoder::readComponent16u( unsigned short *data, void *_buffer,
- 
-     for( y = 0; y < yend - ystart; )
-     {
--        jas_seqent_t* pix_row = &jas_matrix_get( buffer, y / ystep, 0 );
-+        jas_seqent_t* pix_row = jas_matrix_getref( buffer, y / ystep, 0 );
-         ushort* dst = data + (y - yoffset) * step - xoffset;
- 
-         if( xstep == 1 )
diff --git a/package/opencv3/0002-carotene-Replace-ipcp-unit-growth-with-ipa-cp-unit-growth-on-gcc-10.patch b/package/opencv3/0002-carotene-Replace-ipcp-unit-growth-with-ipa-cp-unit-growth-on-gcc-10.patch
deleted file mode 100644
index 321c2e51f9..0000000000
--- a/package/opencv3/0002-carotene-Replace-ipcp-unit-growth-with-ipa-cp-unit-growth-on-gcc-10.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 2bd94884752b9840d434f80b1c4b83176f7063e3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 16 Jan 2020 08:52:00 -0800
-Subject: [PATCH] carotene: Replace ipcp-unit-growth with ipa-cp-unit-growth on
- gcc >= 10
-
-gcc 10+ has renamed this option, therefore check for gcc version before
-deciding which name to use for opt parameter
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-[Retrieved from:
-https://github.com/opencv/opencv/commit/2bd94884752b9840d434f80b1c4b83176f7063e3]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- 3rdparty/carotene/CMakeLists.txt     | 7 +++++--
- 3rdparty/carotene/hal/CMakeLists.txt | 6 +++++-
- 2 files changed, 10 insertions(+), 3 deletions(-)
-
-diff --git a/3rdparty/carotene/CMakeLists.txt b/3rdparty/carotene/CMakeLists.txt
-index bfa9368d79d..528fcf62e15 100644
---- a/3rdparty/carotene/CMakeLists.txt
-+++ b/3rdparty/carotene/CMakeLists.txt
-@@ -20,8 +20,11 @@ if(CMAKE_COMPILER_IS_GNUCC)
-     # - matchTemplate about 5-10%
-     # - goodFeaturesToTrack 10-20%
-     # - cornerHarris 30% for some cases
--
--    set_source_files_properties(${carotene_sources} COMPILE_FLAGS "--param ipcp-unit-growth=100000 --param inline-unit-growth=100000 --param large-stack-frame-growth=5000")
-+    if(CMAKE_CXX_COMPILER_VERSION VERSION_LESS "10.0.0")
-+        set_source_files_properties(${carotene_sources} COMPILE_FLAGS "--param ipcp-unit-growth=100000 --param inline-unit-growth=100000 --param large-stack-frame-growth=5000")
-+    else()
-+        set_source_files_properties(${carotene_sources} COMPILE_FLAGS "--param ipa-cp-unit-growth=100000 --param inline-unit-growth=100000 --param large-stack-frame-growth=5000")
-+    endif()
- endif()
- 
- add_library(carotene_objs OBJECT
-diff --git a/3rdparty/carotene/hal/CMakeLists.txt b/3rdparty/carotene/hal/CMakeLists.txt
-index 819954de137..b94d8511e8a 100644
---- a/3rdparty/carotene/hal/CMakeLists.txt
-+++ b/3rdparty/carotene/hal/CMakeLists.txt
-@@ -88,7 +88,11 @@ set_property(DIRECTORY APPEND PROPERTY COMPILE_DEFINITIONS ${carotene_defs})
-     #   matchTemplate about 5-10%
-     #   goodFeaturesToTrack 10-20%
-     #   cornerHarris 30% for some cases
--    set_source_files_properties(impl.cpp $<TARGET_OBJECTS:carotene_objs> COMPILE_FLAGS "--param ipcp-unit-growth=100000 --param inline-unit-growth=100000 --param large-stack-frame-growth=5000")
-+    if(CMAKE_CXX_COMPILER_VERSION VERSION_LESS "10.0.0")
-+      set_source_files_properties(impl.cpp $<TARGET_OBJECTS:carotene_objs> COMPILE_FLAGS "--param ipcp-unit-growth=100000 --param inline-unit-growth=100000 --param large-stack-frame-growth=5000")
-+    else()
-+      set_source_files_properties(impl.cpp $<TARGET_OBJECTS:carotene_objs> COMPILE_FLAGS "--param ipa-cp-unit-growth=100000 --param inline-unit-growth=100000 --param large-stack-frame-growth=5000")
-+    endif()
- #    set_source_files_properties(impl.cpp $<TARGET_OBJECTS:carotene_objs> COMPILE_FLAGS "--param ipcp-unit-growth=100000 --param inline-unit-growth=100000 --param large-stack-frame-growth=5000")
-   endif()
- 
diff --git a/package/opencv3/opencv3.hash b/package/opencv3/opencv3.hash
index 4953d01a1c..545108a738 100644
--- a/package/opencv3/opencv3.hash
+++ b/package/opencv3/opencv3.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 b7ea364de7273cfb3b771a0d9c111b8b8dfb42ff2bcd2d84681902fb8f49892a  opencv3-3.4.9.tar.gz
-sha256 c3596f2f886631ac49af2c9a201ca559f850bb5726bdc25eacbe2369a70caad9  LICENSE
+sha256  c8919dfb5ead6be67534bf794cb0925534311f1cd5c6680f8164ad1813c88d13  opencv3-3.4.12.tar.gz
+sha256  a5a7cf90fe5ac9763baad852cf69cf9d9b89bff934a679fdc5c8fcecaeba9a25  LICENSE
diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 1ab5cf1efd..de89aebca4 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCV3_VERSION = 3.4.9
+OPENCV3_VERSION = 3.4.12
 OPENCV3_SITE = $(call github,opencv,opencv,$(OPENCV3_VERSION))
 OPENCV3_INSTALL_STAGING = YES
 OPENCV3_LICENSE = BSD-3-Clause
-- 
2.28.0
