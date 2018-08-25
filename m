From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 25 Aug 2018 09:31:13 +0200
Subject: [Buildroot] [PATCH/next v3 2/7] package/freeswitch: Fix build with
 FFmpeg 4.0
In-Reply-To: <20180825073118.14980-1-bernd.kuhls@t-online.de>
References: <20180825073118.14980-1-bernd.kuhls@t-online.de>
Message-ID: <20180825073118.14980-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added missing license hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: re-integrated in ffmpeg bump series
v2: split patch from v1 series, added missing license hashes,
    git-formatted patch 0002
    patch 0001 can not be reformatted because Makefile.in is not part of
    the git repository

 .../0002-mod_av-unbreak-with-ffmpeg-4.0.patch | 90 +++++++++++++++++++
 package/freeswitch/freeswitch.hash            |  2 +
 2 files changed, 92 insertions(+)
 create mode 100644 package/freeswitch/0002-mod_av-unbreak-with-ffmpeg-4.0.patch

diff --git a/package/freeswitch/0002-mod_av-unbreak-with-ffmpeg-4.0.patch b/package/freeswitch/0002-mod_av-unbreak-with-ffmpeg-4.0.patch
new file mode 100644
index 0000000000..0fc7536f52
--- /dev/null
+++ b/package/freeswitch/0002-mod_av-unbreak-with-ffmpeg-4.0.patch
@@ -0,0 +1,90 @@
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
+ 		mst->frame->nb_samples = 10000;
+ 	} else {
+ 		mst->frame->nb_samples = c->frame_size;
+-- 
+2.18.0
+
diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index 25421de99b..057142e655 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -8,6 +8,8 @@ sha256 dbb0f73109171bd381772b247b8ef581f6a176964619082a1fe031b004086f6b  freeswi
 sha256 10299420c1e8602c0daf5a59d022621cd72a9148d1f0f33501edb3db3445c7fe  COPYING
 sha256 e8e26b16da14aa3e6ed5c22c705fdc1f45d6225fca461ea9f7314bcdfdc414c4  libs/apr/LICENSE
 sha256 1eefb2ea1db0af7729a9d8a27d7c65d8a37ab185393f935b029aac6828ce315a  libs/apr-util/LICENSE
+sha256 8267348d5af1262c11d1a08de2f5afc77457755f1ac658627dd9acf71011d615  libs/libvpx/LICENSE
+sha256 2b2cc1180c7e6988328ad2033b04b80117419db9c4c584918bbb3cfec7e9364f  libs/libyuv/LICENSE
 sha256 7d72a8aee2c4b1a084200487992a5d86f5df6b535727a14c1874918e99d24600  libs/libzrtp/src/zrtp_legal.c
 sha256 e1c0890440efe31b6cd2ee2abf895eb917c787799f079133f5809414d90d5d60  libs/sofia-sip/COPYING
 sha256 b402ae58cf355b33be8fa023f704a039e3d41ecaccd2bbcda43ca31d703e4556  libs/sofia-sip/COPYRIGHTS
-- 
2.18.0
