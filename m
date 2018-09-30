From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Sep 2018 12:10:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/freeswitch: bump version to 1.8.2
Message-ID: <20180930101006.23164-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rebased patch 0002 after upstream commit:
https://freeswitch.org/stash/projects/FS/repos/freeswitch/commits/c2b2f49c1d0dcbfa77d5d861155a301fead93071

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0002-mod_av-unbreak-with-ffmpeg-4.0.patch | 33 +++++--------------
 package/freeswitch/freeswitch.hash            | 12 +++----
 package/freeswitch/freeswitch.mk              |  2 +-
 3 files changed, 16 insertions(+), 31 deletions(-)

diff --git a/package/freeswitch/0002-mod_av-unbreak-with-ffmpeg-4.0.patch b/package/freeswitch/0002-mod_av-unbreak-with-ffmpeg-4.0.patch
index 01eb3d86c0..a4693971c1 100644
--- a/package/freeswitch/0002-mod_av-unbreak-with-ffmpeg-4.0.patch
+++ b/package/freeswitch/0002-mod_av-unbreak-with-ffmpeg-4.0.patch
@@ -3,9 +3,6 @@ From: jbeich <jbeich@FreeBSD.org>
 Date: Thu, 16 Aug 2018 22:14:20 +0200
 Subject: [PATCH] mod_av: unbreak with ffmpeg 4.0
 
-avcodec.c:194:40: error: use of undeclared identifier 'FF_INPUT_BUFFER_PADDING_SIZE'
-static uint8_t ff_input_buffer_padding[FF_INPUT_BUFFER_PADDING_SIZE] = { 0 };
-                                       ^
 avformat.c:471:14: error: use of undeclared identifier 'CODEC_FLAG_LOOP_FILTER'
                         c->flags|=CODEC_FLAG_LOOP_FILTER;   // flags=+loop
                                   ^
@@ -28,30 +25,17 @@ https://github.com/freebsd/freebsd-ports/commit/da104360ea7d7861aa9fe6dc04b776a1
 Original file
 https://svnweb.freebsd.org/ports/head/net/freeswitch/files/patch-ffmpeg4?view=markup
 
+[Bernd: Rebased for freeswitch 1.8.2]
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
- src/mod/applications/mod_av/avcodec.c  | 2 +-
  src/mod/applications/mod_av/avformat.c | 8 ++++----
- 2 files changed, 5 insertions(+), 5 deletions(-)
+ 1 file changed, 4 insertions(+), 4 deletions(-)
 
-diff --git a/src/mod/applications/mod_av/avcodec.c b/src/mod/applications/mod_av/avcodec.c
-index f987a47466..54a61c878c 100644
---- a/src/mod/applications/mod_av/avcodec.c
-+++ b/src/mod/applications/mod_av/avcodec.c
-@@ -191,7 +191,7 @@ typedef struct h264_codec_context_s {
- 	int hw_encoder;
- } h264_codec_context_t;
- 
--static uint8_t ff_input_buffer_padding[FF_INPUT_BUFFER_PADDING_SIZE] = { 0 };
-+static uint8_t ff_input_buffer_padding[AV_INPUT_BUFFER_PADDING_SIZE] = { 0 };
- 
- static switch_status_t buffer_h264_nalu(h264_codec_context_t *context, switch_frame_t *frame)
- {
 diff --git a/src/mod/applications/mod_av/avformat.c b/src/mod/applications/mod_av/avformat.c
-index b9f6f99ef5..f5329c9106 100644
+index 84900b601c..2f5c0e8d20 100644
 --- a/src/mod/applications/mod_av/avformat.c
 +++ b/src/mod/applications/mod_av/avformat.c
-@@ -468,13 +468,13 @@ GCC_DIAG_ON(deprecated-declarations)
+@@ -479,13 +479,13 @@ GCC_DIAG_ON(deprecated-declarations)
  			c->ticks_per_frame = 2;
  
  
@@ -67,7 +51,7 @@ index b9f6f99ef5..f5329c9106 100644
  			av_opt_set_int(c->priv_data, "coder", 1, 0);
  
  			switch (mm->vprofile) {
-@@ -550,7 +550,7 @@ GCC_DIAG_ON(deprecated-declarations)
+@@ -568,7 +568,7 @@ GCC_DIAG_ON(deprecated-declarations)
  
  	/* Some formats want stream headers to be separate. */
  	if (fc->oformat->flags & AVFMT_GLOBALHEADER) {
@@ -75,8 +59,8 @@ index b9f6f99ef5..f5329c9106 100644
 +		c->flags |= AV_CODEC_FLAG_GLOBAL_HEADER;
  	}
  
- 	return SWITCH_STATUS_SUCCESS;
-@@ -639,7 +639,7 @@ GCC_DIAG_ON(deprecated-declarations)
+ 	mst->active = 1;
+@@ -660,7 +660,7 @@ GCC_DIAG_ON(deprecated-declarations)
  	mst->frame->format         = AV_SAMPLE_FMT_S16;
  	mst->frame->channel_layout = c->channel_layout;
  
@@ -86,4 +70,5 @@ index b9f6f99ef5..f5329c9106 100644
  		mst->frame->nb_samples = (mst->frame->sample_rate / 50) * c->channels;
  	} else {
 -- 
-2.18.0
+2.19.0
+
diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index 24c86e6295..dab2fb237b 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,9 +1,9 @@
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.8.1.tar.xz.md5
-md5 71b5df2c2fb369f6a7172b2cd9c9e594 freeswitch-1.8.1.tar.xz
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.8.1.tar.xz.sha1
-sha1 26ffa89faa8c83e2c6da6eda1f31fa7f9304346c freeswitch-1.8.1.tar.xz
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.8.1.tar.xz.sha256
-sha256 f606de858e2df09a752f890e8f0fc41dae8dd888e3fe952e17a90e9ff9ed270e freeswitch-1.8.1.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.8.2.tar.xz.md5
+md5 61de81cd70afb056dde7b1dcb91ad967 freeswitch-1.8.2.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.8.2.tar.xz.sha1
+sha1 f2c077db40b05c5fdf66cbe77bd879f41132f79a freeswitch-1.8.2.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.8.2.tar.xz.sha256
+sha256 ebcf3db970ea9bb534c0983a1c9eef88395deb6e0902d8d6407bf217b2f27b9a freeswitch-1.8.2.tar.xz
 # Locally computed
 sha256 10299420c1e8602c0daf5a59d022621cd72a9148d1f0f33501edb3db3445c7fe  COPYING
 sha256 e8e26b16da14aa3e6ed5c22c705fdc1f45d6225fca461ea9f7314bcdfdc414c4  libs/apr/LICENSE
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 2657a39040..577d6c9450 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.8.1
+FREESWITCH_VERSION = 1.8.2
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
 FREESWITCH_SITE = http://files.freeswitch.org/freeswitch-releases
 # External modules need headers/libs from staging
-- 
2.19.0
