From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 12 Apr 2017 00:26:43 +0200
Subject: [Buildroot] [PATCH 14/14] package/minetest_game: new package
In-Reply-To: <20170411222643.9770-1-romain.naour@gmail.com>
References: <20170411222643.9770-1-romain.naour@gmail.com>
Message-ID: <20170411222643.9770-14-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/minetest_game/Config.in        |  7 ++++++
 package/minetest_game/minetest_game.mk | 40 ++++++++++++++++++++++++++++++++++
 4 files changed, 49 insertions(+)
 create mode 100644 package/minetest_game/Config.in
 create mode 100644 package/minetest_game/minetest_game.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 2c25281..5891ae1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1344,6 +1344,7 @@ F:	package/linux-syscall-support/
 F:	package/lugaru/
 F:	package/mcelog/
 F:	package/minetest/
+F:	package/minetest_game/
 F:	package/openpowerlink/
 F:	package/physfs/
 F:	package/stress-ng/
diff --git a/package/Config.in b/package/Config.in
index 23d2c5e..c9cb31c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -226,6 +226,7 @@ menu "Games"
 	source "package/ltris/Config.in"
 	source "package/lugaru/Config.in"
 	source "package/minetest/Config.in"
+	source "package/minetest_game/Config.in"
 	source "package/opentyrian/Config.in"
 	source "package/opentyrian-data/Config.in"
 	source "package/prboom/Config.in"
diff --git a/package/minetest_game/Config.in b/package/minetest_game/Config.in
new file mode 100644
index 0000000..75978e9
--- /dev/null
+++ b/package/minetest_game/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_MINETEST_GAME
+	bool "minetest_game"
+	depends on BR2_PACKAGE_MINETEST
+	help
+	  The main subgame for the Minetest engine.
+
+	  https://github.com/minetest/minetest_game
diff --git a/package/minetest_game/minetest_game.mk b/package/minetest_game/minetest_game.mk
new file mode 100644
index 0000000..2422e8d
--- /dev/null
+++ b/package/minetest_game/minetest_game.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# minetest_game
+#
+################################################################################
+
+MINETEST_GAME_VERSION = 0.4.15
+MINETEST_GAME_SITE = $(call github,minetest,minetest_game,$(MINETEST_GAME_VERSION))
+MINETEST_GAME_LICENSE = LGPL-2.1+, CC-BY-SA-2.0, CC-BY-SA-3.0, \
+	CC-BY-SA-4.0, MIT, CC0 1.0, CC-BY-2.0
+MINETEST_GAME_LICENSE_FILES = README.txt \
+	mods/screwdriver/license.txt \
+	mods/tnt/license.txt \
+	mods/stairs/license.txt \
+	mods/bucket/license.txt \
+	mods/walls/license.txt \
+	mods/wool/license.txt \
+	mods/flowers/license.txt \
+	mods/bones/license.txt \
+	mods/boats/license.txt \
+	mods/default/license.txt \
+	mods/give_initial_stuff/license.txt \
+	mods/dye/license.txt \
+	mods/farming/license.txt \
+	mods/xpanes/license.txt \
+	mods/vessels/license.txt \
+	mods/carts/license.txt \
+	mods/sethome/license.txt \
+	mods/fire/license.txt \
+	mods/nyancat/license.txt \
+	mods/doors/license.txt \
+	mods/creative/license.txt \
+	mods/beds/license.txt
+
+define MINETEST_GAME_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/share/minetest/games/minetest_game
+	rsync -av $(@D)/* --exclude=".*" $(TARGET_DIR)/usr/share/minetest/games/minetest_game
+endef
+
+$(eval $(generic-package))
-- 
2.9.3
