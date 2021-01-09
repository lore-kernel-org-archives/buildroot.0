From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 Jan 2021 23:24:09 +0100
Subject: [Buildroot] [git commit] package/frotz: new package
Message-ID: <20210109220548.1B430864F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=122df1fcd37032f5725cce818f25e48f21019491
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Frotz is an interpreter for old Infocom adventures and other Z-code
games.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/frotz/Config.in  | 10 ++++++++++
 package/frotz/frotz.hash |  3 +++
 package/frotz/frotz.mk   | 31 +++++++++++++++++++++++++++++++
 5 files changed, 46 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 64ce5b7d44..bf8118ef7d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2564,6 +2564,7 @@ F:	toolchain/
 
 N:	Thomas Huth <huth@tuxfamily.org>
 F:	package/ascii-invaders/
+F:	package/frotz/
 F:	package/xorcurses/
 
 N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
diff --git a/package/Config.in b/package/Config.in
index 9709eaa377..f497fbffde 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -265,6 +265,7 @@ menu "Games"
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
index 0000000000..14f1a7fbe2
--- /dev/null
+++ b/package/frotz/frotz.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  7e488140791259a1a8c9e16a0c467ca69b694b918c28ffe3d83c654bcb253cca  frotz-2.51.tar.bz2
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/frotz/frotz.mk b/package/frotz/frotz.mk
new file mode 100644
index 0000000000..ce27bdf0bf
--- /dev/null
+++ b/package/frotz/frotz.mk
@@ -0,0 +1,31 @@
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
+FROTZ_CURSES=ncursesw
+FROTZ_UTF8=yes
+else
+FROTZ_CURSES=ncurses
+endif
+
+define FROTZ_BUILD_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) PREFIX=/usr CONFIG_DIR=/etc \
+		SOUND_TYPE=none CURSES="$(FROTZ_CURSES)" USE_UTF8=$(FROTZ_UTF8) \
+		CFLAGS="$(TARGET_CFLAGS) -std=c99"
+endef
+
+define FROTZ_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/frotz $(TARGET_DIR)/usr/bin/frotz
+endef
+
+$(eval $(generic-package))
