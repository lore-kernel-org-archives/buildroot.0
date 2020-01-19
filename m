From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Jan 2020 12:07:14 +0100
Subject: [Buildroot] [PATCH v9 02/23] package/kodi: bump to version 18.5-Leia
In-Reply-To: <20200119110735.1104443-1-bernd.kuhls@t-online.de>
References: <20200119110735.1104443-1-bernd.kuhls@t-online.de>
Message-ID: <20200119110735.1104443-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reworked raspberry pi handling, it is not treated as separate platform
anymore. Added dependencies to autoreconf cpluff.

Rebased patch
- 0001-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch

Removed unneeded patch
- 0002-CMake-Remove-dependency-on-gmp-and-libintl-from-Find.patch

Removed backported patches
- 0003-cmake-iconv-is-a-required-dependency.patch
- 0004-Fix-ffmpeg-build-for-mips.patch
- kodi-texturepacker/0002-fix_reallocarray.patch

Added backported patches
- 0003-Add-missing-cassert-includes.patch
- 0004-Backport-Add-missing-cstddef-includes.patch

Updated dependencies
- bzip2 is not used anymore
- flatbuffers (upstream PR 14209)
- fmt (upstream PR 11039)
- fstrcmp (upstream PR 14221)
- yajl was replaced by RapidJSON (upstream PR 8008)
- internal rar support was removed (upstream PR 11912)
  CMake option ENABLE_NONFREE was also removed
- internal sftp support was removed (upstream PR 12005)
- host-zip was removed (upstream PR 12643)
- CMake option ENABLE_OPENSSL was removed (upstream PR 13650)
- lirc support is now provided by lirc-tools (upstream PR 13761)
- IMX support was removed (upstream PR 12990)
- ENABLE_X11 was renamed to -DCORE_PLATFORM_NAME=x11 (upstream PR 12134)

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-jsonschemabuilder.mk                 |   4 +-
 ...-fix-texture-packer-cmake-source-dir.patch |  27 +++
 .../0002-fix_reallocarray.patch               | 170 ------------------
 .../kodi-texturepacker/kodi-texturepacker.mk  |   7 +-
 ...e-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch |   8 +-
 ...endency-on-gmp-and-libintl-from-Find.patch |  39 ----
 ...h => 0002-Fix-crosscompiling-issues.patch} |  29 ++-
 .../0003-Add-missing-cassert-includes.patch   |  50 ++++++
 ...cmake-iconv-is-a-required-dependency.patch |  92 ----------
 ...ackport-Add-missing-cstddef-includes.patch |  44 +++++
 .../kodi/0004-Fix-ffmpeg-build-for-mips.patch |  43 -----
 package/kodi/Config.in                        |  28 +--
 package/kodi/kodi.hash                        |  13 +-
 package/kodi/kodi.mk                          |  84 ++++-----
 14 files changed, 189 insertions(+), 449 deletions(-)
 create mode 100644 package/kodi-texturepacker/0002-fix-texture-packer-cmake-source-dir.patch
 delete mode 100644 package/kodi-texturepacker/0002-fix_reallocarray.patch
 delete mode 100644 package/kodi/0002-CMake-Remove-dependency-on-gmp-and-libintl-from-Find.patch
 rename package/kodi/{0005-Fix-crosscompiling-issues.patch => 0002-Fix-crosscompiling-issues.patch} (86%)
 create mode 100644 package/kodi/0003-Add-missing-cassert-includes.patch
 delete mode 100644 package/kodi/0003-cmake-iconv-is-a-required-dependency.patch
 create mode 100644 package/kodi/0004-Backport-Add-missing-cstddef-includes.patch
 delete mode 100644 package/kodi/0004-Fix-ffmpeg-build-for-mips.patch

diff --git a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
index 713d415fed..31003fe856 100644
--- a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
+++ b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
@@ -6,12 +6,12 @@
 
 # Not possible to directly refer to kodi variables, because of
 # first/second expansion trickery...
-KODI_JSONSCHEMABUILDER_VERSION = 17.6-Krypton
+KODI_JSONSCHEMABUILDER_VERSION = 18.5-Leia
 KODI_JSONSCHEMABUILDER_SITE = $(call github,xbmc,xbmc,$(KODI_JSONSCHEMABUILDER_VERSION))
 KODI_JSONSCHEMABUILDER_SOURCE = kodi-$(KODI_JSONSCHEMABUILDER_VERSION).tar.gz
 KODI_JSONSCHEMABUILDER_DL_SUBDIR = kodi
 KODI_JSONSCHEMABUILDER_LICENSE = GPL-2.0
-KODI_JSONSCHEMABUILDER_LICENSE_FILES = LICENSE.GPL
+KODI_JSONSCHEMABUILDER_LICENSE_FILES = LICENSE.md
 HOST_KODI_JSONSCHEMABUILDER_SUBDIR = tools/depends/native/JsonSchemaBuilder
 
 HOST_KODI_JSONSCHEMABUILDER_CONF_OPTS = \
