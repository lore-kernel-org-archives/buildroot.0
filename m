From: Dick Olsson <hi@senzilla.io>
Date: Fri, 18 Dec 2020 20:28:03 +0000
Subject: [Buildroot] [PATCH v3 10/11]
 configs/socionext_developerbox_defconfig: new config for Developerbox
In-Reply-To: <20201218202646.1060123-1-hi@senzilla.io>
References: <20201218202646.1060123-1-hi@senzilla.io>
Message-ID: <20201218202646.1060123-11-hi@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This introduces configuration for the Socionext Developerbox. Its an
Aarch64 workstation built with ARM Trusted Firmware and EDK2 firmware.

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 board/socionext/developerbox/genimage.cfg  | 24 ++++++++++++++++++++++
 board/socionext/developerbox/post-image.sh |  9 ++++++++
 board/socionext/developerbox/readme.txt    | 14 +++++++++++++
 configs/socionext_developerbox_defconfig   | 21 +++++++++++++++++++
 4 files changed, 68 insertions(+)
 create mode 100644 board/socionext/developerbox/genimage.cfg
 create mode 100755 board/socionext/developerbox/post-image.sh
 create mode 100644 board/socionext/developerbox/readme.txt
 create mode 100644 configs/socionext_developerbox_defconfig

diff --git a/board/socionext/developerbox/genimage.cfg b/board/socionext/developerbox/genimage.cfg
new file mode 100644
index 0000000000..5d8457e4ac
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
+image sdcard.img {
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
diff --git a/board/socionext/developerbox/post-image.sh b/board/socionext/developerbox/post-image.sh
new file mode 100755
index 0000000000..7dfea3fa9d
--- /dev/null
+++ b/board/socionext/developerbox/post-image.sh
@@ -0,0 +1,9 @@
+#!/bin/bash
+
+set -e
+
+EFI_DIR=${BINARIES_DIR}/efi-part/EFI/BOOT
+
+# Set up the kernel executable according to the UEFI standard.
+mkdir -p ${EFI_DIR}
+ln -sf ${BINARIES_DIR}/Image ${EFI_DIR}/bootaa64.efi
diff --git a/board/socionext/developerbox/readme.txt b/board/socionext/developerbox/readme.txt
new file mode 100644
index 0000000000..c596051187
--- /dev/null
+++ b/board/socionext/developerbox/readme.txt
@@ -0,0 +1,14 @@
+Intro
+=====
+
+This is the board support for the Socionext SynQuacer Developerbox (SC2A11).
+The firmware is built with ARM Trusted Firmware and EDK2 (UEFI).
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
index 0000000000..1848ed449a
--- /dev/null
+++ b/configs/socionext_developerbox_defconfig
@@ -0,0 +1,21 @@
+BR2_aarch64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_9=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/socionext/developerbox/post-image.sh support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/socionext/developerbox/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.9.12"
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
2.25.1
