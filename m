From: Dick Olsson <hi@senzilla.io>
Date: Sun, 19 Jul 2020 18:10:21 +0000
Subject: [Buildroot] [PATCH 5/8] configs/aarch64_efi_defconfig: build the
 EDK2 firmware from source
In-Reply-To: <20200719180727.28202-1-hi@senzilla.io>
References: <20200719180727.28202-1-hi@senzilla.io>
Message-ID: <20200719180727.28202-6-hi@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Prior to this patch, you had to manually download a pre-built EDK2 flash device
image (QEMU_EFI.fd) in order to boot this configuration with QEMU. With this
patch, the configuration is now building EDK2 from source as a stand-alone
flash device file.

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 board/aarch64-efi/readme.txt  | 8 +++-----
 configs/aarch64_efi_defconfig | 3 +++
 2 files changed, 6 insertions(+), 5 deletions(-)

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
index 2aab6e9699..85eb478f71 100644
--- a/configs/aarch64_efi_defconfig
+++ b/configs/aarch64_efi_defconfig
@@ -33,6 +33,9 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.18.10"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
+# EDK2 firmware
+BR2_TARGET_EDK2=y
+
 # Host tools for genimage
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.20.1
