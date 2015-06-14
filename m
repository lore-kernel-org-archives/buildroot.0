From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jun 2015 19:11:11 +0200
Subject: [Buildroot] [PATCH 1/2] package/ffmpeg: Fix x86 compilation with
	gcc5
Message-ID: <1434301872-30351-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In file included from libavcodec/cabac_functions.h:46:0,
                 from libavcodec/h264_cabac.c:37:
libavcodec/h264_cabac.c: In function 'ff_h264_decode_mb_cabac':
libavcodec/x86/cabac.h:192:5: error: 'asm' operand has impossible constraints
     __asm__ volatile(

To reproduce the bug use this defconfig:

BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_BINUTILS_VERSION_2_25=y
BR2_GCC_VERSION_5_1_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_FFMPEG=y
BR2_PACKAGE_FFMPEG_GPL=y
BR2_PACKAGE_FFMPEG_FFMPEG=y
BR2_PACKAGE_FFMPEG_POSTPROC=y
BR2_PACKAGE_FFMPEG_SWSCALE=y
BR2_PACKAGE_FFMPEG_ENCODERS="all"
BR2_PACKAGE_FFMPEG_DECODERS="all"
BR2_PACKAGE_FFMPEG_MUXERS="all"
BR2_PACKAGE_FFMPEG_DEMUXERS="all"
BR2_PACKAGE_FFMPEG_PARSERS="all"
BR2_PACKAGE_FFMPEG_BSFS="all"
BR2_PACKAGE_FFMPEG_PROTOCOLS="all"
BR2_PACKAGE_FFMPEG_FILTERS="all"
BR2_PACKAGE_FFMPEG_INDEVS=y
BR2_PACKAGE_FFMPEG_OUTDEVS=y
BR2_PACKAGE_FFMPEG_EXTRACONF=""

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/ffmpeg.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 41ac616..479625c 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -261,6 +261,7 @@ ifeq ($(BR2_X86_CPU_HAS_MMX),y)
 FFMPEG_CONF_OPTS += --enable-yasm
 FFMPEG_DEPENDENCIES += host-yasm
 else
+FFMPEG_CONF_OPTS += --disable-asm
 FFMPEG_CONF_OPTS += --disable-yasm
 FFMPEG_CONF_OPTS += --disable-mmx
 endif
-- 
1.7.10.4
