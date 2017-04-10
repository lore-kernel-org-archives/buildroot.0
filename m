From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 10 Apr 2017 22:41:22 +0200
Subject: [Buildroot] [PATCH 5/5] package/mplayer: disable external mmx
In-Reply-To: <20170410204122.13382-1-bernd.kuhls@t-online.de>
References: <20170410204122.13382-1-bernd.kuhls@t-online.de>
Message-ID: <20170410204122.13382-5-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes a follow-up error with this defconfig
http://autobuild.buildroot.net/results/642/6422adeef19ec547c7bc3f8ad3b0d51702015240/
which occurs after disabling inline mmx with the previous patch:

This is the error message:

fmpeg/libavcodec/libavcodec.a(apedec.o): In function `ape_decode_frame':
apedec.c:(.text+0x1df5): undefined reference to `avpriv_emms_yasm'
ffmpeg/libavcodec/libavcodec.a(asvdec.o): In function `decode_frame':
asvdec.c:(.text+0x77c): undefined reference to `avpriv_emms_yasm'
ffmpeg/libavcodec/libavcodec.a(bink.o): In function `decode_frame':
bink.c:(.text+0x2809): undefined reference to `avpriv_emms_yasm'
ffmpeg/libavcodec/libavcodec.a(dvdec.o): In function `dvvideo_decode_frame':
dvdec.c:(.text+0x575): undefined reference to `avpriv_emms_yasm'
ffmpeg/libavcodec/libavcodec.a(ffv1dec.o): In function `decode_slice':
ffv1dec.c:(.text+0x3110): undefined reference to `avpriv_emms_yasm'
ffmpeg/libavcodec/libavcodec.a(h264.o):h264.c:(.text+0xea8): more undefined references to `avpriv_emms_yasm' follow

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mplayer/mplayer.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 166394cac..88f2fb4ef 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -290,6 +290,8 @@ define MPLAYER_DISABLE_INLINE_ASM
 		$(@D)/config.h
 	$(SED) 's,#define HAVE_MMX_INLINE 1,#define HAVE_MMX_INLINE 0,g' \
 		$(@D)/config.h
+	$(SED) 's,#define HAVE_MMX_EXTERNAL 1,#define HAVE_MMX_EXTERNAL 0,g' \
+		$(@D)/config.h
 endef
 
 ifeq ($(BR2_i386),y)
-- 
2.11.0
