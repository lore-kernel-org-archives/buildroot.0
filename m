From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 4 May 2021 22:12:36 +0200
Subject: [Buildroot] [git commit] configs/aarch64_efi: bump kernel version
 and update
Message-ID: <20210504194457.E1D7F818D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f01b0b1a3d321637466cbb9dacd65cd02797956a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump kernel to version 5.11.16.

We remove the hardcoded ttyAMA0 and rely on the firmware to discover our
console. This enables serial console on systems, which do not have an Arm
pl011 UART.

We switch to GPT disklabel and discover our root filesystem using its
PARTLABEL. This enables booting from more media, such as HDD, SD card or
USB.

We update the readme, which hinted that ACPI was mandatory. This is not
strictly the case as we can also boot with a dtb and/or a U-Boot based
firmware, with no ACPI. While at it, mention EBBR, SystemReady and explain
how to build and use a U-Boot-based qemu firmware.

Signed-off-by: Vincent Stehl?? <vincent.stehle@arm.com>
Cc: Erico Nunes <nunes.erico@gmail.com>
Reviewed-by: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/aarch64-efi/genimage-efi.cfg |  8 +++++---
 board/aarch64-efi/grub.cfg         |  2 +-
 board/aarch64-efi/readme.txt       | 21 ++++++++++++++++++++-
 configs/aarch64_efi_defconfig      |  7 +++----
 4 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/board/aarch64-efi/genimage-efi.cfg b/board/aarch64-efi/genimage-efi.cfg
index f93ab9d64f..34cca1d64e 100644
--- a/board/aarch64-efi/genimage-efi.cfg
+++ b/board/aarch64-efi/genimage-efi.cfg
@@ -14,17 +14,19 @@ image efi-part.vfat {
 }
 
 image disk.img {
-
   hdimage {
+    gpt = true
   }
 
   partition boot {
-    partition-type = 0xEF
     image = "efi-part.vfat"
+    partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
+    offset = 32768
+    bootable = true
   }
 
   partition root {
-    partition-type = 0x83
+    partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
     image = "rootfs.ext2"
   }
 }
diff --git a/board/aarch64-efi/grub.cfg b/board/aarch64-efi/grub.cfg
index ab88da91b9..d99e19c4cd 100644
--- a/board/aarch64-efi/grub.cfg
+++ b/board/aarch64-efi/grub.cfg
@@ -2,5 +2,5 @@ set default="0"
 set timeout="5"
 
 menuentry "Buildroot" {
-	linux /Image root=/dev/vda2 rootwait console=ttyAMA0
+	linux /Image root=PARTLABEL=root rootwait
 }
diff --git a/board/aarch64-efi/readme.txt b/board/aarch64-efi/readme.txt
index 65a6345b6c..164993eea4 100644
--- a/board/aarch64-efi/readme.txt
+++ b/board/aarch64-efi/readme.txt
@@ -1,6 +1,10 @@
 
 The aarch64_efi_defconfig allows to build a minimal Linux system that
-can boot on all AArch64 servers providing an EFI firmware and ACPI.
+can boot on all AArch64 servers providing an EFI firmware.
+
+This includes all Arm EBBR[1] compliant systems, and all Arm SystemReady[2]
+compliant systems for example.
+
 
 Building and booting
 ====================
@@ -32,3 +36,18 @@ Note that </path/to/QEMU_EFI.fd> needs to point to a valid aarch64 UEFI
 firmware image for qemu.
 It may be provided by your distribution as a edk2-aarch64 or AAVMF
 package, in path such as /usr/share/edk2/aarch64/QEMU_EFI.fd .
+
+U-Boot based qemu firmware
+==========================
+
+A qemu firmware with support for UEFI based on U-Boot can be built following
+the instructions in [3], with qemu_arm64_defconfig.
+
+This should give you a nor_flash.bin, which you can use with qemu as an
+alternative to QEMU_EFI.fd. You will also need to change the machine
+specification to "-M virt,secure" on qemu command line, to enable TrustZone
+support, and you will need to increase the memory with "-m 1024".
+
+[1]: https://github.com/ARM-software/ebbr
+[2]: https://developer.arm.com/architectures/system-architectures/arm-systemready
+[3]: https://github.com/glikely/u-boot-tfa-build
diff --git a/configs/aarch64_efi_defconfig b/configs/aarch64_efi_defconfig
index 99600575ed..6cb8d1fac2 100644
--- a/configs/aarch64_efi_defconfig
+++ b/configs/aarch64_efi_defconfig
@@ -5,7 +5,6 @@ BR2_aarch64=y
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 
 # System
-BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 
 ## Required tools to create bootable media
@@ -23,13 +22,13 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/aarch64-efi/post-image.sh support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/aarch64-efi/genimage-efi.cfg"
 
-# Linux headers same as kernel, a 5.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_9=y
+# Linux headers same as kernel, a 5.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.9.11"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.11.16"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