diff --git a/package/kodi-texturepacker/0002-fix-texture-packer-cmake-source-dir.patch b/package/kodi-texturepacker/0002-fix-texture-packer-cmake-source-dir.patch
new file mode 100644
index 0000000000..ddd82439fe
--- /dev/null
+++ b/package/kodi-texturepacker/0002-fix-texture-packer-cmake-source-dir.patch
@@ -0,0 +1,27 @@
+Fix stand-alone build
+
+CMake Error at CMakeLists.txt:40 (add_executable):
+  Cannot find source file:
+
+    /home/bernd/buildroot/output/build/host-kodi-texturepacker-18.4-Leia/tools/depends/native/TexturePacker/xbmc/guilib/XBTF.cpp
+
+  Tried extensions .c .C .c++ .cc .cpp .cxx .cu .m .M .mm .h .hh .h++ .hm
+  .hpp .hxx .in .txx
+
+CMake Error at CMakeLists.txt:40 (add_executable):
+  No SOURCES given to target: TexturePacker
+
+Downloaded from
+https://github.com/LibreELEC/LibreELEC.tv/blob/master/packages/mediacenter/kodi/patches/kodi-100.25-hack-fix-texture-packer-cmake-source-dir.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -Naur a/tools/depends/native/TexturePacker/CMakeLists.txt b/tools/depends/native/TexturePacker/CMakeLists.txt
+--- a/tools/depends/native/TexturePacker/CMakeLists.txt	2016-12-23 17:10:28.593185862 +0000
++++ b/tools/depends/native/TexturePacker/CMakeLists.txt	2016-12-23 17:10:39.469253011 +0000
+@@ -1,3 +1,5 @@
++set(CMAKE_SOURCE_DIR ${CMAKE_SOURCE_DIR}/../../../..)
++
+ list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/modules)
+ 
+ if(APPLE)
diff --git a/package/kodi-texturepacker/0002-fix_reallocarray.patch b/package/kodi-texturepacker/0002-fix_reallocarray.patch
deleted file mode 100644
index e32d09ef53..0000000000
--- a/package/kodi-texturepacker/0002-fix_reallocarray.patch
+++ /dev/null
@@ -1,170 +0,0 @@
-From ebc5dfcad836936a14e6f18fd7faa377b3c804e7 Mon Sep 17 00:00:00 2001
-From: MilhouseVH <milhouseVH.github@nmacleod.com>
-Date: Mon, 6 Nov 2017 11:47:28 +0000
-Subject: [PATCH] TexturePacker: use C++ headers
-
-Signed-off-by: Dagg Stompler <daggs@gmx.com>
----
- tools/depends/native/TexturePacker/src/SimpleFS.h            | 4 ++--
- tools/depends/native/TexturePacker/src/TexturePacker.cpp     | 2 +-
- tools/depends/native/TexturePacker/src/XBTFWriter.cpp        | 6 +++---
- tools/depends/native/TexturePacker/src/XBTFWriter.h          | 2 +-
- tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp | 2 +-
- tools/depends/native/TexturePacker/src/md5.h                 | 4 ++--
- 6 files changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/tools/depends/native/TexturePacker/src/SimpleFS.h b/tools/depends/native/TexturePacker/src/SimpleFS.h
-index c48814c0ad..c2288cf8de 100644
---- a/tools/depends/native/TexturePacker/src/SimpleFS.h
-+++ b/tools/depends/native/TexturePacker/src/SimpleFS.h
-@@ -20,9 +20,9 @@
-  *
-  */
- 
--#include <stdio.h>
-+#include <cstdio>
- #include <string>
--#include <stdint.h>
-+#include <cstdint>
- 
- class CFile
- {
-diff --git a/tools/depends/native/TexturePacker/src/TexturePacker.cpp b/tools/depends/native/TexturePacker/src/TexturePacker.cpp
-index ba618be574..045c5ce38d 100644
---- a/tools/depends/native/TexturePacker/src/TexturePacker.cpp
-+++ b/tools/depends/native/TexturePacker/src/TexturePacker.cpp
-@@ -22,7 +22,7 @@
- #include <sys/types.h>
- #include <sys/stat.h>
- #define __STDC_FORMAT_MACROS
--#include <inttypes.h>
-+#include <cinttypes>
- #define platform_stricmp _stricmp
- #else
- #define platform_stricmp stricmp
-diff --git a/tools/depends/native/TexturePacker/src/XBTFWriter.cpp b/tools/depends/native/TexturePacker/src/XBTFWriter.cpp
-index 9e2493369b..2e80ba674c 100644
---- a/tools/depends/native/TexturePacker/src/XBTFWriter.cpp
-+++ b/tools/depends/native/TexturePacker/src/XBTFWriter.cpp
-@@ -19,14 +19,14 @@
-  */
- 
- #define __STDC_FORMAT_MACROS
--#include <inttypes.h>
-+#include <cinttypes>
- #if defined(TARGET_FREEBSD) || defined(TARGET_DARWIN)
--#include <stdlib.h>
-+#include <cstdlib>
- #elif !defined(TARGET_DARWIN)
- #include <malloc.h>
- #endif
- #include <memory.h>
--#include <string.h>
-+#include <cstring>
- 
- #include "XBTFWriter.h"
- #include "guilib/XBTFReader.h"
-diff --git a/tools/depends/native/TexturePacker/src/XBTFWriter.h b/tools/depends/native/TexturePacker/src/XBTFWriter.h
-index 7509303a51..d5cf1a2965 100644
---- a/tools/depends/native/TexturePacker/src/XBTFWriter.h
-+++ b/tools/depends/native/TexturePacker/src/XBTFWriter.h
-@@ -23,7 +23,7 @@
- 
- #include <vector>
- #include <string>
--#include <stdio.h>
-+#include <cstdio>
- 
- #include "guilib/XBTF.h"
- 
-diff --git a/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp b/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp
-index 56c22f7c3a..3ddb20fe88 100644
---- a/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp
-+++ b/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp
-@@ -20,7 +20,7 @@
- 
- #include "GifHelper.h"
- #include <algorithm>
--#include <stdlib.h>
-+#include <cstdlib>
- #include <cstring>
- 
- #define UNSIGNED_LITTLE_ENDIAN(lo, hi)	((lo) | ((hi) << 8))
-diff --git a/tools/depends/native/TexturePacker/src/md5.h b/tools/depends/native/TexturePacker/src/md5.h
-index 456e5be17f..4bb48e0810 100644
---- a/tools/depends/native/TexturePacker/src/md5.h
-+++ b/tools/depends/native/TexturePacker/src/md5.h
-@@ -23,8 +23,8 @@
- #ifndef MD5_H
- #define MD5_H
- 
--#include <string.h>		/* for memcpy() */
--#include <stdint.h>
-+#include <cstring>		/* for memcpy() */
-+#include <cstdint>
- 
- struct MD5Context 
- {
--- 
-2.16.0
-
-From ff3e6dad5fdb7b9a2985b2547c8020c709af0340 Mon Sep 17 00:00:00 2001
-From: MilhouseVH <milhouseVH.github@nmacleod.com>
-Date: Mon, 6 Nov 2017 18:05:17 +0000
-Subject: [PATCH] TexturePacker: drop unused variable
-
----
- tools/depends/native/TexturePacker/src/decoder/JPGDecoder.cpp | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/tools/depends/native/TexturePacker/src/decoder/JPGDecoder.cpp b/tools/depends/native/TexturePacker/src/decoder/JPGDecoder.cpp
-index 53f5e9beb7..b0f18bed68 100644
---- a/tools/depends/native/TexturePacker/src/decoder/JPGDecoder.cpp
-+++ b/tools/depends/native/TexturePacker/src/decoder/JPGDecoder.cpp
-@@ -72,7 +72,6 @@ bool JPGDecoder::LoadFile(const std::string &filename, DecodedFrames &frames)
-   struct jpeg_decompress_struct cinfo;
-   struct jpeg_error_mgr jerr;
-   
--  char *linha;
-   int ImageSize;
-   
-   cinfo.err = jpeg_std_error(&jerr);
-@@ -89,7 +88,6 @@ bool JPGDecoder::LoadFile(const std::string &filename, DecodedFrames &frames)
-   DecodedFrame frame;
-   
-   frame.rgbaImage.pixels = (char *)new char[ImageSize];
--  linha = (char *)frame.rgbaImage.pixels;
-   
-   unsigned char *scanlinebuff = new unsigned char[3 * cinfo.image_width];
-   unsigned char *dst = (unsigned char *)frame.rgbaImage.pixels;
--- 
-2.16.0
-
-From ee441543be07de1222bcff2587bfcdb5c1231989 Mon Sep 17 00:00:00 2001
-From: MilhouseVH <milhouseVH.github@nmacleod.com>
-Date: Mon, 6 Nov 2017 21:02:06 +0000
-Subject: [PATCH] TexturePacker: include GifHelper after system headers
-
----
- tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp b/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp
-index 3ddb20fe88..9ced4ec5bc 100644
---- a/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp
-+++ b/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp
-@@ -18,10 +18,10 @@
-  *
-  */
- 
--#include "GifHelper.h"
- #include <algorithm>
- #include <cstdlib>
- #include <cstring>
-+#include "GifHelper.h"
- 
- #define UNSIGNED_LITTLE_ENDIAN(lo, hi)	((lo) | ((hi) << 8))
- #define GIF_MAX_MEMORY 82944000U // about 79 MB, which is equivalent to 10 full hd frames.
--- 
-2.16.0
-
diff --git a/package/kodi-texturepacker/kodi-texturepacker.mk b/package/kodi-texturepacker/kodi-texturepacker.mk
index bb35252b94..e33e680e16 100644
--- a/package/kodi-texturepacker/kodi-texturepacker.mk
+++ b/package/kodi-texturepacker/kodi-texturepacker.mk
@@ -6,12 +6,12 @@
 
 # Not possible to directly refer to kodi variables, because of
 # first/second expansion trickery...
-KODI_TEXTUREPACKER_VERSION = 17.6-Krypton
+KODI_TEXTUREPACKER_VERSION = 18.5-Leia
 KODI_TEXTUREPACKER_SITE = $(call github,xbmc,xbmc,$(KODI_TEXTUREPACKER_VERSION))
 KODI_TEXTUREPACKER_SOURCE = kodi-$(KODI_TEXTUREPACKER_VERSION).tar.gz
 KODI_TEXTUREPACKER_DL_SUBDIR = kodi
 KODI_TEXTUREPACKER_LICENSE = GPL-2.0
-KODI_TEXTUREPACKER_LICENSE_FILES = LICENSE.GPL
+KODI_TEXTUREPACKER_LICENSE_FILES = LICENSE.md
 HOST_KODI_TEXTUREPACKER_SUBDIR = tools/depends/native/TexturePacker
 HOST_KODI_TEXTUREPACKER_DEPENDENCIES = \
 	host-giflib \
@@ -29,8 +29,7 @@ HOST_KODI_TEXTUREPACKER_CXXFLAGS = \
 
 HOST_KODI_TEXTUREPACKER_CONF_OPTS += \
 	-DCMAKE_CXX_FLAGS="$(HOST_KODI_TEXTUREPACKER_CXXFLAGS)" \
-	-DCMAKE_MODULE_PATH=$(@D)/project/cmake/modules \
-	-DCORE_SOURCE_DIR=$(@D) \
+	-DCMAKE_MODULE_PATH=$(@D)/cmake/modules \
 	-Wno-dev
 
 define HOST_KODI_TEXTUREPACKER_INSTALL_CMDS
diff --git a/package/kodi/0001-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch b/package/kodi/0001-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
index 0b88ce9d27..5abb77e777 100644
--- a/package/kodi/0001-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
+++ b/package/kodi/0001-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
@@ -17,9 +17,9 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 
 diff --git a/project/cmake/KodiConfig.cmake.in b/project/cmake/KodiConfig.cmake.in
 index 76626ec..ffb8e1d 100644
---- a/project/cmake/KodiConfig.cmake.in
-+++ b/project/cmake/KodiConfig.cmake.in
-@@ -7,7 +7,7 @@ if(NOT @APP_NAME_UC at _PREFIX)
+--- a/cmake/KodiConfig.cmake.in
++++ b/cmake/KodiConfig.cmake.in
+@@ -8,7 +8,7 @@ if(NOT @APP_NAME_UC at _PREFIX)
    set(@APP_NAME_UC at _PREFIX @APP_PREFIX@)
  endif()
  if(NOT @APP_NAME_UC at _INCLUDE_DIR)
@@ -28,7 +28,7 @@ index 76626ec..ffb8e1d 100644
  endif()
  if(NOT @APP_NAME_UC at _LIB_DIR)
    set(@APP_NAME_UC at _LIB_DIR @APP_LIB_DIR@)
-@@ -18,7 +18,7 @@ endif()
+@@ -20,7 +20,7 @@ endif()
  if(NOT WIN32)
    set(CMAKE_CXX_FLAGS "$ENV{CXXFLAGS} @CXX11_SWITCH@")
  endif()
diff --git a/package/kodi/0002-CMake-Remove-dependency-on-gmp-and-libintl-from-Find.patch b/package/kodi/0002-CMake-Remove-dependency-on-gmp-and-libintl-from-Find.patch
deleted file mode 100644
index 80bf954d5e..0000000000
--- a/package/kodi/0002-CMake-Remove-dependency-on-gmp-and-libintl-from-Find.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-CMake: Remove dependency on gmp and libintl from FindPython.cmake
-
-Downloaded from Openelec:
-https://github.com/OpenELEC/OpenELEC.tv/blob/master/packages/mediacenter/kodi/patches/kodi-998.02-cmake-python.patch
-
-The dependency for libintl and gmp was introduced by this commit
-https://github.com/xbmc/xbmc/commit/8558d672e98b62f3ea0126ba491376add8ed71cb
-without further explanation and, apparently, without necessity.
-
-A question asking whether this is really needed was sent upstream:
-https://github.com/xbmc/xbmc/pull/10973#pullrequestreview-34179550
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -Naur kodi-17.1-Krypton/project/cmake/modules/FindPython.cmake kodi-17.1-Krypton.patch/project/cmake/modules/FindPython.cmake
---- kodi-17.1-Krypton/project/cmake/modules/FindPython.cmake	2017-03-20 17:17:49.000000000 +0100
-+++ kodi-17.1-Krypton.patch/project/cmake/modules/FindPython.cmake	2017-03-30 11:10:01.065718667 +0200
-@@ -16,14 +16,12 @@
- if(KODI_DEPENDSBUILD)
-   find_library(FFI_LIBRARY ffi REQUIRED)
-   find_library(EXPAT_LIBRARY expat REQUIRED)
--  find_library(INTL_LIBRARY intl REQUIRED)
--  find_library(GMP_LIBRARY gmp REQUIRED)
- 
-   if(NOT CORE_SYSTEM_NAME STREQUAL android)
-     set(PYTHON_DEP_LIBRARIES pthread dl util)
-   endif()
- 
--  set(PYTHON_LIBRARIES ${PYTHON_LIBRARY} ${FFI_LIBRARY} ${EXPAT_LIBRARY} ${INTL_LIBRARY} ${GMP_LIBRARY} ${PYTHON_DEP_LIBRARIES})
-+  set(PYTHON_LIBRARIES ${PYTHON_LIBRARY} ${FFI_LIBRARY} ${EXPAT_LIBRARY} ${PYTHON_DEP_LIBRARIES})
- else()
-   find_package(PythonLibs 2.7 REQUIRED)
-   list(APPEND PYTHON_LIBRARIES ${PC_PYTHON_STATIC_LIBRARIES})
-@@ -36,4 +34,4 @@
-   set(PYTHON_INCLUDE_DIRS ${PYTHON_INCLUDE_DIR})
- endif()
- 
--mark_as_advanced(PYTHON_EXECUTABLE PYTHON_INCLUDE_DIRS PYTHON_INCLUDE_DIR PYTHON_LIBRARY PYTHON_LIBRARIES PYTHON_LDFLAGS FFI_LIBRARY EXPAT_LIBRARY INTL_LIBRARY GMP_LIBRARY)
-+mark_as_advanced(PYTHON_EXECUTABLE PYTHON_INCLUDE_DIRS PYTHON_INCLUDE_DIR PYTHON_LIBRARY PYTHON_LIBRARIES PYTHON_LDFLAGS FFI_LIBRARY EXPAT_LIBRARY)
diff --git a/package/kodi/0005-Fix-crosscompiling-issues.patch b/package/kodi/0002-Fix-crosscompiling-issues.patch
similarity index 86%
rename from package/kodi/0005-Fix-crosscompiling-issues.patch
rename to package/kodi/0002-Fix-crosscompiling-issues.patch
index 63f71cabe1..12bb66dde0 100644
--- a/package/kodi/0005-Fix-crosscompiling-issues.patch
+++ b/package/kodi/0002-Fix-crosscompiling-issues.patch
@@ -24,11 +24,11 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 
 diff --git a/project/cmake/modules/FindFFMPEG.cmake b/project/cmake/modules/FindFFMPEG.cmake
 index 28cc80710e..1ac8793149 100644
---- a/project/cmake/modules/FindFFMPEG.cmake
-+++ b/project/cmake/modules/FindFFMPEG.cmake
-@@ -233,16 +233,14 @@ if(NOT FFMPEG_FOUND)
-     message(STATUS "FFMPEG_URL: ${FFMPEG_URL}")
-   endif()
+--- a/cmake/modules/FindFFMPEG.cmake
++++ b/cmake/modules/FindFFMPEG.cmake
+@@ -234,14 +234,12 @@
+                      -DENABLE_VAAPI=${ENABLE_VAAPI}
+                      -DENABLE_VDPAU=${ENABLE_VDPAU})
  
 -  if(KODI_DEPENDSBUILD)
      set(CROSS_ARGS -DDEPENDS_PATH=${DEPENDS_PATH}
@@ -37,16 +37,14 @@ index 28cc80710e..1ac8793149 100644
                     -DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE}
 -                   -DOS=${OS}
 +                   -DOS=linux
-                    -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
-                    -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
                     -DCMAKE_AR=${CMAKE_AR})
 -  endif()
