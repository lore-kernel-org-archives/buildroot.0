From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Aug 2018 22:32:04 +0200
Subject: [Buildroot] [PATCH/next 5/6] package/motion: Fix build with FFmpeg
 4.0
In-Reply-To: <20180812203205.7251-1-bernd.kuhls@t-online.de>
References: <20180812203205.7251-1-bernd.kuhls@t-online.de>
Message-ID: <20180812203205.7251-5-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/motion/0001-ffmpeg40.patch | 57 ++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 package/motion/0001-ffmpeg40.patch

diff --git a/package/motion/0001-ffmpeg40.patch b/package/motion/0001-ffmpeg40.patch
new file mode 100644
index 0000000000..f3cdfa93b4
--- /dev/null
+++ b/package/motion/0001-ffmpeg40.patch
@@ -0,0 +1,57 @@
+From ff99988d57f4bcb0a7b381374f8106896bda2b15 Mon Sep 17 00:00:00 2001
+From: James Cowgill <jcowgill@jcowgill.uk>
+Date: Fri, 23 Feb 2018 23:04:33 +0000
+Subject: [PATCH] Fix build errors with FFmpeg 4.0
+
+Downloaded from
+https://sources.debian.org/src/motion/4.1.1-1.1/debian/patches/ffmpeg4.0.patch/
+
+Instead of backporting
+https://github.com/Motion-Project/motion/commit/9b93a417e37e1f0fef58d1582a7e98e4c05d3b42
+from upstream master branch we use the patch from Debian.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ ffmpeg.c | 19 ++++++++++++++++---
+ 1 file changed, 16 insertions(+), 3 deletions(-)
+
+--- a/ffmpeg.c
++++ b/ffmpeg.c
+@@ -68,6 +68,19 @@
+ #endif
+ 
+ /*********************************************/
++#if (LIBAVCODEC_VERSION_MAJOR >= 57)
++
++#define MY_CODEC_FLAG_GLOBAL_HEADER AV_CODEC_FLAG_GLOBAL_HEADER
++#define MY_CODEC_FLAG_QSCALE        AV_CODEC_FLAG_QSCALE
++
++#else
++
++#define MY_CODEC_FLAG_GLOBAL_HEADER CODEC_FLAG_GLOBAL_HEADER
++#define MY_CODEC_FLAG_QSCALE        CODEC_FLAG_QSCALE
++
++#endif
++
++/*********************************************/
+ AVFrame *my_frame_alloc(void){
+     AVFrame *pic;
+ #if (LIBAVFORMAT_VERSION_MAJOR >= 55)
+@@ -538,7 +551,7 @@
+         /* The selection of 8000 in the else is a subjective number based upon viewing output files */
+         if (ffmpeg->vbr > 0){
+             ffmpeg->vbr =(int)(((100-ffmpeg->vbr)*(100-ffmpeg->vbr)*(100-ffmpeg->vbr) * 8000) / 1000000) + 1;
+-            ffmpeg->ctx_codec->flags |= CODEC_FLAG_QSCALE;
++            ffmpeg->ctx_codec->flags |= MY_CODEC_FLAG_QSCALE;
+             ffmpeg->ctx_codec->global_quality=ffmpeg->vbr;
+         }
+     }
+@@ -663,7 +676,7 @@
+       ffmpeg->ctx_codec->strict_std_compliance = -2;
+       ffmpeg->ctx_codec->level = 3;
+     }
+-    ffmpeg->ctx_codec->flags |= CODEC_FLAG_GLOBAL_HEADER;
++    ffmpeg->ctx_codec->flags |= MY_CODEC_FLAG_GLOBAL_HEADER;
+ 
+     retcd = ffmpeg_set_quality(ffmpeg);
+     if (retcd < 0){
-- 
2.18.0
