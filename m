From: Thomas Huth <huth@tuxfamily.org>
Date: Mon, 22 Apr 2019 10:11:25 +0200
Subject: [Buildroot] [PATCH v2] package/ascii-invaders: Add the game
 ascii-invaders
Message-ID: <20190422081125.6659-1-huth@tuxfamily.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

An ASCII-art game like Space Invaders using ncurses.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 v2:
 - I'm submitting the patch individually now, to ease the review
 - Addressed Gilles' review feedback from v1
 - Cleaned warnings from utils/check-package
 - Checked with utils/test-pkg, added POST_EXTRACT_HOOK to fix a problem
   when linking the program statically
 - Use $(call github, ...) helper to create the SITE variable

 DEVELOPERS                                 |  3 +++
 package/Config.in                          |  1 +
 package/ascii-invaders/Config.in           |  7 ++++++
 package/ascii-invaders/ascii-invaders.hash |  5 ++++
 package/ascii-invaders/ascii-invaders.mk   | 28 ++++++++++++++++++++++
 5 files changed, 44 insertions(+)
 create mode 100644 package/ascii-invaders/Config.in
 create mode 100644 package/ascii-invaders/ascii-invaders.hash
 create mode 100644 package/ascii-invaders/ascii-invaders.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ea6b802de4..1e69c72e41 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2166,6 +2166,9 @@ F:	support/scripts/size-stats
 F:	utils/size-stats-compare
 F:	toolchain/
 
+N:	Thomas Huth <huth@tuxfamily.org>
+F:	package/ascii-invaders/
+
 N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 F:	arch/Config.in.arm
 F:	boot/boot-wrapper-aarch64/
diff --git a/package/Config.in b/package/Config.in
index 4f3836ae10..3642c5679b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -243,6 +243,7 @@ comment "Themes"
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
-- 
2.17.2
