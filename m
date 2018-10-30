From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Oct 2018 21:00:02 +0100
Subject: [Buildroot] [git commit] motion: bump to version 4.2
Message-ID: <20181030201012.F011483239@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87187d5c994c98537866bb7e10d16606b0eb738a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove patch (already in version)
- Add new mandatory libmicrohttpd dependency, see:
  https://github.com/Motion-Project/motion/commit/3cd68cab497527bb51af63fc4279b024f828b536
- Add new optional gettext dependency, see:
  https://github.com/Motion-Project/motion/commit/4ff191be82920451f5940d6685a2ab7388e0f7b6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Fix-build-errors-with-FFmpeg-4.0.patch    | 58 ----------------------
 package/motion/Config.in                           |  1 +
 package/motion/motion.hash                         |  2 +-
 package/motion/motion.mk                           |  4 +-
 4 files changed, 4 insertions(+), 61 deletions(-)

diff --git a/package/motion/0001-Fix-build-errors-with-FFmpeg-4.0.patch b/package/motion/0001-Fix-build-errors-with-FFmpeg-4.0.patch
deleted file mode 100644
index e738809a74..0000000000
--- a/package/motion/0001-Fix-build-errors-with-FFmpeg-4.0.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 9b93a417e37e1f0fef58d1582a7e98e4c05d3b42 Mon Sep 17 00:00:00 2001
-From: James Cowgill <jcowgill@users.noreply.github.com>
-Date: Sun, 25 Feb 2018 20:13:57 +0000
-Subject: [PATCH] Fix build errors with FFmpeg 4.0
-
-Backported from upstream commit
-https://github.com/Motion-Project/motion/commit/9b93a417e37e1f0fef58d1582a7e98e4c05d3b42
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- ffmpeg.c | 19 ++++++++++++++++---
- 1 file changed, 16 insertions(+), 3 deletions(-)
-
-diff --git a/ffmpeg.c b/ffmpeg.c
-index 1e6cdf6..4299ba3 100644
---- a/ffmpeg.c
-+++ b/ffmpeg.c
-@@ -67,6 +67,19 @@
- 
- #endif
- 
-+/*********************************************/
-+#if (LIBAVCODEC_VERSION_MAJOR >= 57)
-+
-+#define MY_CODEC_FLAG_GLOBAL_HEADER AV_CODEC_FLAG_GLOBAL_HEADER
-+#define MY_CODEC_FLAG_QSCALE        AV_CODEC_FLAG_QSCALE
-+
-+#else
-+
-+#define MY_CODEC_FLAG_GLOBAL_HEADER CODEC_FLAG_GLOBAL_HEADER
-+#define MY_CODEC_FLAG_QSCALE        CODEC_FLAG_QSCALE
-+
-+#endif
-+
- /*********************************************/
- AVFrame *my_frame_alloc(void){
-     AVFrame *pic;
-@@ -548,7 +561,7 @@ static int ffmpeg_set_quality(struct ffmpeg *ffmpeg){
-         /* The selection of 8000 is a subjective number based upon viewing output files */
-         if (ffmpeg->vbr > 0){
-             ffmpeg->vbr =(int)(((100-ffmpeg->vbr)*(100-ffmpeg->vbr)*(100-ffmpeg->vbr) * 8000) / 1000000) + 1;
--            ffmpeg->ctx_codec->flags |= CODEC_FLAG_QSCALE;
-+            ffmpeg->ctx_codec->flags |= MY_CODEC_FLAG_QSCALE;
-             ffmpeg->ctx_codec->global_quality=ffmpeg->vbr;
-         }
-     }
-@@ -673,7 +686,7 @@ static int ffmpeg_set_codec(struct ffmpeg *ffmpeg){
-       ffmpeg->ctx_codec->strict_std_compliance = -2;
-       ffmpeg->ctx_codec->level = 3;
-     }
--    ffmpeg->ctx_codec->flags |= CODEC_FLAG_GLOBAL_HEADER;
-+    ffmpeg->ctx_codec->flags |= MY_CODEC_FLAG_GLOBAL_HEADER;
- 
-     retcd = ffmpeg_set_quality(ffmpeg);
-     if (retcd < 0){
--- 
-2.18.0
-
diff --git a/package/motion/Config.in b/package/motion/Config.in
index a27e7f9fb6..7a2e5dbea1 100644
--- a/package/motion/Config.in
+++ b/package/motion/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_MOTION
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBMICROHTTPD
 	help
 	  Motion is a program that monitors the video signal from
 	  cameras. It is able to detect if a significant part of
diff --git a/package/motion/motion.hash b/package/motion/motion.hash
index 5b67755e8b..9c6a2b7fbe 100644
--- a/package/motion/motion.hash
+++ b/package/motion/motion.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	2074b935bdfe28f84c2c3233274b06908336778f303bb13530d4299c3f8aa4e2	motion-release-4.1.1.tar.gz
+sha256	6ef8504fc5be00a49c82c4045c0004fbf575d9a5df8687025a9b06923efda2a9	motion-release-4.2.tar.gz
 sha256	91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad	COPYING
diff --git a/package/motion/motion.mk b/package/motion/motion.mk
index 0f4898674b..1bbb548fd7 100644
--- a/package/motion/motion.mk
+++ b/package/motion/motion.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-MOTION_VERSION = release-4.1.1
+MOTION_VERSION = release-4.2
 MOTION_SITE = $(call github,Motion-Project,motion,$(MOTION_VERSION))
 MOTION_LICENSE = GPL-2.0
 MOTION_LICENSE_FILES = COPYING
-MOTION_DEPENDENCIES = host-pkgconf jpeg
+MOTION_DEPENDENCIES = host-pkgconf jpeg libmicrohttpd $(TARGET_NLS_DEPENDENCIES)
 # From git
 MOTION_AUTORECONF = YES
 
