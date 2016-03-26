From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 26 Mar 2016 23:21:09 +0100
Subject: [Buildroot] [PATCH 04/18] package/mediastreamer: bump version to
	2.12.1
In-Reply-To: <1459030883-15232-1-git-send-email-bernd.kuhls@t-online.de>
References: <1459030883-15232-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1459030883-15232-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The version bump is needed to provide support for ffmpeg 3.0.

Removed 0001-misc-fixes.patch which previously provided patches to
support newer ffmpeg versions. This is not needed anymore after
this upstream commit:
https://github.com/BelledonneCommunications/mediastreamer2/commit/5e653bfe4c8ea27d09c80d91794f0178a454851e

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mediastreamer/0001-misc-fixes.patch | 156 ----------------------------
 package/mediastreamer/mediastreamer.hash    |   4 +-
 package/mediastreamer/mediastreamer.mk      |   2 +-
 3 files changed, 3 insertions(+), 159 deletions(-)
 delete mode 100644 package/mediastreamer/0001-misc-fixes.patch

diff --git a/package/mediastreamer/0001-misc-fixes.patch b/package/mediastreamer/0001-misc-fixes.patch
deleted file mode 100644
index 84c9948..0000000
--- a/package/mediastreamer/0001-misc-fixes.patch
+++ /dev/null
@@ -1,156 +0,0 @@
-Fix linphone compile with newer ffmpeg versions, downloaded from
-https://github.com/dankamongmen/mediastreamer2/commit/4f438eb8e132a3119284be771e0daad143597ebd
-
-Fixes
-http://autobuild.buildroot.net/results/b72/b72b1f6287986af3d686cc3c8b9c1b3fd9419d29/
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-
-From 4f438eb8e132a3119284be771e0daad143597ebd Mon Sep 17 00:00:00 2001
-From: nick black <nick.black@sprezzatech.com>
-Date: Mon, 28 Jan 2013 23:54:17 -0500
-Subject: [PATCH] adapt to new libav API
-
----
- src/utils/ffmpeg-priv.h       | 1 +
- src/videofilters/h264dec.c    | 6 +++---
- src/videofilters/jpegwriter.c | 6 +++---
- src/videofilters/nowebcam.c   | 6 +++---
- src/videofilters/videodec.c   | 8 ++++----
- src/videofilters/videoenc.c   | 6 +++---
- 6 files changed, 17 insertions(+), 16 deletions(-)
-
-diff --git a/src/utils/ffmpeg-priv.h b/src/utils/ffmpeg-priv.h
-index 0eab098..a405c05 100644
---- a/src/utils/ffmpeg-priv.h
-+++ b/src/utils/ffmpeg-priv.h
-@@ -35,6 +35,7 @@ Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
- /* new layout */
- # include <libavcodec/avcodec.h>
- # include <libavutil/avutil.h>
-+# include <libavutil/mem.h>
- #else
- /* old layout */
- # include <ffmpeg/avcodec.h>
-diff --git a/src/videofilters/h264dec.c b/src/videofilters/h264dec.c
-index 5229b5e..7059634 100644
---- a/src/videofilters/h264dec.c
-+++ b/src/videofilters/h264dec.c
-@@ -58,10 +58,10 @@ static void dec_open(DecData *d){
- 	int error;
- 	codec=avcodec_find_decoder(CODEC_ID_H264);
- 	if (codec==NULL) ms_fatal("Could not find H264 decoder in ffmpeg.");
--	avcodec_get_context_defaults(&d->av_context);
--	error=avcodec_open(&d->av_context,codec);
-+	avcodec_get_context_defaults3(&d->av_context, codec);
-+	error=avcodec_open2(&d->av_context,codec, NULL);
- 	if (error!=0){
--		ms_fatal("avcodec_open() failed.");
-+		ms_fatal("avcodec_open2() failed.");
- 	}
- }
- 
-diff --git a/src/videofilters/jpegwriter.c b/src/videofilters/jpegwriter.c
-index cca79c5..daf3cdb 100644
---- a/src/videofilters/jpegwriter.c
-+++ b/src/videofilters/jpegwriter.c
-@@ -90,7 +90,7 @@ static void jpg_process(MSFilter *f){
- 			mblk_t *jpegm;
- 			struct SwsContext *sws_ctx;
- 			
--			AVCodecContext *avctx=avcodec_alloc_context();
-+			AVCodecContext *avctx=avcodec_alloc_context3(NULL);
- 			
- 			avctx->width=yuvbuf.w;
- 			avctx->height=yuvbuf.h;
-@@ -98,9 +98,9 @@ static void jpg_process(MSFilter *f){
- 			avctx->time_base.den =1;
- 			avctx->pix_fmt=PIX_FMT_YUVJ420P;
- 
--			error=avcodec_open(avctx,s->codec);
-+			error=avcodec_open2(avctx,s->codec,NULL);
- 			if (error!=0) {
--				ms_error("avcodec_open() failed: %i",error);
-+				ms_error("avcodec_open2() failed: %i",error);
- 				cleanup(s,NULL);
- 				av_free(avctx);
- 				return;
-diff --git a/src/videofilters/nowebcam.c b/src/videofilters/nowebcam.c
-index f1c10de..b45f89f 100644
---- a/src/videofilters/nowebcam.c
-+++ b/src/videofilters/nowebcam.c
-@@ -68,9 +68,9 @@ static mblk_t *jpeg2yuv(uint8_t *jpgbuf, int bufsize, MSVideoSize *reqsize){
- 		return NULL;
- 	}
- 
--	avcodec_get_context_defaults(&av_context);
--	if (avcodec_open(&av_context,codec)<0){
--		ms_error("jpeg2yuv: avcodec_open failed");
-+	avcodec_get_context_defaults3(&av_context,NULL);
-+	if (avcodec_open2(&av_context,codec,NULL)<0){
-+		ms_error("jpeg2yuv: avcodec_open2 failed");
- 		return NULL;
- 	}
- 	av_init_packet(&pkt);
-diff --git a/src/videofilters/videodec.c b/src/videofilters/videodec.c
-index 9807214..2f1b452 100644
---- a/src/videofilters/videodec.c
-+++ b/src/videofilters/videodec.c
-@@ -53,7 +53,7 @@ static void dec_init(MSFilter *f, enum CodecID cid){
- 	DecState *s=(DecState *)ms_new0(DecState,1);
- 	ms_ffmpeg_check_init();
- 	
--	avcodec_get_context_defaults(&s->av_context);
-+	avcodec_get_context_defaults3(&s->av_context,NULL);
- 	s->av_codec=NULL;
- 	s->codec=cid;
- 	s->input=NULL;
-@@ -135,7 +135,7 @@ static void dec_preprocess(MSFilter *f){
- 	if (s->av_context.codec==NULL){
- 		/* we must know picture size before initializing snow decoder*/
- 		if (s->codec!=CODEC_ID_SNOW){
--			error=avcodec_open(&s->av_context, s->av_codec);
-+			error=avcodec_open2(&s->av_context, s->av_codec, NULL);
- 			if (error!=0) ms_error("avcodec_open() failed: %i",error);
- 			if (s->codec==CODEC_ID_MPEG4 && s->dci_size>0){
- 				s->av_context.extradata=s->dci;
-@@ -225,8 +225,8 @@ static mblk_t * parse_snow_header(DecState *s,mblk_t *inm){
- 			int error;
- 			s->av_context.width=h>>16;
- 			s->av_context.height=h&0xffff;
--			error=avcodec_open(&s->av_context, s->av_codec);
--			if (error!=0) ms_error("avcodec_open() failed for snow: %i",error);
-+			error=avcodec_open2(&s->av_context, s->av_codec, NULL);
-+			if (error!=0) ms_error("avcodec_open2() failed for snow: %i",error);
- 			else {
- 				s->snow_initialized=TRUE;
- 				ms_message("Snow decoder initialized,size=%ix%i",
-diff --git a/src/videofilters/videoenc.c b/src/videofilters/videoenc.c
-index da35592..4101772 100644
---- a/src/videofilters/videoenc.c
-+++ b/src/videofilters/videoenc.c
-@@ -242,7 +242,7 @@ static void prepare(EncState *s){
- 	AVCodecContext *c=&s->av_context;
- 	const int max_br_vbv=128000;
- 
--	avcodec_get_context_defaults(c);
-+	avcodec_get_context_defaults3(c,NULL);
- 	if (s->codec==CODEC_ID_MJPEG)
- 	{
- 		ms_message("Codec bitrate set to %i",c->bit_rate);
-@@ -348,9 +348,9 @@ static void enc_preprocess(MSFilter *f){
- 		ms_error("could not find encoder for codec id %i",s->codec);
- 		return;
- 	}
--	error=avcodec_open(&s->av_context, s->av_codec);
-+	error=avcodec_open2(&s->av_context, s->av_codec, NULL);
- 	if (error!=0) {
--		ms_error("avcodec_open() failed: %i",error);
-+		ms_error("avcodec_open2() failed: %i",error);
- 		return;
- 	}
- 	video_starter_init(&s->starter);
--- 
-2.0.3
-
diff --git a/package/mediastreamer/mediastreamer.hash b/package/mediastreamer/mediastreamer.hash
index 44849ac..21964a8 100644
--- a/package/mediastreamer/mediastreamer.hash
+++ b/package/mediastreamer/mediastreamer.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking pgp signature
-sha256	c245b9444c2abb4c84433606e01f0b3ce29ce78de0afe1e191f4f3c62656acd5	mediastreamer-2.9.0.tar.gz
+# Locally calculated
+sha256	0dbf8d4f721a04db9ec0982e98a4e852ad2d3acbcbd25edd96a66164a980f2e7	mediastreamer-2.12.1.tar.gz
diff --git a/package/mediastreamer/mediastreamer.mk b/package/mediastreamer/mediastreamer.mk
index 81f5b50..a12bfb4 100644
--- a/package/mediastreamer/mediastreamer.mk
+++ b/package/mediastreamer/mediastreamer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEDIASTREAMER_VERSION = 2.9.0
+MEDIASTREAMER_VERSION = 2.12.1
 MEDIASTREAMER_SITE = http://download.savannah.nongnu.org/releases/linphone/mediastreamer
 MEDIASTREAMER_INSTALL_STAGING = YES
 MEDIASTREAMER_DEPENDENCIES = host-intltool host-pkgconf ortp host-gettext
-- 
2.8.0.rc3
