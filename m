From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Apr 2017 15:45:27 +0200
Subject: [Buildroot] [git commit] package/mplayer: disable inline asm on i386
Message-ID: <20170409134532.F069B80155@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c4261c11848f9856d6a4ce8d887e602d4dabe533
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A similar fix was committed to ffmpeg in the past:
https://git.buildroot.net/buildroot/commit/package/ffmpeg?id=bfb8df2ad9b164b421d25294c6882c8b61dc59a5
which will be reverted with another patch.

Mplayer contains ffmpeg 3.0, with current ffmpeg 3.2.4 the bug is gone,
the difference between both revisions is too big in order to find a
real fix for the problem.

Special cflags, added by
https://git.buildroot.net/buildroot/commit/package/multimedia/mplayer?id=fd38100e1189d19cad87a64c52df2c773eb47e40
are no longer needed now so remove them as well.

Testing these defconfigs did not produce compile errors with current
ffmpeg but with mplayer:

BR2_i386=y
BR2_x86_i586=y
BR2_GCC_VERSION_4_8_X=y

BR2_i386=y
BR2_x86_i586=y
BR2_GCC_VERSION_5_X=y

BR2_i386=y
BR2_x86_i586=y
BR2_GCC_VERSION_6_X=y

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

Fixes
http://autobuild.buildroot.net/results/030/03066dd8937ef4c75d62f237fd195df92b247ee2//
and many others.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mplayer/mplayer.mk | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 6b3009a..14ab8ac 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -285,10 +285,13 @@ MPLAYER_CFLAGS += -mfpu=neon
 endif
 endif
 
+define MPLAYER_DISABLE_INLINE_ASM
+	$(SED) 's,#define HAVE_INLINE_ASM 1,#define HAVE_INLINE_ASM 0,g' \
+		$(@D)/config.h
+endef
+
 ifeq ($(BR2_i386),y)
-# inline asm breaks with "can't find a register in class 'GENERAL_REGS'"
-# inless we free up ebp
-MPLAYER_CFLAGS += -fomit-frame-pointer
+MPLAYER_POST_CONFIGURE_HOOKS += MPLAYER_DISABLE_INLINE_ASM
 endif
 
 ifeq ($(BR2_X86_CPU_HAS_MMX),y)