+   set(LINKER_FLAGS ${CMAKE_EXE_LINKER_FLAGS})
+   list(APPEND LINKER_FLAGS ${SYSTEM_LDFLAGS})
  
-   externalproject_add(ffmpeg
-                       URL ${FFMPEG_URL}
-@@ -270,12 +268,12 @@ if(NOT FFMPEG_FOUND)
- "#!/bin/bash
- if [[ $@ == *${APP_NAME_LC}.bin* || $@ == *${APP_NAME_LC}.so* || $@ == *${APP_NAME_LC}-test* ]]
+@@ -280,12 +278,12 @@
+ "#!${BASH_COMMAND}
+ if [[ $@ == *${APP_NAME_LC}.bin* || $@ == *${APP_NAME_LC}${APP_BINARY_SUFFIX}* || $@ == *${APP_NAME_LC}.so* || $@ == *${APP_NAME_LC}-test* ]]
  then
 -  avformat=`PKG_CONFIG_PATH=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR}/lib/pkgconfig ${PKG_CONFIG_EXECUTABLE} --libs --static libavcodec`
 -  avcodec=`PKG_CONFIG_PATH=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR}/lib/pkgconfig ${PKG_CONFIG_EXECUTABLE} --libs --static libavformat`
@@ -67,15 +65,12 @@ diff --git a/tools/depends/target/ffmpeg/CMakeLists.txt b/tools/depends/target/f
 index fda6b0cac4..af3afa6b60 100644
 --- a/tools/depends/target/ffmpeg/CMakeLists.txt
 +++ b/tools/depends/target/ffmpeg/CMakeLists.txt
-@@ -9,7 +9,7 @@ set(ffmpeg_conf "")
+@@ -13,7 +13,7 @@
  if(CROSSCOMPILING)
    set(pkgconf "PKG_CONFIG_LIBDIR=${DEPENDS_PATH}/lib/pkgconfig")
    list(APPEND ffmpeg_conf --pkg-config=${PKG_CONFIG_EXECUTABLE} --pkg-config-flags=--static)
 -  list(APPEND ffmpeg_conf --enable-cross-compile --cpu=${CPU} --arch=${CPU} --target-os=${OS})
 +  list(APPEND ffmpeg_conf --enable-cross-compile --arch=${CPU} --target-os=${OS})
-   list(APPEND ffmpeg_conf --cc=${CMAKE_C_COMPILER} --cxx=${CMAKE_CXX_COMPILER} --ar=${CMAKE_AR})
+   list(APPEND ffmpeg_conf --ar=${CMAKE_AR} --strip=${CMAKE_STRIP})
    message(STATUS "CROSS: ${ffmpeg_conf}")
  endif()
--- 
-2.18.0
-
diff --git a/package/kodi/0003-Add-missing-cassert-includes.patch b/package/kodi/0003-Add-missing-cassert-includes.patch
new file mode 100644
index 0000000000..ec52f32d0d
--- /dev/null
+++ b/package/kodi/0003-Add-missing-cassert-includes.patch
@@ -0,0 +1,50 @@
+From 711845d533f9f6b5fe68b7cbcc8f369ce7efe445 Mon Sep 17 00:00:00 2001
+From: Craig Andrews <candrews@integralblue.com>
+Date: Thu, 5 Dec 2019 14:49:50 -0500
+Subject: [PATCH] Add missing cassert includes
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Without these includes, ?assert? was not declared in this scope errors
+occur.
+
+Backport of https://github.com/xbmc/xbmc/pull/17000
+
+Patch sent upstream: https://github.com/xbmc/xbmc/pull/17213
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ xbmc/profiles/dialogs/GUIDialogProfileSettings.cpp | 2 ++
+ xbmc/windowing/GraphicContext.cpp                  | 2 ++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/xbmc/profiles/dialogs/GUIDialogProfileSettings.cpp b/xbmc/profiles/dialogs/GUIDialogProfileSettings.cpp
+index 222d1fa2c8..070ea0ae46 100644
+--- a/xbmc/profiles/dialogs/GUIDialogProfileSettings.cpp
++++ b/xbmc/profiles/dialogs/GUIDialogProfileSettings.cpp
+@@ -33,6 +33,8 @@
+ #include "utils/Variant.h"
+ #include "ServiceBroker.h"
+ 
++#include <cassert>
++
+ #define SETTING_PROFILE_NAME          "profile.name"
+ #define SETTING_PROFILE_IMAGE         "profile.image"
+ #define SETTING_PROFILE_DIRECTORY     "profile.directory"
+diff --git a/xbmc/windowing/GraphicContext.cpp b/xbmc/windowing/GraphicContext.cpp
+index 1ced49671b..0ddbe64c9f 100644
+--- a/xbmc/windowing/GraphicContext.cpp
++++ b/xbmc/windowing/GraphicContext.cpp
+@@ -24,6 +24,8 @@
+ #include "guilib/GUIWindowManager.h"
+ #include "guilib/TextureManager.h"
+ 
++#include <cassert>
++
+ using namespace KODI::MESSAGING;
+ 
+ CGraphicContext::CGraphicContext(void) = default;
+-- 
+2.20.1
+
diff --git a/package/kodi/0003-cmake-iconv-is-a-required-dependency.patch b/package/kodi/0003-cmake-iconv-is-a-required-dependency.patch
deleted file mode 100644
index b95771c525..0000000000
--- a/package/kodi/0003-cmake-iconv-is-a-required-dependency.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From 70ab56d74aff8b2e3ac49fed6bdf3751c9b1457e Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sun, 12 Feb 2017 14:24:18 +0100
-Subject: [PATCH] [cmake] iconv is a required dependency
-
-This patch adds support for libiconv currently only provided by the
-autoconf-based build system:
-https://github.com/xbmc/xbmc/blob/Krypton/configure.ac#L1172
-
-This commit fixes an error during linking with an uClibc-based
-buildroot toolchain:
-
-[100%] Linking CXX executable kodi.bin
-/home/buildroot/br8_ffmpeg3_kodi17_github/output/host/usr/lib/gcc/i586-buildroot-linux-uclibc/6.3.0/../../../../i586-buildroot-linux-uclibc/bin/ld: build/utils/utils.a(CharsetConverter.cpp.o): undefined reference to symbol 'libiconv_open'
-/home/buildroot/br8_ffmpeg3_kodi17_github/output/host/usr/i586-buildroot-linux-uclibc/sysroot/usr/lib32/libiconv.so.2: error adding symbols: DSO missing from command line
-
-Backported to Krypton from master branch commit:
-https://github.com/xbmc/xbmc/commit/9a64537543e8dc8609ca8a98181ba17f30c53493
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- project/cmake/CMakeLists.txt          |  2 +-
- project/cmake/modules/FindIconv.cmake | 44 +++++++++++++++++++++++++++++++++++
- 2 files changed, 45 insertions(+), 1 deletion(-)
- create mode 100644 project/cmake/modules/FindIconv.cmake
-
-diff --git a/project/cmake/CMakeLists.txt b/project/cmake/CMakeLists.txt
-index aeb1ff47c2..07c1d1a8d3 100644
---- a/project/cmake/CMakeLists.txt
-+++ b/project/cmake/CMakeLists.txt
-@@ -103,7 +103,7 @@ list(APPEND DEPLIBS ${CMAKE_THREAD_LIBS_INIT})
- 
- # Required dependencies
- set(required_deps Sqlite3 FreeType PCRE Cpluff LibDvd
--                  TinyXML Python Yajl Cdio
-+                  TinyXML Python Yajl Cdio Iconv
-                   Lzo2 Fribidi TagLib FFMPEG CrossGUID)
- if(NOT WIN32)
-   list(APPEND required_deps ZLIB)
-diff --git a/project/cmake/modules/FindIconv.cmake b/project/cmake/modules/FindIconv.cmake
-new file mode 100644
-index 0000000000..8ee01fb6b8
---- /dev/null
-+++ b/project/cmake/modules/FindIconv.cmake
-@@ -0,0 +1,44 @@
-+#.rst:
-+# FindICONV
-+# --------
-+# Finds the ICONV library
-+#
-+# This will will define the following variables::
-+#
-+# ICONV_FOUND - system has ICONV
-+# ICONV_INCLUDE_DIRS - the ICONV include directory
-+# ICONV_LIBRARIES - the ICONV libraries
-+#
-+# and the following imported targets::
-+#
-+#   ICONV::ICONV   - The ICONV library
-+
-+find_path(ICONV_INCLUDE_DIR NAMES iconv.h)
-+
-+find_library(ICONV_LIBRARY NAMES iconv libiconv c)
-+
-+set(CMAKE_REQUIRED_LIBRARIES ${ICONV_LIBRARY})
-+check_function_exists(iconv HAVE_ICONV_FUNCTION)
-+if(NOT HAVE_ICONV_FUNCTION)
-+  check_function_exists(libiconv HAVE_LIBICONV_FUNCTION2)
-+  set(HAVE_ICONV_FUNCTION ${HAVE_LIBICONV_FUNCTION2})
-+  unset(HAVE_LIBICONV_FUNCTION2)
-+endif()
-+
-+include(FindPackageHandleStandardArgs)
-+find_package_handle_standard_args(Iconv
-+                                  REQUIRED_VARS ICONV_LIBRARY ICONV_INCLUDE_DIR HAVE_ICONV_FUNCTION)
-+
-+if(ICONV_FOUND)
-+  set(ICONV_LIBRARIES ${ICONV_LIBRARY})
-+  set(ICONV_INCLUDE_DIRS ${ICONV_INCLUDE_DIR})
-+
-+  if(NOT TARGET ICONV::ICONV)
-+    add_library(ICONV::ICONV UNKNOWN IMPORTED)
-+    set_target_properties(ICONV::ICONV PROPERTIES
-+                                     IMPORTED_LOCATION "${ICONV_LIBRARY}"
-+                                     INTERFACE_INCLUDE_DIRECTORIES "${ICONV_INCLUDE_DIR}")
-+  endif()
-+endif()
-+
-+mark_as_advanced(ICONV_INCLUDE_DIR ICONV_LIBRARY HAVE_ICONV_FUNCTION)
--- 
-2.11.0
-
diff --git a/package/kodi/0004-Backport-Add-missing-cstddef-includes.patch b/package/kodi/0004-Backport-Add-missing-cstddef-includes.patch
new file mode 100644
index 0000000000..607c80610a
--- /dev/null
+++ b/package/kodi/0004-Backport-Add-missing-cstddef-includes.patch
@@ -0,0 +1,44 @@
+From d1b2a27d2d2795fe82c103b49faef74b55df22c7 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 18 Jan 2020 14:49:16 +0100
+Subject: [PATCH] [Backport] Add missing cstddef includes
+
+Backport of https://github.com/xbmc/xbmc/pull/17214
+
+Patch sent upstream: https://github.com/xbmc/xbmc/pull/17215
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ .../rendering/VideoRenderers/RPRendererGuiTexture.cpp           | 2 ++
+ xbmc/pictures/SlideShowPicture.cpp                              | 2 ++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/xbmc/cores/RetroPlayer/rendering/VideoRenderers/RPRendererGuiTexture.cpp b/xbmc/cores/RetroPlayer/rendering/VideoRenderers/RPRendererGuiTexture.cpp
+index 5485358cad..ad2bf1b984 100644
+--- a/xbmc/cores/RetroPlayer/rendering/VideoRenderers/RPRendererGuiTexture.cpp
++++ b/xbmc/cores/RetroPlayer/rendering/VideoRenderers/RPRendererGuiTexture.cpp
+@@ -17,6 +17,8 @@
+ using namespace DirectX;
+ #endif
+ 
++#include <cstddef>
++
+ using namespace KODI;
+ using namespace RETRO;
+ 
+diff --git a/xbmc/pictures/SlideShowPicture.cpp b/xbmc/pictures/SlideShowPicture.cpp
+index 05848191d2..08fc754471 100644
+--- a/xbmc/pictures/SlideShowPicture.cpp
++++ b/xbmc/pictures/SlideShowPicture.cpp
+@@ -32,6 +32,8 @@ using namespace DirectX;
+ using namespace Microsoft::WRL;
+ #endif
+ 
++#include <cstddef>
++
+ #define IMMEDIATE_TRANSITION_TIME          20
+ 
+ #define PICTURE_MOVE_AMOUNT              0.02f
+-- 
+2.20.1
+
diff --git a/package/kodi/0004-Fix-ffmpeg-build-for-mips.patch b/package/kodi/0004-Fix-ffmpeg-build-for-mips.patch
deleted file mode 100644
index 709a2d39da..0000000000
--- a/package/kodi/0004-Fix-ffmpeg-build-for-mips.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From e3882a7d6c2e47731c0435d0faa3594041d58a2c Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sun, 12 Aug 2018 15:12:29 +0200
-Subject: [PATCH] Fix ffmpeg build for mips
-
-Backported from upstream master branch:
-https://github.com/xbmc/xbmc/commit/71e09dd1ac66059e31e6240352da7091d820ef83
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- tools/depends/target/ffmpeg/CMakeLists.txt | 2 +-
- tools/depends/target/ffmpeg/Makefile       | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/tools/depends/target/ffmpeg/CMakeLists.txt b/tools/depends/target/ffmpeg/CMakeLists.txt
-index 0a9e9d38ea..fda6b0cac4 100644
---- a/tools/depends/target/ffmpeg/CMakeLists.txt
-+++ b/tools/depends/target/ffmpeg/CMakeLists.txt
-@@ -63,7 +63,7 @@ endif()
- if(CPU MATCHES arm OR CORE_SYSTEM_NAME STREQUAL rbpi)
-   list(APPEND ffmpeg_conf --enable-pic --disable-armv5te --disable-armv6t2)
- elseif(CPU MATCHES mips)
--  list(APPEND ffmpeg_conf --disable-mips32r2 --disable-mipsdspr1 --disable-mipsdspr2)
-+  list(APPEND ffmpeg_conf --disable-mips32r2 --disable-mipsdsp --disable-mipsdspr2)
- endif()
- 
- find_package(GnuTls)
-diff --git a/tools/depends/target/ffmpeg/Makefile b/tools/depends/target/ffmpeg/Makefile
-index ea1113d293..098f6c0c14 100644
---- a/tools/depends/target/ffmpeg/Makefile
-+++ b/tools/depends/target/ffmpeg/Makefile
-@@ -58,7 +58,7 @@ ifeq ($(findstring arm, $(CPU)), arm)
-   ffmpg_config += --enable-pic --disable-armv5te --disable-armv6t2
- endif
- ifeq ($(findstring mips, $(CPU)), mips)
--  ffmpg_config += --disable-mips32r2 --disable-mipsdspr1 --disable-mipsdspr2
-+  ffmpg_config += --disable-mips32r2 --disable-mipsdsp --disable-mipsdspr2
- endif
- ifeq ($(Configuration), Release)
-   ffmpg_config += --disable-debug
--- 
-2.18.0
-
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index db6931ed8a..f592e18e13 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -23,7 +23,9 @@ config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_RBPI
 	# List of valid CPUs can be found here:
 	# https://github.com/xbmc/xbmc/blob/Krypton/project/cmake/scripts/rbpi/ArchSetup.cmake#L12
 	depends on BR2_arm1176jzf_s || BR2_cortex_a7 || BR2_cortex_a53
+	depends on BR2_ENABLE_LOCALE # libinput
 	depends on BR2_PACKAGE_RPI_USERLAND
+	depends on BR2_PACKAGE_HAS_UDEV # libinput
 	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
 
 config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11_OPENGL
@@ -50,10 +52,12 @@ menuconfig BR2_PACKAGE_KODI
 	depends on BR2_PACKAGE_PYTHON
 	depends on !BR2_PACKAGE_PYTHON_PYC_ONLY
 	select BR2_NEEDS_HOST_JAVA
-	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_FLATBUFFERS
+	select BR2_PACKAGE_FMT
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_FSTRCMP
 	select BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBASS
 	select BR2_PACKAGE_LIBCDIO
@@ -69,17 +73,16 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_PCRE_UCP
 	select BR2_PACKAGE_PYTHON_BSDDB
-	select BR2_PACKAGE_PYTHON_BZIP2
 	select BR2_PACKAGE_PYTHON_CURSES
 	select BR2_PACKAGE_PYTHON_PYEXPAT
 	select BR2_PACKAGE_PYTHON_SQLITE
 	select BR2_PACKAGE_PYTHON_SSL
 	select BR2_PACKAGE_PYTHON_UNICODEDATA
 	select BR2_PACKAGE_PYTHON_ZLIB
+	select BR2_PACKAGE_RAPIDJSON
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_TAGLIB
 	select BR2_PACKAGE_TINYXML
-	select BR2_PACKAGE_YAJL
 	select BR2_PACKAGE_ZLIB
 	select BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY if BR2_TOOLCHAIN_USES_GLIBC # runtime UTF conversion support
 	help
@@ -152,11 +155,6 @@ config BR2_PACKAGE_KODI_LCMS2
 	help
 	  Enable color management support.
 
-config BR2_PACKAGE_KODI_LIRC
-	bool "lirc"
-	help
-	  Enable lirc support
-
 config BR2_PACKAGE_KODI_LIBMICROHTTPD
 	bool "web server"
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt, libmicrohttpd
@@ -181,12 +179,6 @@ config BR2_PACKAGE_KODI_MYSQL
 	help
 	  Enable MySQL support
 
-config BR2_PACKAGE_KODI_NONFREE
-	bool "nonfree components"
-	help
-	  Enable components with non-free licenses. This option
-	  currently only controls support for RAR archives.
-
 choice
 	prompt "platform"
 	default BR2_PACKAGE_KODI_PLATFORM_X11_OPENGL
@@ -194,6 +186,8 @@ choice
 config BR2_PACKAGE_KODI_PLATFORM_RBPI
 	bool "Raspberry Pi"
 	depends on BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_RBPI
+	select BR2_PACKAGE_LIBINPUT
+	select BR2_PACKAGE_LIBXKBCOMMON
 
 config BR2_PACKAGE_KODI_PLATFORM_X11_OPENGL
 	bool "X11/OpenGL"
@@ -229,12 +223,6 @@ config BR2_PACKAGE_KODI_LIBSMBCLIENT
 	help
 	  Enable Samba support
 
-config BR2_PACKAGE_KODI_LIBSSH
-	bool "ssh"
-	select BR2_PACKAGE_LIBSSH
-	help
-	  Enable sftp virtual filesystem using libssh.
-
 config BR2_PACKAGE_KODI_LIBTHEORA
 	bool "theora"
 	select BR2_PACKAGE_LIBTHEORA
diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
index 2b2e5e64f9..cc248e537e 100644
--- a/package/kodi/kodi.hash
+++ b/package/kodi/kodi.hash
@@ -1,12 +1,11 @@
 # Locally computed
-sha256 c8312fe92e5bab1cdac1da93d60baed88fa1574146c50c44e3c86d01671c2b1d  kodi-17.6-Krypton.tar.gz
+sha256 108979df8b41ab4168f5cdc0233f46e38767eda5921f4ccae16584e98d0d6b29  kodi-18.5-Leia.tar.gz
+sha256 9d2396ef3e091d3b82bc84143e070700412984e8589513570f54e0675d1e8851  LICENSE.md
 # Locally computed - ffmpeg
-sha256 7df8bce40765b39de5766ca9d08b5b9ac1f498c65c805c989461b907cee6b7c0  3.1.11-Krypton-17.5.tar.gz
+sha256 e11e7594af35f36ab2711252c3d6bb106908f26605498aef4a9be2d7bc001db2  4.0.4-Leia-18.4.tar.gz
 # Locally computed - libdvdcss
-sha256 b6eb2d929ff56cb051152c32010afc5e7cf5fe8c5ae32dca412a2b46b6b57e34  2f12236.tar.gz
+sha256 d816ed421ca5b70319298bda7830cff475a77d446539c54cf6d576dd6c651cee  e646b950095589e74a2c08cf0c34b758c669aa75.tar.gz
 # Locally computed - libdvdnav
-sha256 312b3d15bc448d24e92f4b2e7248409525eccc4e75776026d805478e51c5ef3d  981488f.tar.gz
+sha256 e50db40a823ddc795d1fe5f18db2517fb3e05fe0c4a88abf1578d95d7a1cce63  9277007ce2263b908e9ce3091cc31b3dd87c351c.tar.gz
 # Locally computed - libdvdread
-sha256 e7179b2054163652596a56301c9f025515cb08c6d6310b42b897c3ad11c0199b  17d99db.tar.gz
-# Locally computed
-sha256 89931c1fb1f3716694175763cf3221cfcd63d6935031cf6b4512d17ffe5d9860  LICENSE.GPL
+sha256 2d9d6d185dd25a983d6dfc2a00207cafdc396a969c227d5edd84b6215b2fba89  bd6b329f0137ab6a9f779a28dd96f04713735e17.tar.gz
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 9ea170ff6b..435f47cae8 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -6,18 +6,23 @@
 
 # When updating the version, please also update kodi-jsonschemabuilder
 # and kodi-texturepacker
-KODI_VERSION = 17.6-Krypton
+KODI_VERSION = 18.5-Leia
 KODI_SITE = $(call github,xbmc,xbmc,$(KODI_VERSION))
 KODI_LICENSE = GPL-2.0
-KODI_LICENSE_FILES = LICENSE.GPL
+KODI_LICENSE_FILES = LICENSE.md
 # needed for binary addons
 KODI_INSTALL_STAGING = YES
+# kodi recommends building out-of-source
+KODI_SUPPORTS_IN_SOURCE_BUILD = NO
 KODI_DEPENDENCIES = \
-	bzip2 \
 	expat \
+	flatbuffers \
+	fmt \
 	fontconfig \
 	freetype \
+	fstrcmp \
 	gnutls \
+	host-flatbuffers \
 	host-gawk \
 	host-gettext \
 	host-gperf \
@@ -26,7 +31,6 @@ KODI_DEPENDENCIES = \
 	host-nasm \
 	host-swig \
 	host-xmlstarlet \
-	host-zip \
 	libass \
 	libcdio \
 	libcrossguid \
@@ -39,44 +43,53 @@ KODI_DEPENDENCIES = \
 	openssl \
 	pcre \
 	python \
+	rapidjson \
 	sqlite \
 	taglib \
 	tinyxml \
-	yajl \
 	zlib
 
-KODI_SUBDIR = project/cmake
-
 # taken from tools/depends/target/ffmpeg/FFMPEG-VERSION
-KODI_FFMPEG_VERSION = 3.1.11-Krypton-17.5
+KODI_FFMPEG_VERSION = 4.0.4-Leia-18.4
 KODI_EXTRA_DOWNLOADS += \
 	https://github.com/xbmc/FFmpeg/archive/$(KODI_FFMPEG_VERSION).tar.gz
 
-KODI_LIBDVDCSS_VERSION = 2f12236
-KODI_LIBDVDNAV_VERSION = 981488f
-KODI_LIBDVDREAD_VERSION = 17d99db
+# 1.4.2-Leia-Beta-5
+KODI_LIBDVDCSS_VERSION = e646b950095589e74a2c08cf0c34b758c669aa75
+# 6.0.0-Leia-Alpha-3
+KODI_LIBDVDNAV_VERSION = 9277007ce2263b908e9ce3091cc31b3dd87c351c
+# 6.0.0-Leia-Alpha-3
+KODI_LIBDVDREAD_VERSION = bd6b329f0137ab6a9f779a28dd96f04713735e17
 KODI_EXTRA_DOWNLOADS += \
 	https://github.com/xbmc/libdvdcss/archive/$(KODI_LIBDVDCSS_VERSION).tar.gz \
 	https://github.com/xbmc/libdvdnav/archive/$(KODI_LIBDVDNAV_VERSION).tar.gz \
 	https://github.com/xbmc/libdvdread/archive/$(KODI_LIBDVDREAD_VERSION).tar.gz
 
+define KODI_CPLUFF_AUTOCONF
+	cd $(KODI_SRCDIR)/lib/cpluff && ./autogen.sh
+endef
+KODI_PRE_CONFIGURE_HOOKS += KODI_CPLUFF_AUTOCONF
+KODI_DEPENDENCIES += host-automake host-autoconf host-libtool
+
 KODI_CONF_OPTS += \
 	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) $(KODI_C_FLAGS)" \
 	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(KODI_CXX_FLAGS)" \
