From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Mon,  6 Jan 2014 12:54:06 +0100
Subject: [Buildroot] [PATCH v2] Add LBreakout2 package (SDL game)
Message-ID: <1389009246-23441-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Boibessot <julien.boibessot@armadeus.com>

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
---
 Changes since v1:
 - took Thomas remarks into account: SF dl, version, license and confiure
   options

 package/Config.in                |    1 +
 package/lbreakout2/Config.in     |   30 ++++++++++++++++++++++++++++++
 package/lbreakout2/lbreakout2.mk |   31 +++++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+), 0 deletions(-)
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
index 0000000..dd805a4
--- /dev/null
+++ b/package/lbreakout2/lbreakout2.mk
@@ -0,0 +1,31 @@
+#############################################################
+#
+# lbreakout2
+#
+#############################################################
+
+LBREAKOUT2_SITE = http://downloads.sourceforge.net/lgames/lbreakout2/2.6/
+LBREAKOUT2_VERSION = 2.6.4
+LBREAKOUT2_LICENSE = GPLv2+
+LBREAKOUT2_LICENSE_FILES = COPYING
+
+LBREAKOUT2_DEPENDENCIES = sdl libpng
+
+ifeq ($(BR2_PACKAGE_LBREAKOUT2_AUDIO),y)
+LBREAKOUT2_DEPENDENCIES += sdl_mixer
+LBREAKOUT2_CONF_OPT += --enable-audio=yes
+else
+LBREAKOUT2_CONF_OPT += --disable-audio
+endif
+
+ifeq ($(BR2_PACKAGE_LBREAKOUT2_NET),y)
+LBREAKOUT2_DEPENDENCIES += sdl_net
+LBREAKOUT2_CONF_OPT += --enable-network=yes
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
