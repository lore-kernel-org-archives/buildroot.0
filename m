From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 25 Aug 2018 09:31:16 +0200
Subject: [Buildroot] [PATCH/next v3 5/7] package/motion: Fix build with
 FFmpeg 4.0
In-Reply-To: <20180825073118.14980-1-bernd.kuhls@t-online.de>
References: <20180825073118.14980-1-bernd.kuhls@t-online.de>
Message-ID: <20180825073118.14980-5-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: re-integrated in ffmpeg bump series
v2: split patch from v1
    backported upstream commit (Thomas)

 ...001-Fix-build-errors-with-FFmpeg-4.0.patch | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 package/motion/0001-Fix-build-errors-with-FFmpeg-4.0.patch

diff --git a/package/motion/0001-Fix-build-errors-with-FFmpeg-4.0.patch b/package/motion/0001-Fix-build-errors-with-FFmpeg-4.0.patch
new file mode 100644
index 0000000000..e738809a74
--- /dev/null
+++ b/package/motion/0001-Fix-build-errors-with-FFmpeg-4.0.patch
@@ -0,0 +1,58 @@
+From 9b93a417e37e1f0fef58d1582a7e98e4c05d3b42 Mon Sep 17 00:00:00 2001
+From: James Cowgill <jcowgill@users.noreply.github.com>
+Date: Sun, 25 Feb 2018 20:13:57 +0000
+Subject: [PATCH] Fix build errors with FFmpeg 4.0
+
+Backported from upstream commit
+https://github.com/Motion-Project/motion/commit/9b93a417e37e1f0fef58d1582a7e98e4c05d3b42
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ ffmpeg.c | 19 ++++++++++++++++---
+ 1 file changed, 16 insertions(+), 3 deletions(-)
+
+diff --git a/ffmpeg.c b/ffmpeg.c
+index 1e6cdf6..4299ba3 100644
+--- a/ffmpeg.c
++++ b/ffmpeg.c
+@@ -67,6 +67,19 @@
+ 
+ #endif
+ 
++/*********************************************/
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
+ /*********************************************/
+ AVFrame *my_frame_alloc(void){
+     AVFrame *pic;
+@@ -548,7 +561,7 @@ static int ffmpeg_set_quality(struct ffmpeg *ffmpeg){
+         /* The selection of 8000 is a subjective number based upon viewing output files */
+         if (ffmpeg->vbr > 0){
+             ffmpeg->vbr =(int)(((100-ffmpeg->vbr)*(100-ffmpeg->vbr)*(100-ffmpeg->vbr) * 8000) / 1000000) + 1;
+-            ffmpeg->ctx_codec->flags |= CODEC_FLAG_QSCALE;
++            ffmpeg->ctx_codec->flags |= MY_CODEC_FLAG_QSCALE;
+             ffmpeg->ctx_codec->global_quality=ffmpeg->vbr;
+         }
+     }
+@@ -673,7 +686,7 @@ static int ffmpeg_set_codec(struct ffmpeg *ffmpeg){
+       ffmpeg->ctx_codec->strict_std_compliance = -2;
+       ffmpeg->ctx_codec->level = 3;
+     }
+-    ffmpeg->ctx_codec->flags |= CODEC_FLAG_GLOBAL_HEADER;
++    ffmpeg->ctx_codec->flags |= MY_CODEC_FLAG_GLOBAL_HEADER;
+ 
+     retcd = ffmpeg_set_quality(ffmpeg);
+     if (retcd < 0){
+-- 
+2.18.0
+
-- 
2.18.0
