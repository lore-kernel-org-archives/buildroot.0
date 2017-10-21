From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 17:19:32 +0200
Subject: [Buildroot] [git commit] package/minetest-game: new package
Message-ID: <20171021151212.6C27A7FB6A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9efb869c2cb9484b0df5ef3901d97eb47bafa52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...lt-Revert-Default-Shorter-and-better-ABMs.patch | 54 ++++++++++++++++++++++
 package/minetest-game/Config.in                    |  7 +++
 package/minetest-game/minetest-game.hash           | 25 ++++++++++
 package/minetest-game/minetest-game.mk             | 39 ++++++++++++++++
 6 files changed, 127 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d582e83..ac1bc9c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1329,6 +1329,7 @@ F:	package/linux-syscall-support/
 F:	package/lugaru/
 F:	package/mcelog/
 F:	package/minetest/
+F:	package/minetest-game/
 F:	package/openpowerlink/
 F:	package/physfs/
 F:	package/stress-ng/
diff --git a/package/Config.in b/package/Config.in
index 6d9c291..2a2df47 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -235,6 +235,7 @@ menu "Games"
 	source "package/ltris/Config.in"
 	source "package/lugaru/Config.in"
 	source "package/minetest/Config.in"
+	source "package/minetest-game/Config.in"
 	source "package/opentyrian/Config.in"
 	source "package/opentyrian-data/Config.in"
 	source "package/prboom/Config.in"
