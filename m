From: Louis-Paul Cordier <lpdev@cordier.org>
Date: Tue,  5 Feb 2019 19:19:45 +0100
Subject: [Buildroot] [PATCH v3 3/4] package/ffmpeg: bump to version 4.1
In-Reply-To: <20190205181946.14496-1-lpdev@cordier.org>
References: <20190205181946.14496-1-lpdev@cordier.org>
Message-ID: <20190205181946.14496-4-lpdev@cordier.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FFserver is not supported anymore
Remove patch 0001: fixed upstream in cae6f806a6367c7760ab6ed059d343d4a8eebd56
Remove patch 0002 to 0004: accepted upstream

Signed-off-by: Louis-Paul Cordier <lpdev@cordier.org>
---
v2 -> v3: (feedback Thomas Petazzoni)
- Fix commit title.
- Check and explain why patches are removed.
- Populate Config.in.legacy with ffeserver removal.

 Config.in.legacy                              |   6 ++
 package/ffmpeg/0001-ffmpeg-pthreads.patch     |  34 ------
 ...cenc-Fix-building-with-libfdk-aac-v2.patch | 100 ------------------
 ...stently-use-a-proper-version-check-m.patch |  99 -----------------
 ...dk-aac-Don-t-use-defined-in-a-define.patch |  72 -------------
 package/ffmpeg/Config.in                      |   6 --
 package/ffmpeg/ffmpeg.hash                    |   2 +-
 package/ffmpeg/ffmpeg.mk                      |   8 +-
 8 files changed, 8 insertions(+), 319 deletions(-)
 delete mode 100644 package/ffmpeg/0001-ffmpeg-pthreads.patch
 delete mode 100644 package/ffmpeg/0002-libfdk-aacenc-Fix-building-with-libfdk-aac-v2.patch
 delete mode 100644 package/ffmpeg/0003-libfdk-aac-Consistently-use-a-proper-version-check-m.patch
 delete mode 100644 package/ffmpeg/0004-libfdk-aac-Don-t-use-defined-in-a-define.patch

diff --git a/Config.in.legacy b/Config.in.legacy
index ef460752f3..b38ff200ff 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -168,6 +168,12 @@ config BR2_TARGET_GENERIC_PASSWD_MD5
 	  The default has been moved to SHA256 and all C libraries
 	  now support that method by default
 
+config BR2_PACKAGE_FFMPEG_FFSERVER
+	bool "Build ffserver"
+	depends on BR2_USE_MMU # fork()
+	help
+	  On July 10th, 2016, ffserver program has been dropped.
+
 comment "Legacy options removed in 2018.11"
 
 config BR2_TARGET_XLOADER
