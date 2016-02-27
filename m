From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 Feb 2016 00:00:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: Fix i486 compilation with
	gcc5
Message-ID: <1456614055-10889-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes

In file included from libpostproc/postprocess.c:539:0:
libpostproc/postprocess_template.c: In function 'postProcess_MMX':
libpostproc/postprocess_template.c:3184:5: error: 'asm' operand has impossible constraints
     __asm__ volatile(
     ^
libpostproc/postprocess_template.c:3101:5: error: 'asm' operand has impossible constraints
     __asm__ volatile(
     ^
using this defconfig:

BR2_x86_i486=y
BR2_PACKAGE_FFMPEG=y
BR2_PACKAGE_FFMPEG_GPL=y
BR2_PACKAGE_FFMPEG_POSTPROC=y

This is a follow-up patch for
https://git.busybox.net/buildroot/commit/?id=bfb8df2ad9b164b421d25294c6882c8b61dc59a5

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/ffmpeg.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index ddfac20..183d003 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -352,7 +352,7 @@ ifeq ($(BR2_X86_CPU_HAS_MMX),y)
 FFMPEG_CONF_OPTS += --enable-yasm
 FFMPEG_DEPENDENCIES += host-yasm
 else
-ifeq ($(BR2_x86_i586),y)
+ifeq ($(BR2_x86_i486)$(BR2_x86_i586),y)
 # Needed to work around a bug with gcc 5.x:
 # error: 'asm' operand has impossible constraints
 FFMPEG_CONF_OPTS += --disable-inline-asm
-- 
2.7.0
