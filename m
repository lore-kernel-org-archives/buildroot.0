From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 21:41:33 +0200
Subject: [Buildroot] [git commit] package/flare-engine: new package
Message-ID: <20180409194154.A063D88266@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=419b68eef5bc98b53514eff41b56a11f66e3898a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/flare-engine/Config.in         | 19 +++++++++++++++++++
 package/flare-engine/flare-engine.hash |  3 +++
 package/flare-engine/flare-engine.mk   | 17 +++++++++++++++++
 5 files changed, 41 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8a6793b5a9..3353ee0f89 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1591,6 +1591,7 @@ F:	package/bullet/
 F:	package/efl/
 F:	package/enlightenment/
 F:	package/expedite/
+F:	package/flare-engine/
 F:	package/irrlicht/
 F:	package/liblinear/
 F:	package/lensfun/
diff --git a/package/Config.in b/package/Config.in
index 5e798a4f14..71c186613e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -234,6 +234,7 @@ endmenu
 menu "Games"
 	source "package/chocolate-doom/Config.in"
 	source "package/doom-wad/Config.in"
+	source "package/flare-engine/Config.in"
 	source "package/gnuchess/Config.in"
 	source "package/lbreakout2/Config.in"
 	source "package/ltris/Config.in"
diff --git a/package/flare-engine/Config.in b/package/flare-engine/Config.in
new file mode 100644
index 0000000000..cdcb018948
--- /dev/null
+++ b/package/flare-engine/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_FLARE_ENGINE
+	bool "flare-engine"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS # SDL2
+	select BR2_PACKAGE_SDL2
+	select BR2_PACKAGE_SDL2_IMAGE
+	select BR2_PACKAGE_SDL2_MIXER
+	select BR2_PACKAGE_SDL2_TTF
+	help
+	  Flare (Free Libre Action Roleplaying Engine) is a simple game
+	  engine built to handle a very specific kind of game:
+	  single-player 2D action RPGs.
+	  Flare is not a reimplementation of an existing game or engine.
+	  It is a tribute to and exploration of the action RPG genre.
+
+	  http://flarerpg.org
+
+comment "flare-engine needs a toolchain w/ C++, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
diff --git a/package/flare-engine/flare-engine.hash b/package/flare-engine/flare-engine.hash
new file mode 100644
index 0000000000..8c6fc3ab1b
--- /dev/null
+++ b/package/flare-engine/flare-engine.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  4bbd4674513b643be6294188904665c53f0ef2912e803212c05e8fd22a44d74d  flare-engine-v1.0.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/flare-engine/flare-engine.mk b/package/flare-engine/flare-engine.mk
new file mode 100644
index 0000000000..394ddcfa5d
--- /dev/null
+++ b/package/flare-engine/flare-engine.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# flare-engine
+#
+################################################################################
+
+FLARE_ENGINE_VERSION = v1.0
+FLARE_ENGINE_SITE =  $(call github,clintbellanger,flare-engine,$(FLARE_ENGINE_VERSION))
+FLARE_ENGINE_LICENSE = GPL-3.0
+FLARE_ENGINE_LICENSE_FILES = COPYING
+
+FLARE_ENGINE_DEPENDENCIES += sdl2 sdl2_image sdl2_mixer sdl2_ttf
+
+# Don't use /usr/games and /usr/share/games
+FLARE_ENGINE_CONF_OPTS += -DBINDIR=bin -DDATADIR=share/flare
+
+$(eval $(cmake-package))
