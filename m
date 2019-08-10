From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 10 Aug 2019 12:59:54 +0200
Subject: [Buildroot] [PATCH 3/4] package/odroid-scripts: remove package
In-Reply-To: <20190810105955.22449-1-bernd.kuhls@t-online.de>
References: <20190810105955.22449-1-bernd.kuhls@t-online.de>
Message-ID: <20190810105955.22449-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Package is not needed anymore after support for odroid2c was dropped:
https://git.buildroot.net/buildroot/commit/?id=b80712a16ae3deb65331a7923aa878e13e2e66b6

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy                           |  6 ++++
 DEVELOPERS                                 |  1 -
 package/Config.in                          |  1 -
 package/odroid-scripts/Config.in           |  9 ------
 package/odroid-scripts/S02odroidc2_fb      | 20 ------------
 package/odroid-scripts/odroid-scripts.hash |  2 --
 package/odroid-scripts/odroid-scripts.mk   | 36 ----------------------
 7 files changed, 6 insertions(+), 69 deletions(-)
 delete mode 100644 package/odroid-scripts/Config.in
 delete mode 100644 package/odroid-scripts/S02odroidc2_fb
 delete mode 100644 package/odroid-scripts/odroid-scripts.hash
 delete mode 100644 package/odroid-scripts/odroid-scripts.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 18782046aa..34c484e1f6 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2019.08"
 
+config BR2_PACKAGE_ODROID_SCRIPTS
+	bool "Support for odroidc2 based systems was removed"
+	select BR2_LEGACY
+	help
+	  Support for odroidc2 based systems was removed.
+
 config BR2_PACKAGE_ODROID_MALI
 	bool "Support for odroidc2 based systems was removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 670ac61473..ce34bc5aca 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -581,7 +581,6 @@ F:	package/kvm-unit-tests
 
 N:	Dagg Stompler <daggs@gmx.com>
 F:	package/libamcodec/
-F:	package/odroid-scripts/
 
 N:	Daniel J. Leach <dleach@belcan.com>
 F:	package/dacapo/
diff --git a/package/Config.in b/package/Config.in
index d1368575cd..ce735e4b0c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -487,7 +487,6 @@ endmenu
 	source "package/nvidia-driver/Config.in"
 	source "package/nvidia-tegra23/Config.in"
 	source "package/nvme/Config.in"
-	source "package/odroid-scripts/Config.in"
 	source "package/ofono/Config.in"
 	source "package/on2-8170-modules/Config.in"
 	source "package/open2300/Config.in"
diff --git a/package/odroid-scripts/Config.in b/package/odroid-scripts/Config.in
deleted file mode 100644
index c07c3a4c09..0000000000
--- a/package/odroid-scripts/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_ODROID_SCRIPTS
-	bool "odroid-scripts"
-	depends on BR2_aarch64 || BR2_arm || BR2_armeb
-	select BR2_PACKAGE_FBSET # runtime
-	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # needed for fbset
-	help
-	  Install the scripts for the odroidc2 based systems.
-
-	  https://github.com/mdrjr/c2_bootini
diff --git a/package/odroid-scripts/S02odroidc2_fb b/package/odroid-scripts/S02odroidc2_fb
deleted file mode 100644
index 2aae59db98..0000000000
--- a/package/odroid-scripts/S02odroidc2_fb
+++ /dev/null
@@ -1,20 +0,0 @@
-#!/bin/sh
-#
-# Set up frame buffer
-#
-
-case "$1" in
-    start)
-        echo "Setting up display..."
-        /usr/sbin/odroidc2_init_fb.sh
-        ;;
-    stop)
-        ;;
-    restart|reload)
-        ;;
-    *)
-        echo "Usage: $0 {start|stop|restart}"
-        exit 1
-esac
-
-exit $?
diff --git a/package/odroid-scripts/odroid-scripts.hash b/package/odroid-scripts/odroid-scripts.hash
deleted file mode 100644
index e5a262d209..0000000000
--- a/package/odroid-scripts/odroid-scripts.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-#  Locally computed hash
-sha256 9d61472ee6aed2d1a7b5afdcb91b823003c8524a242572f24f89d4e57323daf3  odroid-scripts-cfd289b1d69136b8bfd725d90cd648da4654f2bd.tar.gz
diff --git a/package/odroid-scripts/odroid-scripts.mk b/package/odroid-scripts/odroid-scripts.mk
deleted file mode 100644
index fc1940dcef..0000000000
--- a/package/odroid-scripts/odroid-scripts.mk
+++ /dev/null
@@ -1,36 +0,0 @@
-################################################################################
-#
-# odroid-scripts
-#
-################################################################################
-
-ODROID_SCRIPTS_VERSION = cfd289b1d69136b8bfd725d90cd648da4654f2bd
-ODROID_SCRIPTS_SITE = $(call github,mdrjr,c2_bootini,$(ODROID_SCRIPTS_VERSION))
-ODROID_SCRIPTS_LICENSE = unclear
-
-ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-define ODROID_SCRIPTS_INSTALL_UDEV_RULES
-	$(INSTALL) -D -m 0644 $(@D)/10-odroid.rules \
-		$(TARGET_DIR)/etc/udev/rules.d/10-odroid.rules
-endef
-endif
-
-define ODROID_SCRIPTS_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/c2_init.sh $(TARGET_DIR)/usr/sbin/odroidc2_init_fb.sh
-	$(ODROID_SCRIPTS_INSTALL_UDEV_RULES)
-endef
-
-define ODROID_SCRIPTS_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 0644 $(@D)/amlogic.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/odroidc2_fb.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../../../../usr/lib/systemd/system/odroidc2_fb.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/odroidc2_fb.service
-endef
-
-define ODROID_SCRIPTS_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 package/odroid-scripts/S02odroidc2_fb \
-		$(TARGET_DIR)/etc/init.d/S02odroidc2_fb
-endef
-
-$(eval $(generic-package))
-- 
2.20.1
