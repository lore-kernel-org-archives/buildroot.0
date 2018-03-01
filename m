From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Mar 2018 23:19:20 +0100
Subject: [Buildroot] [git commit branch/next] 18xx-ti-utils: new package
Message-ID: <20180301222104.9FAA2814D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8304e920cb9e1728aee9e69c28f029130c42a1d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

These are spacial RF calibration utilities for TI Wilink 18xx
modules.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                               |  1 +
 package/18xx-ti-utils/18xx-ti-utils.hash |  3 +++
 package/18xx-ti-utils/18xx-ti-utils.mk   | 30 ++++++++++++++++++++++++++++++
 package/18xx-ti-utils/Config.in          | 14 ++++++++++++++
 package/Config.in                        |  1 +
 5 files changed, 49 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e2b3901425..77b6df3cd3 100644
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
index 0000000000..faa23d0b3e
--- /dev/null
+++ b/package/18xx-ti-utils/18xx-ti-utils.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 9ce2c7228dd0ac8d3cc530a32bb92b532bdbc5dfb6a405c245abee678d878697  18xx-ti-utils-R8.7_SP3.tar.gz
+sha256 363cef40b276a7a91ebcff3f78626d9cfe5e5a51927c725236007259403d5fc4  COPYING
diff --git a/package/18xx-ti-utils/18xx-ti-utils.mk b/package/18xx-ti-utils/18xx-ti-utils.mk
new file mode 100644
index 0000000000..d1f0388c3a
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
index 0000000000..571d196e09
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
index 97317fdb5f..12d3d2bbff 100644
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
