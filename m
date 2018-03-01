From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  1 Mar 2018 23:51:42 +0200
Subject: [Buildroot] [PATCH next] 18xx-ti-utils: new package
Message-ID: <d322743a2a05c94eb5e1403f726b2c55372df556.1519941102.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These are spacial RF calibration utilities for TI Wilink 18xx
modules.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v3:
  * Propagate dependencies (Marcus)
  * Add license information and hash

v2:
  * Fix the config symbol as noted by ThomasP
  * Use STAGING_DIR for NFSROOT
---
 DEVELOPERS                               |  1 +
 package/18xx-ti-utils/18xx-ti-utils.hash |  3 +++
 package/18xx-ti-utils/18xx-ti-utils.mk   | 30 ++++++++++++++++++++++++++++++
 package/18xx-ti-utils/Config.in          | 14 ++++++++++++++
 package/Config.in                        |  1 +
 5 files changed, 49 insertions(+)
 create mode 100644 package/18xx-ti-utils/18xx-ti-utils.hash
 create mode 100644 package/18xx-ti-utils/18xx-ti-utils.mk
 create mode 100644 package/18xx-ti-utils/Config.in

diff --git a/DEVELOPERS b/DEVELOPERS
index e2b390142595..77b6df3cd37d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -205,6 +205,7 @@ F:	package/pulseview/
 F:	package/sigrok-cli/
 
 N:	Baruch Siach <baruch@tkos.co.il>
+F:	package/18xx-ti-utils/
 F:	package/daemon/
 F:	package/dropbear/
 F:	package/ebtables/
diff --git a/package/18xx-ti-utils/18xx-ti-utils.hash b/package/18xx-ti-utils/18xx-ti-utils.hash
new file mode 100644
index 000000000000..faa23d0b3edc
--- /dev/null
+++ b/package/18xx-ti-utils/18xx-ti-utils.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 9ce2c7228dd0ac8d3cc530a32bb92b532bdbc5dfb6a405c245abee678d878697  18xx-ti-utils-R8.7_SP3.tar.gz
+sha256 363cef40b276a7a91ebcff3f78626d9cfe5e5a51927c725236007259403d5fc4  COPYING
diff --git a/package/18xx-ti-utils/18xx-ti-utils.mk b/package/18xx-ti-utils/18xx-ti-utils.mk
new file mode 100644
index 000000000000..d1f0388c3a87
--- /dev/null
+++ b/package/18xx-ti-utils/18xx-ti-utils.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# 18xx-ti-utils
+#
+################################################################################
+
+18XX_TI_UTILS_VERSION = R8.7_SP3
+18XX_TI_UTILS_SITE = git://git.ti.com/wilink8-wlan/18xx-ti-utils
+18XX_TI_UTILS_DEPENDENCIES = libnl
+18XX_TI_UTILS_LICENSE = BSD-3-Clause
+18XX_TI_UTILS_LICENSE_FILES = COPYING
+
+18XX_TI_UTILS_CFLAGS = -I$(STAGING_DIR)/usr/include/libnl3 -DCONFIG_LIBNL32
+
+ifeq ($(BR2_STATIC_LIBS),y)
+18XX_TI_UTILS_BUILD_TARGET = static
+endif
+
+define 18XX_TI_UTILS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) CROSS_COMPILE=$(TARGET_CROSS) \
+		NFSROOT="$(STAGING_DIR)" NLVER=3 $(MAKE) -C $(@D) \
+		CFLAGS="$(TARGET_CFLAGS) $(18XX_TI_UTILS_CFLAGS)" \
+		$(18XX_TI_UTILS_BUILD_TARGET)
+endef
+
+define 18XX_TI_UTILS_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 $(@D)/calibrator $(TARGET_DIR)/usr/bin/calibrator
+endef
+
+$(eval $(generic-package))
diff --git a/package/18xx-ti-utils/Config.in b/package/18xx-ti-utils/Config.in
new file mode 100644
index 000000000000..571d196e091c
--- /dev/null
+++ b/package/18xx-ti-utils/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_18XX_TI_UTILS
+	bool "18xx-ti-utils"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
+	select BR2_PACKAGE_LIBNL
+	help
+	  TI Wilink calibration utilities.
+
+	  CONFIG_NL80211_TESTMODE must be enabled in the kernel
+	  configuration for this package to work.
+
+	  http://processors.wiki.ti.com/index.php/WL18xx_TX_Testing
+
+comment "18xx-ti-utils needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/Config.in b/package/Config.in
index 97317fdb5ff0..12d3d2bbff11 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -375,6 +375,7 @@ menu "Firmware"
 	source "package/wilink-bt-firmware/Config.in"
 	source "package/zd1211-firmware/Config.in"
 endmenu
+	source "package/18xx-ti-utils/Config.in"
 	source "package/a10disp/Config.in"
 	source "package/acpica/Config.in"
 	source "package/acpid/Config.in"
-- 
2.16.1
