From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  9 Sep 2018 16:19:34 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/freeswitch: Fix build with
 FFmpeg 4.0
Message-ID: <20180909141934.6814-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v4: send again as standalone patch, rebased for buildroot master after
    freeswitch bump to 1.8.1 (Thomas)
    build-tested without bumping ffmpeg to 4.0.2,
    AV_INPUT_BUFFER_PADDING_SIZE was added to ffmpeg 2.8 in 2015:
    http://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=29d147c94dd40a78ca3981f39365cc77dae9a0da
v3: re-integrated in ffmpeg bump series
v2: split patch from v1 series, added missing license hashes,
    git-formatted patch 0002
    patch 0001 can not be reformatted because Makefile.in is not part of
    the git repository

 .../0002-mod_av-unbreak-with-ffmpeg-4.0.patch | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 package/freeswitch/0002-mod_av-unbreak-with-ffmpeg-4.0.patch

diff --git a/package/freeswitch/0002-mod_av-unbreak-with-ffmpeg-4.0.patch b/package/freeswitch/0002-mod_av-unbreak-with-ffmpeg-4.0.patch
new file mode 100644
index 0000000000..01eb3d86c0
--- /dev/null
+++ b/package/freeswitch/0002-mod_av-unbreak-with-ffmpeg-4.0.patch
@@ -0,0 +1,89 @@
+From 72f2f7047ad35b37002d6210458667a89c301cfe Mon Sep 17 00:00:00 2001
+From: jbeich <jbeich@FreeBSD.org>
+Date: Thu, 16 Aug 2018 22:14:20 +0200
+Subject: [PATCH] mod_av: unbreak with ffmpeg 4.0
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
+PR:		227726
+Reported by:	antoine (via exp-run)
+
+Downloaded from
+https://github.com/freebsd/freebsd-ports/commit/da104360ea7d7861aa9fe6dc04b776a1eaf794ec
+
+Original file
+https://svnweb.freebsd.org/ports/head/net/freeswitch/files/patch-ffmpeg4?view=markup
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/mod/applications/mod_av/avcodec.c  | 2 +-
+ src/mod/applications/mod_av/avformat.c | 8 ++++----
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/mod/applications/mod_av/avcodec.c b/src/mod/applications/mod_av/avcodec.c
+index f987a47466..54a61c878c 100644
+--- a/src/mod/applications/mod_av/avcodec.c
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
+diff --git a/src/mod/applications/mod_av/avformat.c b/src/mod/applications/mod_av/avformat.c
+index b9f6f99ef5..f5329c9106 100644
+--- a/src/mod/applications/mod_av/avformat.c
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
+@@ -639,7 +639,7 @@ GCC_DIAG_ON(deprecated-declarations)
+ 	mst->frame->format         = AV_SAMPLE_FMT_S16;
+ 	mst->frame->channel_layout = c->channel_layout;
+ 
+-	if (c->codec->capabilities & CODEC_CAP_VARIABLE_FRAME_SIZE) {
++	if (c->codec->capabilities & AV_CODEC_CAP_VARIABLE_FRAME_SIZE) {
+ 		//mst->frame->nb_samples = 10000;
+ 		mst->frame->nb_samples = (mst->frame->sample_rate / 50) * c->channels;
+ 	} else {
+-- 
+2.18.0
-- 
2.18.0
