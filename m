From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Apr 2017 15:45:20 +0200
Subject: [Buildroot] [git commit] Revert "package/ffmpeg: Fix i586
	compilation with gcc5"
Message-ID: <20170409134532.E2ECB826D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b7b989e53897009e632f3bc918e553a4b607e39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit bfb8df2ad9b164b421d25294c6882c8b61dc59a5.

With current toolchains it was not possible to trigger the bug anymore.

Tested with these settings:

BR2_i386=y
BR2_x86_i586=y
BR2_GCC_VERSION_4_8_X=y

BR2_i386=y
BR2_x86_i586=y
BR2_GCC_VERSION_5_X=y

BR2_i386=y
BR2_x86_i586=y
BR2_GCC_VERSION_6_X=y

Other x86 variants also work:

BR2_i386=y
BR2_x86_i486=y
BR2_GCC_VERSION_5_X=y

BR2_i386=y
BR2_x86_i686=y
BR2_GCC_VERSION_5_X=y

BR2_i386=y
BR2_x86_pentium_mmx=y
BR2_GCC_VERSION_5_X=y

BR2_i386=y
BR2_x86_corei7=y
BR2_GCC_VERSION_5_X=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/ffmpeg.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 348bc82..223ed84 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -364,11 +364,6 @@ ifeq ($(BR2_X86_CPU_HAS_MMX),y)
 FFMPEG_CONF_OPTS += --enable-yasm
 FFMPEG_DEPENDENCIES += host-yasm
 else
-ifeq ($(BR2_x86_i586),y)
-# Needed to work around a bug with gcc 5.x:
-# error: 'asm' operand has impossible constraints
-FFMPEG_CONF_OPTS += --disable-inline-asm
-endif
 FFMPEG_CONF_OPTS += --disable-yasm
 FFMPEG_CONF_OPTS += --disable-mmx
 endif
