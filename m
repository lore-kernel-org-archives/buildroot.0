From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Aug 2018 22:32:01 +0200
Subject: [Buildroot] [PATCH/next 2/6] package/freeswitch: Fix build with
 FFmpeg 4.0
In-Reply-To: <20180812203205.7251-1-bernd.kuhls@t-online.de>
References: <20180812203205.7251-1-bernd.kuhls@t-online.de>
Message-ID: <20180812203205.7251-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch/0002-ffmpeg4.patch | 70 +++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 package/freeswitch/0002-ffmpeg4.patch

diff --git a/package/freeswitch/0002-ffmpeg4.patch b/package/freeswitch/0002-ffmpeg4.patch
new file mode 100644
index 0000000000..6c323e097e
--- /dev/null
+++ b/package/freeswitch/0002-ffmpeg4.patch
@@ -0,0 +1,70 @@
+Fix build with ffmpeg4
+
+avcodec.c:194:40: error: use of undeclared identifier 'FF_INPUT_BUFFER_PADDING_SIZE'
+static uint8_t ff_input_buffer_padding[FF_INPUT_BUFFER_PADDING_SIZE] = { 0 };
+                                       ^
+avformat.c:471:14: error: use of undeclared identifier 'CODEC_FLAG_LOOP_FILTER'
+                        c->flags|=CODEC_FLAG_LOOP_FILTER;   // flags=+loop
+                                  ^
+avformat.c:477:47: error: use of undeclared identifier 'ME_HEX'
+                        av_opt_set_int(c->priv_data, "motion_est", ME_HEX, 0);
+                                                                   ^
+avformat.c:553:15: error: use of undeclared identifier 'CODEC_FLAG_GLOBAL_HEADER'
+                c->flags |= CODEC_FLAG_GLOBAL_HEADER;
+                            ^
+avformat.c:638:31: error: use of undeclared identifier 'CODEC_CAP_VARIABLE_FRAME_SIZE'
+        if (c->codec->capabilities & CODEC_CAP_VARIABLE_FRAME_SIZE) {
+                                     ^
+
+Downloaded from
+https://svnweb.freebsd.org/ports/head/net/freeswitch/files/patch-ffmpeg4?view=markup
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- a/src/mod/applications/mod_av/avcodec.c.orig	2017-07-13 12:07:30 UTC
++++ b/src/mod/applications/mod_av/avcodec.c
+@@ -191,7 +191,7 @@ typedef struct h264_codec_context_s {
+ 	int hw_encoder;
+ } h264_codec_context_t;
+ 
+-static uint8_t ff_input_buffer_padding[FF_INPUT_BUFFER_PADDING_SIZE] = { 0 };
++static uint8_t ff_input_buffer_padding[AV_INPUT_BUFFER_PADDING_SIZE] = { 0 };
+ 
+ static switch_status_t buffer_h264_nalu(h264_codec_context_t *context, switch_frame_t *frame)
+ {
+--- a/src/mod/applications/mod_av/avformat.c.orig	2017-07-13 12:07:30 UTC
++++ b/src/mod/applications/mod_av/avformat.c
+@@ -468,13 +468,13 @@ GCC_DIAG_ON(deprecated-declarations)
+ 			c->ticks_per_frame = 2;
+ 
+ 
+-			c->flags|=CODEC_FLAG_LOOP_FILTER;   // flags=+loop
++			c->flags|=AV_CODEC_FLAG_LOOP_FILTER;   // flags=+loop
+ 			c->me_cmp|= 1;  // cmp=+chroma, where CHROMA = 1
+ 			c->me_range = 16;   // me_range=16
+ 			c->max_b_frames = 3;    // bf=3
+ 
+ 			av_opt_set_int(c->priv_data, "b_strategy", 1, 0);
+-			av_opt_set_int(c->priv_data, "motion_est", ME_HEX, 0);
++			av_opt_set(c->priv_data, "motion_est", "hex", 0);
+ 			av_opt_set_int(c->priv_data, "coder", 1, 0);
+ 
+ 			switch (mm->vprofile) {
+@@ -550,7 +550,7 @@ GCC_DIAG_ON(deprecated-declarations)
+ 
+ 	/* Some formats want stream headers to be separate. */
+ 	if (fc->oformat->flags & AVFMT_GLOBALHEADER) {
+-		c->flags |= CODEC_FLAG_GLOBAL_HEADER;
++		c->flags |= AV_CODEC_FLAG_GLOBAL_HEADER;
+ 	}
+ 
+ 	return SWITCH_STATUS_SUCCESS;
+@@ -635,7 +635,7 @@ GCC_DIAG_ON(deprecated-declarations)
+ 	mst->frame->format         = AV_SAMPLE_FMT_S16;
+ 	mst->frame->channel_layout = c->channel_layout;
+ 
+-	if (c->codec->capabilities & CODEC_CAP_VARIABLE_FRAME_SIZE) {
++	if (c->codec->capabilities & AV_CODEC_CAP_VARIABLE_FRAME_SIZE) {
+ 		mst->frame->nb_samples = 10000;
+ 	} else {
+ 		mst->frame->nb_samples = c->frame_size;
-- 
2.18.0
