From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 14 Feb 2018 15:04:43 +0200
Subject: [Buildroot] [PATCH RFC] 18xx-ti-utils: new package
Message-ID: <f92c71ab69063c62e8562b05062a70fdb91b187f.1518613483.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These are spacial RF calibration utilities for the TI Wilink 18xx
modules.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---

I encountered strange behaviour with this package. Simple 'make' does
not build the package even when 'BR2_18XX_TI_UTILS=y' is in my .config.
All other packages in my .config build fine. Running 'make
18xx-ti-utils' does build the package, though. 'make printvars' shows
the package in PACKAGES_ALL but not in PACKAGES.

I might have missed something obvious. Maybe someone on the list can
enlighten me.
---
 DEVELOPERS                             |  1 +
 package/18xx-ti-utils/18xx-ti-utils.mk | 28 ++++++++++++++++++++++++++++
 package/18xx-ti-utils/Config.in        | 10 ++++++++++
 package/Config.in                      |  1 +
 4 files changed, 40 insertions(+)
 create mode 100644 package/18xx-ti-utils/18xx-ti-utils.mk
 create mode 100644 package/18xx-ti-utils/Config.in

diff --git a/DEVELOPERS b/DEVELOPERS
index c524cb6ac505..2dc2d0665fcb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -203,6 +203,7 @@ F:	package/pulseview/
 F:	package/sigrok-cli/
 
 N:	Baruch Siach <baruch@tkos.co.il>
+F:	package/18xx-ti-utils/
 F:	package/daemon/
 F:	package/dropbear/
 F:	package/ebtables/
diff --git a/package/18xx-ti-utils/18xx-ti-utils.mk b/package/18xx-ti-utils/18xx-ti-utils.mk
new file mode 100644
index 000000000000..be8a67608165
--- /dev/null
+++ b/package/18xx-ti-utils/18xx-ti-utils.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# 18xx-ti-utils
+#
+################################################################################
+
+18XX_TI_UTILS_VERSION = R8.7_SP3
+18XX_TI_UTILS_SITE = git://git.ti.com/wilink8-wlan/18xx-ti-utils
+18XX_TI_UTILS_DEPENDENCIES = libnl
+
+18XX_TI_UTILS_CFLAGS = -I$(STAGING_DIR)/usr/include/libnl3 -DCONFIG_LIBNL32
+
+ifeq ($(BR2_STATIC_LIBS),y)
+18XX_TI_UTILS_BUILD_TARGET = static
+endif
+
+define 18XX_TI_UTILS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) CROSS_COMPILE=$(TARGET_CROSS) \
+		NFSROOT=/noexistent NLVER=3 $(MAKE) -C $(@D) \
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
index 000000000000..fcdb80673c7e
--- /dev/null
+++ b/package/18xx-ti-utils/Config.in
@@ -0,0 +1,10 @@
+config BR2_18XX_TI_UTILS
+	bool "18xx-ti-utils"
+	select BR2_PACKAGE_LIBNL
+	help
+	  TI Wilink calibration utilities.
+
+	  CONFIG_NL80211_TESTMODE must be enabled in the kernel
+	  configuration for this package to work.
+
+	  http://processors.wiki.ti.com/index.php/WL18xx_TX_Testing
diff --git a/package/Config.in b/package/Config.in
index 9cd5d9c08741..3c82f7ab00d5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -374,6 +374,7 @@ menu "Firmware"
 	source "package/wilink-bt-firmware/Config.in"
 	source "package/zd1211-firmware/Config.in"
 endmenu
+	source "package/18xx-ti-utils/Config.in"
 	source "package/a10disp/Config.in"
 	source "package/acpica/Config.in"
 	source "package/acpid/Config.in"
-- 
2.15.1
