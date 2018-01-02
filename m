From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  2 Jan 2018 08:16:01 +0200
Subject: [Buildroot] [PATCH v2] eeprog: remove package
Message-ID: <2647f36b9fbe9f718b30aa984c2c488f7cf6bc9c.1514873761.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The i2c-tools package has adopted the code of eeprog.

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2:
  Select BR2_LEGACY (Thomas)
  Select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS to make sure i2c-tools is
  enabled (Thomas)
---
 Config.in.legacy           |  8 ++++++++
 DEVELOPERS                 |  1 -
 package/Config.in          |  1 -
 package/eeprog/Config.in   |  6 ------
 package/eeprog/eeprog.hash |  2 --
 package/eeprog/eeprog.mk   | 20 --------------------
 6 files changed, 8 insertions(+), 30 deletions(-)
 delete mode 100644 package/eeprog/Config.in
 delete mode 100644 package/eeprog/eeprog.hash
 delete mode 100644 package/eeprog/eeprog.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index f52469deb822..1f83c0dfd231 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,14 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2018.02"
 
+config BR2_PACKAGE_EEPROG
+	bool "eeprog package removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_I2C_TOOLS
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	help
+	  The eeprog program is now provided by the i2c-tools package.
+
 config BR2_PACKAGE_GNUPG2_GPGV2
 	bool "gnupg2 gpgv2 option removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 28beff618c26..7e14b5609f19 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1116,7 +1116,6 @@ F:	package/crda/
 F:	package/devmem2/
 F:	package/dnsmasq/
 F:	package/dosfstools/
-F:	package/eeprog/
 F:	package/eigen/
 F:	package/ethtool/
 F:	package/flashbench/
diff --git a/package/Config.in b/package/Config.in
index b7ca5d7cbed6..e97d3e2e58d1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -406,7 +406,6 @@ endmenu
 	source "package/dvb-apps/Config.in"
 	source "package/dvbsnoop/Config.in"
 	source "package/edid-decode/Config.in"
-	source "package/eeprog/Config.in"
 	source "package/eudev/Config.in"
 	source "package/ev3dev-linux-drivers/Config.in"
 	source "package/evemu/Config.in"
diff --git a/package/eeprog/Config.in b/package/eeprog/Config.in
deleted file mode 100644
index 73582c70f9d4..000000000000
--- a/package/eeprog/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_EEPROG
-	bool "eeprog"
-	help
-	  Simple tool to read/write i2c eeprom chips.
-
-	  http://www.codesink.org/eeprog.html
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
