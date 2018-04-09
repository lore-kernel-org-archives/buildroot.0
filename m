From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 21:56:48 +0200
Subject: [Buildroot] [git commit] package/flare-game: new package
Message-ID: <20180409195703.A75688259E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e930a61c21f4d7e4fd0c648c382c54ff3b02a03f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/flare-game/Config.in       | 13 +++++++++++++
 package/flare-game/flare-game.hash |  3 +++
 package/flare-game/flare-game.mk   | 18 ++++++++++++++++++
 5 files changed, 36 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3353ee0f89..14d872996b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1592,6 +1592,7 @@ F:	package/efl/
 F:	package/enlightenment/
 F:	package/expedite/
 F:	package/flare-engine/
+F:	package/flare-game/
 F:	package/irrlicht/
 F:	package/liblinear/
 F:	package/lensfun/
diff --git a/package/Config.in b/package/Config.in
index 71c186613e..e48d0b4c64 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -235,6 +235,7 @@ menu "Games"
 	source "package/chocolate-doom/Config.in"
 	source "package/doom-wad/Config.in"
 	source "package/flare-engine/Config.in"
+	source "package/flare-game/Config.in"
 	source "package/gnuchess/Config.in"
 	source "package/lbreakout2/Config.in"
 	source "package/ltris/Config.in"
diff --git a/package/flare-game/Config.in b/package/flare-game/Config.in
new file mode 100644
index 0000000000..ca68d19a69
--- /dev/null
+++ b/package/flare-game/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_FLARE_GAME
+	bool "flare-game"
+	depends on BR2_PACKAGE_FLARE_ENGINE
+	help
+	  Flare is an open source, 2D action RPG licensed under the
+	  GPL3 license. Its game play can be likened to the games in
+	  the Diablo series.
+
+	  This package, flare-game, only contains the game data. The
+	  game engine itself is part of a separate package,
+	  flame-engine.
+
+	  http://flarerpg.org
diff --git a/package/flare-game/flare-game.hash b/package/flare-game/flare-game.hash
new file mode 100644
index 0000000000..a27c66d9e3
--- /dev/null
+++ b/package/flare-game/flare-game.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  5c8e9d72fcbe59f1861f79ac7b76ceffe3ec61d1df241c32d9133fe158fba4c1  flare-game-v1.0.tar.gz
+sha256  9fce5eb663f136449e11293a871ed96db5ba579116a927fc6a70dd20a4a5b9e6  README
diff --git a/package/flare-game/flare-game.mk b/package/flare-game/flare-game.mk
new file mode 100644
index 0000000000..89750d99b1
--- /dev/null
+++ b/package/flare-game/flare-game.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# flare-game
+#
+################################################################################
+
+FLARE_GAME_VERSION = v1.0
+FLARE_GAME_SITE =  $(call github,clintbellanger,flare-game,$(FLARE_GAME_VERSION))
+FLARE_GAME_LICENSE = CC-BY-SA-3.0 (data files), GPL-2.0 (GNU Unifont), \
+	OFL-1.1 (Liberation Sans)
+FLARE_GAME_LICENSE_FILES = README
+
+FLARE_GAME_DEPENDENCIES = flare-engine
+
+# Don't use /usr/share/games
+FLARE_GAME_CONF_OPTS += -DDATADIR=share/flare
+
+$(eval $(cmake-package))
