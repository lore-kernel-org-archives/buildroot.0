From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Mar 2020 13:49:23 +0100
Subject: [Buildroot] [git commit] package/libvncserver: fix jpeg build
 without png or zlib
Message-ID: <20200308123816.4E6DB8FE43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8dc83b83a460d5aa787b2d8dfc5b786a7e83cd5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/bcc701055dd5876005fa6f78f38500399394cd75

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...txt-don-t-build-tight.c-without-png-or-zl.patch | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/package/libvncserver/0005-CMakeLists.txt-don-t-build-tight.c-without-png-or-zl.patch b/package/libvncserver/0005-CMakeLists.txt-don-t-build-tight.c-without-png-or-zl.patch
new file mode 100644
index 0000000000..c357f8b3d5
--- /dev/null
+++ b/package/libvncserver/0005-CMakeLists.txt-don-t-build-tight.c-without-png-or-zl.patch
@@ -0,0 +1,54 @@
+From 8f58a9d9f35e6b893b54b399be357bc789f6e630 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 8 Mar 2020 10:36:57 +0100
+Subject: [PATCH] CMakeLists.txt: don't build tight.c without png or zlib
+
+If the user enables JPEG and disable PNG and ZLIB, build will fail on:
+
+[ 42%] Building C object CMakeFiles/vncserver.dir/libvncserver/ws_decode.c.o
+/nvmedata/autobuild/instance-3/output-1/build/libvncserver-0.9.12/libvncserver/tight.c: In function 'rfbSendRectEncodingTight':
+/nvmedata/autobuild/instance-3/output-1/build/libvncserver-0.9.12/libvncserver/tight.c:276:7: error: 'struct _rfbClientRec' has no member named 'tightEncoding'
+     cl->tightEncoding = rfbEncodingTight;
+       ^~
+/nvmedata/autobuild/instance-3/output-1/build/libvncserver-0.9.12/libvncserver/tight.c: In function 'rfbSendRectEncodingTightPng':
+/nvmedata/autobuild/instance-3/output-1/build/libvncserver-0.9.12/libvncserver/tight.c:287:7: error: 'struct _rfbClientRec' has no member named 'tightEncoding'
+     cl->tightEncoding = rfbEncodingTightPng;
+       ^~
+/nvmedata/autobuild/instance-3/output-1/build/libvncserver-0.9.12/libvncserver/tight.c: In function 'SendRectEncodingTight':
+/nvmedata/autobuild/instance-3/output-1/build/libvncserver-0.9.12/libvncserver/tight.c:307:23: error: 'struct _rfbClientRec' has no member named 'tightCompressLevel'
+     compressLevel = cl->tightCompressLevel;
+                       ^~
+/nvmedata/autobuild/instance-3/output-1/build/libvncserver-0.9.12/libvncserver/tight.c:308:22: error: 'struct _rfbClientRec' has no member named 'turboQualityLevel'
+     qualityLevel = cl->turboQualityLevel;
+                      ^~
+/nvmedata/autobuild/instance-3/output-1/build/libvncserver-0.9.12/libvncserver/tight.c:309:22: error: 'struct _rfbClientRec' has no member named 'turboSubsampLevel'
+     subsampLevel = cl->turboSubsampLevel;
+                      ^~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/bcc701055dd5876005fa6f78f38500399394cd75
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/LibVNC/libvncserver/pull/380]
+---
+ CMakeLists.txt | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 2a2cb15..b8bc9e2 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -425,7 +425,9 @@ endif()
+ if(JPEG_FOUND)
+   add_definitions(-DLIBVNCSERVER_HAVE_LIBJPEG)
+   include_directories(${JPEG_INCLUDE_DIR})
+-  set(TIGHT_C ${LIBVNCSERVER_DIR}/tight.c ${COMMON_DIR}/turbojpeg.c)
++  if(PNG_FOUND OR ZLIB_FOUND)
++    set(TIGHT_C ${LIBVNCSERVER_DIR}/tight.c ${COMMON_DIR}/turbojpeg.c)
++  endif(PNG_FOUND OR ZLIB_FOUND)
+ endif(JPEG_FOUND)
+ 
+ if(PNG_FOUND)
+-- 
+2.25.0
+
