From: D. Olsson <hi@senzilla.io>
Date: Sun, 26 Jul 2020 10:07:02 +0000
Subject: [Buildroot] [PATCH v2 3/6] configs/aarch64_efi_defconfig: build the
 EDK2 firmware from source
Message-ID: <20200726100541.7710-4-hi@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Dick Olsson <hi@senzilla.io>

Prior to this, you had to manually download a pre-built EDK2 flash device
image (QEMU_EFI.fd) in order to boot this configuration with QEMU.
Now, the configuration is building EDK2 from source.

Signed-off-by: Dick Olsson <hi@senzilla.io>

---

Revision 2:

 * Explicitly added the default EDK2 platform to defconfig
---
 board/aarch64-efi/readme.txt  | 8 +++-----
 configs/aarch64_efi_defconfig | 2 ++
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/aarch64-efi/readme.txt b/board/aarch64-efi/readme.txt
index 65a6345b6c..08747027e1 100644
--- a/board/aarch64-efi/readme.txt
+++ b/board/aarch64-efi/readme.txt
@@ -22,13 +22,11 @@ qemu-system-aarch64 \
 	-cpu cortex-a57 \
 	-m 512 \
 	-nographic \
-	-bios </path/to/QEMU_EFI.fd> \
+	-bios output/images/QEMU_EFI.fd \
 	-drive file=output/images/disk.img,if=none,format=raw,id=hd0 \
 	-device virtio-blk-device,drive=hd0 \
 	-netdev user,id=eth0 \
 	-device virtio-net-device,netdev=eth0
 
-Note that </path/to/QEMU_EFI.fd> needs to point to a valid aarch64 UEFI
-firmware image for qemu.
-It may be provided by your distribution as a edk2-aarch64 or AAVMF
-package, in path such as /usr/share/edk2/aarch64/QEMU_EFI.fd .
+Note that output/images/QEMU_EFI.fd is the flash device file built by
+the EDK2 package.
diff --git a/configs/aarch64_efi_defconfig b/configs/aarch64_efi_defconfig
index 2aab6e9699..3da6542ea0 100644
--- a/configs/aarch64_efi_defconfig
+++ b/configs/aarch64_efi_defconfig
@@ -12,6 +12,8 @@ BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 
 # Bootloader
+BR2_TARGET_EDK2=y
+BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU=y
 BR2_TARGET_GRUB2=y
 BR2_TARGET_GRUB2_ARM64_EFI=y
 
-- 
2.20.1