diff --git a/package/ffmpeg/0001-ffmpeg-pthreads.patch b/package/ffmpeg/0001-ffmpeg-pthreads.patch
deleted file mode 100644
index c6d75d2297..0000000000
--- a/package/ffmpeg/0001-ffmpeg-pthreads.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From patchwork Wed Oct 25 13:32:36 2017
-Content-Type: text/plain; charset="utf-8"
-MIME-Version: 1.0
-Content-Transfer-Encoding: 7bit
-Subject: [FFmpeg-devel] configure: v4l2_m2m depends on pthreads
-From: Mark Thompson <sw@jkqxz.net>
-X-Patchwork-Id: 5688
-Message-Id: <27e5b360-1210-d550-c8de-a761f8e9f326@jkqxz.net>
-To: FFmpeg development discussions and patches <ffmpeg-devel@ffmpeg.org>
-Date: Wed, 25 Oct 2017 14:32:36 +0100
-
-Fixes build with --disable-pthreads.
-
-Downloaded from upstream patchworks:
-https://patchwork.ffmpeg.org/patch/5688/
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- configure | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure b/configure
-index c86e578..76523c8 100755
---- a/configure
-+++ b/configure
-@@ -2780,7 +2780,7 @@ omx_rpi_select="omx"
- qsvdec_select="qsv"
- qsvenc_select="qsv"
- vaapi_encode_deps="vaapi"
--v4l2_m2m_deps_any="linux_videodev2_h"
-+v4l2_m2m_deps="linux_videodev2_h pthreads"
- 
- hwupload_cuda_filter_deps="cuda"
- scale_npp_filter_deps="cuda libnpp"
diff --git a/package/ffmpeg/0002-libfdk-aacenc-Fix-building-with-libfdk-aac-v2.patch b/package/ffmpeg/0002-libfdk-aacenc-Fix-building-with-libfdk-aac-v2.patch
deleted file mode 100644
index 3f452242fa..0000000000
--- a/package/ffmpeg/0002-libfdk-aacenc-Fix-building-with-libfdk-aac-v2.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From c60fb550302878aba7e86037451f7996e8069289 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Martin=20Storsj=C3=B6?= <martin@martin.st>
-Date: Fri, 31 Aug 2018 14:25:30 +0300
-Subject: [PATCH] libfdk-aacenc: Fix building with libfdk-aac v2
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-When flushing the encoder, we now need to provide non-null buffer
-parameters for everything, even if they are unused.
-
-The encoderDelay parameter has been replaced by two, nDelay and
-nDelayCore.
-
-Downloaded from
-http://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=141c960e21d2860e354f9b90df136184dd00a9a8
-
-Signed-off-by: Martin Storsj?? <martin@martin.st>
-[Bernd: rebased for ffmpeg 3.4.5]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- libavcodec/libfdk-aacenc.c | 34 +++++++++++++++++++++++++---------
- 1 file changed, 25 insertions(+), 9 deletions(-)
-
-diff --git a/libavcodec/libfdk-aacenc.c b/libavcodec/libfdk-aacenc.c
-index 0e2051b468..f5adb407ed 100644
---- a/libavcodec/libfdk-aacenc.c
-+++ b/libavcodec/libfdk-aacenc.c
-@@ -26,6 +26,11 @@
- #include "audio_frame_queue.h"
- #include "internal.h"
- 
-+#define FDKENC_VER_AT_LEAST(vl0, vl1) \
-+    (defined(AACENCODER_LIB_VL0) && \
-+        ((AACENCODER_LIB_VL0 > vl0) || \
-+         (AACENCODER_LIB_VL0 == vl0 && AACENCODER_LIB_VL1 >= vl1)))
-+
- typedef struct AACContext {
-     const AVClass *class;
-     HANDLE_AACENCODER handle;
-@@ -286,7 +291,11 @@ static av_cold int aac_encode_init(AVCodecContext *avctx)
-     }
- 
-     avctx->frame_size = info.frameLength;
-+#if FDKENC_VER_AT_LEAST(4, 0)
-+    avctx->initial_padding = info.nDelay;
-+#else
-     avctx->initial_padding = info.encoderDelay;
-+#endif
-     ff_af_queue_init(avctx, &s->afq);
- 
-     if (avctx->flags & AV_CODEC_FLAG_GLOBAL_HEADER) {
-@@ -319,28 +328,35 @@ static int aac_encode_frame(AVCodecContext *avctx, AVPacket *avpkt,
-     int out_buffer_size, out_buffer_element_size;
-     void *in_ptr, *out_ptr;
-     int ret;
-+    uint8_t dummy_buf[1];
-     AACENC_ERROR err;
- 
-     /* handle end-of-stream small frame and flushing */
-     if (!frame) {
-+        /* Must be a non-null pointer, even if it's a dummy. We could use
-+         * the address of anything else on the stack as well. */
-+        in_ptr               = dummy_buf;
-+        in_buffer_size       = 0;
-+
-         in_args.numInSamples = -1;
-     } else {
--        in_ptr                   = frame->data[0];
--        in_buffer_size           = 2 * avctx->channels * frame->nb_samples;
--        in_buffer_element_size   = 2;
-+        in_ptr               = frame->data[0];
-+        in_buffer_size       = 2 * avctx->channels * frame->nb_samples;
- 
--        in_args.numInSamples     = avctx->channels * frame->nb_samples;
--        in_buf.numBufs           = 1;
--        in_buf.bufs              = &in_ptr;
--        in_buf.bufferIdentifiers = &in_buffer_identifier;
--        in_buf.bufSizes          = &in_buffer_size;
--        in_buf.bufElSizes        = &in_buffer_element_size;
-+        in_args.numInSamples = avctx->channels * frame->nb_samples;
- 
-         /* add current frame to the queue */
-         if ((ret = ff_af_queue_add(&s->afq, frame)) < 0)
-             return ret;
-     }
- 
-+    in_buffer_element_size   = 2;
-+    in_buf.numBufs           = 1;
-+    in_buf.bufs              = &in_ptr;
-+    in_buf.bufferIdentifiers = &in_buffer_identifier;
-+    in_buf.bufSizes          = &in_buffer_size;
-+    in_buf.bufElSizes        = &in_buffer_element_size;
-+
-     /* The maximum packet size is 6144 bits aka 768 bytes per channel. */
-     if ((ret = ff_alloc_packet2(avctx, avpkt, FFMAX(8192, 768 * avctx->channels), 0)) < 0)
-         return ret;
--- 
-2.20.1
-
diff --git a/package/ffmpeg/0003-libfdk-aac-Consistently-use-a-proper-version-check-m.patch b/package/ffmpeg/0003-libfdk-aac-Consistently-use-a-proper-version-check-m.patch
deleted file mode 100644
index c358a045d1..0000000000
--- a/package/ffmpeg/0003-libfdk-aac-Consistently-use-a-proper-version-check-m.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From 48be4c81e0ad081edab65e133e6e1bdec7de3b55 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Martin=20Storsj=C3=B6?= <martin@martin.st>
-Date: Tue, 4 Sep 2018 08:29:37 +0300
-Subject: [PATCH] libfdk-aac: Consistently use a proper version check macro for
- detecting features
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-libfdk-aac: Consistently use a proper version check macro for detecting features
-
-The previous version checks checked explicitly for the version
-where the version define was added to the installed headers,
-making an "#ifdef AACDECODER_LIB_VL0" enough. Now that we have
-a need for more diverse version checks than this, convert all checks
-to such checks.
-
-Downloaded from
-http://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=ffb9b7a6bab6c6bfd3dd9a7c32e3724209824999
-
-Signed-off-by: Martin Storsj? <martin@martin.st>
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- libavcodec/libfdk-aacdec.c | 13 ++++++++-----
- libavcodec/libfdk-aacenc.c |  6 +++---
- 2 files changed, 11 insertions(+), 8 deletions(-)
-
-diff --git a/libavcodec/libfdk-aacdec.c b/libavcodec/libfdk-aacdec.c
-index 2857b9453f..ef51184ebd 100644
---- a/libavcodec/libfdk-aacdec.c
-+++ b/libavcodec/libfdk-aacdec.c
-@@ -25,9 +25,12 @@
- #include "avcodec.h"
- #include "internal.h"
- 
--/* The version macro is introduced the same time as the setting enum was
-- * changed, so this check should suffice. */
--#ifndef AACDECODER_LIB_VL0
-+#define FDKDEC_VER_AT_LEAST(vl0, vl1) \
-+    (defined(AACDECODER_LIB_VL0) && \
-+        ((AACDECODER_LIB_VL0 > vl0) || \
-+         (AACDECODER_LIB_VL0 == vl0 && AACDECODER_LIB_VL1 >= vl1)))
-+
-+#if !FDKDEC_VER_AT_LEAST(2, 5) // < 2.5.10
- #define AAC_PCM_MAX_OUTPUT_CHANNELS AAC_PCM_OUTPUT_CHANNELS
- #endif
- 
-@@ -72,7 +75,7 @@ static const AVOption fdk_aac_dec_options[] = {
-                      OFFSET(drc_level),      AV_OPT_TYPE_INT,   { .i64 = -1},  -1, 127, AD, NULL    },
-     { "drc_heavy", "Dynamic Range Control: heavy compression, where [1] is on (RF mode) and [0] is off",
-                      OFFSET(drc_heavy),      AV_OPT_TYPE_INT,   { .i64 = -1},  -1, 1,   AD, NULL    },
--#ifdef AACDECODER_LIB_VL0
-+#if FDKDEC_VER_AT_LEAST(2, 5) // 2.5.10
-     { "level_limit", "Signal level limiting", OFFSET(level_limit), AV_OPT_TYPE_INT, { .i64 = 0 }, -1, 1, AD },
- #endif
-     { NULL }
-@@ -293,7 +296,7 @@ static av_cold int fdk_aac_decode_init(AVCodecContext *avctx)
-         }
-     }
- 
--#ifdef AACDECODER_LIB_VL0
-+#if FDKDEC_VER_AT_LEAST(2, 5) // 2.5.10
-     if (aacDecoder_SetParam(s->handle, AAC_PCM_LIMITER_ENABLE, s->level_limit) != AAC_DEC_OK) {
-         av_log(avctx, AV_LOG_ERROR, "Unable to set in signal level limiting in the decoder\n");
-         return AVERROR_UNKNOWN;
-diff --git a/libavcodec/libfdk-aacenc.c b/libavcodec/libfdk-aacenc.c
-index f5adb407ed..91dcb5a1b9 100644
---- a/libavcodec/libfdk-aacenc.c
-+++ b/libavcodec/libfdk-aacenc.c
-@@ -156,7 +156,7 @@ static av_cold int aac_encode_init(AVCodecContext *avctx)
-     case 6: mode = MODE_1_2_2_1; sce = 2; cpe = 2; break;
- /* The version macro is introduced the same time as the 7.1 support, so this
-    should suffice. */
--#ifdef AACENCODER_LIB_VL0
-+#if FDKENC_VER_AT_LEAST(3, 4) // 3.4.12
-     case 8:
-         sce = 2;
-         cpe = 3;
-@@ -291,7 +291,7 @@ static av_cold int aac_encode_init(AVCodecContext *avctx)
-     }
- 
-     avctx->frame_size = info.frameLength;
--#if FDKENC_VER_AT_LEAST(4, 0)
-+#if FDKENC_VER_AT_LEAST(4, 0) // 4.0.0
-     avctx->initial_padding = info.nDelay;
- #else
-     avctx->initial_padding = info.encoderDelay;
-@@ -412,7 +412,7 @@ static const uint64_t aac_channel_layout[] = {
-     AV_CH_LAYOUT_4POINT0,
-     AV_CH_LAYOUT_5POINT0_BACK,
-     AV_CH_LAYOUT_5POINT1_BACK,
--#ifdef AACENCODER_LIB_VL0
-+#if FDKENC_VER_AT_LEAST(3, 4) // 3.4.12
-     AV_CH_LAYOUT_7POINT1_WIDE_BACK,
-     AV_CH_LAYOUT_7POINT1,
- #endif
--- 
-2.20.1
-
diff --git a/package/ffmpeg/0004-libfdk-aac-Don-t-use-defined-in-a-define.patch b/package/ffmpeg/0004-libfdk-aac-Don-t-use-defined-in-a-define.patch
deleted file mode 100644
index 30357b91e1..0000000000
--- a/package/ffmpeg/0004-libfdk-aac-Don-t-use-defined-in-a-define.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 452746d80fdaaaf1b546860eb78449c6de3678d7 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Martin=20Storsj=C3=B6?= <martin@martin.st>
-Date: Wed, 12 Sep 2018 20:03:12 +0300
-Subject: [PATCH] libfdk-aac: Don't use defined() in a #define
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-libfdk-aac: Don't use defined() in a #define
-
-MSVC expands the preprocessor directives differently, making the
-version check fail in the previous form.
-
-Clang can warn about this with -Wexpansion-to-defined (not currently
-enabled by default):
-warning: macro expansion producing 'defined' has undefined behavior [-Wexpansion-to-defined]
-
-Downloaded from
-http://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=2a9e1c122eed66be1b26b747342b848300b226c7
-
-Signed-off-by: Martin Storsj? <martin@martin.st>
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- libavcodec/libfdk-aacdec.c | 9 ++++++---
- libavcodec/libfdk-aacenc.c | 9 ++++++---
- 2 files changed, 12 insertions(+), 6 deletions(-)
-
-diff --git a/libavcodec/libfdk-aacdec.c b/libavcodec/libfdk-aacdec.c
-index ef51184ebd..0fbab36463 100644
---- a/libavcodec/libfdk-aacdec.c
-+++ b/libavcodec/libfdk-aacdec.c
-@@ -25,10 +25,13 @@
- #include "avcodec.h"
- #include "internal.h"
- 
-+#ifdef AACDECODER_LIB_VL0
- #define FDKDEC_VER_AT_LEAST(vl0, vl1) \
--    (defined(AACDECODER_LIB_VL0) && \
--        ((AACDECODER_LIB_VL0 > vl0) || \
--         (AACDECODER_LIB_VL0 == vl0 && AACDECODER_LIB_VL1 >= vl1)))
-+    ((AACDECODER_LIB_VL0 > vl0) || \
-+     (AACDECODER_LIB_VL0 == vl0 && AACDECODER_LIB_VL1 >= vl1))
-+#else
-+#define FDKDEC_VER_AT_LEAST(vl0, vl1) 0
-+#endif
- 
- #if !FDKDEC_VER_AT_LEAST(2, 5) // < 2.5.10
- #define AAC_PCM_MAX_OUTPUT_CHANNELS AAC_PCM_OUTPUT_CHANNELS
-diff --git a/libavcodec/libfdk-aacenc.c b/libavcodec/libfdk-aacenc.c
-index 91dcb5a1b9..8349e56dcb 100644
---- a/libavcodec/libfdk-aacenc.c
-+++ b/libavcodec/libfdk-aacenc.c
-@@ -26,10 +26,13 @@
- #include "audio_frame_queue.h"
- #include "internal.h"
- 
-+#ifdef AACENCODER_LIB_VL0
- #define FDKENC_VER_AT_LEAST(vl0, vl1) \
--    (defined(AACENCODER_LIB_VL0) && \
--        ((AACENCODER_LIB_VL0 > vl0) || \
--         (AACENCODER_LIB_VL0 == vl0 && AACENCODER_LIB_VL1 >= vl1)))
-+    ((AACENCODER_LIB_VL0 > vl0) || \
-+     (AACENCODER_LIB_VL0 == vl0 && AACENCODER_LIB_VL1 >= vl1))
-+#else
-+#define FDKENC_VER_AT_LEAST(vl0, vl1) 0
-+#endif
- 
- typedef struct AACContext {
-     const AVClass *class;
--- 
-2.20.1
-
diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index 2d94c5712a..eec7ce0f6b 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -63,12 +63,6 @@ config BR2_PACKAGE_FFMPEG_FFPLAY
 comment "ffplay needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
 
-config BR2_PACKAGE_FFMPEG_FFSERVER
-	bool "Build ffserver"
-	depends on BR2_USE_MMU # fork()
-	help
-	  FFserver is a streaming server for both audio and video.
-
 config BR2_PACKAGE_FFMPEG_FFPROBE
 	bool "Build ffprobe"
 	help
diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index e00c4ec56c..c21561698f 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 741cbd6394eaed370774ca4cc089eaafbc54d0824b9aa360d4b3b0cbcbc4a92c  ffmpeg-3.4.5.tar.xz
+sha256 a38ec4d026efb58506a99ad5cd23d5a9793b4bf415f2c4c2e9c1bb444acd1994  ffmpeg-4.1.tar.xz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256 b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  COPYING.LGPLv2.1
 sha256 73d99bc83313fff665b426d6672b4e0479102bc402fe22314ac9ce94a38aa5ff  LICENSE.md
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index b86d465df8..c42fa54cd1 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 3.4.5
+FFMPEG_VERSION = 4.1
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
@@ -84,12 +84,6 @@ else
 FFMPEG_CONF_OPTS += --disable-ffplay
 endif
 
-ifeq ($(BR2_PACKAGE_FFMPEG_FFSERVER),y)
-FFMPEG_CONF_OPTS += --enable-ffserver
-else
-FFMPEG_CONF_OPTS += --disable-ffserver
-endif
-
 ifeq ($(BR2_PACKAGE_FFMPEG_AVRESAMPLE),y)
 FFMPEG_CONF_OPTS += --enable-avresample
 else
-- 
2.20.1
