From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  3 Jan 2020 14:48:21 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/wireshark: fix static build with brotli
Message-ID: <20200103134821.1505736-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/2387d4590c5dce73d5f6d72bccf253e79f9a73d8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Drop CMAKE_FIND_LIBRARY_SUFFIXES STREQUAL ".a" from patch

 ...-FindBROTLI.cmake-fix-static-linking.patch | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 package/wireshark/0002-FindBROTLI.cmake-fix-static-linking.patch

diff --git a/package/wireshark/0002-FindBROTLI.cmake-fix-static-linking.patch b/package/wireshark/0002-FindBROTLI.cmake-fix-static-linking.patch
new file mode 100644
index 0000000000..1300a65167
--- /dev/null
+++ b/package/wireshark/0002-FindBROTLI.cmake-fix-static-linking.patch
@@ -0,0 +1,54 @@
+From e1d88b868f57d79a3e90af34f3961f56172998ba Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 3 Jan 2020 10:47:30 +0100
+Subject: [PATCH 2/2] FindBROTLI.cmake: fix static linking
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
+ cmake/modules/FindBROTLI.cmake | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/cmake/modules/FindBROTLI.cmake b/cmake/modules/FindBROTLI.cmake
+index 4ab8dbb41c..687afd6e5e 100644
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
+@@ -28,6 +31,10 @@ if( BROTLI_FOUND )
+   set( BROTLI_INCLUDE_DIRS ${BROTLI_INCLUDE_DIR} )
+   set( BROTLI_LIBRARIES ${BROTLIDEC_LIBRARY} )
+ 
++  if(UNIX)
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
