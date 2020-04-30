From: Thomas Huth <huth@tuxfamily.org>
Date: Thu, 30 Apr 2020 16:44:41 +0200
Subject: [Buildroot] [PATCH v3] package/frotz: new package
Message-ID: <20200430144441.25470-1-huth@tuxfamily.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Frotz is an interpreter for old Infocom adventures and other Z-code games.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 v3: Updated patch from Frotz v2.44 to Frotz v2.51

 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/frotz/Config.in  | 10 ++++++++++
 package/frotz/frotz.hash |  5 +++++
 package/frotz/frotz.mk   | 32 ++++++++++++++++++++++++++++++++
 5 files changed, 49 insertions(+)
 create mode 100644 package/frotz/Config.in
 create mode 100644 package/frotz/frotz.hash
 create mode 100644 package/frotz/frotz.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index cc72b288be..f875cb54cb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2488,6 +2488,7 @@ F:	toolchain/
 
 N:	Thomas Huth <huth@tuxfamily.org>
 F:	package/ascii-invaders/
+F:	package/frotz/
 
 N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 F:	arch/Config.in.arm
diff --git a/package/Config.in b/package/Config.in
index 53c8ce0e29..0992dd77e2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -258,6 +258,7 @@ menu "Games"
 	source "package/doom-wad/Config.in"
 	source "package/flare-engine/Config.in"
 	source "package/flare-game/Config.in"
+	source "package/frotz/Config.in"
 	source "package/gnuchess/Config.in"
 	source "package/lbreakout2/Config.in"
 	source "package/ltris/Config.in"
diff --git a/package/frotz/Config.in b/package/frotz/Config.in
new file mode 100644
index 0000000000..59b6d0007d
--- /dev/null
+++ b/package/frotz/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_FROTZ
+	bool "frotz"
+	select BR2_PACKAGE_NCURSES
+	help
+	  Frotz is an interpreter for old Infocom adventure games and
+	  other Z-code games. Note that frotz can not be run as root.
+	  You must add a normal user to your buildroot configuration to
+	  be able to use it.
+
+	  https://661.org/proj/if/frotz/
diff --git a/package/frotz/frotz.hash b/package/frotz/frotz.hash
new file mode 100644
index 0000000000..b2fb02dbad
--- /dev/null
+++ b/package/frotz/frotz.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha512 a95d09a8d949c5193c0b9b016f4ef5b00483bfd5a9dd5b82aa015b543c72f03411fc8e22471828efe95fe0baa978966ac547a45dca727e1faf58ea819fa6aa34  frotz-2.51.tar.bz2
+
+# Hash for license file
+sha512 aee80b1f9f7f4a8a00dcf6e6ce6c41988dcaedc4de19d9d04460cbfb05d99829ffe8f9d038468eabbfba4d65b38e8dbef5ecf5eb8a1b891d9839cda6c48ee957  COPYING
diff --git a/package/frotz/frotz.mk b/package/frotz/frotz.mk
new file mode 100644
index 0000000000..baeaa8abed
--- /dev/null
+++ b/package/frotz/frotz.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# Frotz
+#
+################################################################################
+
+FROTZ_VERSION = 2.51
+FROTZ_SOURCE = frotz-$(FROTZ_VERSION).tar.bz2
+FROTZ_SITE = https://gitlab.com/DavidGriffith/frotz/-/archive/$(FROTZ_VERSION)
+FROTZ_DEPENDENCIES = host-pkgconf ncurses
+FROTZ_LICENSE = GPL-2.0+
+FROTZ_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
+FROTZ_CURSES="ncursesw"
+FROTZ_UTF8=yes
+else
+FROTZ_CURSES="ncurses"
+FROTZ_UTF8=
+endif
+
+define FROTZ_BUILD_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) PREFIX=/usr CONFIG_DIR=/etc \
+		SOUND_TYPE=none CURSES=$(FROTZ_CURSES) USE_UTF8=$(FROTZ_UTF8) \
+		CFLAGS="$(TARGET_CFLAGS) -std=c99"
+endef
+
+define FROTZ_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/frotz $(TARGET_DIR)/usr/bin/frotz
+endef
+
+$(eval $(generic-package))
-- 
2.21.1
