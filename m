From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  3 Jan 2020 11:57:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/wireshark: fix static build with
 brotli
Message-ID: <20200103105706.1500629-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/2387d4590c5dce73d5f6d72bccf253e79f9a73d8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-FindBROTLI.cmake-fix-static-linking.patch | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 package/wireshark/0002-FindBROTLI.cmake-fix-static-linking.patch

diff --git a/package/wireshark/0002-FindBROTLI.cmake-fix-static-linking.patch b/package/wireshark/0002-FindBROTLI.cmake-fix-static-linking.patch
new file mode 100644
index 0000000000..e20821311a
--- /dev/null
+++ b/package/wireshark/0002-FindBROTLI.cmake-fix-static-linking.patch
@@ -0,0 +1,55 @@
+From 3055fa75774f0aa532f3bd293875b25eb2312191 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 3 Jan 2020 10:47:30 +0100
+Subject: [PATCH] FindBROTLI.cmake: fix static linking
+
+Use pkg-config to retrieve dependencies of libbrotlidec such as
+libbrotlicommon otherwise static build will fail on:
+
+[100%] Building C object CMakeFiles/tshark.dir/ui/cli/tap-smbsids.c.o
+/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot/autobuild/instance-1/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libbrotlidec.a(decode.c.o): in function `ProcessCommands':
+decode.c:(.text+0x36d0): undefined reference to `BrotliTransformDictionaryWord'
+/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot/autobuild/instance-1/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libbrotlidec.a(decode.c.o): in function `SafeProcessCommands':
+decode.c:(.text+0x418c): undefined reference to `BrotliTransformDictionaryWord'
+/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot/autobuild/instance-1/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libbrotlidec.a(state.c.o): in function `BrotliDecoderStateInit':
+state.c:(.text+0x120): undefined reference to `BrotliGetDictionary'
+/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: state.c:(.text+0x128): undefined reference to `BrotliGetTransforms'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/2387d4590c5dce73d5f6d72bccf253e79f9a73d8
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: Not sent yet (waiting for feedback on first patch)]
+---
+ cmake/modules/FindBROTLI.cmake | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/cmake/modules/FindBROTLI.cmake b/cmake/modules/FindBROTLI.cmake
+index 4ab8dbb41c..43fb7ad11c 100644
+--- a/cmake/modules/FindBROTLI.cmake
++++ b/cmake/modules/FindBROTLI.cmake
+@@ -11,6 +11,9 @@
+ include( FindWSWinLibs )
+ FindWSWinLibs( "brotli-.*" "BROTLI_HINTS" )
+ 
++find_package(PkgConfig QUIET)
++PKG_CHECK_MODULES(PC_BROTLI QUIET libbrotlidec)
++
+ find_path(BROTLI_INCLUDE_DIR
+   NAMES "brotli/decode.h"
+   HINTS "${BROTLI_HINTS}/include"
+@@ -28,6 +31,11 @@ if( BROTLI_FOUND )
+   set( BROTLI_INCLUDE_DIRS ${BROTLI_INCLUDE_DIR} )
+   set( BROTLI_LIBRARIES ${BROTLIDEC_LIBRARY} )
+ 
++  # Include transitive dependencies for static linking.
++  if(UNIX AND CMAKE_FIND_LIBRARY_SUFFIXES STREQUAL ".a")
++    list(APPEND BROTLI_LIBRARIES ${PC_BROTLI_LIBRARIES})
++  endif()
++
+   if (WIN32)
+     set ( BROTLI_DLL_DIR "${BROTLI_HINTS}/bin"
+       CACHE PATH "Path to the brotli DLLs"
+-- 
+2.24.0
+
-- 
2.24.0