diff --git a/package/minetest-game/0001-Default-Revert-Default-Shorter-and-better-ABMs.patch b/package/minetest-game/0001-Default-Revert-Default-Shorter-and-better-ABMs.patch
new file mode 100644
index 0000000..e484e50
--- /dev/null
+++ b/package/minetest-game/0001-Default-Revert-Default-Shorter-and-better-ABMs.patch
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
diff --git a/package/minetest-game/Config.in b/package/minetest-game/Config.in
new file mode 100644
index 0000000..cf92ea5
--- /dev/null
+++ b/package/minetest-game/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_MINETEST_GAME
+	bool "minetest-game"
+	depends on BR2_PACKAGE_MINETEST
+	help
+	  The main subgame for the Minetest engine.
+
+	  https://github.com/minetest/minetest_game
diff --git a/package/minetest-game/minetest-game.hash b/package/minetest-game/minetest-game.hash
new file mode 100644
index 0000000..1a2fe78
--- /dev/null
+++ b/package/minetest-game/minetest-game.hash
@@ -0,0 +1,25 @@
+# Locally calculated
+sha256 ea914555949b4faccda5e13143cb021d2f9a5fa19abd1f5e4b7b65004cbd2b5a minetest-game-0.4.16.tar.gz
+
+sha256 f8a254e8d5f6b3ca3873f990986e86c864f943aa5dc9bf56808c5f4bfa509db0 LICENSE.txt
+sha256 3382f3bf99566089543621ee3256f7f98bf9364d3b852c5ed08202d435215d7d mods/beds/license.txt
+sha256 9e9dbe5236ba70d0337f9879b988c19c6a7b0c902eed202f775200b8bee6980d mods/boats/license.txt
+sha256 e642798b595fb41901ae695326da9a167b0bd6b4055edec2396672f5f01bb16c mods/bones/license.txt
+sha256 baf438bc48b7da1b8fc03d37d134473e1c1f33ffe2e926fa650e6d0c64872785 mods/bucket/license.txt
+sha256 6196d390ee0b6331766219aa82f31613fffb62476c03cf960190ab8c232b8822 mods/carts/license.txt
+sha256 c0eca35bf446b1b9c8a0d1eefa0613bf2996187cd1f9382e7424b3d0b0dd7851 mods/creative/license.txt
+sha256 0542a1ff8212197bf350b6135fb4d29f8a2341d9ddc1407ec812d7fb609a5c0f mods/default/license.txt
+sha256 c0c652890fc80af8eefedbcfe1cd0d16b13b14cd1c7105c9c2bc9abe8cf1620c mods/doors/license.txt
+sha256 011ebc82e96df3b825777e7531cb5d34cfce1f6ca27b7d3c80793c033d7c4f4e mods/dye/license.txt
+sha256 163ad77a427a21a900a8fe2333dfc82d115e8e799b7e13ca71f6bd47dcf0ec13 mods/farming/license.txt
+sha256 61f826be9adee70ef0e37f3bf4891fecc4b027a21637b32981b98220723d6f37 mods/fire/license.txt
+sha256 a8647ac7609fdaea96bd0ec58ac5837fd17d049fd450008fd7922162979a292e mods/flowers/license.txt
+sha256 857f64cd62c13e27f25363584342fe049885b16c6b2392f1ebd7c3a7fb6ca436 mods/give_initial_stuff/license.txt
+sha256 0066e63d682d54a014ad3359794365a1abb87562d2b1e5e32093976d88c295b4 mods/screwdriver/license.txt
+sha256 b903866d052774e4127952690ce62ca26aa5bc4c2ddd48fceae501fa0d24ed74 mods/sethome/license.txt
+sha256 a82dfda1c9feb704997ea42116eb6a15a1f3f99ee8c49215fbbd32d519e8ad74 mods/stairs/license.txt
+sha256 1d42ffae6bad0da2e76966532f5f759bbeb5adb395ee4bf7bacca1fdfef745a6 mods/tnt/license.txt
+sha256 a0814bccd28157a160049efeac03864ff4c4dd6a34bc9cfcd3cc62de66fb156a mods/vessels/license.txt
+sha256 e9ebf1b4b170e64a0ea6e246edd03689aeb859d6560b8372a8081c004b30cb65 mods/walls/license.txt
+sha256 551b19e2c8b18c143301e090a1ceb5dc5d4ca243cad846de179d693439910816 mods/wool/license.txt
+sha256 54fd170807a31712e3d6489287a27cdf5aa42eaff10e321aea040fb5b3e5a60a mods/xpanes/license.txt
diff --git a/package/minetest-game/minetest-game.mk b/package/minetest-game/minetest-game.mk
new file mode 100644
index 0000000..2386944
--- /dev/null
+++ b/package/minetest-game/minetest-game.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# minetest_game
+#
+################################################################################
+
+MINETEST_GAME_VERSION = 0.4.16
+MINETEST_GAME_SITE = $(call github,minetest,minetest_game,$(MINETEST_GAME_VERSION))
+MINETEST_GAME_LICENSE = LGPL-2.1+ (code), CC-BY-SA-2.0, CC-BY-SA-3.0, \
+	CC-BY-SA-4.0, MIT, CC0 1.0, CC-BY-2.0 (mods)
+MINETEST_GAME_LICENSE_FILES = LICENSE.txt \
+	mods/beds/license.txt \
+	mods/boats/license.txt \
+	mods/bones/license.txt \
+	mods/bucket/license.txt \
+	mods/carts/license.txt \
+	mods/creative/license.txt \
+	mods/default/license.txt \
+	mods/doors/license.txt \
+	mods/dye/license.txt \
+	mods/farming/license.txt \
+	mods/fire/license.txt \
+	mods/flowers/license.txt \
+	mods/give_initial_stuff/license.txt \
+	mods/screwdriver/license.txt \
+	mods/sethome/license.txt \
+	mods/stairs/license.txt \
+	mods/tnt/license.txt \
+	mods/vessels/license.txt \
+	mods/walls/license.txt \
+	mods/wool/license.txt \
+	mods/xpanes/license.txt
+
+define MINETEST_GAME_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/share/minetest/games/minetest_game
+	cp -dpfr $(@D)/* $(TARGET_DIR)/usr/share/minetest/games/minetest_game
+endef
+
+$(eval $(generic-package))
