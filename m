From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 Jan 2014 15:35:25 +0100
Subject: [Buildroot] [git commit] Add LBreakout2 package (SDL game)
Message-ID: <20140106143603.D29859C281@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8238e41962daed442394c70f289f92691a1a5750
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: needs gettext with uClibc+locale]
Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                |    1 +
 package/lbreakout2/Config.in     |   31 +++++++++++++++++++++++++++++++
 package/lbreakout2/lbreakout2.mk |   36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index e2280f1..e502cde 100644
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
index 0000000..221c9e2
--- /dev/null
+++ b/package/lbreakout2/Config.in
@@ -0,0 +1,31 @@
+config BR2_PACKAGE_LBREAKOUT2
+	bool "LBreakout2"
+	select BR2_PACKAGE_SDL
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
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
index 0000000..48cbe4c
--- /dev/null
+++ b/package/lbreakout2/lbreakout2.mk
@@ -0,0 +1,36 @@
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
+LBREAKOUT2_CONF_ENV = \
+	SDL_CONFIG="$(STAGING_DIR)/usr/bin/sdl-config"
+
+ifeq ($(BR2_PACKAGE_GETTEXT),y)
+LBREAKOUT2_DEPENDENCIES += gettext
+LBREAKOUT2_CONF_ENV += LIBS=-lintl
+endif
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
+$(eval $(autotools-package))
