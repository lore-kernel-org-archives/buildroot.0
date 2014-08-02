From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  3 Aug 2014 00:11:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: Bump to version 2.3.1
Message-ID: <1407017477-8540-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- remove obsolete option --disable-vis
- add patch to fix compile error with uClibc
- add patch to fix compile error in freerdp

Compile-tested against all packages depending on ffmpeg using this defconfig:

BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_GSTREAMER=y
BR2_PACKAGE_GST_FFMPEG=y
BR2_PACKAGE_MPD=y
BR2_PACKAGE_MPD_FFMPEG=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_FREERDP=y
BR2_PACKAGE_OPENCV=y
BR2_PACKAGE_OPENCV_WITH_FFMPEG=y
BR2_PACKAGE_MEDIASTREAMER=y
BR2_PACKAGE_MINIDLNA=y

VLC also compiled when the build of vlc-static is disabled in Makefiles,
otherwise this known error occurs:
http://autobuild.buildroot.net/results/022/022252176c051ff3365b2cb820f32aafc802803a/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/ffmpeg-0001-fminf.patch    |   47 +++++++++++++++++
 package/ffmpeg/ffmpeg.mk                  |    3 +-
 package/freerdp/freerdp-0001-ffmpeg.patch |   78 +++++++++++++++++++++++++++++
 3 files changed, 126 insertions(+), 2 deletions(-)
 create mode 100644 package/ffmpeg/ffmpeg-0001-fminf.patch
 create mode 100644 package/freerdp/freerdp-0001-ffmpeg.patch

