From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 15 Oct 2015 20:33:32 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/rtmpdump: Fix librtmp.pc
	defaulting to OpenSSL
Message-ID: <1444934013-500-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

rtmpdump has an optional dependency to OpenSSL or GnuTLS.
The 'Requires: ' section of librtmp.pc defaults to "libssl,libcrypto"
even when no crypto lib is available because the 'CRYPTO=' override in
rtmpdump.mk does not force librtmp/Makefile, line 35, to not include
these libraries. This breaks ffmpeg configure.

The bug occured using this defconfig

BR2_PACKAGE_FFMPEG=y
BR2_PACKAGE_FFMPEG_GPL=y
BR2_PACKAGE_FFMPEG_NONFREE=y
BR2_PACKAGE_FFMPEG_FFPLAY=y
BR2_PACKAGE_FFMPEG_FFSERVER=y
BR2_PACKAGE_FFMPEG_FFPROBE=y
BR2_PACKAGE_FFMPEG_AVRESAMPLE=y
BR2_PACKAGE_FFMPEG_POSTPROC=y
BR2_PACKAGE_RTMPDUMP=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: Removed "Fixes" section because this patch addresses another bug.

 package/rtmpdump/rtmpdump.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/rtmpdump/rtmpdump.mk b/package/rtmpdump/rtmpdump.mk
index 613f1cd..5709cdb 100644
--- a/package/rtmpdump/rtmpdump.mk
+++ b/package/rtmpdump/rtmpdump.mk
@@ -25,6 +25,10 @@ RTMPDUMP_CRYPTO = OPENSSL
 else
 # no crypto
 RTMPDUMP_CRYPTO =
+define RTMPDUMP_FIX_MAKEFILE
+	$(SED) "s/CRYPTO=.*//g" $(@D)/librtmp/Makefile
+endef
+RTMPDUMP_POST_PATCH_HOOKS += RTMPDUMP_FIX_MAKEFILE
 endif
 
 RTMPDUMP_CFLAGS = $(TARGET_CFLAGS)
-- 
2.6.1
