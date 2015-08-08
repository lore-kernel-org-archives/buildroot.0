From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:51 -0000
Subject: [Buildroot] [git commit branch/next] package/ffmpeg: bump version
	to 2.7.1
Message-ID: <20150808105638.D8C9F803C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c8a2264d2337d03f45e25a04e01de6c4178fcd5c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Removed patches applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ix-dxva-playback-of-streams-that-don-t-st.patch |    6 +-
 package/ffmpeg/0014-fix-ff-thread-get-format.patch |  131 --------------------
 .../ffmpeg/0015-hevc-avoid-unnecessary-calls.patch |   72 -----------
 package/ffmpeg/ffmpeg.hash                         |    2 +-
 package/ffmpeg/ffmpeg.mk                           |    2 +-
 5 files changed, 5 insertions(+), 208 deletions(-)

diff --git a/package/ffmpeg/0012-dxva-h264-Fix-dxva-playback-of-streams-that-don-t-st.patch b/package/ffmpeg/0012-dxva-h264-Fix-dxva-playback-of-streams-that-don-t-st.patch
index 0aa0aeb..f346da1 100644
--- a/package/ffmpeg/0012-dxva-h264-Fix-dxva-playback-of-streams-that-don-t-st.patch
+++ b/package/ffmpeg/0012-dxva-h264-Fix-dxva-playback-of-streams-that-don-t-st.patch
@@ -32,7 +32,7 @@ index 6deccc3..85b25fd 100644
 +        h->got_first_iframe = 1;
 +    }
 +
