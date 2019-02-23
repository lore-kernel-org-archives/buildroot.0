From: Thomas Huth <huth@tuxfamily.org>
Date: Sat, 23 Feb 2019 21:56:57 +0100
Subject: [Buildroot] [PATCH 3/3] package/frotz: new package
In-Reply-To: <20190223205657.18394-1-huth@tuxfamily.org>
References: <20190223205657.18394-1-huth@tuxfamily.org>
Message-ID: <20190223205657.18394-4-huth@tuxfamily.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Frotz is an interpreter for old Infocom adventures and other Z-code games.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 package/Config.in        |  1 +
 package/frotz/Config.in  |  7 +++++++
 package/frotz/frotz.hash |  2 ++
 package/frotz/frotz.mk   | 32 ++++++++++++++++++++++++++++++++
 4 files changed, 42 insertions(+)
 create mode 100644 package/frotz/Config.in
 create mode 100644 package/frotz/frotz.hash
 create mode 100644 package/frotz/frotz.mk

diff --git a/package/Config.in b/package/Config.in
index 16789fcd7c..d6f7ba0d75 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -244,6 +244,7 @@ menu "Games"
 	source "package/doom-wad/Config.in"
 	source "package/flare-engine/Config.in"
 	source "package/flare-game/Config.in"
+	source "package/frotz/Config.in"
 	source "package/gnuchess/Config.in"
 	source "package/lbreakout2/Config.in"
 	source "package/ltris/Config.in"
diff --git a/package/frotz/Config.in b/package/frotz/Config.in
new file mode 100644
index 0000000000..4b3039613f
--- /dev/null
+++ b/package/frotz/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_FROTZ
+	bool "frotz"
+	select BR2_PACKAGE_NCURSES
+	help
+	  Frotz is an interpreter for old Infocom adventure games and other Z-code
+	  games. Note that frotz can not be run as root. You must add a normal user
+	  to your buildroot configuration to be able to use it.
diff --git a/package/frotz/frotz.hash b/package/frotz/frotz.hash
new file mode 100644
index 0000000000..b441bffc31
--- /dev/null
+++ b/package/frotz/frotz.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha512 c3aeb1bca227db7b759be880c1fe14e3d46c79eae3f2891d2472ff1e1b17b2153b2e400d537d54dce68011079e230fe8176ebb7547b2ecbc30e44f2b7423c285  frotz-2.44.tar.bz2
diff --git a/package/frotz/frotz.mk b/package/frotz/frotz.mk
new file mode 100644
index 0000000000..7f31e7d89b
--- /dev/null
+++ b/package/frotz/frotz.mk
@@ -0,0 +1,32 @@
+##############################################################################
+#
+# Frotz - the Z-code interpreter
+#
+##############################################################################
+
+FROTZ_VERSION = 2.44
+FROTZ_SOURCE = frotz-$(FROTZ_VERSION).tar.bz2
+FROTZ_SITE = https://gitlab.com/DavidGriffith/frotz/-/archive/$(FROTZ_VERSION)
+FROTZ_INSTALL_TARGET = YES
+FROTZ_DEPENDENCIES = ncurses
+FROTZ_LICENSE = GPL-2.0+
+FROTZ_LICENSE_FILES = COPYING
+
+define FROTZ_POST_EXTRACT_FIXUP
+	(cd $(@D); \
+	 sed -i 's/$	ar rc/	\$$\(AR\) rc/g' $(@D)/Makefile ; \
+	 sed -i 's/$	ranlib/	\$$\(RANLIB\)/g' $(@D)/Makefile ; \
+	 sed -i 's/$	strip/	\$$\(STRIP\)/g' $(@D)/Makefile )
+endef
+FROTZ_POST_EXTRACT_HOOKS += FROTZ_POST_EXTRACT_FIXUP
+
+define FROTZ_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) PREFIX=/usr CONFIG_DIR=/etc -C $(@D)
+endef
+
+define FROTZ_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/frotz $(TARGET_DIR)/usr/bin
+	$(INSTALL) -D -m 0644 $(@D)/doc/frotz.6 $(TARGET_DIR)/usr/man/man6
+endef
+
+$(eval $(generic-package))
-- 
2.17.2
