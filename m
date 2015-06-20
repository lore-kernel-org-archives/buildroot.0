From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Jun 2015 21:44:55 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/ffmpeg: Fix i586 compilation
	with gcc5
Message-ID: <1434829495-16711-1-git-send-email-bernd.kuhls@t-online.de>
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

BR2_GCC_VERSION_5_1_X=y
BR2_PACKAGE_FFMPEG=y
BR2_PACKAGE_FFMPEG_GPL=y
BR2_PACKAGE_FFMPEG_NONFREE=y
BR2_PACKAGE_FFMPEG_FFPLAY=y
BR2_PACKAGE_FFMPEG_FFSERVER=y
BR2_PACKAGE_FFMPEG_FFPROBE=y
BR2_PACKAGE_FFMPEG_AVRESAMPLE=y
BR2_PACKAGE_FFMPEG_POSTPROC=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: bug only occurs with a i586 target cpu

 package/ffmpeg/ffmpeg.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 787dbb1..83c3cfb 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -261,6 +261,9 @@ ifeq ($(BR2_X86_CPU_HAS_MMX),y)
 FFMPEG_CONF_OPTS += --enable-yasm
 FFMPEG_DEPENDENCIES += host-yasm
 else
+ifeq ($(BR2_x86_i586),y)
+FFMPEG_CONF_OPTS += --disable-inline-asm
+endif
 FFMPEG_CONF_OPTS += --disable-yasm
 FFMPEG_CONF_OPTS += --disable-mmx
 endif
-- 
1.7.10.4
