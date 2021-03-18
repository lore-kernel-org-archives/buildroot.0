From: Dick Olsson <hi@senzilla.io>
Date: Thu, 18 Mar 2021 15:43:25 +0000
Subject: [Buildroot] [PATCH v4 08/10]
 configs/socionext_developerbox_defconfig: new config for Developerbox
Message-ID: <T3SoFMBRAnJjeMy4YYF6AFBkVY9Q5U6GtaV6KHGmthc@cp3-web-021.plabs.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This introduces configuration for the Socionext Developerbox, an
Aarch64 workstation built with ARM Trusted Firmware and EDK2 firmware.

Signed-off-by: Dick Olsson <hi@senzilla.io>

---

Revision 4:

 * Renamed post-image.sh to assemble-flash-images
 * Updated to Linux LTS kernel 5.10
 * Added startup.nsh script for auto-booting from the EFI shell

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 .../developerbox/assemble-flash-images        | 14 +++++++++++
 board/socionext/developerbox/genimage.cfg     | 24 +++++++++++++++++++
 board/socionext/developerbox/readme.txt       | 16 +++++++++++++
 board/socionext/developerbox/startup.nsh      |  1 +
 configs/socionext_developerbox_defconfig      | 21 ++++++++++++++++
 5 files changed, 76 insertions(+)
 create mode 100755 board/socionext/developerbox/assemble-flash-images
 create mode 100644 board/socionext/developerbox/genimage.cfg
 create mode 100644 board/socionext/developerbox/readme.txt
 create mode 100644 board/socionext/developerbox/startup.nsh
 create mode 100644 configs/socionext_developerbox_defconfig

diff --git a/board/socionext/developerbox/assemble-flash-images b/board/socionext/developerbox/assemble-flash-images
new file mode 100755
index 0000000000..22a86e1f6b
--- /dev/null
+++ b/board/socionext/developerbox/assemble-flash-images
@@ -0,0 +1,14 @@
+#!/bin/bash
+
+set -e
+
+BOARD_DIR="$(dirname $0)"
+EFI_PART=${BINARIES_DIR}/efi-part
+EFI_DIR=${EFI_PART}/EFI/BOOT
+
+# Create the EFI system partition with startup script and kernel
+# executable according to the UEFI standard.
+rm -rf ${EFI_DIR}
+mkdir -p ${EFI_DIR}
+cp ${BOARD_DIR}/startup.nsh ${EFI_PART}/
+ln -sf ${BINARIES_DIR}/Image ${EFI_DIR}/bootaa64.efi
diff --git a/board/socionext/developerbox/genimage.cfg b/board/socionext/developerbox/genimage.cfg
new file mode 100644
index 0000000000..f653b1f35d
--- /dev/null
+++ b/board/socionext/developerbox/genimage.cfg
@@ -0,0 +1,24 @@
+image efi-part.vfat {
+  vfat {
+    file EFI {
+      image = "efi-part/EFI"
+    }
+  }
+  size = 32M
+}
+
+image disk.img {
+  hdimage {
+    gpt = true
+  }
+
+  partition boot {
+    partition-type = 0xEF
+    image = "efi-part.vfat"
+  }
+
+  partition root {
+    partition-type = 0x83
+    image = "rootfs.ext2"
+  }
+}
diff --git a/board/socionext/developerbox/readme.txt b/board/socionext/developerbox/readme.txt
new file mode 100644
index 0000000000..4c301c1353
--- /dev/null
+++ b/board/socionext/developerbox/readme.txt
@@ -0,0 +1,16 @@
+Intro
+=====
+
+This is the board support for the Socionext SynQuacer Developerbox (SC2A11).
+The firmware is built with ARM Trusted Firmware and EDK2 (UEFI).
+
+CM3_IMAGE.bin
+
+More info
+=========
+
+For more information about this board and the firmware see:
+
+- https://www.96boards.org/product/developerbox/
+- https://www.96boards.org/documentation/enterprise/developerbox/downloads/edk2.md.html
+- https://trustedfirmware-a.readthedocs.io/en/latest/plat/synquacer.html
diff --git a/board/socionext/developerbox/startup.nsh b/board/socionext/developerbox/startup.nsh
new file mode 100644
index 0000000000..8c85089d7d
--- /dev/null
+++ b/board/socionext/developerbox/startup.nsh
@@ -0,0 +1 @@
+FS0:\EFI\BOOT\bootaa64.efi root=/dev/sda2 rootwait
diff --git a/configs/socionext_developerbox_defconfig b/configs/socionext_developerbox_defconfig
new file mode 100644
index 0000000000..4a389eb48b
--- /dev/null
+++ b/configs/socionext_developerbox_defconfig
@@ -0,0 +1,21 @@
+BR2_aarch64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/socionext/developerbox/assemble-flash-images support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/socionext/developerbox/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.2"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="synquacer"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS="bl31 fiptool"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="PRELOADED_BL33_BASE=0x8200000"
+BR2_TARGET_EDK2=y
+BR2_TARGET_EDK2_PLATFORM_SOCIONEXT_DEVELOPERBOX=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.24.3 (Apple Git-128)
