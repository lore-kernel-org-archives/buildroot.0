From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 27 Jan 2019 17:04:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/freeswitch: bump version to 1.8.5
Message-ID: <20190127160456.22335-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch 0002, not needed anymore after upstream commit
https://freeswitch.org/stash/projects/FS/repos/freeswitch/commits/13f6890f411598bd2c567762d457d1a8163a7a8a

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0002-mod_av-unbreak-with-ffmpeg-4.0.patch | 74 -------------------
 package/freeswitch/freeswitch.hash            | 12 +--
 package/freeswitch/freeswitch.mk              |  2 +-
 3 files changed, 7 insertions(+), 81 deletions(-)
 delete mode 100644 package/freeswitch/0002-mod_av-unbreak-with-ffmpeg-4.0.patch

diff --git a/package/freeswitch/0002-mod_av-unbreak-with-ffmpeg-4.0.patch b/package/freeswitch/0002-mod_av-unbreak-with-ffmpeg-4.0.patch
deleted file mode 100644
index a4693971c1..0000000000
--- a/package/freeswitch/0002-mod_av-unbreak-with-ffmpeg-4.0.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 72f2f7047ad35b37002d6210458667a89c301cfe Mon Sep 17 00:00:00 2001
-From: jbeich <jbeich@FreeBSD.org>
-Date: Thu, 16 Aug 2018 22:14:20 +0200
-Subject: [PATCH] mod_av: unbreak with ffmpeg 4.0
-
-avformat.c:471:14: error: use of undeclared identifier 'CODEC_FLAG_LOOP_FILTER'
-                        c->flags|=CODEC_FLAG_LOOP_FILTER;   // flags=+loop
-                                  ^
-avformat.c:477:47: error: use of undeclared identifier 'ME_HEX'
-                        av_opt_set_int(c->priv_data, "motion_est", ME_HEX, 0);
-                                                                   ^
-avformat.c:553:15: error: use of undeclared identifier 'CODEC_FLAG_GLOBAL_HEADER'
-                c->flags |= CODEC_FLAG_GLOBAL_HEADER;
-                            ^
-avformat.c:638:31: error: use of undeclared identifier 'CODEC_CAP_VARIABLE_FRAME_SIZE'
-        if (c->codec->capabilities & CODEC_CAP_VARIABLE_FRAME_SIZE) {
-                                     ^
-
-PR:		227726
-Reported by:	antoine (via exp-run)
-
-Downloaded from
-https://github.com/freebsd/freebsd-ports/commit/da104360ea7d7861aa9fe6dc04b776a1eaf794ec
-
-Original file
-https://svnweb.freebsd.org/ports/head/net/freeswitch/files/patch-ffmpeg4?view=markup
-
-[Bernd: Rebased for freeswitch 1.8.2]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/mod/applications/mod_av/avformat.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/mod/applications/mod_av/avformat.c b/src/mod/applications/mod_av/avformat.c
-index 84900b601c..2f5c0e8d20 100644
---- a/src/mod/applications/mod_av/avformat.c
-+++ b/src/mod/applications/mod_av/avformat.c
-@@ -479,13 +479,13 @@ GCC_DIAG_ON(deprecated-declarations)
- 			c->ticks_per_frame = 2;
- 
- 
--			c->flags|=CODEC_FLAG_LOOP_FILTER;   // flags=+loop
-+			c->flags|=AV_CODEC_FLAG_LOOP_FILTER;   // flags=+loop
- 			c->me_cmp|= 1;  // cmp=+chroma, where CHROMA = 1
- 			c->me_range = 16;   // me_range=16
- 			c->max_b_frames = 3;    // bf=3
- 
- 			av_opt_set_int(c->priv_data, "b_strategy", 1, 0);
--			av_opt_set_int(c->priv_data, "motion_est", ME_HEX, 0);
-+			av_opt_set(c->priv_data, "motion_est", "hex", 0);
- 			av_opt_set_int(c->priv_data, "coder", 1, 0);
- 
- 			switch (mm->vprofile) {
-@@ -568,7 +568,7 @@ GCC_DIAG_ON(deprecated-declarations)
- 
- 	/* Some formats want stream headers to be separate. */
- 	if (fc->oformat->flags & AVFMT_GLOBALHEADER) {
--		c->flags |= CODEC_FLAG_GLOBAL_HEADER;
-+		c->flags |= AV_CODEC_FLAG_GLOBAL_HEADER;
- 	}
- 
- 	mst->active = 1;
-@@ -660,7 +660,7 @@ GCC_DIAG_ON(deprecated-declarations)
- 	mst->frame->format         = AV_SAMPLE_FMT_S16;
- 	mst->frame->channel_layout = c->channel_layout;
- 
--	if (c->codec->capabilities & CODEC_CAP_VARIABLE_FRAME_SIZE) {
-+	if (c->codec->capabilities & AV_CODEC_CAP_VARIABLE_FRAME_SIZE) {
- 		//mst->frame->nb_samples = 10000;
- 		mst->frame->nb_samples = (mst->frame->sample_rate / 50) * c->channels;
- 	} else {
--- 
-2.19.0
-
diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index dab2fb237b..6f90c21564 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,9 +1,9 @@
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.8.2.tar.xz.md5
-md5 61de81cd70afb056dde7b1dcb91ad967 freeswitch-1.8.2.tar.xz
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.8.2.tar.xz.sha1
-sha1 f2c077db40b05c5fdf66cbe77bd879f41132f79a freeswitch-1.8.2.tar.xz
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.8.2.tar.xz.sha256
-sha256 ebcf3db970ea9bb534c0983a1c9eef88395deb6e0902d8d6407bf217b2f27b9a freeswitch-1.8.2.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.8.5.tar.xz.md5
+md5 e3d750ed0bbf13ce6fe228af9af07bcd freeswitch-1.8.5.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.8.5.tar.xz.sha1
+sha1 e9f95b42ed9dd41437a65bddbb5c1f647436e426 freeswitch-1.8.5.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.8.5.tar.xz.sha256
+sha256 503a551be5d6df06162ea9d98a952b6fb524852ce2352fe3ca3a36a76995b046 freeswitch-1.8.5.tar.xz
 # Locally computed
 sha256 10299420c1e8602c0daf5a59d022621cd72a9148d1f0f33501edb3db3445c7fe  COPYING
 sha256 e8e26b16da14aa3e6ed5c22c705fdc1f45d6225fca461ea9f7314bcdfdc414c4  libs/apr/LICENSE
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 577d6c9450..0b7544d097 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.8.2
+FREESWITCH_VERSION = 1.8.5
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
 FREESWITCH_SITE = http://files.freeswitch.org/freeswitch-releases
 # External modules need headers/libs from staging
-- 
2.20.1
