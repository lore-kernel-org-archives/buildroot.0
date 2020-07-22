From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 09:15:41 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/libvncserver:
 security bump to version 0.9.13
Message-ID: <20200722085626.46F7F880B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4d6637977fde65f5d0042df4c3759bd970379c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

- Drop all patches (already in version)
- Fix CVE-2018-21247: An issue was discovered in LibVNCServer before
  0.9.13. There is an information leak (of uninitialized memory contents)
  in the libvncclient/rfbproto.c ConnectToRFBRepeater function.
- Fix CVE-2019-20839: libvncclient/sockets.c in LibVNCServer before
  0.9.13 has a buffer overflow via a long socket filename.
- Fix CVE-2019-20840: An issue was discovered in LibVNCServer before
  0.9.13. libvncserver/ws_decode.c can lead to a crash because of
  unaligned accesses in hybiReadAndDecode.
- Fix CVE-2020-14396: An issue was discovered in LibVNCServer before
  0.9.13. libvncclient/tls_openssl.c has a NULL pointer dereference.
- Fix CVE-2020-14397: An issue was discovered in LibVNCServer before
  0.9.13. libvncserver/rfbregion.c has a NULL pointer dereference.
- Fix CVE-2020-14398: An issue was discovered in LibVNCServer before
  0.9.13. An improperly closed TCP connection causes an infinite loop in
  libvncclient/sockets.c.
- Fix CVE-2020-14399: An issue was discovered in LibVNCServer before
  0.9.13. Byte-aligned data is accessed through uint32_t pointers in
  libvncclient/rfbproto.c.
- Fix CVE-2020-14400: An issue was discovered in LibVNCServer before
  0.9.13. Byte-aligned data is accessed through uint16_t pointers in
  libvncserver/translate.c.
- Fix CVE-2020-14401: An issue was discovered in LibVNCServer before
  0.9.13. libvncserver/scale.c has a pixel_value integer overflow.
- Fix CVE-2020-14402: An issue was discovered in LibVNCServer before
  0.9.13. libvncserver/corre.c allows out-of-bounds access via
  encodings.
- Fix CVE-2020-14403: An issue was discovered in LibVNCServer before
  0.9.13. libvncserver/hextile.c allows out-of-bounds access via
  encodings.
- Fix CVE-2020-14404: An issue was discovered in LibVNCServer before
  0.9.13. libvncserver/rre.c allows out-of-bounds access via encodings.
- Fix CVE-2020-14405: An issue was discovered in LibVNCServer before
  0.9.13. libvncclient/rfbproto.c does not limit TextChat size.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e1b60ef18142e19cda12feae9c396f0947c9e68c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-CMakeLists.txt-fix-build-without-C.patch  | 33 -------------
 ...vnc-client-server-.pc.cmakein-remove-zlib.patch | 45 ------------------
 ...bytes-in-rfbProcessFileTransferReadBuffer.patch | 47 -------------------
 ...ver-don-t-leak-stack-memory-to-the-remote.patch | 26 -----------
 ...txt-don-t-build-tight.c-without-png-or-zl.patch | 54 ----------------------
 ...nt-cursor-limit-width-height-input-values.patch | 40 ----------------
 package/libvncserver/libvncserver.hash             |  2 +-
 package/libvncserver/libvncserver.mk               | 11 +----
 8 files changed, 2 insertions(+), 256 deletions(-)