+	-DENABLE_APP_AUTONAME=OFF \
 	-DENABLE_CCACHE=OFF \
 	-DENABLE_DVDCSS=ON \
 	-DENABLE_INTERNAL_CROSSGUID=OFF \
 	-DENABLE_INTERNAL_FFMPEG=ON \
+	-DENABLE_INTERNAL_FLATBUFFERS=OFF \
 	-DFFMPEG_URL=$(KODI_DL_DIR)/$(KODI_FFMPEG_VERSION).tar.gz \
 	-DKODI_DEPENDSBUILD=OFF \
-	-DENABLE_OPENSSL=ON \
+	-DENABLE_LDGOLD=OFF \
 	-DNATIVEPREFIX=$(HOST_DIR) \
 	-DDEPENDS_PATH=$(STAGING_DIR)/usr \
+	-DWITH_JSONSCHEMABUILDER=$(HOST_DIR)/bin/JsonSchemaBuilder \
 	-DWITH_TEXTUREPACKER=$(HOST_DIR)/bin/TexturePacker \
 	-DLIBDVDCSS_URL=$(KODI_DL_DIR)/$(KODI_LIBDVDCSS_VERSION).tar.gz \
 	-DLIBDVDNAV_URL=$(KODI_DL_DIR)/$(KODI_LIBDVDNAV_VERSION).tar.gz \
