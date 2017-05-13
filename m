From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 13 May 2017 17:09:16 +0200
Subject: [Buildroot] [PATCH 1/3] package/mplayer: disable inline sse on i386
Message-ID: <20170513150918.25427-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes

libavcodec/x86/ac3dsp_init.c: In function 'ac3_downmix_sse':
libavcodec/x86/ac3dsp_init.c:161:9: error: can't find a register in class 'GENERAL_REGS' while reloading 'asm'
libavcodec/x86/ac3dsp_init.c:165:9: error: can't find a register in class 'GENERAL_REGS' while reloading 'asm'
libavcodec/x86/ac3dsp_init.c:161:9: error: 'asm' operand has impossible constraints
libavcodec/x86/ac3dsp_init.c:165:9: error: 'asm' operand has impossible constraints
libavcodec/x86/ac3dsp_init.c:174:9: error: 'asm' operand has impossible constraints

found by autobuilder job
http://autobuild.buildroot.net/results/9f5/9f5a497c6242860fb67a5aa2996c3509f49a4564//

Please note that this patch alone will not fix all build errors, sse2
and mmxext show similar errors and are fixed by follow-up patches.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mplayer/mplayer.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index f43ec5dc7..0d3ba0b81 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -292,6 +292,10 @@ define MPLAYER_DISABLE_INLINE_ASM
 		$(@D)/config.h
 	$(SED) 's,#define HAVE_MMX_EXTERNAL 1,#define HAVE_MMX_EXTERNAL 0,g' \
 		$(@D)/config.h
+	$(SED) 's,#define HAVE_SSE_INLINE 1,#define HAVE_SSE_INLINE 0,g' \
+		$(@D)/config.h
+	$(SED) 's,#define HAVE_SSE_EXTERNAL 1,#define HAVE_SSE_EXTERNAL 0,g' \
+		$(@D)/config.h
 endef
 
 ifeq ($(BR2_i386),y)
-- 
2.11.0
