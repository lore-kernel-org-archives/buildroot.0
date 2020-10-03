From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  3 Oct 2020 14:24:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/fluidsynth: bump to version 2.1.5
Message-ID: <20201003122441.3792272-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop patch (already in version)

https://github.com/FluidSynth/fluidsynth/releases/tag/v2.1.5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...MakeLists.txt-fix-build-with-gcc-4.8.patch | 49 -------------------
 package/fluidsynth/fluidsynth.hash            |  2 +-
 package/fluidsynth/fluidsynth.mk              |  2 +-
 3 files changed, 2 insertions(+), 51 deletions(-)
 delete mode 100644 package/fluidsynth/0001-CMakeLists.txt-fix-build-with-gcc-4.8.patch

diff --git a/package/fluidsynth/0001-CMakeLists.txt-fix-build-with-gcc-4.8.patch b/package/fluidsynth/0001-CMakeLists.txt-fix-build-with-gcc-4.8.patch
deleted file mode 100644
index 1e906f53bb..0000000000
--- a/package/fluidsynth/0001-CMakeLists.txt-fix-build-with-gcc-4.8.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From a810e30a3d560d3e6ced41c74032c54ea365a88e Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 16 Aug 2020 20:17:26 +0200
-Subject: [PATCH] CMakeLists.txt: fix build with gcc 4.8
-
--Werror=incompatible-pointer-types is unconditionally used since version
-2.1.4 and 137a14e106d75d1260f78acc1a19c5a936ef75b2. This will raise a
-build failure when checking for threads on gcc 4.8:
-
-/home/buildroot/autobuild/run/instance-3/output-1/host/bin/arm-none-linux-gnueabi-gcc --sysroot=/home/buildroot/autobuild/run/instance-3/output-1/host/arm-buildroot-linux-gnueabi/sysroot -DTESTKEYWORD=inline  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -Wall -W -Wpointer-arith -Wcast-qual -Wstrict-prototypes -Wno-unused-parameter -Wdeclaration-after-statement -Werror=implicit-function-declaration -Werror=incompatible-pointer-types -Wbad-function-cast -Wcast-align   -DNDEBUG -fPIE   -o CMakeFiles/cmTC_98946.dir/CheckIncludeFile.c.o   -c /home/buildroot/autobuild/run/instance-3/output-1/build/fluidsynth-2.1.4/CMakeFiles/CMakeTmp/CheckIncludeFile.c
-cc1: error: -Werror=incompatible-pointer-types: no option -Wincompatible-pointer-types
-
-Fixes:
- - http://autobuild.buildroot.org/results/13cbba871db56ef8657a3d13c6ac8e1b4da0d244
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/FluidSynth/fluidsynth/pull/661]
----
- CMakeLists.txt | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 7844889..0f6c169 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -146,6 +146,7 @@ endif ( POLICY CMP0063 )
- include ( DefaultDirs )
- 
- # Basic C library checks
-+include ( CheckCCompilerFlag )
- include ( CheckSTDC )
- include ( CheckIncludeFile )
- include ( CheckFunctionExists )
-@@ -196,7 +197,11 @@ if ( CMAKE_COMPILER_IS_GNUCC OR CMAKE_C_COMPILER_ID MATCHES "Clang" OR CMAKE_C_C
-   endif ( NOT APPLE AND NOT OS2 )
- 
-   # define some warning flags
--  set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -W -Wpointer-arith -Wcast-qual -Wstrict-prototypes -Wno-unused-parameter -Wdeclaration-after-statement -Werror=implicit-function-declaration -Werror=incompatible-pointer-types" )
-+  set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -W -Wpointer-arith -Wcast-qual -Wstrict-prototypes -Wno-unused-parameter -Wdeclaration-after-statement -Werror=implicit-function-declaration" )
-+  check_c_compiler_flag ( "-Werror=incompatible-pointer-types" HAVE_INCOMPATIBLE_POINTER_TYPES )
-+  if ( HAVE_INCOMPATIBLE_POINTER_TYPES )
-+    set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Werror=incompatible-pointer-types" )
-+  endif ( HAVE_INCOMPATIBLE_POINTER_TYPES ) 
- 
-   # prepend to build type specific flags, to allow users to override
-   set ( CMAKE_C_FLAGS_DEBUG "-g ${CMAKE_C_FLAGS_DEBUG}" )
--- 
-2.27.0
-
diff --git a/package/fluidsynth/fluidsynth.hash b/package/fluidsynth/fluidsynth.hash
index 9469305cdc..17e37e2479 100644
--- a/package/fluidsynth/fluidsynth.hash
+++ b/package/fluidsynth/fluidsynth.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6e4f3e4a957d03812765bd0e400f61cd6c9fdb4bf10970e5cdaea8487d54b250  fluidsynth-2.1.4.tar.gz
+sha256  b539b7c65a650b56f01cd60a4e83c6125c217c5a63c0c214ef6274894a677d00  fluidsynth-2.1.5.tar.gz
 sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index 828a5cab8f..5756df544c 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUIDSYNTH_VERSION = 2.1.4
+FLUIDSYNTH_VERSION = 2.1.5
 FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
 FLUIDSYNTH_LICENSE = LGPL-2.1+
 FLUIDSYNTH_LICENSE_FILES = LICENSE
-- 
2.28.0
