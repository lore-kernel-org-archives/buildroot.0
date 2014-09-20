From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Sep 2014 19:09:48 +0200
Subject: [Buildroot] [PATCH 02/10] package/freerdp: bump version
In-Reply-To: <cover.1411232859.git.yann.morin.1998@free.fr>
References: <cover.1411232859.git.yann.morin.1998@free.fr>
Message-ID: <60fca17f0e0bc5bc68a6da6066f0d2040fd14fd9.1411232859.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There has been no new release recently, and the 1.0 branch is out-dated.

The 1.1 branch has not been release-tagged since the last beta tag,
but it still continues to receive bug fixes, and is relatively stable.

The next major release should be 1.2.0, but it is still in beta, looks
like it is focused on Android, and was only recently tagged.

So, we use the latest cset from the 1.1 branch until there is a new
release (either 1.2.0 or 1.1.0), at which point we can revisit which
version we'll use.

Drop our patch, since the problem has been fixed upstream (with a more
complete solution.)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/freerdp/freerdp-0001-ffmpeg.patch | 78 -------------------------------
 package/freerdp/freerdp.mk                |  3 +-
 2 files changed, 2 insertions(+), 79 deletions(-)
 delete mode 100644 package/freerdp/freerdp-0001-ffmpeg.patch

diff --git a/package/freerdp/freerdp-0001-ffmpeg.patch b/package/freerdp/freerdp-0001-ffmpeg.patch
deleted file mode 100644
index 4f9820a..0000000
--- a/package/freerdp/freerdp-0001-ffmpeg.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-Fix freerdp compile with newer ffmpeg versions.
-
-Downloaded from https://github.com/pld-linux/freerdp/blob/master/freerdp-ffmpeg.patch
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
---- freerdp-1.0.2/channels/drdynvc/tsmf/ffmpeg/tsmf_ffmpeg.c.orig	2013-01-02 22:46:59.000000000 +0100
-+++ freerdp-1.0.2/channels/drdynvc/tsmf/ffmpeg/tsmf_ffmpeg.c	2013-09-26 18:29:52.693695785 +0200
-@@ -39,7 +39,7 @@
- 	ITSMFDecoder iface;
- 
- 	int media_type;
--	enum CodecID codec_id;
-+	enum AVCodecID codec_id;
- 	AVCodecContext* codec_context;
- 	AVCodec* codec;
- 	AVFrame* frame;
-@@ -54,7 +54,7 @@
- {
- 	TSMFFFmpegDecoder* mdecoder = (TSMFFFmpegDecoder*) decoder;
- 
--	mdecoder->codec_context = avcodec_alloc_context();
-+	mdecoder->codec_context = avcodec_alloc_context3(NULL);
- 	if (!mdecoder->codec_context)
- 	{
- 		DEBUG_WARN("avcodec_alloc_context failed.");
-@@ -88,16 +88,6 @@
- 	mdecoder->codec_context->channels = media_type->Channels;
- 	mdecoder->codec_context->block_align = media_type->BlockAlign;
- 
--#ifdef AV_CPU_FLAG_SSE2
--	mdecoder->codec_context->dsp_mask = AV_CPU_FLAG_SSE2 | AV_CPU_FLAG_MMX2;
--#else
--#if LIBAVCODEC_VERSION_MAJOR < 53
--	mdecoder->codec_context->dsp_mask = FF_MM_SSE2 | FF_MM_MMXEXT;
--#else
--	mdecoder->codec_context->dsp_mask = FF_MM_SSE2 | FF_MM_MMX2;
--#endif
--#endif
--
- 	return true;
- }
- 
-@@ -174,7 +164,7 @@
- {
- 	TSMFFFmpegDecoder* mdecoder = (TSMFFFmpegDecoder*) decoder;
- 
--	if (avcodec_open(mdecoder->codec_context, mdecoder->codec) < 0)
-+	if (avcodec_open2(mdecoder->codec_context, mdecoder->codec, NULL) < 0)
- 	{
- 		DEBUG_WARN("avcodec_open failed.");
- 		return false;
-@@ -337,7 +327,7 @@
- #endif
- 
- 	if (mdecoder->decoded_size_max == 0)
--		mdecoder->decoded_size_max = AVCODEC_MAX_AUDIO_FRAME_SIZE + 16;
-+		mdecoder->decoded_size_max = 192000 /* AVCODEC_MAX_AUDIO_FRAME_SIZE */ + 16;
- 	mdecoder->decoded_data = xzalloc(mdecoder->decoded_size_max);
- 	/* align the memory for SSE2 needs */
- 	dst = (uint8*) (((uintptr_t)mdecoder->decoded_data + 15) & ~ 0x0F);
-@@ -348,7 +338,7 @@
- 	while (src_size > 0)
- 	{
- 		/* Ensure enough space for decoding */
--		if (mdecoder->decoded_size_max - mdecoder->decoded_size < AVCODEC_MAX_AUDIO_FRAME_SIZE)
-+		if (mdecoder->decoded_size_max - mdecoder->decoded_size < 192000 /* AVCODEC_MAX_AUDIO_FRAME_SIZE */)
- 		{
- 			mdecoder->decoded_size_max = mdecoder->decoded_size_max * 2 + 16;
- 			mdecoder->decoded_data = xrealloc(mdecoder->decoded_data, mdecoder->decoded_size_max);
-@@ -499,7 +489,6 @@
- 
- 	if (!initialized)
- 	{
--		avcodec_init();
- 		avcodec_register_all();
- 		initialized = true;
- 	}
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 26688aa..f1ec0c3 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-FREERDP_VERSION = 1.0.2
+# Changeset on the stable-1.1 branch
+FREERDP_VERSION = 440916eae2e07463912d5fe507677e67096eb083
 FREERDP_SITE = $(call github,FreeRDP,FreeRDP,$(FREERDP_VERSION))
 FREERDP_DEPENDENCIES = openssl zlib \
 	xlib_libX11 xlib_libXt xlib_libXext xlib_libXcursor
-- 
1.9.1
