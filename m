From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 13 May 2017 17:09:17 +0200
Subject: [Buildroot] [PATCH 2/3] package/mplayer: disable inline sse2 on i386
In-Reply-To: <20170513150918.25427-1-bernd.kuhls@t-online.de>
References: <20170513150918.25427-1-bernd.kuhls@t-online.de>
Message-ID: <20170513150918.25427-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes subsequent sse2-related build error

libavcodec/x86/cavsdsp.c: In function 'ff_cavsdsp_init_x86':
libavcodec/x86/cavsdsp.c:589:45: error: 'put_cavs_qpel16_mc00_sse2' undeclared (first use in this function)
libavcodec/x86/cavsdsp.c:589:45: note: each undeclared identifier is reported only once for each function it appears in
libavcodec/x86/cavsdsp.c:590:45: error: 'avg_cavs_qpel16_mc00_sse2' undeclared (first use in this function)
common.mak:60: recipe for target 'libavcodec/x86/cavsdsp.o' failed

after disabling inline sse by the previous patch.

Found while fixing autobuilder
http://autobuild.buildroot.net/results/9f5/9f5a497c6242860fb67a5aa2996c3509f49a4564/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mplayer/mplayer.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 0d3ba0b81..59e37d828 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -296,6 +296,10 @@ define MPLAYER_DISABLE_INLINE_ASM
 		$(@D)/config.h
 	$(SED) 's,#define HAVE_SSE_EXTERNAL 1,#define HAVE_SSE_EXTERNAL 0,g' \
 		$(@D)/config.h
+	$(SED) 's,#define HAVE_SSE2_INLINE 1,#define HAVE_SSE2_INLINE 0,g' \
+		$(@D)/config.h
+	$(SED) 's,#define HAVE_SSE2_EXTERNAL 1,#define HAVE_SSE2_EXTERNAL 0,g' \
+		$(@D)/config.h
 endef
 
 ifeq ($(BR2_i386),y)
-- 
2.11.0