diff --git a/package/ffmpeg/ffmpeg-0001-fminf.patch b/package/ffmpeg/ffmpeg-0001-fminf.patch
new file mode 100644
index 0000000..1e08517
--- /dev/null
+++ b/package/ffmpeg/ffmpeg-0001-fminf.patch
@@ -0,0 +1,47 @@
+Fix build error
+
+CC      libavdevice/alldevices.o
+In file included from ./libavutil/internal.h:167:0,
+                 from ./libavutil/common.h:415,
+                 from ./libavutil/avutil.h:289,
+                 from ./libavutil/log.h:25,
+                 from libavdevice/avdevice.h:46,
+                 from libavdevice/alldevices.c:22:
+./libavutil/libm.h:87:40: error: static declaration of 'fminf' follows non-static declaration
+ static av_always_inline av_const float fminf(float x, float y)
+                                        ^
+make: *** [libavdevice/alldevices.o] Error 1
+
+using buildroot-compiled uClibc toolchain, used defconfig:
+
+BR2_x86_64=y
+BR2_x86_corei7=y
+BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
+BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
+BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+
+diff -uNr ffmpeg-d028c907004e8a3c0f5161ce595331e4cc57c86c.org/libavutil/libm.h ffmpeg-d028c907004e8a3c0f5161ce595331e4cc57c86c/libavutil/libm.h
+--- ffmpeg-d028c907004e8a3c0f5161ce595331e4cc57c86c.org/libavutil/libm.h	2014-07-16 20:37:20.000000000 +0200
++++ ffmpeg-d028c907004e8a3c0f5161ce595331e4cc57c86c/libavutil/libm.h	2014-07-17 22:58:01.781316442 +0200
+@@ -82,16 +82,6 @@
+ #define exp2f(x) ((float)exp2(x))
+ #endif /* HAVE_EXP2F */
+ 
+-#if !HAVE_FMINF
+-#undef fminf
+-static av_always_inline av_const float fminf(float x, float y)
+-{
+-    //Note, the NaN special case is needed for C spec compliance, it should be
+-    //optimized away if the users compiler is configured to assume no NaN
+-    return x > y ? y : (x == x ? x : y);
+-}
+-#endif
+-
+ #if !HAVE_ISINF
+ static av_always_inline av_const int isinf(float x)
+ {
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 2b73fbc..5c269ac 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 1.2.7
+FFMPEG_VERSION = 2.3.1
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.bz2
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
@@ -65,7 +65,6 @@ FFMPEG_CONF_OPT = \
 	--disable-libtheora \
 	--disable-libvo-aacenc \
 	--disable-libvo-amrwbenc \
-	--disable-vis \
 	--disable-sram \
 	--disable-symver \
 	--disable-doc
diff --git a/package/freerdp/freerdp-0001-ffmpeg.patch b/package/freerdp/freerdp-0001-ffmpeg.patch
new file mode 100644
index 0000000..4f9820a
--- /dev/null
+++ b/package/freerdp/freerdp-0001-ffmpeg.patch
@@ -0,0 +1,78 @@
+Fix freerdp compile with newer ffmpeg versions.
+
+Downloaded from https://github.com/pld-linux/freerdp/blob/master/freerdp-ffmpeg.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- freerdp-1.0.2/channels/drdynvc/tsmf/ffmpeg/tsmf_ffmpeg.c.orig	2013-01-02 22:46:59.000000000 +0100
++++ freerdp-1.0.2/channels/drdynvc/tsmf/ffmpeg/tsmf_ffmpeg.c	2013-09-26 18:29:52.693695785 +0200
+@@ -39,7 +39,7 @@
+ 	ITSMFDecoder iface;
+ 
+ 	int media_type;
+-	enum CodecID codec_id;
++	enum AVCodecID codec_id;
+ 	AVCodecContext* codec_context;
+ 	AVCodec* codec;
+ 	AVFrame* frame;
+@@ -54,7 +54,7 @@
+ {
+ 	TSMFFFmpegDecoder* mdecoder = (TSMFFFmpegDecoder*) decoder;
+ 
+-	mdecoder->codec_context = avcodec_alloc_context();
++	mdecoder->codec_context = avcodec_alloc_context3(NULL);
+ 	if (!mdecoder->codec_context)
+ 	{
+ 		DEBUG_WARN("avcodec_alloc_context failed.");
+@@ -88,16 +88,6 @@
+ 	mdecoder->codec_context->channels = media_type->Channels;
+ 	mdecoder->codec_context->block_align = media_type->BlockAlign;
+ 
+-#ifdef AV_CPU_FLAG_SSE2
+-	mdecoder->codec_context->dsp_mask = AV_CPU_FLAG_SSE2 | AV_CPU_FLAG_MMX2;
+-#else
+-#if LIBAVCODEC_VERSION_MAJOR < 53
+-	mdecoder->codec_context->dsp_mask = FF_MM_SSE2 | FF_MM_MMXEXT;
+-#else
+-	mdecoder->codec_context->dsp_mask = FF_MM_SSE2 | FF_MM_MMX2;
+-#endif
+-#endif
+-
+ 	return true;
+ }
+ 
+@@ -174,7 +164,7 @@
+ {
+ 	TSMFFFmpegDecoder* mdecoder = (TSMFFFmpegDecoder*) decoder;
+ 
+-	if (avcodec_open(mdecoder->codec_context, mdecoder->codec) < 0)
++	if (avcodec_open2(mdecoder->codec_context, mdecoder->codec, NULL) < 0)
+ 	{
+ 		DEBUG_WARN("avcodec_open failed.");
+ 		return false;
+@@ -337,7 +327,7 @@
+ #endif
+ 
+ 	if (mdecoder->decoded_size_max == 0)
+-		mdecoder->decoded_size_max = AVCODEC_MAX_AUDIO_FRAME_SIZE + 16;
++		mdecoder->decoded_size_max = 192000 /* AVCODEC_MAX_AUDIO_FRAME_SIZE */ + 16;
+ 	mdecoder->decoded_data = xzalloc(mdecoder->decoded_size_max);
+ 	/* align the memory for SSE2 needs */
+ 	dst = (uint8*) (((uintptr_t)mdecoder->decoded_data + 15) & ~ 0x0F);
+@@ -348,7 +338,7 @@
+ 	while (src_size > 0)
+ 	{
+ 		/* Ensure enough space for decoding */
+-		if (mdecoder->decoded_size_max - mdecoder->decoded_size < AVCODEC_MAX_AUDIO_FRAME_SIZE)
++		if (mdecoder->decoded_size_max - mdecoder->decoded_size < 192000 /* AVCODEC_MAX_AUDIO_FRAME_SIZE */)
+ 		{
+ 			mdecoder->decoded_size_max = mdecoder->decoded_size_max * 2 + 16;
+ 			mdecoder->decoded_data = xrealloc(mdecoder->decoded_data, mdecoder->decoded_size_max);
+@@ -499,7 +489,6 @@
+ 
+ 	if (!initialized)
+ 	{
+-		avcodec_init();
+ 		avcodec_register_all();
+ 		initialized = true;
+ 	}
-- 
1.7.10.4
