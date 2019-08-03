From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Aug 2019 14:55:44 +0200
Subject: [Buildroot] [git commit] package/ascii-invaders: Add the game
 ascii-invaders
Message-ID: <20190803132045.8052B8D4E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c63f804bfffe8121e2976ea0acc777d747b2d3e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

An ASCII-art game like Space Invaders using ncurses.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
Reviewed-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                 |  3 +++
 package/Config.in                          |  1 +
 package/ascii-invaders/Config.in           |  7 +++++++
 package/ascii-invaders/ascii-invaders.hash |  5 +++++
 package/ascii-invaders/ascii-invaders.mk   | 28 ++++++++++++++++++++++++++++
 5 files changed, 44 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6b30e14136..c820312d12 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2207,6 +2207,9 @@ F:	support/scripts/size-stats
 F:	utils/size-stats-compare
 F:	toolchain/
 
+N:	Thomas Huth <huth@tuxfamily.org>
+F:	package/ascii-invaders/
+
 N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 F:	arch/Config.in.arm
 F:	boot/boot-wrapper-aarch64/
diff --git a/package/Config.in b/package/Config.in
index a7c4c53165..f9acf596a3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -245,6 +245,7 @@ comment "Themes"
 endmenu
 
 menu "Games"
+	source "package/ascii-invaders/Config.in"
 	source "package/chocolate-doom/Config.in"
 	source "package/doom-wad/Config.in"
 	source "package/flare-engine/Config.in"
diff --git a/package/ascii-invaders/Config.in b/package/ascii-invaders/Config.in
new file mode 100644
index 0000000000..f02ab74994
--- /dev/null
+++ b/package/ascii-invaders/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_ASCII_INVADERS
+	bool "ascii_invaders"
+	select BR2_PACKAGE_NCURSES
+	help
+	  An ASCII-art game like Space Invaders using ncurses.
+
+	  https://github.com/macdice/ascii-invaders
diff --git a/package/ascii-invaders/ascii-invaders.hash b/package/ascii-invaders/ascii-invaders.hash
new file mode 100644
index 0000000000..b4805e7b1d
--- /dev/null
+++ b/package/ascii-invaders/ascii-invaders.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha512	326708ffc2c277e04575920c58f6a267e0bf46f8d2a3dbca9b5c317fb01006d4f673ab35f92f292549cc52dbee4400a84c85478eb81b9bd7703689a705547bc7	v1.0.1.tar.gz
+
+# Hash for license file
+sha512	1e455684996d7733b2f1ccd4606d034694d16ceff6ede6125d7f1537d20dabe05976cca4cef5cbf6c31352cbd62a515fd8e34a2ffb54dae1181c1116b24c6cf7	LICENSE
diff --git a/package/ascii-invaders/ascii-invaders.mk b/package/ascii-invaders/ascii-invaders.mk
new file mode 100644
index 0000000000..c91e0eeaa8
--- /dev/null
+++ b/package/ascii-invaders/ascii-invaders.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# ASCII-Invaders
+#
+################################################################################
+
+ASCII_INVADERS_VERSION = v1.0.1
+ASCII_INVADERS_SOURCE = $(ASCII_INVADERS_VERSION).tar.gz
+ASCII_INVADERS_SITE = $(call github,macdice,ascii-invaders,$(ASCII_INVADERS_VERSION))
+ASCII_INVADERS_DEPENDENCIES = ncurses
+ASCII_INVADERS_LICENSE = GPL-2.0+
+ASCII_INVADERS_LICENSE_FILES = LICENSE
+
+# For compiling statically, libraries must be specified after the object file
+define ASCII_INVADERS_POST_EXTRACT_FIXUP
+	sed -i 's/\$$(LIBS) invaders.o/invaders.o \$$(LIBS)/' $(@D)/Makefile
+endef
+ASCII_INVADERS_POST_EXTRACT_HOOKS += ASCII_INVADERS_POST_EXTRACT_FIXUP
+
+define ASCII_INVADERS_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define ASCII_INVADERS_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/ascii_invaders $(TARGET_DIR)/usr/bin/ascii_invaders
+endef
+
+$(eval $(generic-package))
