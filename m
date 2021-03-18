From: Dick Olsson <hi@senzilla.io>
Date: Thu, 18 Mar 2021 15:43:32 +0000
Subject: [Buildroot] [PATCH v4 09/10]
 configs/solidrun_macchiatobin_efi_defconfig: EFI config for MacchiatoBin
Message-ID: <BR9BhREuAfwfd9s4mqI0EWezwoEfLpNZ5ISfiQPgxQ@cp4-web-040.plabs.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This introduces an alternative board build for the MacchiatoBin based on
EDK2 (UEFI) firmware loaded as BL33 by ARM Trusted Firmware.

Signed-off-by: Dick Olsson <hi@senzilla.io>

---

Revision 4:

 * Renamed post-image.sh to assemble-flash-images
 * Updated to Linux LTS kernel 5.10
 * Added startup.nsh for auto-booting from the EFI shell

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 .../macchiatobin-efi/assemble-flash-images    | 14 +++
 board/solidrun/macchiatobin-efi/genimage.cfg  | 24 +++++
 .../solidrun/macchiatobin-efi/linux.fragment  |  3 +
 board/solidrun/macchiatobin-efi/readme.txt    | 90 +++++++++++++++++++
 board/solidrun/macchiatobin-efi/startup.nsh   |  1 +
 configs/solidrun_macchiatobin_efi_defconfig   | 25 ++++++
 6 files changed, 157 insertions(+)
 create mode 100755 board/solidrun/macchiatobin-efi/assemble-flash-images
 create mode 100644 board/solidrun/macchiatobin-efi/genimage.cfg
 create mode 100644 board/solidrun/macchiatobin-efi/linux.fragment
 create mode 100644 board/solidrun/macchiatobin-efi/readme.txt
 create mode 100644 board/solidrun/macchiatobin-efi/startup.nsh
 create mode 100644 configs/solidrun_macchiatobin_efi_defconfig

diff --git a/board/solidrun/macchiatobin-efi/assemble-flash-images b/board/solidrun/macchiatobin-efi/assemble-flash-images
new file mode 100755
index 0000000000..22a86e1f6b
--- /dev/null
+++ b/board/solidrun/macchiatobin-efi/assemble-flash-images
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
diff --git a/board/solidrun/macchiatobin-efi/genimage.cfg b/board/solidrun/macchiatobin-efi/genimage.cfg
new file mode 100644
index 0000000000..5d8457e4ac
--- /dev/null
+++ b/board/solidrun/macchiatobin-efi/genimage.cfg
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
diff --git a/board/solidrun/macchiatobin-efi/linux.fragment b/board/solidrun/macchiatobin-efi/linux.fragment
new file mode 100644
index 0000000000..29fd630626
--- /dev/null
+++ b/board/solidrun/macchiatobin-efi/linux.fragment
@@ -0,0 +1,3 @@
+CONFIG_MARVELL_PHY=y
+CONFIG_MARVELL_10G_PHY=y
+CONFIG_SFP=y
diff --git a/board/solidrun/macchiatobin-efi/readme.txt b/board/solidrun/macchiatobin-efi/readme.txt
new file mode 100644
index 0000000000..b9794dd3d4
--- /dev/null
+++ b/board/solidrun/macchiatobin-efi/readme.txt
@@ -0,0 +1,90 @@
+Intro
+=====
+
+This is the board support for MacchiatoBin with a more modern firmware stack
+compared to the original build with board/solidrun/macchiatobin.
+
+The goal with this default configuration is to provide a build as close to
+ARM Server Base Boot Requirement (SBBR) as possible. This gives us the
+following benefits:
+
+ - The firmware is built and flashed separately from the OS image
+ - Therefore, the board will boot with any standard Aarch64 distribution image
+ - UEFI provides a more standardized firmware interface
+
+How to build
+============
+
+The default configuration provides the following stack:
+
+ - ARM Trusted Firmware (mainline)
+ - EDK2 UEFI firmware (mainline)
+ - Linux 5.9 (mainline)
+
+    $ make solidrun_macchiatobin_efi_defconfig
+    $ make
+
+The next step will depend on whether you have U-Boot or UEFI flashed on the
+board.
+
+How to flash the firmware from U-Boot
+=====================================
+
+In this example we will assume that the board has U-Boot flashed on it. We will
+flash the new UEFI firmware from the U-Boot console to the SPI flash, using
+the "bubt" (Burn ATF) command.
+
+Once the build process is finished you will have an image called
+"flash-image.bin" in the output/images/ directory.
+
+First, format a USB drive with an EXT4 partition and copy the "flash-image.bin"
+file onto the USB drive.
+
+Second, attach to the serial console[1], insert the USB drive into the board,
+boot the board and enter the U-Boot console. On the U-Boot console enter the
+following commands:
+
+    usb start
+    bubt flash-image.bin spi usb
+
+Lastly, unplug the USB drive and reboot the board. The board will now
+boot with the newly flashed UEFI firmware.
+
+How to flash the firmware from UEFI
+===================================
+
+In this example we will assume that the board has UEFI flashed on it. We will
+flash the new UEFI firmware from the old UEFI console to the SPI flash, using
+the "fupdate" command.
+
+First, format a USB drive with an FAT partition and copy the "flash-image.bin"
+file onto the USB drive.
+
+Second, attach to the serial console[1], insert the USB drive into the board,
+boot the board and enter the UEFI shell. In the UEFI shell, find what file
+system your USB drive got mapped to by using the "map" and "ls" commands.
+Then enter this command (assuming your USB drive is on "FS0"):
+
+    fupdate FS0:\flash-image.bin spi
+
+Lastly, unplug the USB drive and reboot the board. The board will now
+boot with the newly flashed UEFI firmware.
+
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory. This image only contains the Linux kernel and
+the rest of the operating system.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX bs=1M conv=fsync
+  $ sudo sync
+
+Plug in the SD card into the board and boot.
+
+Note that because the board is now using UEFI firmware, the board will also
+boot any other standard Aarch64 distribution image.
+
+[1]: http://wiki.espressobin.net/tiki-index.php?page=Quick+User+Guide
diff --git a/board/solidrun/macchiatobin-efi/startup.nsh b/board/solidrun/macchiatobin-efi/startup.nsh
new file mode 100644
index 0000000000..79c00ce65c
--- /dev/null
+++ b/board/solidrun/macchiatobin-efi/startup.nsh
@@ -0,0 +1 @@
+FS0:\EFI\BOOT\bootaa64.efi console=ttyS0,115200n8 root=/dev/mmcblk1p2 rootwait
diff --git a/configs/solidrun_macchiatobin_efi_defconfig b/configs/solidrun_macchiatobin_efi_defconfig
new file mode 100644
index 0000000000..a71b5fa322
--- /dev/null
+++ b/configs/solidrun_macchiatobin_efi_defconfig
@@ -0,0 +1,25 @@
+BR2_aarch64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/solidrun/macchiatobin-efi/assemble-flash-images support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/solidrun/macchiatobin-efi/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.2"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/solidrun/macchiatobin-efi/linux.fragment"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="a80x0_mcbin"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS="mrvl_flash"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="USE_COHERENT_MEM=0"
+BR2_TARGET_BINARIES_MARVELL=y
+BR2_TARGET_EDK2=y
+BR2_TARGET_EDK2_PLATFORM_SOLIDRUN_ARMADA80X0MCBIN=y
+BR2_TARGET_MV_DDR_MARVELL=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.24.3 (Apple Git-128)
