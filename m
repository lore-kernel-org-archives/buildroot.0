From: Baruch Siach <baruch@tkos.co.il>
Date: Mon,  1 Jan 2018 20:40:12 +0200
Subject: [Buildroot] [PATCH] eeprog: remove package
Message-ID: <39d02849d93281d09a8dace211b69df3e925b43e.1514832012.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The i2c-tools package has adopted the code of eeprog.

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 Config.in.legacy           |  6 ++++++
 DEVELOPERS                 |  1 -
 package/Config.in          |  1 -
 package/eeprog/Config.in   |  6 ------
 package/eeprog/eeprog.hash |  2 --
 package/eeprog/eeprog.mk   | 20 --------------------
 6 files changed, 6 insertions(+), 30 deletions(-)
 delete mode 100644 package/eeprog/Config.in
 delete mode 100644 package/eeprog/eeprog.hash
 delete mode 100644 package/eeprog/eeprog.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index f52469deb822..a0fcbed49d6e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,12 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2018.02"
 
+config BR2_PACKAGE_EEPROG
+	bool "eeprog package removed"
+	select BR2_PACKAGE_I2C_TOOLS if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	help
+	  The eeprog program is now provided by the i2c-tools package.
+
 config BR2_PACKAGE_GNUPG2_GPGV2
 	bool "gnupg2 gpgv2 option removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index fd6d8d8a953a..fbbe65ec5caa 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1107,7 +1107,6 @@ F:	package/crda/
 F:	package/devmem2/
 F:	package/dnsmasq/
 F:	package/dosfstools/
-F:	package/eeprog/
 F:	package/eigen/
 F:	package/ethtool/
 F:	package/flashbench/
diff --git a/package/Config.in b/package/Config.in
index be72d36e731a..5012522c0c5e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -405,7 +405,6 @@ endmenu
 	source "package/dvb-apps/Config.in"
 	source "package/dvbsnoop/Config.in"
 	source "package/edid-decode/Config.in"
-	source "package/eeprog/Config.in"
 	source "package/eudev/Config.in"
 	source "package/ev3dev-linux-drivers/Config.in"
 	source "package/evemu/Config.in"
diff --git a/package/eeprog/Config.in b/package/eeprog/Config.in
deleted file mode 100644
index ff313bdbae96..000000000000
--- a/package/eeprog/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_EEPROG
-	bool "eeprog"
-	help
-	  Simple tool to read/write i2c eeprom chips.
-
-	  http://codesink.org/eeprog.html
diff --git a/package/eeprog/eeprog.hash b/package/eeprog/eeprog.hash
deleted file mode 100644
index c91be72332f5..000000000000
--- a/package/eeprog/eeprog.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256	35155cc3844d2c3ae8ed6935fda72768c7f24fddc4a0fca89e4ffbb34880d9ef	eeprog-0.7.6.tar.gz
diff --git a/package/eeprog/eeprog.mk b/package/eeprog/eeprog.mk
deleted file mode 100644
index 0b0fcc67e1ce..000000000000
--- a/package/eeprog/eeprog.mk
+++ /dev/null
@@ -1,20 +0,0 @@
-################################################################################
-#
-# eeprog
-#
-################################################################################
-
-EEPROG_VERSION = 0.7.6
-EEPROG_SITE = http://www.codesink.org/download
-EEPROG_LICENSE = GPL-2.0+
-EEPROG_LICENSE_FILES = eeprog.c
-
-define EEPROG_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
-endef
-
-define EEPROG_INSTALL_TARGET_CMDS
-	$(INSTALL) -D $(@D)/eeprog $(TARGET_DIR)/usr/bin/eeprog
-endef
-
-$(eval $(generic-package))
-- 
2.15.1
