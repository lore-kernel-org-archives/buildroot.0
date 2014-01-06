From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Mon,  6 Jan 2014 10:12:57 +0100
Subject: [Buildroot] [PATCH] Add LBreakout2 package (SDL game)
Message-ID: <1388999577-9681-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Boibessot <julien.boibessot@armadeus.com>


Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
---
 package/Config.in                |    1 +
 package/lbreakout2/Config.in     |   30 ++++++++++++++++++++++++++++++
 package/lbreakout2/lbreakout2.mk |   30 ++++++++++++++++++++++++++++++
 3 files changed, 61 insertions(+), 0 deletions(-)
 create mode 100644 package/lbreakout2/Config.in
 create mode 100644 package/lbreakout2/lbreakout2.mk

diff --git a/package/Config.in b/package/Config.in
index c4b6ec1..00ead97 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -157,6 +157,7 @@ endmenu
 menu "Games"
 source "package/doom-wad/Config.in"
 source "package/gnuchess/Config.in"
+source "package/lbreakout2/Config.in"
 source "package/prboom/Config.in"
 source "package/rubix/Config.in"
 endmenu
diff --git a/package/lbreakout2/Config.in b/package/lbreakout2/Config.in
new file mode 100644
index 0000000..6788aca
--- /dev/null
+++ b/package/lbreakout2/Config.in
@@ -0,0 +1,30 @@
+config BR2_PACKAGE_LBREAKOUT2
+	bool "LBreakout2"
+	select BR2_PACKAGE_SDL
+	select BR2_PACKAGE_LIBPNG
+	help
+	  LBreakout2 is the successor to LBreakout, a breakout-style arcade
+	  game in the manner of Arkanoid. Requires SDL, libpng, and
+	  optionnally SDL_mixer/SDL_net.
+	  A display with minimum 640x480 resolution, a keyboard and a mouse
+	  are recommanded.
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
+	  Activates audio support in LBreakout2. Will add SDL_mixer.
+
+config BR2_PACKAGE_LBREAKOUT2_NET
+	bool "network support"
+	default y
+	select BR2_PACKAGE_SDL_NET
+	help
+	  Activates network support LBreakout2. Will add SDL_net.
+
+endif
diff --git a/package/lbreakout2/lbreakout2.mk b/package/lbreakout2/lbreakout2.mk
new file mode 100644
index 0000000..66ef013
--- /dev/null
+++ b/package/lbreakout2/lbreakout2.mk
@@ -0,0 +1,30 @@
+#############################################################
+#
+# LBreakout2
+#
+#############################################################
+
+LBREAKOUT2_SITE = http://sourceforge.net/projects/lgames/files/lbreakout2/2.6/
+LBREAKOUT2_VERSION = 2.6.3
+LBREAKOUT2_LICENSE = GPLv2
+LBREAKOUT2_LICENSE_FILES = COPYING
+
+LBREAKOUT2_DEPENDENCIES = sdl libpng
+LBREAKOUT2_CONF_OPT = --disable-nls
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
+$(eval $(autotools-package))
-- 
1.7.5.4
