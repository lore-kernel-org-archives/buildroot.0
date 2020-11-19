From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Nov 2020 23:00:57 +0100
Subject: [Buildroot] [git commit branch/next] package/qcom-db410c-firmware:
 new package
Message-ID: <20201119215317.3B2DA8688A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c51fc3897ab98630f9a9896f41afe32092b36fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Installs the required Wifi/BT firmware blobs for the Qualcomm
Dragonboard 410c SBC.

Signed-off-by: Mike Frampton <mikeframpo@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  3 ++
 package/Config.in                                  |  1 +
 package/qcom-db410c-firmware/Config.in             |  7 ++++
 .../qcom-db410c-firmware/qcom-db410c-firmware.hash |  3 ++
 .../qcom-db410c-firmware/qcom-db410c-firmware.mk   | 41 ++++++++++++++++++++++
 5 files changed, 55 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d0c9c16423..a76b539285 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1864,6 +1864,9 @@ N:	Michel Stempin <michel.stempin@wanadoo.fr>
 F:	board/licheepi/
 F:	configs/licheepi_zero_defconfig
 
+N:	Mike Frampton <mikeframpo@gmail.com>
+F:	package/qcom-db410c-firmware/
+
 N:	Mike Harmony <mike.harmony@snapav.com>
 F:	board/sinovoip/m2-plus/
 F:	configs/bananapi_m2_plus_defconfig
diff --git a/package/Config.in b/package/Config.in
index d32a271113..3c5664f723 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -402,6 +402,7 @@ menu "Firmware"
 	source "package/linux-firmware/Config.in"
 	source "package/murata-cyw-fw/Config.in"
 	source "package/odroidc2-firmware/Config.in"
+	source "package/qcom-db410c-firmware/Config.in"
 	source "package/rpi-bt-firmware/Config.in"
 	source "package/rpi-firmware/Config.in"
 	source "package/rpi-wifi-firmware/Config.in"
diff --git a/package/qcom-db410c-firmware/Config.in b/package/qcom-db410c-firmware/Config.in
new file mode 100644
index 0000000000..9f68857490
--- /dev/null
+++ b/package/qcom-db410c-firmware/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_QCOM_DB410C_FIRMWARE
+	bool "qcom-db410c-firmware"
+	select BR2_PACKAGE_HOST_MTOOLS
+	help
+	  Wifi/BT firmware for Qualcomm Dragonboard 410c SBC.
+
+	  https://releases.linaro.org/96boards/dragonboard410c/qualcomm/firmware/
diff --git a/package/qcom-db410c-firmware/qcom-db410c-firmware.hash b/package/qcom-db410c-firmware/qcom-db410c-firmware.hash
new file mode 100644
index 0000000000..e8ac31eb39
--- /dev/null
+++ b/package/qcom-db410c-firmware/qcom-db410c-firmware.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  46953b974c5c58c7ca66db414437c0268b033ac9d28127e98d9c4e1a49359da5  linux-board-support-package-r1034.2.1.zip
+sha256  11e60ad6f83c2a86e40dca374c24230b53650dd3e0adf2e72c15f8cafedc2e5a  LICENSE
diff --git a/package/qcom-db410c-firmware/qcom-db410c-firmware.mk b/package/qcom-db410c-firmware/qcom-db410c-firmware.mk
new file mode 100644
index 0000000000..9ef32cc9d4
--- /dev/null
+++ b/package/qcom-db410c-firmware/qcom-db410c-firmware.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# qcom-db410c-firmware
+#
+################################################################################
+
+QCOM_DB410C_FIRMWARE_VERSION = 1034.2.1
+QCOM_DB410C_FIRMWARE_BASE = linux-board-support-package-r$(QCOM_DB410C_FIRMWARE_VERSION)
+QCOM_DB410C_FIRMWARE_SOURCE = $(QCOM_DB410C_FIRMWARE_BASE).zip
+QCOM_DB410C_FIRMWARE_SITE = https://releases.linaro.org/96boards/dragonboard410c/qualcomm/firmware
+QCOM_DB410C_FIRMWARE_LICENCE = Qualcomm firmware license
+QCOM_DB410C_FIRMWARE_LICENSE_FILES = LICENSE
+QCOM_DB410C_FIRMWARE_DEPENDENCIES = host-mtools
+
+define QCOM_DB410C_FIRMWARE_EXTRACT_CMDS
+	$(UNZIP) -d $(@D) \
+		$(QCOM_DB410C_FIRMWARE_DL_DIR)/$(QCOM_DB410C_FIRMWARE_SOURCE)
+	mv $(@D)/$(QCOM_DB410C_FIRMWARE_BASE)/* $(@D)
+	rmdir $(@D)/$(QCOM_DB410C_FIRMWARE_BASE)
+endef
+
+# Install the Wifi/Bt firmware blobs to target. These commands are
+# based on firmware-qcom-dragonboard410c_*.bb in the OpenEmbedded
+# meta-qcom layer, see https://github.com/ndechesne/meta-qcom
+define QCOM_DB410C_FIRMWARE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0644 \
+		$(@D)/efs-seed/fs_image_linux.tar.gz.mbn.img \
+		$(TARGET_DIR)/boot/modem_fsg
+
+	$(INSTALL) -d $(TARGET_DIR)/lib/firmware
+	cp -r $(@D)/proprietary-linux/wlan \
+		$(TARGET_DIR)/lib/firmware/
+
+	$(INSTALL) -d $(TARGET_DIR)/lib/firmware/qcom/msm8916
+	MTOOLS_SKIP_CHECK=1 $(HOST_DIR)/bin/mcopy -n -i \
+		$(@D)/bootloaders-linux/NON-HLOS.bin \
+		::image/modem.* ::image/mba.mbn ::image/wcnss.* \
+		$(TARGET_DIR)/lib/firmware/qcom/msm8916
+endef
+
+$(eval $(generic-package))
