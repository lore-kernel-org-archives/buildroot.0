From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 13 May 2017 17:09:18 +0200
Subject: [Buildroot] [PATCH 3/3] package/mplayer: disable inline mmxext on
	i386
In-Reply-To: <20170513150918.25427-1-bernd.kuhls@t-online.de>
References: <20170513150918.25427-1-bernd.kuhls@t-online.de>
Message-ID: <20170513150918.25427-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes subsequent mmxext-related build error

libavcodec/x86/fdct.c: In function 'ff_fdct_mmxext':
libavcodec/x86/fdct.c:567:27: error: 'tab_frw_01234567' undeclared (first use in this function)
libavcodec/x86/fdct.c:567:27: note: each undeclared identifier is reported only once for each function it appears in
common.mak:60: recipe for target 'libavcodec/x86/fdct.o' failed

after disabling inline sse & sse2 by the previous patches.

Finally fixes
http://autobuild.buildroot.net/results/9f5/9f5a497c6242860fb67a5aa2996c3509f49a4564/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mplayer/mplayer.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 59e37d828..73cfdde23 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -292,6 +292,10 @@ define MPLAYER_DISABLE_INLINE_ASM
 		$(@D)/config.h
 	$(SED) 's,#define HAVE_MMX_EXTERNAL 1,#define HAVE_MMX_EXTERNAL 0,g' \
 		$(@D)/config.h
+	$(SED) 's,#define HAVE_MMXEXT_INLINE 1,#define HAVE_MMXEXT_INLINE 0,g' \
+		$(@D)/config.h
+	$(SED) 's,#define HAVE_MMXEXT_EXTERNAL 1,#define HAVE_MMXEXT_EXTERNAL 0,g' \
+		$(@D)/config.h
 	$(SED) 's,#define HAVE_SSE_INLINE 1,#define HAVE_SSE_INLINE 0,g' \
 		$(@D)/config.h
 	$(SED) 's,#define HAVE_SSE_EXTERNAL 1,#define HAVE_SSE_EXTERNAL 0,g' \
-- 
2.11.0
