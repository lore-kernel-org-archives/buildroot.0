From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun, 12 Nov 2017 23:16:42 +0300
Subject: [Buildroot] [PATCH/next 1/5] armada-firmware: new package
In-Reply-To: <20171112201646.15558-1-geomatsi@gmail.com>
References: <20171112201646.15558-1-geomatsi@gmail.com>
Message-ID: <20171112201646.15558-2-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package adds SCP BL2 firmware for Marvell Armada 7040 and 8040 SoCs.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 boot/Config.in                            |  1 +
 boot/armada-firmware/Config.in            | 19 +++++++++++++++++++
 boot/armada-firmware/armada-firmware.hash |  2 ++
 boot/armada-firmware/armada-firmware.mk   | 18 ++++++++++++++++++
 4 files changed, 40 insertions(+)
 create mode 100644 boot/armada-firmware/Config.in
 create mode 100644 boot/armada-firmware/armada-firmware.hash
 create mode 100644 boot/armada-firmware/armada-firmware.mk

diff --git a/boot/Config.in b/boot/Config.in
index 2f46c8546e..0ffbd7288b 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -17,5 +17,6 @@ source "boot/ts4800-mbrboot/Config.in"
 source "boot/uboot/Config.in"
 source "boot/vexpress-firmware/Config.in"
 source "boot/xloader/Config.in"
+source "boot/armada-firmware/Config.in"
 
 endmenu
diff --git a/boot/armada-firmware/Config.in b/boot/armada-firmware/Config.in
new file mode 100644
index 0000000000..530b5622c8
--- /dev/null
+++ b/boot/armada-firmware/Config.in
@@ -0,0 +1,19 @@
+config BR2_TARGET_ARMADA_FIRMWARE
+	bool "armada-firmware"
+	depends on BR2_aarch64
+	help
+	  Marvell Armada SCP BL2 firmware images.
+
+if BR2_TARGET_ARMADA_FIRMWARE
+
+config BR2_TARGET_ARMADA_FIRMWARE_IMAGE
+	string "Armada SCP BL2 image name"
+	help
+	  Armada SCP BL2 firmware image name.
+
+config BR2_TARGET_ARMADA_FIRMWARE_VERSION
+	string "Armada SCP BL2 image version"
+	help
+	  Armada SCP BL2 firmware image version.
+
+endif
diff --git a/boot/armada-firmware/armada-firmware.hash b/boot/armada-firmware/armada-firmware.hash
new file mode 100644
index 0000000000..5eeca9d6ea
--- /dev/null
+++ b/boot/armada-firmware/armada-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 b310443c0d51d07b7c11597548685ae608b8478eee7095925427da6ab71e0168 armada-firmware-binaries-marvell-armada-17.10.tar.gz
diff --git a/boot/armada-firmware/armada-firmware.mk b/boot/armada-firmware/armada-firmware.mk
new file mode 100644
index 0000000000..d75dc7cb6c
--- /dev/null
+++ b/boot/armada-firmware/armada-firmware.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# Marvell Armada SCP BL2 firmware images
+#
+################################################################################
+
+ARMADA_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_ARMADA_FIRMWARE_VERSION))
+ARMADA_FIRMWARE_SITE = $(call github,MarvellEmbeddedProcessors,binaries-marvell,$(ARMADA_FIRMWARE_VERSION))
+ARMADA_FIRMWARE_LICENSE = Proprietary
+
+ARMADA_FIRMWARE_INSTALL_IMAGES  = YES
+
+define ARMADA_FIRMWARE_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/mrvl_scp_bl2_7040.img $(BINARIES_DIR)/mrvl_scp_bl2_7040.img
+	$(INSTALL) -D -m 0644 $(@D)/mrvl_scp_bl2_8040.img $(BINARIES_DIR)/mrvl_scp_bl2_8040.img
+endef
+
+$(eval $(generic-package))
-- 
2.11.0