-     ret = ff_dxva2_common_end_frame(avctx, &h->cur_pic_ptr->f,
+     ret = ff_dxva2_common_end_frame(avctx, h->cur_pic_ptr->f,
                                      &ctx_pic->pp, sizeof(ctx_pic->pp),
                                      &ctx_pic->qm, sizeof(ctx_pic->qm),
 diff --git a/libavcodec/h264.c b/libavcodec/h264.c
@@ -40,9 +40,9 @@ index 222bf58..ea2ec17 100644
 --- a/libavcodec/h264.c
 +++ b/libavcodec/h264.c
 @@ -1085,6 +1085,7 @@ void ff_h264_flush_change(H264Context *h)
-     h->list_count = 0;
-     h->current_slice = 0;
      h->mmco_reset = 1;
+     for (i = 0; i < h->nb_slice_ctx; i++)
+         h->slice_ctx[i].list_count = 0;
 +    h->got_first_iframe = 0;
  }
  
diff --git a/package/ffmpeg/0014-fix-ff-thread-get-format.patch b/package/ffmpeg/0014-fix-ff-thread-get-format.patch
deleted file mode 100644
index 8e7e339..0000000
--- a/package/ffmpeg/0014-fix-ff-thread-get-format.patch
+++ /dev/null
@@ -1,131 +0,0 @@
-From b52c216539bdbee830e0d306b372037d4e0cb35f Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Reimar=20D=C3=B6ffinger?= <Reimar.Doeffinger@gmx.de>
-Date: Sun, 8 Mar 2015 19:44:12 +0100
-Subject: [PATCH] pthread: Fix ff_thread_get_format issues when called outside
- frame decode
-
-Patch part of the XBMC patch set for ffmpeg, downloaded from
-https://github.com/xbmc/FFmpeg/.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- libavcodec/pthread_frame.c | 22 +++++++++++++++++++---
- 1 file changed, 19 insertions(+), 3 deletions(-)
-
-diff --git a/libavcodec/pthread_frame.c b/libavcodec/pthread_frame.c
-index 5a4ab84..c29d0a9 100644
---- a/libavcodec/pthread_frame.c
-+++ b/libavcodec/pthread_frame.c
-@@ -53,6 +53,7 @@
-  * Context used by codec threads and stored in their AVCodecInternal thread_ctx.
-  */
- typedef struct PerThreadContext {
-+    int main_thread;
-     struct FrameThreadContext *parent;
- 
-     pthread_t      thread;
-@@ -83,7 +84,8 @@ typedef struct PerThreadContext {
-                                      * Set when the codec calls get_format().
-                                      * State is returned to STATE_SETTING_UP afterwards.
-                                      */
--        STATE_SETUP_FINISHED        ///< Set after the codec has called ff_thread_finish_setup().
-+        STATE_SETUP_FINISHED,       ///< Set after the codec has called ff_thread_finish_setup().
-+        STATE_UPDATE_CONTEXT,       ///< Main thread is updating its context
-     } state;
- 
-     /**
-@@ -105,6 +107,7 @@ typedef struct PerThreadContext {
-  * Context stored in the client AVCodecInternal thread_ctx.
-  */
- typedef struct FrameThreadContext {
-+    int main_thread;
-     PerThreadContext *threads;     ///< The contexts for each thread.
-     PerThreadContext *prev_thread; ///< The last thread submit_packet() was called on.
- 
-@@ -143,6 +146,7 @@ static attribute_align_arg void *frame_worker_thread(void *arg)
-     AVCodecContext *avctx = p->avctx;
-     const AVCodec *codec = avctx->codec;
- 
-+    av_assert0(!p->main_thread);
-     pthread_mutex_lock(&p->mutex);
-     while (1) {
-             while (p->state == STATE_INPUT_READY && !fctx->die)
-@@ -330,6 +334,8 @@ static int submit_packet(PerThreadContext *p, AVPacket *avpkt)
- 
-     pthread_mutex_lock(&p->mutex);
- 
-+    p->state = STATE_UPDATE_CONTEXT;
-+
-     release_delayed_buffers(p);
- 
-     if (prev_thread) {
-@@ -408,6 +414,7 @@ int ff_thread_decode_frame(AVCodecContext *avctx,
-     int finished = fctx->next_finished;
-     PerThreadContext *p;
-     int err;
-+    av_assert0(fctx->main_thread);
- 
-     /*
-      * Submit a packet to the next decoding thread.
-@@ -515,6 +522,7 @@ void ff_thread_finish_setup(AVCodecContext *avctx) {
- 
-     if (!(avctx->active_thread_type&FF_THREAD_FRAME)) return;
- 
-+    av_assert0(!p->main_thread);
-     if(p->state == STATE_SETUP_FINISHED){
-         av_log(avctx, AV_LOG_WARNING, "Multiple ff_thread_finish_setup() calls\n");
-     }
-@@ -549,6 +557,7 @@ void ff_frame_thread_free(AVCodecContext *avctx, int thread_count)
-     const AVCodec *codec = avctx->codec;
-     int i;
- 
-+    av_assert0(fctx->main_thread);
-     park_frame_worker_threads(fctx, thread_count);
- 
-     if (fctx->prev_thread && fctx->prev_thread != fctx->threads)
-@@ -634,6 +643,7 @@ int ff_frame_thread_init(AVCodecContext *avctx)
-     }
- 
-     avctx->internal->thread_ctx = fctx = av_mallocz(sizeof(FrameThreadContext));
-+    fctx->main_thread = 1;
- 
-     fctx->threads = av_mallocz_array(thread_count, sizeof(PerThreadContext));
-     pthread_mutex_init(&fctx->buffer_mutex, NULL);
-@@ -718,6 +728,7 @@ void ff_thread_flush(AVCodecContext *avctx)
- 
-     if (!fctx) return;
- 
-+    av_assert0(fctx->main_thread);
-     park_frame_worker_threads(fctx, avctx->thread_count);
-     if (fctx->prev_thread) {
-         if (fctx->prev_thread != &fctx->threads[0])
-@@ -743,7 +754,10 @@ void ff_thread_flush(AVCodecContext *avctx)
- int ff_thread_can_start_frame(AVCodecContext *avctx)
- {
-     PerThreadContext *p = avctx->internal->thread_ctx;
--    if ((avctx->active_thread_type&FF_THREAD_FRAME) && p->state != STATE_SETTING_UP &&
-+    if (!(avctx->active_thread_type&FF_THREAD_FRAME))
-+        return 1;
-+    av_assert0(!p->main_thread);
-+    if (p->state != STATE_SETTING_UP &&
-         (avctx->codec->update_thread_context || !THREAD_SAFE_CALLBACKS(avctx))) {
-         return 0;
-     }
-@@ -762,6 +776,7 @@ static int thread_get_buffer_internal(AVCodecContext *avctx, ThreadFrame *f, int
-     if (!(avctx->active_thread_type & FF_THREAD_FRAME))
-         return ff_get_buffer(avctx, f->f, flags);
- 
-+    av_assert0(!p->main_thread);
-     if (p->state != STATE_SETTING_UP &&
-         (avctx->codec->update_thread_context || !THREAD_SAFE_CALLBACKS(avctx))) {
-         av_log(avctx, AV_LOG_ERROR, "get_buffer() cannot be called after ff_thread_finish_setup()\n");
-@@ -819,7 +834,8 @@ enum AVPixelFormat ff_thread_get_format(AVCodecContext *avctx, const enum AVPixe
-     enum AVPixelFormat res;
-     PerThreadContext *p = avctx->internal->thread_ctx;
-     if (!(avctx->active_thread_type & FF_THREAD_FRAME) || avctx->thread_safe_callbacks ||
--        avctx->get_format == avcodec_default_get_format)
-+        avctx->get_format == avcodec_default_get_format ||
-+        p->main_thread || p->state == STATE_UPDATE_CONTEXT)
-         return ff_get_format(avctx, fmt);
-     if (p->state != STATE_SETTING_UP) {
-         av_log(avctx, AV_LOG_ERROR, "get_format() cannot be called after ff_thread_finish_setup()\n");
diff --git a/package/ffmpeg/0015-hevc-avoid-unnecessary-calls.patch b/package/ffmpeg/0015-hevc-avoid-unnecessary-calls.patch
deleted file mode 100644
index 4e6050d..0000000
--- a/package/ffmpeg/0015-hevc-avoid-unnecessary-calls.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From ef86b05da8ad38c9c83e6f075536635647e6b799 Mon Sep 17 00:00:00 2001
-From: Rainer Hochecker <fernetmenta@online.de>
-Date: Thu, 12 Mar 2015 12:49:48 +0100
-Subject: [PATCH] hevc: avoid unnecessary calls to get_format
-
-Patch part of the XBMC patch set for ffmpeg, downloaded from
-https://github.com/xbmc/FFmpeg/.
-
-Upstream status: committed to master
-http://git.videolan.org/?p=ffmpeg.git;a=commit;h=786032cad8ecabe577d9cff0356da6e9e9488a2d
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- libavcodec/hevc.c | 23 ++++++++++++++---------
- 1 file changed, 14 insertions(+), 9 deletions(-)
-
-diff --git a/libavcodec/hevc.c b/libavcodec/hevc.c
-index b7ad29a..77b0c0c 100644
---- a/libavcodec/hevc.c
-+++ b/libavcodec/hevc.c
-@@ -280,7 +280,7 @@ static int decode_lt_rps(HEVCContext *s, LongTermRPS *rps, GetBitContext *gb)
-     return 0;
- }
- 
--static int set_sps(HEVCContext *s, const HEVCSPS *sps)
-+static int set_sps(HEVCContext *s, const HEVCSPS *sps, enum AVPixelFormat pix_fmt)
- {
-     #define HWACCEL_MAX (CONFIG_HEVC_DXVA2_HWACCEL)
-     enum AVPixelFormat pix_fmts[HWACCEL_MAX + 2], *fmt = pix_fmts;
-@@ -304,13 +304,18 @@ static int set_sps(HEVCContext *s, const HEVCSPS *sps)
- #endif
-     }
- 
--    *fmt++ = sps->pix_fmt;
--    *fmt = AV_PIX_FMT_NONE;
-+    if (pix_fmt == AV_PIX_FMT_NONE) {
-+        *fmt++ = sps->pix_fmt;
-+        *fmt = AV_PIX_FMT_NONE;
- 
--    ret = ff_thread_get_format(s->avctx, pix_fmts);
--    if (ret < 0)
--        goto fail;
--    s->avctx->pix_fmt = ret;
-+        ret = ff_thread_get_format(s->avctx, pix_fmts);
-+        if (ret < 0)
-+            goto fail;
-+        s->avctx->pix_fmt = ret;
-+    }
-+    else {
-+        s->avctx->pix_fmt = pix_fmt;
-+    }
- 
-     ff_set_sar(s->avctx, sps->vui.sar);
- 
-@@ -420,7 +425,7 @@ static int hls_slice_header(HEVCContext *s)
-                 sh->no_output_of_prior_pics_flag = 0;
-         }
-         ff_hevc_clear_refs(s);
--        ret = set_sps(s, s->sps);
-+        ret = set_sps(s, s->sps, AV_PIX_FMT_NONE);
-         if (ret < 0)
-             return ret;
- 
-@@ -3335,7 +3340,7 @@ static int hevc_update_thread_context(AVCodecContext *dst,
-     }
- 
-     if (s->sps != s0->sps)
--        if ((ret = set_sps(s, s0->sps)) < 0)
-+        if ((ret = set_sps(s, s0->sps, src->pix_fmt)) < 0)
-             return ret;
- 
-     s->seq_decode = s0->seq_decode;
diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index 0add973..a6cb310 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	59eb98c1b5896ac29abc0385f7c875d1b4942d695818818d418ee71eea1e0cfb	ffmpeg-2.6.3.tar.bz2
+sha256	7e07b97d2415feeae9c9b5595e35e7b7aab33207e81bf9f8c0d1eece43f7f720	ffmpeg-2.7.1.tar.bz2
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 0030d97..0162db2 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 2.6.3
+FFMPEG_VERSION = 2.7.1
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.bz2
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
