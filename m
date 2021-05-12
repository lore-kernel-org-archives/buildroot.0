From: Dick Olsson <hi@senzilla.io>
Date: Wed, 12 May 2021 18:36:51 +0000
Subject: [Buildroot] [PATCH v5 07/10]
 configs/socionext_developerbox_defconfig: new config for Developerbox
Message-ID: <CGRX95XeVXODG9bgpB42Pwhfs947f6bws2DAtg@cp3-web-033.plabs.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This introduces configuration for the Socionext Developerbox, an
Aarch64 workstation built with ARM Trusted Firmware and EDK2 firmware.

Signed-off-by: Dick Olsson <hi@senzilla.io>

---

Revision 5:

 * Replaced kernel EFI stub mode with GRUB2 for more convenience
 * The GRUB2 package handles the efi-part image
 * Simplified the post script
 * Removed the startup.nsh in favour of that provided by GRUB2
 * Re-exported the defconfig

Revision 4:

 * Renamed post-image.sh to assemble-flash-images
 * Updated to Linux LTS kernel 5.10
 * Added startup.nsh script for auto-booting from the EFI shell
---
 .../developerbox/assemble-flash-images        |  7 +++++
 board/socionext/developerbox/genimage.cfg     | 30 +++++++++++++++++++
 board/socionext/developerbox/grub.cfg         |  6 ++++
 board/socionext/developerbox/readme.txt       | 16 ++++++++++
 configs/socionext_developerbox_defconfig      | 24 +++++++++++++++
 5 files changed, 83 insertions(+)
 create mode 100755 board/socionext/developerbox/assemble-flash-images
 create mode 100644 board/socionext/developerbox/genimage.cfg
 create mode 100644 board/socionext/developerbox/grub.cfg
 create mode 100644 board/socionext/developerbox/readme.txt
 create mode 100644 configs/socionext_developerbox_defconfig

diff --git a/board/socionext/developerbox/assemble-flash-images b/board/socionext/developerbox/assemble-flash-images
new file mode 100755
index 0000000000..51e4e33458
--- /dev/null
+++ b/board/socionext/developerbox/assemble-flash-images
@@ -0,0 +1,7 @@
+#!/bin/bash
+
+set -e
+
+BOARD_DIR="$(dirname $0)"
+
+cp -f ${BOARD_DIR}/grub.cfg ${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg
diff --git a/board/socionext/developerbox/genimage.cfg b/board/socionext/developerbox/genimage.cfg
new file mode 100644
index 0000000000..285b308d90
--- /dev/null
+++ b/board/socionext/developerbox/genimage.cfg
@@ -0,0 +1,30 @@
+image efi-part.vfat {
+  vfat {
+    file startup.nsh {
+      image = "efi-part/startup.nsh"
+    }
+    file EFI {
+      image = "efi-part/EFI"
+    }
+    file Image {
+      image = "Image"
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
diff --git a/board/socionext/developerbox/grub.cfg b/board/socionext/developerbox/grub.cfg
new file mode 100644
index 0000000000..ab88da91b9
--- /dev/null
+++ b/board/socionext/developerbox/grub.cfg
@@ -0,0 +1,6 @@
+set default="0"
+set timeout="5"
+
+menuentry "Buildroot" {
+	linux /Image root=/dev/vda2 rootwait console=ttyAMA0
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
diff --git a/configs/socionext_developerbox_defconfig b/configs/socionext_developerbox_defconfig
new file mode 100644
index 0000000000..4d8e9b7c05
--- /dev/null
+++ b/configs/socionext_developerbox_defconfig
@@ -0,0 +1,24 @@
+BR2_aarch64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/socionext/developerbox/assemble-flash-images support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/socionext/developerbox/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.34"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="synquacer"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS="bl31 fiptool"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="PRELOADED_BL33_BASE=0x8200000"
+BR2_TARGET_EDK2=y
+BR2_TARGET_EDK2_PLATFORM_SOCIONEXT_DEVELOPERBOX=y
+BR2_TARGET_GRUB2=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.30.2