diff --git a/package/libvncserver/0001-CMakeLists.txt-fix-build-without-C.patch b/package/libvncserver/0001-CMakeLists.txt-fix-build-without-C.patch
deleted file mode 100644
index 591c97fd6a..0000000000
--- a/package/libvncserver/0001-CMakeLists.txt-fix-build-without-C.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 868f0a9fa60bb45ee6cf762f323c5b3964b2ee69 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 23 Jun 2019 10:18:59 +0200
-Subject: [PATCH] CMakeLists.txt: fix build without C++
-
-Specify that libvncserver is a C project file otherwise build will fail
-if no C++ compiler is found by cmake
-
-Fixes:
- - http://autobuild.buildroot.org/results/16aaa4e86a2dbf1acf95f10d5131b0f7b8a3d61a
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/LibVNC/libvncserver/pull/317]
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 0d3b4dc..ad609ae 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,7 +1,7 @@
- cmake_minimum_required(VERSION 3.4)
- cmake_policy(SET CMP0037 NEW)
- 
--project(LibVNCServer)
-+project(LibVNCServer C)
- include(CheckFunctionExists)
- include(CheckSymbolExists)
- include(CheckIncludeFile)
--- 
-2.20.1
-
diff --git a/package/libvncserver/0002-libvnc-client-server-.pc.cmakein-remove-zlib.patch b/package/libvncserver/0002-libvnc-client-server-.pc.cmakein-remove-zlib.patch
deleted file mode 100644
index 7941a98882..0000000000
--- a/package/libvncserver/0002-libvnc-client-server-.pc.cmakein-remove-zlib.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 5abd95b65fe5ec24749164338a9718ecce19e240 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 28 Feb 2020 10:29:58 +0100
-Subject: [PATCH] libvnc{client,server}.pc.cmakein: remove zlib
-
-Remove zlib from Requires.private as libvnc can be built without zlib
-thanks to WITH_LIB, zlib will be added to Libs.private thanks to
-PRIVATE_LIBS
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/LibVNC/libvncserver/pull/377]
----
- libvncclient.pc.cmakein | 2 +-
- libvncserver.pc.cmakein | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libvncclient.pc.cmakein b/libvncclient.pc.cmakein
-index 336e73f..ceeda39 100644
---- a/libvncclient.pc.cmakein
-+++ b/libvncclient.pc.cmakein
-@@ -7,7 +7,7 @@ Name: LibVNCClient
- Description: A library for easy implementation of a VNC client.
- Version: @LibVNCServer_VERSION@
- Requires:
--Requires.private: zlib
-+Requires.private:
- Libs: -L${libdir} -lvncclient
- Libs.private: @PRIVATE_LIBS@
- Cflags: -I${includedir}
-diff --git a/libvncserver.pc.cmakein b/libvncserver.pc.cmakein
-index dfcec9d..33ec668 100644
---- a/libvncserver.pc.cmakein
-+++ b/libvncserver.pc.cmakein
-@@ -7,7 +7,7 @@ Name: LibVNCServer
- Description: A library for easy implementation of a VNC server.
- Version: @LibVNCServer_VERSION@
- Requires:
--Requires.private: zlib
-+Requires.private:
- Libs: -L${libdir} -lvncserver
- Libs.private: @PRIVATE_LIBS@
- Cflags: -I${includedir}
--- 
-2.25.0
-
diff --git a/package/libvncserver/0003-Limit-lenght-to-INT_MAX-bytes-in-rfbProcessFileTransferReadBuffer.patch b/package/libvncserver/0003-Limit-lenght-to-INT_MAX-bytes-in-rfbProcessFileTransferReadBuffer.patch
deleted file mode 100644
index 7461f11f80..0000000000
--- a/package/libvncserver/0003-Limit-lenght-to-INT_MAX-bytes-in-rfbProcessFileTransferReadBuffer.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 09e8fc02f59f16e2583b34fe1a270c238bd9ffec Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Petr=20P=C3=ADsa=C5=99?= <ppisar@redhat.com>
-Date: Mon, 7 Jan 2019 10:40:01 +0100
-Subject: [PATCH] Limit lenght to INT_MAX bytes in
- rfbProcessFileTransferReadBuffer()
-
-This ammends 15bb719c03cc70f14c36a843dcb16ed69b405707 fix for a heap
-out-of-bound write access in rfbProcessFileTransferReadBuffer() when
-reading a transfered file content in a server. The former fix did not
-work on platforms with a 32-bit int type (expected by rfbReadExact()).
-
-CVE-2018-15127
-<https://github.com/LibVNC/libvncserver/issues/243>
-<https://github.com/LibVNC/libvncserver/issues/273>
-[Retrieved from:
-https://github.com/LibVNC/libvncserver/commit/09e8fc02f59f16e2583b34fe1a270c238bd9ffec]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- libvncserver/rfbserver.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/libvncserver/rfbserver.c b/libvncserver/rfbserver.c
-index 7af84906..f2edbeea 100644
---- a/libvncserver/rfbserver.c
-+++ b/libvncserver/rfbserver.c
-@@ -88,6 +88,8 @@
- #include <errno.h>
- /* strftime() */
- #include <time.h>
-+/* INT_MAX */
-+#include <limits.h>
- 
- #ifdef LIBVNCSERVER_WITH_WEBSOCKETS
- #include "rfbssl.h"
-@@ -1472,8 +1474,11 @@ char *rfbProcessFileTransferReadBuffer(rfbClientPtr cl, uint32_t length)
-        0XFFFFFFFF, i.e. SIZE_MAX for 32-bit systems. On 64-bit systems, a length of 0XFFFFFFFF
-        will safely be allocated since this check will never trigger and malloc() can digest length+1
-        without problems as length is a uint32_t.
-+       We also later pass length to rfbReadExact() that expects a signed int type and
-+       that might wrap on platforms with a 32-bit int type if length is bigger
-+       than 0X7FFFFFFF.
-     */
--    if(length == SIZE_MAX) {
-+    if(length == SIZE_MAX || length > INT_MAX) {
- 	rfbErr("rfbProcessFileTransferReadBuffer: too big file transfer length requested: %u", (unsigned int)length);
- 	rfbCloseClient(cl);
- 	return NULL;
diff --git a/package/libvncserver/0004-rfbserver-don-t-leak-stack-memory-to-the-remote.patch b/package/libvncserver/0004-rfbserver-don-t-leak-stack-memory-to-the-remote.patch
deleted file mode 100644
index 056b940cdf..0000000000
--- a/package/libvncserver/0004-rfbserver-don-t-leak-stack-memory-to-the-remote.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From d01e1bb4246323ba6fcee3b82ef1faa9b1dac82a Mon Sep 17 00:00:00 2001
-From: Christian Beier <dontmind@freeshell.org>
-Date: Mon, 19 Aug 2019 22:32:25 +0200
-Subject: [PATCH] rfbserver: don't leak stack memory to the remote
-
-Thanks go to Pavel Cheremushkin of Kaspersky for reporting.
-[Retrieved from:
-https://github.com/LibVNC/libvncserver/commit/d01e1bb4246323ba6fcee3b82ef1faa9b1dac82a]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- libvncserver/rfbserver.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/libvncserver/rfbserver.c b/libvncserver/rfbserver.c
-index 3bacc891..310e5487 100644
---- a/libvncserver/rfbserver.c
-+++ b/libvncserver/rfbserver.c
-@@ -3724,6 +3724,8 @@ rfbSendServerCutText(rfbScreenInfoPtr rfbScreen,char *str, int len)
-     rfbServerCutTextMsg sct;
-     rfbClientIteratorPtr iterator;
- 
-+    memset((char *)&sct, 0, sizeof(sct));
-+
-     iterator = rfbGetClientIterator(rfbScreen);
-     while ((cl = rfbClientIteratorNext(iterator)) != NULL) {
-         sct.type = rfbServerCutText;
diff --git a/package/libvncserver/0005-CMakeLists.txt-don-t-build-tight.c-without-png-or-zl.patch b/package/libvncserver/0005-CMakeLists.txt-don-t-build-tight.c-without-png-or-zl.patch
deleted file mode 100644
index c357f8b3d5..0000000000
--- a/package/libvncserver/0005-CMakeLists.txt-don-t-build-tight.c-without-png-or-zl.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 8f58a9d9f35e6b893b54b399be357bc789f6e630 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 8 Mar 2020 10:36:57 +0100
-Subject: [PATCH] CMakeLists.txt: don't build tight.c without png or zlib
-
-If the user enables JPEG and disable PNG and ZLIB, build will fail on:
-
-[ 42%] Building C object CMakeFiles/vncserver.dir/libvncserver/ws_decode.c.o
-/nvmedata/autobuild/instance-3/output-1/build/libvncserver-0.9.12/libvncserver/tight.c: In function 'rfbSendRectEncodingTight':
-/nvmedata/autobuild/instance-3/output-1/build/libvncserver-0.9.12/libvncserver/tight.c:276:7: error: 'struct _rfbClientRec' has no member named 'tightEncoding'
-     cl->tightEncoding = rfbEncodingTight;
-       ^~
-/nvmedata/autobuild/instance-3/output-1/build/libvncserver-0.9.12/libvncserver/tight.c: In function 'rfbSendRectEncodingTightPng':
-/nvmedata/autobuild/instance-3/output-1/build/libvncserver-0.9.12/libvncserver/tight.c:287:7: error: 'struct _rfbClientRec' has no member named 'tightEncoding'
-     cl->tightEncoding = rfbEncodingTightPng;
-       ^~
-/nvmedata/autobuild/instance-3/output-1/build/libvncserver-0.9.12/libvncserver/tight.c: In function 'SendRectEncodingTight':
-/nvmedata/autobuild/instance-3/output-1/build/libvncserver-0.9.12/libvncserver/tight.c:307:23: error: 'struct _rfbClientRec' has no member named 'tightCompressLevel'
-     compressLevel = cl->tightCompressLevel;
-                       ^~
-/nvmedata/autobuild/instance-3/output-1/build/libvncserver-0.9.12/libvncserver/tight.c:308:22: error: 'struct _rfbClientRec' has no member named 'turboQualityLevel'
-     qualityLevel = cl->turboQualityLevel;
-                      ^~
-/nvmedata/autobuild/instance-3/output-1/build/libvncserver-0.9.12/libvncserver/tight.c:309:22: error: 'struct _rfbClientRec' has no member named 'turboSubsampLevel'
-     subsampLevel = cl->turboSubsampLevel;
-                      ^~
-
-Fixes:
- - http://autobuild.buildroot.org/results/bcc701055dd5876005fa6f78f38500399394cd75
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/LibVNC/libvncserver/pull/380]
----
- CMakeLists.txt | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 2a2cb15..b8bc9e2 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -425,7 +425,9 @@ endif()
- if(JPEG_FOUND)
-   add_definitions(-DLIBVNCSERVER_HAVE_LIBJPEG)
-   include_directories(${JPEG_INCLUDE_DIR})
--  set(TIGHT_C ${LIBVNCSERVER_DIR}/tight.c ${COMMON_DIR}/turbojpeg.c)
-+  if(PNG_FOUND OR ZLIB_FOUND)
-+    set(TIGHT_C ${LIBVNCSERVER_DIR}/tight.c ${COMMON_DIR}/turbojpeg.c)
-+  endif(PNG_FOUND OR ZLIB_FOUND)
- endif(JPEG_FOUND)
- 
- if(PNG_FOUND)
--- 
-2.25.0
-
diff --git a/package/libvncserver/0006-libvncclient-cursor-limit-width-height-input-values.patch b/package/libvncserver/0006-libvncclient-cursor-limit-width-height-input-values.patch
deleted file mode 100644
index c389f2ecfb..0000000000
--- a/package/libvncserver/0006-libvncclient-cursor-limit-width-height-input-values.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 54220248886b5001fbbb9fa73c4e1a2cb9413fed Mon Sep 17 00:00:00 2001
-From: Christian Beier <dontmind@freeshell.org>
-Date: Sun, 17 Nov 2019 17:18:35 +0100
-Subject: [PATCH] libvncclient/cursor: limit width/height input values
-
-Avoids a possible heap overflow reported by Pavel Cheremushkin
-<Pavel.Cheremushkin@kaspersky.com>.
-
-re #275
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/LibVNC/libvncserver/commit/54220248886b5001fbbb9fa73c4e1a2cb9413fed]
----
- libvncclient/cursor.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/libvncclient/cursor.c b/libvncclient/cursor.c
-index 67f45726..40ffb3b0 100644
---- a/libvncclient/cursor.c
-+++ b/libvncclient/cursor.c
-@@ -28,6 +28,8 @@
- #define OPER_SAVE     0
- #define OPER_RESTORE  1
- 
-+#define MAX_CURSOR_SIZE 1024
-+
- #define RGB24_TO_PIXEL(bpp,r,g,b)                                       \
-    ((((uint##bpp##_t)(r) & 0xFF) * client->format.redMax + 127) / 255             \
-     << client->format.redShift |                                              \
-@@ -54,6 +56,9 @@ rfbBool HandleCursorShape(rfbClient* client,int xhot, int yhot, int width, int h
-   if (width * height == 0)
-     return TRUE;
- 
-+  if (width >= MAX_CURSOR_SIZE || height >= MAX_CURSOR_SIZE)
-+    return FALSE;
-+
-   /* Allocate memory for pixel data and temporary mask data. */
-   if(client->rcSource)
-     free(client->rcSource);
diff --git a/package/libvncserver/libvncserver.hash b/package/libvncserver/libvncserver.hash
index d98d78d766..8e61a3d0ea 100644
--- a/package/libvncserver/libvncserver.hash
+++ b/package/libvncserver/libvncserver.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  33cbbb4e15bb390f723c311b323cef4a43bcf781984f92d92adda3243a116136  LibVNCServer-0.9.12.tar.gz
+sha256  0ae5bb9175dc0a602fe85c1cf591ac47ee5247b87f2bf164c16b05f87cbfa81a  LibVNCServer-0.9.13.tar.gz
 sha256  4d23c8c814e5baf007d854f01d8502e77dc56a41144934e003fb32c4e052d20f  COPYING
diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index 890672d04b..96dd51299c 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVNCSERVER_VERSION = 0.9.12
+LIBVNCSERVER_VERSION = 0.9.13
 LIBVNCSERVER_SOURCE = LibVNCServer-$(LIBVNCSERVER_VERSION).tar.gz
 LIBVNCSERVER_SITE = https://github.com/LibVNC/libvncserver/archive
 LIBVNCSERVER_LICENSE = GPL-2.0+
@@ -13,15 +13,6 @@ LIBVNCSERVER_INSTALL_STAGING = YES
 LIBVNCSERVER_DEPENDENCIES = host-pkgconf lzo
 LIBVNCSERVER_CONF_OPTS = -DWITH_LZO=ON
 
-# 0003-Limit-lenght-to-INT_MAX-bytes-in-rfbProcessFileTransferReadBuffer.patch
-LIBVNCSERVER_IGNORE_CVES += CVE-2018-20750
-
-# 0004-rfbserver-don-t-leak-stack-memory-to-the-remote.patch
-LIBVNCSERVER_IGNORE_CVES += CVE-2019-15681
-
-# 0006-libvncclient-cursor-limit-width-height-input-values.patch
-LIBVNCSERVER_IGNORE_CVES += CVE-2019-20788
-
 # only used for examples
 LIBVNCSERVER_CONF_OPTS += \
 	-DWITH_FFMPEG=OFF \
