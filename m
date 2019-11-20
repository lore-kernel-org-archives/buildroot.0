From: Changming Huang <jerry.huang@nxp.com>
Date: Wed, 20 Nov 2019 12:07:22 +0800
Subject: [Buildroot] [PATCH 6/9] package/freescale-qoriq/cadence: new package
In-Reply-To: <20191120040725.32207-1-jerry.huang@nxp.com>
References: <20191120040725.32207-1-jerry.huang@nxp.com>
Message-ID: <20191120040725.32207-7-jerry.huang@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package provides the firmware for LS1028ARDB DP (display port).

Signed-off-by: Changming Huang <jerry.huang@nxp.com>
---
 package/freescale-qoriq/Config.in          |  2 ++
 package/freescale-qoriq/cadence/Config.in  |  9 +++++++++
 package/freescale-qoriq/cadence/cadence.mk | 19 +++++++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 package/freescale-qoriq/cadence/Config.in
 create mode 100644 package/freescale-qoriq/cadence/cadence.mk

diff --git a/package/freescale-qoriq/Config.in b/package/freescale-qoriq/Config.in
index 51497c588e..03fdf345c0 100644
--- a/package/freescale-qoriq/Config.in
+++ b/package/freescale-qoriq/Config.in
@@ -1,4 +1,6 @@
 menu "Freescale QorIQ libraries"
 	depends on BR2_aarch64 || BR2_arm || BR2_powerpc64 || BR2_powerpc
 
+source "package/freescale-qoriq/cadence/Config.in"
+
 endmenu
diff --git a/package/freescale-qoriq/cadence/Config.in b/package/freescale-qoriq/cadence/Config.in
new file mode 100644
index 0000000000..67292a799f
--- /dev/null
+++ b/package/freescale-qoriq/cadence/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_CADENCE
+	bool "display port firmware"
+	help
+	Display Port, a resident EL3 firmware.
+
+if BR2_PACKAGE_CADENCE
+config BR2_PACKAGE_CADENCE_DP_BIN
+	string "Custom DP Firmware BIN"
+endif
diff --git a/package/freescale-qoriq/cadence/cadence.mk b/package/freescale-qoriq/cadence/cadence.mk
new file mode 100644
index 0000000000..dd78411e15
--- /dev/null
+++ b/package/freescale-qoriq/cadence/cadence.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# DP firmware for NXP layerscape platforms
+#
+################################################################################
+CADENCE_INSTALL_IMAGES = YES
+
+DP_BIN = $(call qstrip,$(BR2_PACKAGE_CADENCE_DP_BIN))
+
+define CADENCE_BUILD_CMDS
+	cd $(@D)/ && wget http://www.nxp.com/lgfiles/sdk/lsdk1909/firmware-cadence-lsdk1909.bin &&\
+	chmod +x firmware-cadence-lsdk1909.bin && ./firmware-cadence-lsdk1909.bin --auto-accept;
+endef
+
+define CADENCE_INSTALL_IMAGES_CMDS
+	cp $(@D)/firmware-cadence-lsdk1909/dp/$(DP_BIN) $(BINARIES_DIR)/;
+endef
+
+$(eval $(generic-package))
-- 
2.17.1