-	-DLIBDVDREAD_URL=$(KODI_DL_DIR)/$(KODI_LIBDVDREAD_VERSION).tar.gz \
-	-DENABLE_IMX=OFF
+	-DLIBDVDREAD_URL=$(KODI_DL_DIR)/$(KODI_LIBDVDREAD_VERSION).tar.gz
 
 ifeq ($(BR2_ENABLE_LOCALE),)
 KODI_DEPENDENCIES += libiconv
@@ -88,8 +101,7 @@ ifeq ($(BR2_PACKAGE_KODI_PLATFORM_RBPI),y)
 ifeq ($(BR2_arm1176jzf_s)$(BR2_cortex_a7)$(BR2_cortex_a53),y)
 KODI_CONF_OPTS += -DWITH_CPU="$(GCC_TARGET_CPU)"
 endif
-else
-ifeq ($(BR2_arceb)$(BR2_arcle),y)
+else ifeq ($(BR2_arceb)$(BR2_arcle),y)
 KODI_CONF_OPTS += -DWITH_ARCH=arc -DWITH_CPU=arc
 else ifeq ($(BR2_armeb),y)
 KODI_CONF_OPTS += -DWITH_ARCH=arm -DWITH_CPU=arm
@@ -108,7 +120,6 @@ else
 # see project/cmake/scripts/linux/ArchSetup.cmake
 KODI_CONF_OPTS += -DWITH_CPU=$(BR2_ARCH)
 endif
