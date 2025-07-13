Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5972AC83F1D
	for <buildroot@archiver.kernel.org>; Sun, 13 Jul 2025 11:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 132B6407DD;
	Sun, 13 Jul 2025 11:21:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 85OwEdNzknux; Sun, 13 Jul 2025 11:21:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7B38407F4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7B38407F4;
	Sun, 13 Jul 2025 11:21:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AD62028B
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 11:21:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 383D1608D6
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 11:21:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5QaSJQvLn5BS for <buildroot@buildroot.org>;
 Sun, 13 Jul 2025 11:21:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B1F060A69
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B1F060A69
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 11:21:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A5858642B; Sun, 13 Jul 2025 11:21:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Jul 2025 13:06:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa187f62d6ef55f990fbe245d03f73c9b96ed5aa
X-Git-Newrev: 68751909a9a5060dc7e3f5e52aa72675721d8905
X-Patchwork-Hint: ignore
Message-Id: <20250713112101.1A5858642B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeswitch: fix build with
 ffmpeg-7.x
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=68751909a9a5060dc7e3f5e52aa72675721d8905
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch replaces the previous patch allowing to build with ffmpeg 6.x
with a patch which also allows to build with ffmpeg 7.x.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freeswitch/0002-ffmpeg7.patch              | 206 +++++++++++++++++++++
 .../0002-mod_av-fix-build-with-ffmpeg-6.0.patch    |  48 -----
 2 files changed, 206 insertions(+), 48 deletions(-)

