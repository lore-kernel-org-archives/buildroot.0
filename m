From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 Nov 2011 23:42:23 +0100
Subject: [Buildroot] [git commit] mplayer: Enable live and tv options
Message-ID: <20111109224312.7583C8F44E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=88b5a31f31c12abb0ed15290efc1d09e3ac84fc2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

1.Enable TV interface.
2.Enable LIVE555 Streaming Media if live555 is available.

[Peter: cleanup CFLAGS/LDFLAGS handling]
Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/mplayer/mplayer.mk |   20 ++++++++++++++++----
 1 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/package/multimedia/mplayer/mplayer.mk b/package/multimedia/mplayer/mplayer.mk
index 4c03440..776cc68 100644
--- a/package/multimedia/mplayer/mplayer.mk
+++ b/package/multimedia/mplayer/mplayer.mk
@@ -8,6 +8,9 @@ MPLAYER_VERSION = 32726
 # MPLAYER_SITE = http://www.mplayerhq.hu/MPlayer/releases
 MPLAYER_SITE = svn://svn.mplayerhq.hu/mplayer/trunk
 
+MPLAYER_CFLAGS = $(TARGET_CFLAGS)
+MPLAYER_LDFLAGS = $(TARGET_LDFLAGS)
+
 # mplayer needs pcm+mixer support, but configure fails to check for it
 ifeq ($(BR2_PACKAGE_ALSA_LIB)$(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_PCM),yyy)
 MPLAYER_DEPENDENCIES += alsa-lib
@@ -75,6 +78,17 @@ else
 MPLAYER_CONF_OPTS += --disable-mad
 endif
 
+ifeq ($(BR2_PACKAGE_LIVE555),y)
+MPLAYER_DEPENDENCIES += live555
+MPLAYER_CONF_OPTS += --enable-live
+MPLAYER_LIVE555 = liveMedia groupsock UsageEnvironment BasicUsageEnvironment
+MPLAYER_CFLAGS += \
+	$(addprefix -I$(STAGING_DIR)/usr/include/live/,$(MPLAYER_LIVE555))
+MPLAYER_LDFLAGS += $(addprefix -l,$(MPLAYER_LIVE555)) -lstdc++
+else
+MPLAYER_CONF_OPTS += --disable-live
+endif
+
 MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBTHEORA),libtheora)
 MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBPNG),libpng)
 MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_JPEG),jpeg)
@@ -106,15 +120,13 @@ define MPLAYER_CONFIGURE_CMDS
 		--cc="$(TARGET_CC)" \
 		--as="$(TARGET_AS)" \
 		--charset=UTF-8 \
-		--extra-cflags="$(TARGET_CFLAGS)" \
-		--extra-ldflags="$(TARGET_LDFLAGS)" \
+		--extra-cflags="$(MPLAYER_CFLAGS)" \
+		--extra-ldflags="$(MPLAYER_LDFLAGS)" \
 		--enable-mad \
 		--enable-fbdev \
 		$(MPLAYER_CONF_OPTS) \
 		--enable-cross-compile \
 		--disable-ivtv \
-		--disable-tv \
-		--disable-live \
 		--enable-dynamic-plugins \
 	)
 endef
