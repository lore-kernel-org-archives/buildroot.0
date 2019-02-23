From: Thomas Huth <huth@tuxfamily.org>
Date: Sat, 23 Feb 2019 21:56:55 +0100
Subject: [Buildroot] [PATCH 1/3] package/xorcurses: new package
In-Reply-To: <20190223205657.18394-1-huth@tuxfamily.org>
References: <20190223205657.18394-1-huth@tuxfamily.org>
Message-ID: <20190223205657.18394-2-huth@tuxfamily.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Huth <thuth@redhat.com>

XorCurses is a remake of the 8-bit game 'Xor' by Astral Software.
Your task is to roam around a series of mazes where you have to collect
all blue masks before finding the exit. You have two 'shields' (players)
and you can use either one at any time and switch between them. While
the first level is simply a matter of navigation, the following levels
introduce further objects like bombs and teleports, which have to be
used right to solve the puzzles.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 package/Config.in                |  1 +
 package/xorcurses/Config.in      | 13 +++++++++++++
 package/xorcurses/xorcurses.hash |  2 ++
 package/xorcurses/xorcurses.mk   | 25 +++++++++++++++++++++++++
 4 files changed, 41 insertions(+)
 create mode 100644 package/xorcurses/Config.in
 create mode 100644 package/xorcurses/xorcurses.hash
 create mode 100644 package/xorcurses/xorcurses.mk

diff --git a/package/Config.in b/package/Config.in
index cc232b9fba..490cbdb216 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -258,6 +258,7 @@ menu "Games"
 	source "package/stella/Config.in"
 	source "package/supertux/Config.in"
 	source "package/supertuxkart/Config.in"
+	source "package/xorcurses/Config.in"
 endmenu
 
 menu "Graphic libraries and applications (graphic/text)"
diff --git a/package/xorcurses/Config.in b/package/xorcurses/Config.in
new file mode 100644
index 0000000000..0af161fec9
--- /dev/null
+++ b/package/xorcurses/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_XORCURSES
+    bool "xorcurses"
+    select BR2_PACKAGE_NCURSES
+    help
+      XorCurses is a remake of the 8-bit game 'Xor' by Astral Software.
+      Your task is to roam around a series of mazes where you have to collect
+      all blue masks before finding the exit. You have two 'shields' (players)
+      and you can use either one at any time and switch between them. While
+      the first level is simply a matter of navigation, the following levels
+      introduce further objects like bombs and teleports, which have to be
+      used right to solve the puzzles.
+      Note that the game needs a terminal with colors, i.e. make sure that
+      the TERM environment variable is set to "linux" ("vt100" won't work).
diff --git a/package/xorcurses/xorcurses.hash b/package/xorcurses/xorcurses.hash
new file mode 100644
index 0000000000..49d3a0c3b9
--- /dev/null
+++ b/package/xorcurses/xorcurses.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha512 1782ebf6ae8798b32e0a8e5e20e6d0b44eb619f6e7f015735c6e86205bd545da108c36bff1c9cfc9e9b44dee8f90bacb9df70436991f57f51c2c87e94b3a4725  XorCurses-0.2.2.tar.bz2
diff --git a/package/xorcurses/xorcurses.mk b/package/xorcurses/xorcurses.mk
new file mode 100644
index 0000000000..4bc132c5e8
--- /dev/null
+++ b/package/xorcurses/xorcurses.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# XorCurses
+#
+################################################################################
+
+XORCURSES_VERSION = 0.2.2
+XORCURSES_LICENSE = GPL-3.0
+XORCURSES_SOURCE = XorCurses-$(XORCURSES_VERSION).tar.bz2
+XORCURSES_SITE = http://www.jwm-art.net/art/archive
+XORCURSES_INSTALL_TARGET = YES
+XORCURSES_DEPENDENCIES = ncurses
+
+define XORCURSES_BUILD_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="-O2 -DDATADIR='\"/usr/share/xorcurses\"' -DVERSION='\"$(XORCURSES_VERSION)\"'"
+endef
+
+define XORCURSES_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/xorcurses $(TARGET_DIR)/usr/bin/
+	mkdir -p $(TARGET_DIR)/usr/share/xorcurses/maps
+	$(INSTALL) -D -m 0755 $(@D)/maps/*.xcm $(TARGET_DIR)/usr/share/xorcurses/maps/
+endef
+
+$(eval $(generic-package))
-- 
2.17.2
