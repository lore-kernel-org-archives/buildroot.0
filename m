From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Thu, 16 Dec 2010 15:36:26 +0100
Subject: [Buildroot] [PATCH] Add LBreakout2 game package
Message-ID: <1292510186-14853-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Boibessot <julien.boibessot@armadeus.com>


Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
---
 package/Config.in                |    1 +
 package/lbreakout2/Config.in     |   26 ++++++++++++++++++++++++++
 package/lbreakout2/lbreakout2.mk |   29 +++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+), 0 deletions(-)
 create mode 100644 package/lbreakout2/Config.in
 create mode 100644 package/lbreakout2/lbreakout2.mk

diff --git a/package/Config.in b/package/Config.in
index d3ae75e..1eab1ba 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -80,6 +80,7 @@ endmenu
 menu "Games"
 source "package/games/ace_of_penguins/Config.in"
 source "package/games/gnuchess/Config.in"
+source "package/lbreakout2/Config.in"
 source "package/games/magiccube4d/Config.in"
 source "package/games/prboom/Config.in"
 source "package/games/doom-wad/Config.in"
diff --git a/package/lbreakout2/Config.in b/package/lbreakout2/Config.in
new file mode 100644
index 0000000..1869cc1
--- /dev/null
+++ b/package/lbreakout2/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_LBREAKOUT2
+	bool "LBreakout2"
+	select BR2_PACKAGE_SDL
+	help
+	  LBreakout2 is the successor to LBreakout, a breakout-style arcade
+	  game in the manner of Arkanoid.
+
+	  http://lgames.sourceforge.net/index.php?project=LBreakout2
+
+if BR2_PACKAGE_LBREAKOUT2
+
+config BR2_PACKAGE_LBREAKOUT2_AUDIO
+	bool "audio support"
+	default y
+	select BR2_PACKAGE_SDL_MIXER
+	help
+	  Activates audio support. Will add SDL_mixer.
+
+config BR2_PACKAGE_LBREAKOUT2_NET
+	bool "network support"
+	default y
+	select BR2_PACKAGE_SDL_NET
+	help
+	  Activates network support. Will add SDL_net.
+
+endif
diff --git a/package/lbreakout2/lbreakout2.mk b/package/lbreakout2/lbreakout2.mk
new file mode 100644
index 0000000..bf12c30
--- /dev/null
+++ b/package/lbreakout2/lbreakout2.mk
@@ -0,0 +1,29 @@
+#############################################################
+#
+# LBreakout2
+#
+#############################################################
+
+LBREAKOUT2_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/lgames
+LBREAKOUT2_VERSION:=2.6.1
+LBREAKOUT2_SOURCE:=lbreakout2-$(LBREAKOUT2_VERSION).tar.gz
+LBREAKOUT2_CAT=$(ZCAT)
+
+LBREAKOUT2_DEPENDENCIES = sdl libpng
+
+ifeq ($(BR2_PACKAGE_LBREAKOUT2_AUDIO),y)
+LBREAKOUT2_DEPENDENCIES += sdl_mixer
+else
+LBREAKOUT2_CONF_OPT += --disable-audio
+endif
+
+ifeq ($(BR2_PACKAGE_LBREAKOUT2_NET),y)
+LBREAKOUT2_DEPENDENCIES += sdl_net
+else
+LBREAKOUT2_CONF_OPT += --disable-network
+endif
+
+LBREAKOUT2_CONF_ENV = \
+	SDL_CONFIG="$(STAGING_DIR)/usr/bin/sdl-config"
+
+$(eval $(call AUTOTARGETS,package,lbreakout2))
-- 
1.6.0.4