-endif
 
 ifeq ($(BR2_X86_CPU_HAS_SSE),y)
 KODI_CONF_OPTS += -D_SSE_OK=ON -D_SSE_TRUE=ON
@@ -164,26 +175,14 @@ KODI_CXX_FLAGS += -latomic
 endif
 
 ifeq ($(BR2_PACKAGE_KODI_PLATFORM_RBPI),y)
-KODI_CONF_OPTS += -DCORE_SYSTEM_NAME=rbpi -DENABLE_OPENGLES=ON
-KODI_DEPENDENCIES += rpi-userland
-else
-# Kodi considers "rpbi" and "linux" as two separate platforms. The
-# below options, defined in
-# project/cmake/scripts/linux/ArchSetup.cmake are only valid for the
-# "linux" platforms. The "rpbi" platform has a different set of
-# options, defined in project/cmake/scripts/rbpi/
-KODI_CONF_OPTS += -DENABLE_LDGOLD=OFF
+KODI_CONF_OPTS += -DCORE_PLATFORM_NAME=rbpi
+KODI_DEPENDENCIES += libinput libxkbcommon rpi-userland
 endif
 
 ifeq ($(BR2_PACKAGE_KODI_PLATFORM_X11_OPENGL),y)
-KODI_CONF_OPTS += \
-	-DENABLE_OPENGL=ON \
-	-DENABLE_OPENGLES=OFF \
-	-DENABLE_X11=ON
+KODI_CONF_OPTS += -DCORE_PLATFORM_NAME=x11
 KODI_DEPENDENCIES += libegl libglu libgl xlib_libX11 xlib_libXext \
 	xlib_libXrandr libdrm
