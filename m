From: Mike Frampton <mikeframpo@gmail.com>
Date: Tue, 27 Oct 2020 20:50:55 +1300
Subject: [Buildroot] [PATCH 2/3] package/qcom-db410c-firmware: add support
 for DB410c Wifi Added new package. Installs required Wifi firmware blobs on
 the target.
In-Reply-To: <20201027075056.10753-1-mikeframpo@gmail.com>
References: <20201027075056.10753-1-mikeframpo@gmail.com>
Message-ID: <20201027075056.10753-2-mikeframpo@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Frampton <mikeframpo@gmail.com>
---
 configs/qcom_db410c_defconfig                 |  1 +
 package/Config.in                             |  1 +
 package/qcom-db410c-firmware/Config.in        |  5 ++++
 .../qcom-db410c-firmware.mk                   | 28 +++++++++++++++++++
 4 files changed, 35 insertions(+)
 create mode 100644 package/qcom-db410c-firmware/Config.in
 create mode 100644 package/qcom-db410c-firmware/qcom-db410c-firmware.mk

diff --git a/configs/qcom_db410c_defconfig b/configs/qcom_db410c_defconfig
index 835e34453d..470d55efde 100644
--- a/configs/qcom_db410c_defconfig
+++ b/configs/qcom_db410c_defconfig
@@ -8,6 +8,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
 BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_QCOM_VENUS=y
 BR2_PACKAGE_LINUX_FIRMWARE_QCOM_ADRENO=y
+BR2_PACKAGE_QCOM_DB410C_FIRMWARE=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
diff --git a/package/Config.in b/package/Config.in
index d7e79f4795..6ceff1107c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -400,6 +400,7 @@ menu "Firmware"
 	source "package/b43-firmware/Config.in"
 	source "package/linux-firmware/Config.in"
 	source "package/murata-cyw-fw/Config.in"
+	source "package/qcom-db410c-firmware/Config.in"
 	source "package/rpi-bt-firmware/Config.in"
 	source "package/rpi-firmware/Config.in"
 	source "package/rpi-wifi-firmware/Config.in"
diff --git a/package/qcom-db410c-firmware/Config.in b/package/qcom-db410c-firmware/Config.in
new file mode 100644
index 0000000000..8ad768230b
--- /dev/null
+++ b/package/qcom-db410c-firmware/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_QCOM_DB410C_FIRMWARE
+	bool "qcom-db410c-firmware"
+	help
+	  Wifi/BT firmware for Qualcomm Dragonboard 410c SBC.
+
diff --git a/package/qcom-db410c-firmware/qcom-db410c-firmware.mk b/package/qcom-db410c-firmware/qcom-db410c-firmware.mk
new file mode 100644
index 0000000000..5a1e6bbca4
--- /dev/null
+++ b/package/qcom-db410c-firmware/qcom-db410c-firmware.mk
@@ -0,0 +1,28 @@
+
+QCOM_DB410C_FIRMWARE_VERSION = r1034.2.1
+QCOM_DB410C_FIRMWARE_BASE = linux-board-support-package-$(QCOM_DB410C_FIRMWARE_VERSION)
+QCOM_DB410C_FIRMWARE_SOURCE = $(QCOM_DB410C_FIRMWARE_BASE).zip
+QCOM_DB410C_FIRMWARE_SITE = https://releases.linaro.org/96boards/dragonboard410c/qualcomm/firmware
+
+QCOM_DB410C_FIRMWARE_LICENCE = Qualcomm firmware license
+QCOM_DB410C_FIRMWARE_LICENSE_FILES = LICENSE
+
+QCOM_DB410C_FIRMWARE_INSTALL_TARGET = YES
+
+define QCOM_DB410C_FIRMWARE_EXTRACT_CMDS
+        $(UNZIP) -d $(@D) $(QCOM_DB410C_FIRMWARE_DL_DIR)/$(QCOM_DB410C_FIRMWARE_SOURCE)
+endef
+
+define QCOM_DB410C_FIRMWARE_INSTALL_TARGET_CMDS
+	$(INSTALL) -d $(TARGET_DIR)/boot
+	cp $(@D)/$(QCOM_DB410C_FIRMWARE_BASE)/efs-seed/fs_image_linux.tar.gz.mbn.img $(TARGET_DIR)/boot/modem_fsg
+
+	$(INSTALL) -d $(TARGET_DIR)/lib/firmware
+	cp -r $(@D)/$(QCOM_DB410C_FIRMWARE_BASE)/proprietary-linux/wlan $(TARGET_DIR)/lib/firmware/
+
+	$(INSTALL) -d $(TARGET_DIR)/lib/firmware/qcom/msm8916
+	MTOOLS_SKIP_CHECK=1 mcopy -i $(@D)/$(QCOM_DB410C_FIRMWARE_BASE)/bootloaders-linux/NON-HLOS.bin \
+		::image/modem.* ::image/mba.mbn ::image/wcnss.* $(TARGET_DIR)/lib/firmware/qcom/msm8916
+endef
+
+$(eval $(generic-package))
-- 
2.25.1
