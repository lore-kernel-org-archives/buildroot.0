From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 12 Jun 2017 22:54:10 +0200
Subject: [Buildroot] [PATCH v2 13/13] package/minetest_game: new package
In-Reply-To: <20170612205410.20230-1-romain.naour@gmail.com>
References: <20170612205410.20230-1-romain.naour@gmail.com>
Message-ID: <20170612205410.20230-13-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v2: update to 0.4.16
    update license file
    Add a hash file
    backport an upstream patch due to regression.
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...lt-Revert-Default-Shorter-and-better-ABMs.patch | 54 ++++++++++++++++++++++
 package/minetest_game/Config.in                    |  7 +++
 package/minetest_game/minetest_game.hash           |  2 +
 package/minetest_game/minetest_game.mk             | 40 ++++++++++++++++
 6 files changed, 105 insertions(+)
 create mode 100644 package/minetest_game/0001-Default-Revert-Default-Shorter-and-better-ABMs.patch
 create mode 100644 package/minetest_game/Config.in
 create mode 100644 package/minetest_game/minetest_game.hash
 create mode 100644 package/minetest_game/minetest_game.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 6ef7b23..a610ac7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1390,6 +1390,7 @@ F:	package/linux-syscall-support/
 F:	package/lugaru/
 F:	package/mcelog/
 F:	package/minetest/
+F:	package/minetest_game/
 F:	package/openpowerlink/
 F:	package/physfs/
 F:	package/stress-ng/
diff --git a/package/Config.in b/package/Config.in
index 4d59a68..f922d35 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -227,6 +227,7 @@ menu "Games"
 	source "package/ltris/Config.in"
 	source "package/lugaru/Config.in"
 	source "package/minetest/Config.in"
+	source "package/minetest_game/Config.in"
 	source "package/opentyrian/Config.in"
 	source "package/opentyrian-data/Config.in"
 	source "package/prboom/Config.in"
diff --git a/package/minetest_game/0001-Default-Revert-Default-Shorter-and-better-ABMs.patch b/package/minetest_game/0001-Default-Revert-Default-Shorter-and-better-ABMs.patch
new file mode 100644
index 0000000..e484e50
--- /dev/null
+++ b/package/minetest_game/0001-Default-Revert-Default-Shorter-and-better-ABMs.patch
@@ -0,0 +1,54 @@
+From 626cd8e9c7c2a5d5c907a12abbaa6066b6d5f2ff Mon Sep 17 00:00:00 2001
+From: "vorunbekannt75 at web.de" <vorunbekannt75@web.de>
+Date: Tue, 6 Jun 2017 19:20:58 +0200
+Subject: [PATCH] Default: Revert "Default: Shorter and better ABMs"
+
+This reverts commit e523c3a2965afe76b9102b67992e15fafba1594a to re-enable
+the overriding and redefinition of these global functions.
+
+[Romain backport from upstream]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ mods/default/functions.lua | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/mods/default/functions.lua b/mods/default/functions.lua
+index 5dc22ca..327e0c8 100644
+--- a/mods/default/functions.lua
++++ b/mods/default/functions.lua
+@@ -139,7 +139,9 @@ if minetest.settings:get_bool("enable_lavacooling") ~= false then
+ 		interval = 1,
+ 		chance = 2,
+ 		catch_up = false,
+-		action = default.cool_lava,
++		action = function(...)
++			default.cool_lava(...)
++		end,
+ 	})
+ end
+ 
+@@ -222,7 +224,9 @@ minetest.register_abm({
+ 	neighbors = {"group:sand"},
+ 	interval = 12,
+ 	chance = 83,
+-	action = default.grow_cactus
++	action = function(...)
++		default.grow_cactus(...)
++	end
+ })
+ 
+ minetest.register_abm({
+@@ -231,7 +235,9 @@ minetest.register_abm({
+ 	neighbors = {"default:dirt", "default:dirt_with_grass"},
+ 	interval = 14,
+ 	chance = 71,
+-	action = default.grow_papyrus
++	action = function(...)
++		default.grow_papyrus(...)
++	end
+ })
+ 
+ 
+-- 
+2.9.4
+
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
diff --git a/package/minetest_game/minetest_game.hash b/package/minetest_game/minetest_game.hash
new file mode 100644
index 0000000..1e8ca90
--- /dev/null
+++ b/package/minetest_game/minetest_game.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 ea914555949b4faccda5e13143cb021d2f9a5fa19abd1f5e4b7b65004cbd2b5a minetest_game-0.4.16.tar.gz
diff --git a/package/minetest_game/minetest_game.mk b/package/minetest_game/minetest_game.mk
new file mode 100644
index 0000000..c01aae5
--- /dev/null
+++ b/package/minetest_game/minetest_game.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# minetest_game
+#
+################################################################################
+
+MINETEST_GAME_VERSION = 0.4.16
+MINETEST_GAME_SITE = $(call github,minetest,minetest_game,$(MINETEST_GAME_VERSION))
+MINETEST_GAME_LICENSE = LGPL-2.1+, CC-BY-SA-2.0, CC-BY-SA-3.0, \
+	CC-BY-SA-4.0, MIT, CC0 1.0, CC-BY-2.0
+MINETEST_GAME_LICENSE_FILES = LICENSE.txt \
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
2.9.4