diff --git a/package/freeswitch/0002-ffmpeg7.patch b/package/freeswitch/0002-ffmpeg7.patch
new file mode 100644
index 0000000000..ac1d3a13af
--- /dev/null
+++ b/package/freeswitch/0002-ffmpeg7.patch
@@ -0,0 +1,206 @@
+From ff2e8b475f25a995e085045fc25ba445fb32c57e Mon Sep 17 00:00:00 2001
+From: Korynkai <matt@qmxtech.com>
+Date: Mon, 30 Dec 2024 22:23:33 +0000
+Subject: [PATCH] Fixes related to signalwire/freeswitch#2202
+ AVOutputFormat::priv_data_size is marked private and no longer exists in the
+ public API as of FFMPEG 6.0, but found hidden in AVOutputFormat as part of
+ FFOutputFormat. AVCodecContext::ticks_per_frame was deprecated as of FFMPEG
+ 6.1. libavcodec notes 'do not use avcodec_close()' as of FFMPEG 3.1, use
+ avcodec_free_context() instead. AVFrame::key_frame was deprecated as of
+ FFMPEG 6.1, use AVFrame::flags instead. AVInputFormat::read_seek and
+ AVInputFormat::read_seek2 no longer exists as of FFMPEG 7.0. This seems to
+ only be used for logging purposes, so guard this functionality accordingly.
+
+Upstream: https://github.com/signalwire/freeswitch/pull/2681.patch
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/mod/applications/mod_av/avcodec.c  | 27 +++++++++++++++++++++-
+ src/mod/applications/mod_av/avformat.c | 31 +++++++++++++++++++++++---
+ 2 files changed, 54 insertions(+), 4 deletions(-)
+
+diff --git a/src/mod/applications/mod_av/avcodec.c b/src/mod/applications/mod_av/avcodec.c
+index 0293b834467..be864a56744 100644
+--- a/src/mod/applications/mod_av/avcodec.c
++++ b/src/mod/applications/mod_av/avcodec.c
+@@ -1226,9 +1226,13 @@ static switch_status_t open_encoder(h264_codec_context_t *context, uint32_t widt
+ 	}
+ 
+ 	if (context->encoder_ctx) {
++#if (LIBAVCODEC_VERSION_INT < AV_VERSION_INT(57,48,101))
+ 		if (avcodec_is_open(context->encoder_ctx)) {
+ 			avcodec_close(context->encoder_ctx);
+ 		}
++#else
++		avcodec_free_context(&(context->encoder_ctx));
++#endif
+ 		av_free(context->encoder_ctx);
+ 		context->encoder_ctx = NULL;
+ 	}
+@@ -1319,9 +1323,13 @@ FF_ENABLE_DEPRECATION_WARNINGS
+ 		}
+ 
+ 		if (context->encoder_ctx) {
++#if (LIBAVCODEC_VERSION_INT < AV_VERSION_INT(57,48,101))
+ 			if (avcodec_is_open(context->encoder_ctx)) {
+ 				avcodec_close(context->encoder_ctx);
+ 			}
++#else
++			avcodec_free_context(&(context->encoder_ctx));
++#endif
+ 			av_free(context->encoder_ctx);
+ 			context->encoder_ctx = NULL;
+ 		}
+@@ -1557,7 +1565,11 @@ static switch_status_t switch_h264_encode(switch_codec_t *codec, switch_frame_t
+ 		}
+ 
+ 		 avframe->pict_type = AV_PICTURE_TYPE_I;
++#if (LIBAVUTIL_VERSION_INT < AV_VERSION_INT(58,29,100))
+ 		 avframe->key_frame = 1;
++#else
++		 avframe->flags |= AV_FRAME_FLAG_KEY;
++#endif
+ 		 context->last_keyframe_request = switch_time_now();
+ 	}
+ 
+@@ -1600,9 +1612,14 @@ GCC_DIAG_ON(deprecated-declarations)
+ 		}
+ #endif
+ 
++#if (LIBAVUTIL_VERSION_INT < AV_VERSION_INT(58,29,100))
+ 	if (context->need_key_frame && avframe->key_frame == 1) {
+-		avframe->pict_type = 0;
+ 		avframe->key_frame = 0;
++#else
++	if (context->need_key_frame && avframe->flags & AV_FRAME_FLAG_KEY) {
++		avframe->flags ^= AV_FRAME_FLAG_KEY;
++#endif
++		avframe->pict_type = 0;
+ 		context->need_key_frame = 0;
+ 	}
+ 
+@@ -1862,14 +1879,22 @@ static switch_status_t switch_h264_destroy(switch_codec_t *codec)
+ 
+ 	switch_buffer_destroy(&context->nalu_buffer);
+ 	if (context->decoder_ctx) {
++#if (LIBAVCODEC_VERSION_INT < AV_VERSION_INT(57,48,101))
+ 		if (avcodec_is_open(context->decoder_ctx)) avcodec_close(context->decoder_ctx);
++#else
++		avcodec_free_context(&(context->decoder_ctx));
++#endif
+ 		av_free(context->decoder_ctx);
+ 	}
+ 
+ 	switch_img_free(&context->img);
+ 
+ 	if (context->encoder_ctx) {
++#if (LIBAVCODEC_VERSION_INT < AV_VERSION_INT(57,48,101))
+ 		if (avcodec_is_open(context->encoder_ctx)) avcodec_close(context->encoder_ctx);
++#else
++		avcodec_free_context(&(context->encoder_ctx));
++#endif
+ 		av_free(context->encoder_ctx);
+ 	}
+ 
+diff --git a/src/mod/applications/mod_av/avformat.c b/src/mod/applications/mod_av/avformat.c
+index c1e00525300..6fcb51c2079 100644
+--- a/src/mod/applications/mod_av/avformat.c
++++ b/src/mod/applications/mod_av/avformat.c
+@@ -184,6 +184,16 @@ struct av_file_context {
+ 
+ typedef struct av_file_context av_file_context_t;
+ 
++#if (LIBAVFORMAT_VERSION_MAJOR >= 60)
++typedef struct FFOutputFormat {
++	int priv_data_size;
++} FFOutputFormat;
++
++static inline int priv_data_size(const AVOutputFormat *fmt)
++{
++    return ((const struct FFOutputFormat*)fmt)->priv_data_size;
++}
++#endif
+ 
+ /**
+  * Fill the provided buffer with a string containing a timestamp
+@@ -455,8 +465,13 @@ static int mod_avformat_alloc_output_context2(AVFormatContext **avctx, const cha
+ 	}
+ 
+ 	s->oformat = oformat;
++#if (LIBAVFORMAT_VERSION_MAJOR < 60)
+ 	if (s->oformat->priv_data_size > 0) {
+ 		s->priv_data = av_mallocz(s->oformat->priv_data_size);
++#else
++	if (priv_data_size(s->oformat) > 0) {
++		s->priv_data = av_mallocz(priv_data_size(s->oformat));
++#endif
+ 		if (!s->priv_data) {
+ 			goto nomem;
+ 		}
+@@ -621,7 +636,9 @@ static switch_status_t add_stream(av_file_context_t *context, MediaStream *mst,
+ 		c->rc_initial_buffer_occupancy = buffer_bytes * 8;
+ 
+ 		if (codec_id == AV_CODEC_ID_H264) {
++#if (LIBAVCODEC_VERSION_INT < AV_VERSION_INT(60,31,102))
+ 			c->ticks_per_frame = 2;
++#endif
+ 
+ 
+ 			c->flags|=AV_CODEC_FLAG_LOOP_FILTER;   // flags=+loop
+@@ -1410,8 +1427,10 @@ static switch_status_t open_input_file(av_file_context_t *context, switch_file_h
+ 		switch_goto_status(SWITCH_STATUS_FALSE, err);
+ 	}
+ 
++#if (LIBAVFORMAT_VERSION_MAJOR < 61)
+ 	handle->seekable = context->fc->iformat->read_seek2 ? 1 : (context->fc->iformat->read_seek ? 1 : 0);
+ 	switch_log_printf(SWITCH_CHANNEL_LOG, SWITCH_LOG_INFO, "file %s is %sseekable\n", filename, handle->seekable ? "" : "not ");
++#endif
+ 
+ 	/** Get information on the input file (number of streams etc.). */
+ 	if ((error = avformat_find_stream_info(context->fc, opts ? &opts : NULL)) < 0) {
+@@ -1502,7 +1521,11 @@ static switch_status_t open_input_file(av_file_context_t *context, switch_file_h
+ 
+ 		switch_log_printf(SWITCH_CHANNEL_LOG, SWITCH_LOG_ERROR, "Could not open input audio codec channel 2 (error '%s')\n", get_error_text(error, ebuf, sizeof(ebuf)));
+ 		if ((cc = av_get_codec_context(&context->audio_st[0]))) {
++#if (LIBAVCODEC_VERSION_INT < AV_VERSION_INT(57,48,101))
+ 			avcodec_close(cc);
++#else
++			avcodec_free_context(&cc);
++#endif
+ 		}
+ 
+ 		context->has_audio = 0;
+@@ -3084,14 +3107,11 @@ static switch_status_t av_file_read_video(switch_file_handle_t *handle, switch_f
+ 	void *pop;
+ 	MediaStream *mst = &context->video_st;
+ 	AVStream *st = mst->st;
+-	int ticks = 0;
+ 	int64_t max_delta = 1 * AV_TIME_BASE; // 1 second
+ 	switch_status_t status = SWITCH_STATUS_SUCCESS;
+ 	double fl_to = 0.02;
+ 	int do_fl = 0;
+ 	int smaller_ts = context->read_fps;
+-	AVCodecContext *c = NULL;
+-	AVCodecParserContext *cp = NULL;
+ 
+ 	if (!context->has_video) return SWITCH_STATUS_FALSE;
+ 
+@@ -3199,6 +3219,10 @@ static switch_status_t av_file_read_video(switch_file_handle_t *handle, switch_f
+ 	}
+ #endif
+ 
++#if (LIBAVCODEC_VERSION_INT < AV_VERSION_INT(60,31,102))
++	int ticks = 0;
++	AVCodecContext *c = NULL;
++	AVCodecParserContext *cp = NULL;
+ 	if ((c = av_get_codec_context(mst)) && c->time_base.num) {
+ 		cp = av_stream_get_parser(st);
+ 		ticks = cp ? cp->repeat_pict + 1 : c->ticks_per_frame;
+@@ -3210,6 +3234,7 @@ static switch_status_t av_file_read_video(switch_file_handle_t *handle, switch_f
+ 			context->video_start_time, ticks, c ? c->ticks_per_frame : -1, st->time_base.num, st->time_base.den, c ? c->time_base.num : -1, c ? c->time_base.den : -1,
+ 			st->start_time, st->duration == AV_NOPTS_VALUE ? context->fc->duration / AV_TIME_BASE * 1000 : st->duration, st->nb_frames, av_q2d(st->time_base));
+ 	}
++#endif
+ 
+  again:
+ 
diff --git a/package/freeswitch/0002-mod_av-fix-build-with-ffmpeg-6.0.patch b/package/freeswitch/0002-mod_av-fix-build-with-ffmpeg-6.0.patch
deleted file mode 100644
index bd38d76d85..0000000000
--- a/package/freeswitch/0002-mod_av-fix-build-with-ffmpeg-6.0.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 2e75bb8b2c7f70c5d16c9e3d14b1427f4eb80c9c Mon Sep 17 00:00:00 2001
-From: Korynkai <matt@qmxtech.com>
-Date: Thu, 17 Aug 2023 21:10:31 +0200
-Subject: [PATCH] mod_av: fix build with ffmpeg 6.0
-
-Upstream: https://github.com/signalwire/freeswitch/issues/2202
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/mod/applications/mod_av/avformat.c | 2 ++
- src/mod/applications/mod_av/mod_av.h   | 1 +
- 2 files changed, 3 insertions(+)
-
-diff --git a/src/mod/applications/mod_av/avformat.c b/src/mod/applications/mod_av/avformat.c
-index 69475c169f..0a1662aed6 100644
---- a/src/mod/applications/mod_av/avformat.c
-+++ b/src/mod/applications/mod_av/avformat.c
-@@ -455,6 +455,7 @@ static int mod_avformat_alloc_output_context2(AVFormatContext **avctx, const cha
- 	}
- 
- 	s->oformat = oformat;
-+#if (LIBAVFORMAT_VERSION_MAJOR < LIBAVFORMAT_N)
- 	if (s->oformat->priv_data_size > 0) {
- 		s->priv_data = av_mallocz(s->oformat->priv_data_size);
- 		if (!s->priv_data) {
-@@ -468,6 +469,7 @@ static int mod_avformat_alloc_output_context2(AVFormatContext **avctx, const cha
- 	} else {
- 		s->priv_data = NULL;
- 	}
-+#endif
- 
- 	if (filename) {
- #if (LIBAVCODEC_VERSION_INT < AV_VERSION_INT(58,7,100))
-diff --git a/src/mod/applications/mod_av/mod_av.h b/src/mod/applications/mod_av/mod_av.h
-index a89e6cb8f7..ef9bd48d73 100644
---- a/src/mod/applications/mod_av/mod_av.h
-+++ b/src/mod/applications/mod_av/mod_av.h
-@@ -42,6 +42,7 @@
- 
- #define LIBAVCODEC_V 59
- #define LIBAVFORMAT_V 59
-+#define LIBAVFORMAT_N 60
- #define LIBAVUTIL_V 57
- 
- struct mod_av_globals {
--- 
-2.39.2
-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