-else
-KODI_CONF_OPTS += -DENABLE_OPENGL=OFF -DENABLE_X11=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_KODI_MYSQL),y)
@@ -193,14 +192,6 @@ else
 KODI_CONF_OPTS += -DENABLE_MYSQLCLIENT=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_KODI_NONFREE),y)
-KODI_CONF_OPTS += -DENABLE_NONFREE=ON
-KODI_LICENSE += , unrar
-KODI_LICENSE_FILES += lib/UnrarXLib/license.txt
-else
-KODI_CONF_OPTS += -DENABLE_NONFREE=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 KODI_CONF_OPTS += -DENABLE_UDEV=ON
 KODI_DEPENDENCIES += udev
@@ -288,13 +279,6 @@ else
 KODI_CONF_OPTS += -DENABLE_AIRTUNES=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_KODI_LIBSSH),y)
-KODI_DEPENDENCIES += libssh
-KODI_CONF_OPTS += -DENABLE_SSH=ON
-else
-KODI_CONF_OPTS += -DENABLE_SSH=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_KODI_AVAHI),y)
 KODI_DEPENDENCIES += avahi
 KODI_CONF_OPTS += -DENABLE_AVAHI=ON
@@ -316,10 +300,8 @@ else
 KODI_CONF_OPTS += -DENABLE_LCMS2=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_KODI_LIRC),y)
-KODI_CONF_OPTS += -DENABLE_LIRC=ON
-else
-KODI_CONF_OPTS += -DENABLE_LIRC=OFF
+ifeq ($(BR2_PACKAGE_LIRC_TOOLS),y)
+KODI_DEPENDENCIES += lirc-tools
 endif
 
 ifeq ($(BR2_PACKAGE_KODI_LIBTHEORA),y)
-- 
2.20.1
