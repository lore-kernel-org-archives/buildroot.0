From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Jul 2015 14:43:16 +0200
Subject: [Buildroot] [git commit] package/ffmpeg: Fix i586 compilation with
	gcc5
Message-ID: <20150705124338.6ADB280166@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bfb8df2ad9b164b421d25294c6882c8b61dc59a5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

[Thomas: add a comment in the code.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/ffmpeg.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 787dbb1..94aec4b 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -261,6 +261,11 @@ ifeq ($(BR2_X86_CPU_HAS_MMX),y)
 FFMPEG_CONF_OPTS += --enable-yasm
 FFMPEG_DEPENDENCIES += host-yasm
 else
+ifeq ($(BR2_x86_i586),y)
+# Needed to work around a bug with gcc 5.x:
+# error: 'asm' operand has impossible constraints
+FFMPEG_CONF_OPTS += --disable-inline-asm
+endif
 FFMPEG_CONF_OPTS += --disable-yasm
 FFMPEG_CONF_OPTS += --disable-mmx
 endif
