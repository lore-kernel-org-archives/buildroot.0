From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  8 Nov 2015 17:22:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/mplayer: needs host-yasm for mmx
	support
Message-ID: <1446999752-11055-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/6a8/6a8c3a70e33cb5b3fc40d036fb0716d915185f33/
http://autobuild.buildroot.net/results/cef/cef30d4e14d39ab64bb27a6514a0390755f4a9d2/
http://autobuild.buildroot.net/results/03b/03b1b42688b07789971a99337708b4dbe4278665/
http://autobuild.buildroot.net/results/5e3/5e3320dfc6793a9ff0494161cdc9a3be795462c4/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mplayer/mplayer.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 8eb59c9..ad2d9dd 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -261,6 +261,13 @@ ifeq ($(BR2_i386),y)
 MPLAYER_CFLAGS += -fomit-frame-pointer
 endif
 
+ifeq ($(BR2_X86_CPU_HAS_MMX),y)
+MPLAYER_CONF_OPTS += --yasm=$(HOST_DIR)/usr/bin/yasm
+MPLAYER_DEPENDENCIES += host-yasm
+else
+MPLAYER_CONF_OPTS += --yasm=''
+endif
+
 define MPLAYER_CONFIGURE_CMDS
 	(cd $(@D); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
@@ -275,7 +282,6 @@ define MPLAYER_CONFIGURE_CMDS
 		--charset=UTF-8 \
 		--extra-cflags="$(MPLAYER_CFLAGS)" \
 		--extra-ldflags="$(MPLAYER_LDFLAGS)" \
-		--yasm='' \
 		--enable-fbdev \
 		$(MPLAYER_CONF_OPTS) \
 		--enable-cross-compile \
-- 
2.6.2
