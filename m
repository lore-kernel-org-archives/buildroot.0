From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  2 Apr 2017 13:25:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/mplayer: disable inline asm on i386
Message-ID: <20170402112507.14419-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A similar fix was committed to ffmpeg:
https://git.buildroot.net/buildroot/commit/package/ffmpeg?id=bfb8df2ad9b164b421d25294c6882c8b61dc59a5

Special cflags, added by
https://git.buildroot.net/buildroot/commit/package/multimedia/mplayer?id=fd38100e1189d19cad87a64c52df2c773eb47e40
are no longer needed now so remove them as well.

Fixes
http://autobuild.buildroot.net/results/030/03066dd8937ef4c75d62f237fd195df92b247ee2//
and many others.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mplayer/mplayer.mk | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 6b3009abc..14ab8acee 100644
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
-- 
2.11.0
