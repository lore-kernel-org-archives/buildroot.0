From: Changming Huang <jerry.huang@nxp.com>
Date: Wed, 27 Nov 2019 15:17:17 +0800
Subject: [Buildroot] [PATCH v3 6/9] package/qoriq-cadence-dp-firmware: new
 package
In-Reply-To: <20191127071720.15623-1-jerry.huang@nxp.com>
References: <20191127071720.15623-1-jerry.huang@nxp.com>
Message-ID: <20191127071720.15623-6-jerry.huang@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jerry Huang <jerry.huang@nxp.com>

This package provides the firmware for LS1028ARDB DP (display port).

Signed-off-by: Jerry Huang <jerry.huang@nxp.com>
---
changes since v2:
1. change the package name to qoriq-cadence-dp-firmware.
2. add the hash of COPYING.
3. modify makefile with new option.
4. update DEVELOPERS with alphabetic ordering

changes since v1:
1. rename the package to fsl-qoriq-cadence-dp-fw.
2. update DEVELOPERS.
3. add the hash of package.
4. modify the context fo config file to package name.
5. re-write the makefile according to rule of buildroot.
6. add the license message in makefile.
---
 DEVELOPERS                                    |  3 +++
 package/nxp/Config.in                         |  2 ++
 package/nxp/helper.mk                         |  2 ++
 .../nxp/qoriq-cadence-dp-firmware/Config.in   |  4 ++++
 .../qoriq-cadence-dp-firmware.hash            |  3 +++
 .../qoriq-cadence-dp-firmware.mk              | 23 +++++++++++++++++++
 6 files changed, 37 insertions(+)
 create mode 100644 package/nxp/qoriq-cadence-dp-firmware/Config.in
 create mode 100644 package/nxp/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
 create mode 100644 package/nxp/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 887ab7ad95..70f2671ff8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -513,6 +513,9 @@ F:	configs/nanopi_m1_plus_defconfig
 F:	configs/olimex_a13_olinuxino_defconfig
 F:	configs/orangepi_plus_defconfig
 
+N:	Changming Huang <jerry.huang@nxp.com>
+F:	package/nxp/qoriq-cadence-dp-firmware/
+
 N:	Chris Packham <judge.packham@gmail.com>
 F:	package/gstreamer1/gst1-shark/
 F:	package/micropython/
diff --git a/package/nxp/Config.in b/package/nxp/Config.in
index 575542c7ab..855d62700b 100644
--- a/package/nxp/Config.in
+++ b/package/nxp/Config.in
@@ -1,4 +1,6 @@
 menu "NXP QorIQ libraries"
 	depends on BR2_aarch64 || BR2_arm || BR2_powerpc64 || BR2_powerpc
 
+source "package/nxp/qoriq-cadence-dp-firmware/Config.in"
+
 endmenu
diff --git a/package/nxp/helper.mk b/package/nxp/helper.mk
index 79e4236249..2eee2227af 100644
--- a/package/nxp/helper.mk
+++ b/package/nxp/helper.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+NXP_QORIQ_SITE = http://www.nxp.com/lgfiles/sdk/lsdk1909
+
 # Helper for self-extracting binaries distributed by NXP.
 #
 # The --force option makes sure it doesn't fail if the source
diff --git a/package/nxp/qoriq-cadence-dp-firmware/Config.in b/package/nxp/qoriq-cadence-dp-firmware/Config.in
new file mode 100644
index 0000000000..3f494bd3a3
--- /dev/null
+++ b/package/nxp/qoriq-cadence-dp-firmware/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_QORIQ_CADENCE_DP_FIRMWARE
+	bool "qoriq-cadence-dp-firmware"
+	help
+	  NXP QorIQ cadence DP firmware, a resident EL3 firmware.
diff --git a/package/nxp/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash b/package/nxp/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
new file mode 100644
index 0000000000..89aaf1d71b
--- /dev/null
+++ b/package/nxp/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 5871c5717be32f14a59624d5699d405e8ce9ae2e9c9ef86fd16e13d264a40e58  firmware-cadence-lsdk1909.bin
+sha256 d55f024af2bfff714b90de596f6d0399124b999e8c18a86b13a3b507bae6f561  COPYING
diff --git a/package/nxp/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk b/package/nxp/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
new file mode 100644
index 0000000000..239f4b9d75
--- /dev/null
+++ b/package/nxp/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# qoriq-cadence-dp-firmware
+#
+################################################################################
+
+QORIQ_CADENCE_DP_FIRMWARE_VERSION = lsdk1909
+QORIQ_CADENCE_DP_FIRMWARE_SITE = $(NXP_QORIQ_SITE)
+QORIQ_CADENCE_DP_FIRMWARE_SOURCE = firmware-cadence-$(QORIQ_CADENCE_DP_FIRMWARE_VERSION).bin
+QORIQ_CADENCE_DP_FIRMWARE_LICENSE = NXP-Binary-EULA
+QORIQ_CADENCE_DP_FIRMWARE_LICENSE_FILES = COPYING
+QORIQ_CADENCE_DP_FIRMWARE_INSTALL_IMAGES = YES
+QORIQ_CADENCE_DP_FIRMWARE_INSTALL_TARGET = NO
+
+define QORIQ_CADENCE_DP_FIRMWARE_EXTRACT_CMDS
+	$(call NXP_EXTRACT_HELPER,$(QORIQ_CADENCE_DP_FIRMWARE_DL_DIR)/$(QORIQ_CADENCE_DP_FIRMWARE_SOURCE))
+endef
+
+define QORIQ_CADENCE_DP_FIRMWARE_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/dp/ls1028a-dp-fw.bin $(BINARIES_DIR)/ls1028a-dp-fw.bin
+endef
+
+$(eval $(generic-package))
-- 
2.17.1
