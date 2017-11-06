From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Mon,  6 Nov 2017 13:16:50 +0300
Subject: [Buildroot] [PATCH v2 1/3] armbian-firmware: new package
In-Reply-To: <20171106101652.28861-1-geomatsi@gmail.com>
References: <20171106101652.28861-1-geomatsi@gmail.com>
Message-ID: <20171106101652.28861-2-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package enables access to firmware blobs from Armbian firmware
repository: https://github.com/armbian/firmware

That repository contains multiple firmware blobs grouped by vendor.
For the sake of convenience each group can be independently selected
using Kconfig options. This commit enables the following options:
- firmware blobs for XR819 SDIO WiFi chip
- firmware blobs for AP6212 WiFi/BT combo

Armbian firmware repository does not include any specific licenses.
Most part of those firmware blobs belongs to various Android/Linux
SDK packages provided by board vendors. As a result, this package
makes use of the following conservative approach for all the
selected firmware binaries:
  FIRMWARE_LICENSE = PROPRIETARY
  FIRMWARE_REDISTRIBUTE = NO

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/armbian-firmware/Config.in             | 21 ++++++++++
 package/armbian-firmware/armbian-firmware.hash |  2 +
 package/armbian-firmware/armbian-firmware.mk   | 53 ++++++++++++++++++++++++++
 5 files changed, 78 insertions(+)
 create mode 100644 package/armbian-firmware/Config.in
 create mode 100644 package/armbian-firmware/armbian-firmware.hash
 create mode 100644 package/armbian-firmware/armbian-firmware.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c651bf26fa..d27d55f73d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1432,6 +1432,7 @@ F:	package/mpir/
 
 N:	Sergey Matyukevich <geomatsi@gmail.com>
 F:	package/xr819-xradio/
+F:	package/armbian-firmware/
 
 N:	Sergio Prado <sergio.prado@e-labworks.com>
 F:	package/libgdiplus/
diff --git a/package/Config.in b/package/Config.in
index fe5ccc434e..23526b4124 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -369,6 +369,7 @@ menu "Firmware"
 	source "package/wilc1000-firmware/Config.in"
 	source "package/wilink-bt-firmware/Config.in"
 	source "package/zd1211-firmware/Config.in"
+	source "package/armbian-firmware/Config.in"
 endmenu
 	source "package/a10disp/Config.in"
 	source "package/acpica/Config.in"
diff --git a/package/armbian-firmware/Config.in b/package/armbian-firmware/Config.in
new file mode 100644
index 0000000000..766c291697
--- /dev/null
+++ b/package/armbian-firmware/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_ARMBIAN_FIRMWARE
+	bool "armbian-firmware"
+	help
+	  This package enables access to various firmware
+	  blobs from Armbian firmware repository.
+
+	  https://github.com/armbian/firmware
+
+if BR2_PACKAGE_ARMBIAN_FIRMWARE
+
+config BR2_PACKAGE_ARMBIAN_FIRMWARE_XR819
+	bool "XR819 WiFi"
+	help
+	  Firmware files for XR819 WiFi SDIO chip.
+
+config BR2_PACKAGE_ARMBIAN_FIRMWARE_AP6212
+	bool "AP6212 WiFi/BT"
+	help
+	  Firmware files for AP6212 WiFi/BT combo chip.
+
+endif
diff --git a/package/armbian-firmware/armbian-firmware.hash b/package/armbian-firmware/armbian-firmware.hash
new file mode 100644
index 0000000000..0f3858dedf
--- /dev/null
+++ b/package/armbian-firmware/armbian-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 876958ce6ba8a4a01a424f2b4455208b7a989eaba96015649c774340553f0c35 armbian-firmware-455d6b6701178dafe7fd0168eb4a4ef78a8d24a3.tar.gz
diff --git a/package/armbian-firmware/armbian-firmware.mk b/package/armbian-firmware/armbian-firmware.mk
new file mode 100644
index 0000000000..b31f4a12c7
--- /dev/null
+++ b/package/armbian-firmware/armbian-firmware.mk
@@ -0,0 +1,53 @@
+################################################################################
+#
+# armbian-firmware
+#
+################################################################################
+
+ARMBIAN_FIRMWARE_VERSION = 455d6b6701178dafe7fd0168eb4a4ef78a8d24a3
+ARMBIAN_FIRMWARE_SITE = https://github.com/armbian/firmware
+ARMBIAN_FIRMWARE_SITE_METHOD = git
+
+# XR819 WiFi firmware
+ifeq ($(BR2_PACKAGE_ARMBIAN_FIRMWARE_XR819),y)
+ARMBIAN_FIRMWARE_FILES += \
+	xr819/boot_xr819.bin  \
+	xr819/fw_xr819.bin  \
+	xr819/sdd_xr819.bin
+endif
+
+# AP6212 WiFi/BT combo firmware
+ifeq ($(BR2_PACKAGE_ARMBIAN_FIRMWARE_AP6212),y)
+ARMBIAN_FIRMWARE_DIRS += ap6212
+endif
+
+ifneq ($(ARMBIAN_FIRMWARE_FILES),)
+define ARMBIAN_FIRMWARE_INSTALL_FILES
+	cd $(@D) ; \
+	$(TAR) c $(sort $(ARMBIAN_FIRMWARE_FILES)) | \
+		$(TAR) x -C $(TARGET_DIR)/lib/firmware
+endef
+endif
+
+ifneq ($(ARMBIAN_FIRMWARE_DIRS),)
+# We need to rm-rf the destination directory to avoid copying
+# into it in itself, should we re-install the package.
+define ARMBIAN_FIRMWARE_INSTALL_DIRS
+	$(foreach d,$(ARMBIAN_FIRMWARE_DIRS), \
+		rm -rf $(TARGET_DIR)/lib/firmware/$(d); \
+		cp -a $(@D)/$(d) $(TARGET_DIR)/lib/firmware/$(d)$(sep))
+endef
+endif
+
+ifneq ($(ARMBIAN_FIRMWARE_FILES)$(ARMBIAN_FIRMWARE_DIRS),)
+ARMBIAN_FIRMWARE_LICENSE = PROPRIETARY
+ARMBIAN_FIRMWARE_REDISTRIBUTE = NO
+endif
+
+define ARMBIAN_FIRMWARE_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/lib/firmware
+	$(ARMBIAN_FIRMWARE_INSTALL_FILES)
+	$(ARMBIAN_FIRMWARE_INSTALL_DIRS)
+endef
+
+$(eval $(generic-package))
-- 
2.11.0
