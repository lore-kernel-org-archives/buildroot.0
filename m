From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Sun,  9 Sep 2018 21:33:43 +0200
Subject: [Buildroot] [PATCH] motion: fix build failure due to missing
 drmGetVersion() and drmFreeVersion()
Message-ID: <20180909193343.117159-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

During static linking -ldrm is listed too early respect -lavutil.
This cause build failure.

Append extra -ldrm at the tail of $(LIBS) list.

Fixes:
http://autobuild.buildroot.net/results/395/395be1a9cab824b82ef34c2ebd84d54243029b33//

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 ...-fix-static-linking-for-ldrm-library.patch | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/motion/0002-Makefile.in-fix-static-linking-for-ldrm-library.patch

diff --git a/package/motion/0002-Makefile.in-fix-static-linking-for-ldrm-library.patch b/package/motion/0002-Makefile.in-fix-static-linking-for-ldrm-library.patch
new file mode 100644
index 0000000000..591cca66eb
--- /dev/null
+++ b/package/motion/0002-Makefile.in-fix-static-linking-for-ldrm-library.patch
@@ -0,0 +1,30 @@
+From 7098dafaf297d70bb73a5320bdc522b66c456a56 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@micronovasrl.com>
+Date: Sun, 9 Sep 2018 20:30:33 +0200
+Subject: [PATCH] Makefile.in: fix static linking for -ldrm library
+
+While linking statically -ldrm library is listed too early than -lavutil.
+
+Append additional -ldrm entry to linker $(LIBS) list.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+ Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 94c7d40..5cfb490 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -39,7 +39,7 @@ CFLAGS       = @CFLAGS@ -Wall \
+ 	 -DMOTIONDOCDIR=\"$(DESTDIR)$(docdir)\"    \
+ 	 @FFMPEG_CFLAGS@ @MMAL_CFLAGS@
+ LDFLAGS      = @LDFLAGS@
+-LIBS         = @LIBS@  @MMAL_LIBS@ @FFMPEG_LIBS@
++LIBS         = @LIBS@ @FFMPEG_LIBS@ @MMAL_LIBS@ -ldrm
+ OBJ          = motion.o logger.o conf.o draw.o jpegutils.o \
+ 			   video_loopback.o video_v4l2.o video_common.o video_bktr.o \
+ 			   netcam.o netcam_http.o netcam_ftp.o netcam_jpeg.o netcam_wget.o \
+-- 
+2.17.1
+
-- 
2.17.1
