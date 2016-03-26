From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 26 Mar 2016 23:21:12 +0100
Subject: [Buildroot] [PATCH 07/18] package/squeezelite: fix compilation with
	ffmpeg >= 2.9
In-Reply-To: <1459030883-15232-1-git-send-email-bernd.kuhls@t-online.de>
References: <1459030883-15232-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1459030883-15232-7-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/squeezelite/0003-ffmpeg_2_9.patch | 57 +++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 package/squeezelite/0003-ffmpeg_2_9.patch

diff --git a/package/squeezelite/0003-ffmpeg_2_9.patch b/package/squeezelite/0003-ffmpeg_2_9.patch
new file mode 100644
index 0000000..f69b829
--- /dev/null
+++ b/package/squeezelite/0003-ffmpeg_2_9.patch
@@ -0,0 +1,57 @@
+Fix compilation with ffmpeg >= 2.9
+
+Downloaded from Debian:
+https://sources.debian.net/src/squeezelite/1.8-3/debian/patches/ffmpeg_2.9.patch/
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+
+Description: Replace deprecated FFmpeg API
+Author: Andreas Cadhalpun <Andreas.Cadhalpun@googlemail.com>
+Last-Update: <2015-11-02>
+
+--- squeezelite-1.8.orig/ffmpeg.c
++++ squeezelite-1.8/ffmpeg.c
+@@ -52,8 +52,8 @@ struct ff_s {
+ 	unsigned (* avcodec_version)(void);
+ 	AVCodec * (* avcodec_find_decoder)(int);
+ 	int attribute_align_arg (* avcodec_open2)(AVCodecContext *, const AVCodec *, AVDictionary **);
+-	AVFrame * (* avcodec_alloc_frame)(void);
+-	void (* avcodec_free_frame)(AVFrame **);
++	AVFrame * (* av_frame_alloc)(void);
++	void (* av_frame_free)(AVFrame **);
+ 	int attribute_align_arg (* avcodec_decode_audio4)(AVCodecContext *, AVFrame *, int *, const AVPacket *);
+ 	// ffmpeg symbols to be dynamically loaded from libavformat
+ 	unsigned (* avformat_version)(void);
+@@ -324,7 +324,7 @@ static decode_state ff_decode(void) {
+ 
+ 		AVCODEC(ff, open2, ff->codecC, codec, NULL);
+ 
+-		ff->frame = AVCODEC(ff, alloc_frame);
++		ff->frame = AV(ff, frame_alloc);
+ 
+ 		ff->avpkt = AV(ff, malloc, sizeof(AVPacket));
+ 		if (ff->avpkt == NULL) {
+@@ -520,9 +520,9 @@ static void _free_ff_data(void) {
+ 	if (ff->frame) {
+ 		// ffmpeg version dependant free function
+ #if !LINKALL
+-		ff->avcodec_free_frame ? AVCODEC(ff, free_frame, &ff->frame) : AV(ff, freep, &ff->frame);
++		ff->av_frame_free ? AV(ff, frame_free, &ff->frame) : AV(ff, freep, &ff->frame);
+ #elif LIBAVCODEC_VERSION_INT >= AV_VERSION_INT(54,28,0)
+-		AVCODEC(ff, free_frame, &ff->frame);
++		AV(ff, frame_free, &ff->frame);
+ #else
+ 		AV(ff, freep, &ff->frame);
+ #endif
+@@ -607,8 +607,8 @@ static bool load_ff() {
+ 	ff->avcodec_version = dlsym(handle_codec, "avcodec_version");
+ 	ff->avcodec_find_decoder = dlsym(handle_codec, "avcodec_find_decoder");
+ 	ff->avcodec_open2 = dlsym(handle_codec, "avcodec_open2");
+-	ff->avcodec_alloc_frame = dlsym(handle_codec, "avcodec_alloc_frame");
+-	ff->avcodec_free_frame = dlsym(handle_codec, "avcodec_free_frame");
++	ff->av_frame_alloc = dlsym(handle_codec, "av_frame_alloc");
++	ff->av_frame_free = dlsym(handle_codec, "av_frame_free");
+ 	ff->avcodec_decode_audio4 = dlsym(handle_codec, "avcodec_decode_audio4");
+ 	ff->av_init_packet = dlsym(handle_codec, "av_init_packet");
+ 	ff->av_free_packet = dlsym(handle_codec, "av_free_packet");
-- 
2.8.0.rc3
