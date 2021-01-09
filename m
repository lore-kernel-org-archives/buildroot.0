From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 Jan 2021 22:59:01 +0100
Subject: [Buildroot] [git commit] package/xorcurses: new package
Message-ID: <20210109214042.DA3D48263D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a216093cae7df943029f681da6aa25971805e5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

XorCurses is a remake of the 8-bit game 'Xor' by Astral Software.
Your task is to roam around a series of mazes where you have to
collect all blue masks before finding the exit. You have two 'shields'
(players) and you can use either one at any time and switch between
them. While the first level is simply a matter of navigation, the
following levels introduce further objects like bombs and teleports,
which have to be used right to solve the puzzles.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/xorcurses/Config.in      | 11 +++++++++++
 package/xorcurses/xorcurses.hash |  3 +++
 package/xorcurses/xorcurses.mk   | 27 +++++++++++++++++++++++++++
 5 files changed, 43 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index dc606b4c5d..64ce5b7d44 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2564,6 +2564,7 @@ F:	toolchain/
 
 N:	Thomas Huth <huth@tuxfamily.org>
 F:	package/ascii-invaders/
+F:	package/xorcurses/
 
 N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 F:	arch/Config.in.arm
diff --git a/package/Config.in b/package/Config.in
index 9ed02ec890..9709eaa377 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -280,6 +280,7 @@ menu "Games"
 	source "package/stella/Config.in"
 	source "package/supertux/Config.in"
 	source "package/supertuxkart/Config.in"
+	source "package/xorcurses/Config.in"
 endmenu
 
 menu "Graphic libraries and applications (graphic/text)"
diff --git a/package/xorcurses/Config.in b/package/xorcurses/Config.in
new file mode 100644
index 0000000000..6a94a2eef4
--- /dev/null
+++ b/package/xorcurses/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_XORCURSES
+	bool "xorcurses"
+	select BR2_PACKAGE_NCURSES
+	help
+	  XorCurses is a game remake of the 8-bit game 'Xor'. Your task
+	  is to roam around a series of mazes where you have to collect
+	  all blue masks before finding the exit. Note that the game
+	  needs a terminal with colors, i.e. make sure that the TERM
+	  environment variable is set to "linux" ("vt100" won't work).
+
+	  https://github.com/jwm-art-net/XorCurses/
diff --git a/package/xorcurses/xorcurses.hash b/package/xorcurses/xorcurses.hash
new file mode 100644
index 0000000000..549b5adf15
--- /dev/null
+++ b/package/xorcurses/xorcurses.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  6c60a41b9a74ecd5f6ded337b9982e81eaf7b31a654a4a32b219e3a2ff638ae3  xorcurses-04b664826c5bd30dd483f6a5c8c189ef97e255da.tar.gz
+sha256  8632a67e5a76be4cdf7fd0fc6509e21bd6c647183bd9d2325310d5098c652a3a  README
diff --git a/package/xorcurses/xorcurses.mk b/package/xorcurses/xorcurses.mk
new file mode 100644
index 0000000000..10b746f2e5
--- /dev/null
+++ b/package/xorcurses/xorcurses.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# xorcurses
+#
+################################################################################
+
+XORCURSES_VERSION = 04b664826c5bd30dd483f6a5c8c189ef97e255da
+XORCURSES_SITE = $(call github,jwm-art-net,XorCurses,$(XORCURSES_VERSION))
+XORCURSES_DEPENDENCIES = ncurses
+XORCURSES_LICENSE = GPL-3.0
+XORCURSES_LICENSE_FILES = README
+
+define XORCURSES_BUILD_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS) -std=gnu99 \
+			-DDATADIR='\"/usr/share/xorcurses\"' \
+			-DVERSION='\"$(XORCURSES_VERSION)\"'"
+endef
+
+define XORCURSES_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/xorcurses $(TARGET_DIR)/usr/bin/xorcurses
+	mkdir -p $(TARGET_DIR)/usr/share/xorcurses/maps
+	$(INSTALL) -D -m 0644 $(@D)/maps/*.xcm \
+		$(TARGET_DIR)/usr/share/xorcurses/maps/
+endef
+
+$(eval $(generic-package))
