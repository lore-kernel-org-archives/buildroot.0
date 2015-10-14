From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 14 Oct 2015 15:15:24 +0100
Subject: [Buildroot] [PATCH] mplayer: enable apng and tdsc only if zlib is
	available
Message-ID: <1444832124-35387-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

apng and tdsc are enabled by default, but they need zlib, otherwise the
compilation will fail with an error like this one:

libavcodec/pngdec.c:35:18: fatal error: zlib.h: No such file or
directory
 #include <zlib.h>
                  ^
compilation terminated.

So add an autodep on BR2_PACKAGE_ZLIB to enable or disable support for
apng and tdsc accordingly.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/mplayer/mplayer.mk |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index d896b35..2f58864 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -27,6 +27,19 @@ else
 MPLAYER_CONF_OPTS += --disable-big-endian
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+MPLAYER_DEPENDENCIES += zlib
+MPLAYER_CONF_OPTS += \
+	--enable-decoder=apng \
+	--enable-encoder=apng \
+	--enable-decoder=tdsc
+else
+MPLAYER_CONF_OPTS += \
+	--disable-decoder=apng \
+	--disable-encoder=apng \
+	--disable-decoder=tdsc
+endif
+
 ifeq ($(BR2_PACKAGE_SDL),y)
 MPLAYER_CONF_OPTS += \
 	--enable-sdl \
-- 
1.7.1
