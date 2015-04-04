From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 17:03:57 +0200
Subject: [Buildroot] [git commit] package/ffmpeg: bump version to 2.6.1
Message-ID: <20150404152533.3E2D4818FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4d094d9eb4edba5b6c3c229a2c02da1427e43fe5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Dump two Kodi-specific patches according to
https://github.com/xbmc/xbmc/pull/6636
and update two new patches to improve hevc handling with Kodi Isengard.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/0002-asf-hacks.patch                |   42 ------
 ...add-public-version-of-ff_read_frame_flush.patch |   54 --------
 package/ffmpeg/0013-fix-ff-thread-get-format.patch |  131 ++++++++++++++++++++
 .../ffmpeg/0014-hevc-avoid-unnecessary-calls.patch |   72 +++++++++++
 package/ffmpeg/ffmpeg.hash                         |    2 +-
 package/ffmpeg/ffmpeg.mk                           |    2 +-
 6 files changed, 205 insertions(+), 98 deletions(-)

diff --git a/package/ffmpeg/0002-asf-hacks.patch b/package/ffmpeg/0002-asf-hacks.patch
deleted file mode 100644
index d0fbb2e..0000000
--- a/package/ffmpeg/0002-asf-hacks.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From fbd0b8b0239d3786b941adc89322b8e49e4c768e Mon Sep 17 00:00:00 2001
-From: Joakim Plate <elupus@ecce.se>
-Date: Mon, 12 Sep 2011 21:37:17 +0200
-Subject: [PATCH 02/13] asf hacks
-
-Patch part of the XBMC patch set for ffmpeg, downloaded from
-https://github.com/xbmc/FFmpeg/.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- libavformat/asfdec.c | 11 +++++++++++
- 1 file changed, 11 insertions(+)
-
-diff --git a/libavformat/asfdec.c b/libavformat/asfdec.c
-index 7f7bb4d..8911987 100644
---- a/libavformat/asfdec.c
-+++ b/libavformat/asfdec.c
-@@ -1549,9 +1549,20 @@ static int asf_read_seek(AVFormatContext *s, int stream_index,
-     AVStream *st    = s->streams[stream_index];
-     int ret = 0;
- 
-+    if (pts == 0) {
-+      // this is a hack since av_gen_search searches the entire file in this case
-+      av_log(s, AV_LOG_DEBUG, "SEEKTO: %"PRId64"\n", s->data_offset);
-+      if (avio_seek(s->pb, s->data_offset, SEEK_SET) < 0)
-+          return -1;
-+      return 0;
-+    }
-+
-     if (s->packet_size <= 0)
-         return -1;
- 
-+    if (st->codec->codec_type != AVMEDIA_TYPE_VIDEO)
-+        return -1;
-+
-     /* Try using the protocol's read_seek if available */
-     if (s->pb) {
-         int ret = avio_seek_time(s->pb, stream_index, pts, flags);
--- 
-2.1.0
-
diff --git a/package/ffmpeg/0013-add-public-version-of-ff_read_frame_flush.patch b/package/ffmpeg/0013-add-public-version-of-ff_read_frame_flush.patch
deleted file mode 100644
index cf07bd2..0000000
--- a/package/ffmpeg/0013-add-public-version-of-ff_read_frame_flush.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 7d7ce18ff0d24b586634fa6e631fa0eec7865aae Mon Sep 17 00:00:00 2001
-From: elupus <elupus@xbmc.org>
-Date: Tue, 1 Nov 2011 20:18:35 +0100
-Subject: [PATCH 13/13] add public version of ff_read_frame_flush
-
-We need this since we sometimes seek on the
-input stream behind ffmpeg's back. After this
-all data need to be flushed completely.
-
-Patch part of the XBMC patch set for ffmpeg, downloaded from
-https://github.com/xbmc/FFmpeg/.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- libavformat/avformat.h | 5 +++++
- libavformat/utils.c    | 5 +++++
- 2 files changed, 10 insertions(+)
-
-diff --git a/libavformat/avformat.h b/libavformat/avformat.h
-index 2e54ed1..3a9f292 100644
---- a/libavformat/avformat.h
-+++ b/libavformat/avformat.h
-@@ -2121,6 +2121,11 @@ int av_find_best_stream(AVFormatContext *ic,
- int av_read_frame(AVFormatContext *s, AVPacket *pkt);
- 
- /**
-+ * Clear out any buffered data in context
-+ */
-+void av_read_frame_flush(AVFormatContext *s);
-+
-+/**
-  * Seek to the keyframe at timestamp.
-  * 'timestamp' in 'stream_index'.
-  *
-diff --git a/libavformat/utils.c b/libavformat/utils.c
-index f4fb172..10dda18 100644
---- a/libavformat/utils.c
-+++ b/libavformat/utils.c
-@@ -1624,6 +1624,11 @@ void ff_read_frame_flush(AVFormatContext *s)
-     }
- }
- 
-+void av_read_frame_flush(AVFormatContext *s)
-+{
-+  ff_read_frame_flush(s);
-+}
-+
- void ff_update_cur_dts(AVFormatContext *s, AVStream *ref_st, int64_t timestamp)
- {
-     int i;
--- 
-2.1.0
-
diff --git a/package/ffmpeg/0013-fix-ff-thread-get-format.patch b/package/ffmpeg/0013-fix-ff-thread-get-format.patch
new file mode 100644
index 0000000..8e7e339
--- /dev/null
+++ b/package/ffmpeg/0013-fix-ff-thread-get-format.patch
@@ -0,0 +1,131 @@
+From b52c216539bdbee830e0d306b372037d4e0cb35f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Reimar=20D=C3=B6ffinger?= <Reimar.Doeffinger@gmx.de>
+Date: Sun, 8 Mar 2015 19:44:12 +0100
+Subject: [PATCH] pthread: Fix ff_thread_get_format issues when called outside
+ frame decode
+
+Patch part of the XBMC patch set for ffmpeg, downloaded from
+https://github.com/xbmc/FFmpeg/.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ libavcodec/pthread_frame.c | 22 +++++++++++++++++++---
+ 1 file changed, 19 insertions(+), 3 deletions(-)
+
+diff --git a/libavcodec/pthread_frame.c b/libavcodec/pthread_frame.c
+index 5a4ab84..c29d0a9 100644
+--- a/libavcodec/pthread_frame.c
++++ b/libavcodec/pthread_frame.c
+@@ -53,6 +53,7 @@
+  * Context used by codec threads and stored in their AVCodecInternal thread_ctx.
+  */
+ typedef struct PerThreadContext {
++    int main_thread;
+     struct FrameThreadContext *parent;
+ 
+     pthread_t      thread;
+@@ -83,7 +84,8 @@ typedef struct PerThreadContext {
+                                      * Set when the codec calls get_format().
+                                      * State is returned to STATE_SETTING_UP afterwards.
+                                      */
+-        STATE_SETUP_FINISHED        ///< Set after the codec has called ff_thread_finish_setup().
++        STATE_SETUP_FINISHED,       ///< Set after the codec has called ff_thread_finish_setup().
++        STATE_UPDATE_CONTEXT,       ///< Main thread is updating its context
+     } state;
+ 
+     /**
+@@ -105,6 +107,7 @@ typedef struct PerThreadContext {
+  * Context stored in the client AVCodecInternal thread_ctx.
+  */
+ typedef struct FrameThreadContext {
++    int main_thread;
+     PerThreadContext *threads;     ///< The contexts for each thread.
+     PerThreadContext *prev_thread; ///< The last thread submit_packet() was called on.
+ 
+@@ -143,6 +146,7 @@ static attribute_align_arg void *frame_worker_thread(void *arg)
+     AVCodecContext *avctx = p->avctx;
+     const AVCodec *codec = avctx->codec;
+ 
++    av_assert0(!p->main_thread);
+     pthread_mutex_lock(&p->mutex);
+     while (1) {
+             while (p->state == STATE_INPUT_READY && !fctx->die)
+@@ -330,6 +334,8 @@ static int submit_packet(PerThreadContext *p, AVPacket *avpkt)
+ 
+     pthread_mutex_lock(&p->mutex);
+ 
++    p->state = STATE_UPDATE_CONTEXT;
++
+     release_delayed_buffers(p);
+ 
+     if (prev_thread) {
+@@ -408,6 +414,7 @@ int ff_thread_decode_frame(AVCodecContext *avctx,
+     int finished = fctx->next_finished;
+     PerThreadContext *p;
+     int err;
++    av_assert0(fctx->main_thread);
+ 
+     /*
+      * Submit a packet to the next decoding thread.
+@@ -515,6 +522,7 @@ void ff_thread_finish_setup(AVCodecContext *avctx) {
+ 
+     if (!(avctx->active_thread_type&FF_THREAD_FRAME)) return;
+ 
++    av_assert0(!p->main_thread);
+     if(p->state == STATE_SETUP_FINISHED){
+         av_log(avctx, AV_LOG_WARNING, "Multiple ff_thread_finish_setup() calls\n");
+     }
+@@ -549,6 +557,7 @@ void ff_frame_thread_free(AVCodecContext *avctx, int thread_count)
+     const AVCodec *codec = avctx->codec;
+     int i;
+ 
++    av_assert0(fctx->main_thread);
+     park_frame_worker_threads(fctx, thread_count);
+ 
+     if (fctx->prev_thread && fctx->prev_thread != fctx->threads)
+@@ -634,6 +643,7 @@ int ff_frame_thread_init(AVCodecContext *avctx)
+     }
+ 
+     avctx->internal->thread_ctx = fctx = av_mallocz(sizeof(FrameThreadContext));
++    fctx->main_thread = 1;
+ 
+     fctx->threads = av_mallocz_array(thread_count, sizeof(PerThreadContext));
+     pthread_mutex_init(&fctx->buffer_mutex, NULL);
+@@ -718,6 +728,7 @@ void ff_thread_flush(AVCodecContext *avctx)
+ 
+     if (!fctx) return;
+ 
++    av_assert0(fctx->main_thread);
+     park_frame_worker_threads(fctx, avctx->thread_count);
+     if (fctx->prev_thread) {
+         if (fctx->prev_thread != &fctx->threads[0])
+@@ -743,7 +754,10 @@ void ff_thread_flush(AVCodecContext *avctx)
+ int ff_thread_can_start_frame(AVCodecContext *avctx)
+ {
+     PerThreadContext *p = avctx->internal->thread_ctx;
+-    if ((avctx->active_thread_type&FF_THREAD_FRAME) && p->state != STATE_SETTING_UP &&
++    if (!(avctx->active_thread_type&FF_THREAD_FRAME))
++        return 1;
++    av_assert0(!p->main_thread);
++    if (p->state != STATE_SETTING_UP &&
+         (avctx->codec->update_thread_context || !THREAD_SAFE_CALLBACKS(avctx))) {
+         return 0;
+     }
+@@ -762,6 +776,7 @@ static int thread_get_buffer_internal(AVCodecContext *avctx, ThreadFrame *f, int
+     if (!(avctx->active_thread_type & FF_THREAD_FRAME))
+         return ff_get_buffer(avctx, f->f, flags);
+ 
++    av_assert0(!p->main_thread);
+     if (p->state != STATE_SETTING_UP &&
+         (avctx->codec->update_thread_context || !THREAD_SAFE_CALLBACKS(avctx))) {
+         av_log(avctx, AV_LOG_ERROR, "get_buffer() cannot be called after ff_thread_finish_setup()\n");
+@@ -819,7 +834,8 @@ enum AVPixelFormat ff_thread_get_format(AVCodecContext *avctx, const enum AVPixe
+     enum AVPixelFormat res;
+     PerThreadContext *p = avctx->internal->thread_ctx;
+     if (!(avctx->active_thread_type & FF_THREAD_FRAME) || avctx->thread_safe_callbacks ||
+-        avctx->get_format == avcodec_default_get_format)
++        avctx->get_format == avcodec_default_get_format ||
++        p->main_thread || p->state == STATE_UPDATE_CONTEXT)
+         return ff_get_format(avctx, fmt);
+     if (p->state != STATE_SETTING_UP) {
+         av_log(avctx, AV_LOG_ERROR, "get_format() cannot be called after ff_thread_finish_setup()\n");
diff --git a/package/ffmpeg/0014-hevc-avoid-unnecessary-calls.patch b/package/ffmpeg/0014-hevc-avoid-unnecessary-calls.patch
new file mode 100644
index 0000000..4e6050d
--- /dev/null
+++ b/package/ffmpeg/0014-hevc-avoid-unnecessary-calls.patch
@@ -0,0 +1,72 @@
+From ef86b05da8ad38c9c83e6f075536635647e6b799 Mon Sep 17 00:00:00 2001
+From: Rainer Hochecker <fernetmenta@online.de>
+Date: Thu, 12 Mar 2015 12:49:48 +0100
+Subject: [PATCH] hevc: avoid unnecessary calls to get_format
+
+Patch part of the XBMC patch set for ffmpeg, downloaded from
+https://github.com/xbmc/FFmpeg/.
+
+Upstream status: committed to master
+http://git.videolan.org/?p=ffmpeg.git;a=commit;h=786032cad8ecabe577d9cff0356da6e9e9488a2d
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ libavcodec/hevc.c | 23 ++++++++++++++---------
+ 1 file changed, 14 insertions(+), 9 deletions(-)
+
+diff --git a/libavcodec/hevc.c b/libavcodec/hevc.c
+index b7ad29a..77b0c0c 100644
+--- a/libavcodec/hevc.c
++++ b/libavcodec/hevc.c
+@@ -280,7 +280,7 @@ static int decode_lt_rps(HEVCContext *s, LongTermRPS *rps, GetBitContext *gb)
+     return 0;
+ }
+ 
+-static int set_sps(HEVCContext *s, const HEVCSPS *sps)
++static int set_sps(HEVCContext *s, const HEVCSPS *sps, enum AVPixelFormat pix_fmt)
+ {
+     #define HWACCEL_MAX (CONFIG_HEVC_DXVA2_HWACCEL)
+     enum AVPixelFormat pix_fmts[HWACCEL_MAX + 2], *fmt = pix_fmts;
+@@ -304,13 +304,18 @@ static int set_sps(HEVCContext *s, const HEVCSPS *sps)
+ #endif
+     }
+ 
+-    *fmt++ = sps->pix_fmt;
+-    *fmt = AV_PIX_FMT_NONE;
++    if (pix_fmt == AV_PIX_FMT_NONE) {
++        *fmt++ = sps->pix_fmt;
++        *fmt = AV_PIX_FMT_NONE;
+ 
+-    ret = ff_thread_get_format(s->avctx, pix_fmts);
+-    if (ret < 0)
+-        goto fail;
+-    s->avctx->pix_fmt = ret;
++        ret = ff_thread_get_format(s->avctx, pix_fmts);
++        if (ret < 0)
++            goto fail;
++        s->avctx->pix_fmt = ret;
++    }
++    else {
++        s->avctx->pix_fmt = pix_fmt;
++    }
+ 
+     ff_set_sar(s->avctx, sps->vui.sar);
+ 
+@@ -420,7 +425,7 @@ static int hls_slice_header(HEVCContext *s)
+                 sh->no_output_of_prior_pics_flag = 0;
+         }
+         ff_hevc_clear_refs(s);
+-        ret = set_sps(s, s->sps);
++        ret = set_sps(s, s->sps, AV_PIX_FMT_NONE);
+         if (ret < 0)
+             return ret;
+ 
+@@ -3335,7 +3340,7 @@ static int hevc_update_thread_context(AVCodecContext *dst,
+     }
+ 
+     if (s->sps != s0->sps)
+-        if ((ret = set_sps(s, s0->sps)) < 0)
++        if ((ret = set_sps(s, s0->sps, src->pix_fmt)) < 0)
+             return ret;
+ 
+     s->seq_decode = s0->seq_decode;
diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index c39174f..13487d1 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  cc91c166c2b0ad9aacc533e4d5637912df583b43834c68aeec12ded7e082a286  ffmpeg-2.5.4.tar.bz2
+sha256	a4f6388706ee2daba9d35d2aa018ae5feeb450efa716555e011a6543d43ec7c1	ffmpeg-2.6.1.tar.bz2
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 68a28a2..b27fce6 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 2.5.4
+FFMPEG_VERSION = 2.6.1
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.bz2
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
