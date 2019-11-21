From: Changming Huang <jerry.huang@nxp.com>
Date: Thu, 21 Nov 2019 18:23:21 +0800
Subject: [Buildroot] [PATCH v2 07/10]
 package/freescale-qoriq/fsl-qoriq-cadence-dp-fw: new package
In-Reply-To: <20191121102324.35225-1-jerry.huang@nxp.com>
References: <20191121102324.35225-1-jerry.huang@nxp.com>
Message-ID: <20191121102324.35225-8-jerry.huang@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jerry Huang <jerry.huang@nxp.com>

This package provides the firmware for LS1028ARDB DP (display port).

Signed-off-by: Jerry Huang <jerry.huang@nxp.com>
---
changes since v1:
1. rename the package to fsl-qoriq-cadence-dp-fw
2. update DEVELOPERS
3. add the hash of package
4. modify the context fo config file to package name
5. re-write the makefile according to rule of buildroot
6. add the license message in makefile
---
 DEVELOPERS                                    |  3 +++
 package/freescale-qoriq/Config.in             |  2 ++
 .../fsl-qoriq-cadence-dp-fw/Config.in         |  5 ++++
 .../fsl-qoriq-cadence-dp-fw.hash              |  2 ++
 .../fsl-qoriq-cadence-dp-fw.mk                | 24 +++++++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/Config.in
 create mode 100644 package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/fsl-qoriq-cadence-dp-fw.hash
 create mode 100644 package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/fsl-qoriq-cadence-dp-fw.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9fbe229eb7..b15115f507 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2545,3 +2545,6 @@ F:	package/qjson/
 F:	package/quazip/
 F:	package/shapelib/
 F:	package/tinc/
+
+N:	Changming Huang <jerry.huang@nxp.com>
+F:	package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/
diff --git a/package/freescale-qoriq/Config.in b/package/freescale-qoriq/Config.in
index 51497c588e..89f575a344 100644
--- a/package/freescale-qoriq/Config.in
+++ b/package/freescale-qoriq/Config.in
@@ -1,4 +1,6 @@
 menu "Freescale QorIQ libraries"
 	depends on BR2_aarch64 || BR2_arm || BR2_powerpc64 || BR2_powerpc
 
+source "package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/Config.in"
+
 endmenu
diff --git a/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/Config.in b/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/Config.in
new file mode 100644
index 0000000000..9259776750
--- /dev/null
+++ b/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_FSL_QORIQ_CADENCE_DP_FW
+	bool "FSL QorIQ cadence DP firmware"
+	help
+	  FSL QorIQ cadence DP firmware, a resident EL3 firmware.
+	  link: http://www.nxp.com/lgfiles/sdk/lsdk1909/firmware-cadence-lsdk1909.bin
diff --git a/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/fsl-qoriq-cadence-dp-fw.hash b/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/fsl-qoriq-cadence-dp-fw.hash
new file mode 100644
index 0000000000..bee912bee1
--- /dev/null
+++ b/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/fsl-qoriq-cadence-dp-fw.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 5871c5717be32f14a59624d5699d405e8ce9ae2e9c9ef86fd16e13d264a40e58  firmware-cadence-lsdk1909.bin
diff --git a/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/fsl-qoriq-cadence-dp-fw.mk b/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/fsl-qoriq-cadence-dp-fw.mk
new file mode 100644
index 0000000000..d0d112e25f
--- /dev/null
+++ b/package/freescale-qoriq/fsl-qoriq-cadence-dp-fw/fsl-qoriq-cadence-dp-fw.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# fsl-qoriq-cadence-dp-fw
+#
+################################################################################
+
+FSL_QORIQ_CADENCE_DP_FW_VERSION = lsdk1909
+FSL_QORIQ_CADENCE_DP_FW_SITE = http://www.nxp.com/lgfiles/sdk/lsdk1909
+FSL_QORIQ_CADENCE_DP_FW_SOURCE = firmware-cadence-$(FSL_QORIQ_CADENCE_DP_FW_VERSION).bin
+FSL_QORIQ_CADENCE_DP_FW_LICENSE = NXP-Binary-EULA
+FSL_QORIQ_CADENCE_DP_FW_LICENSE_FILES = COPYING
+FSL_QORIQ_CADENCE_DP_FW_INSTALL_IMAGES = YES
+FSL_QORIQ_CADENCE_DP_FW_INSTALL_TARGET = no
+
+define FSL_QORIQ_CADENCE_DP_FW_EXTRACT_CMDS
+	cd $(@D); \
+		sh $(FSL_QORIQ_CADENCE_DP_FW_DL_DIR)/$(FSL_QORIQ_CADENCE_DP_FW_SOURCE) --auto-accept;
+endef
+
+define FSL_QORIQ_CADENCE_DP_FW_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/firmware-cadence-lsdk1909/dp/ls1028a-dp-fw.bin $(BINARIES_DIR)/ls1028a-dp-fw.bin
+endef
+
+$(eval $(generic-package))
-- 
2.17.1
