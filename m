From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
Date: Fri, 23 Apr 2021 10:28:33 +0200
Subject: [Buildroot] [PATCH] configs/aarch64_efi: bump kernel version and
 update
Message-ID: <20210423082833.17674-1-vincent.stehle@arm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

Signed-off-by: Vincent Stehl? <vincent.stehle@arm.com>
Cc: Erico Nunes <nunes.erico@gmail.com>
---


Hi,

The aarch64_efi_defconfig by Erico working on Qemu is a good starting point for
Arm 64b UEFI systems; thank you Erico for that.

I would like to propose a few updates to this defconfig, to make it the
reference buildroot defconfig for all Arm 64b SystemReady[1] platforms.
Feedbacks are welcome.

Erico, if you feel this is too much changes compared to the initial defconfig
please do not hesitate to say so; we can always create another defconfig instead
if you prefer.

I have tested the resulting disk.img successfully on the following systems (with
appropriate firmware):

- Compulab IOT-GATE-iMX8, u-boot/dtb, usb
- NXP i.MX8M Mini EVK, u-boot/dtb, sd
- Qemu, edk2/acpi or u-boot/dtb, virtio
- Raspberry Pi 400, edk2/acpi, usb
- Renesas HiHope RZ/G2M, u-boot/dtb, usb
- Solidrun HoneyComb LX2, edk2/acpi or u-boot/dtb, usb
- Xilinx ZCU102, u-boot/dtb, usb, sd, sata

As mentioned in the readme.txt, Grant's build system[2] can be used to generate
u-boot/dtb UEFI firmware for some of the aforementioned systems. For Raspberry
Pi 400, an edk2/acpi firmware is available at [3]. For the Compulab board, a
firmware by Paul is available at [4].

I plan to submit a 32b defconfig at a later time. Also, I will send an RFC to
open a discussion regarding the firmware generation, which I think could be done
in buildroot as well.

Vincent Stehl?
System Architect - Arm


[1]: https://developer.arm.com/architectures/system-architectures/arm-systemready
[2]: https://github.com/glikely/u-boot-tfa-build
[3]: https://github.com/pftf/RPi4
[4]: https://git.linaro.org/people/paul.liu/systemready/build-scripts.git/


 board/aarch64-efi/genimage-efi.cfg |  8 +++++---
 board/aarch64-efi/grub.cfg         |  2 +-
 board/aarch64-efi/readme.txt       | 21 ++++++++++++++++++++-
 configs/aarch64_efi_defconfig      |  8 ++++----
 4 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/board/aarch64-efi/genimage-efi.cfg b/board/aarch64-efi/genimage-efi.cfg
index f93ab9d64f5..34cca1d64e2 100644
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
index ab88da91b94..d99e19c4cd5 100644
--- a/board/aarch64-efi/grub.cfg
+++ b/board/aarch64-efi/grub.cfg
@@ -2,5 +2,5 @@ set default="0"
 set timeout="5"
 
 menuentry "Buildroot" {
-	linux /Image root=/dev/vda2 rootwait console=ttyAMA0
+	linux /Image root=PARTLABEL=root rootwait
 }
diff --git a/board/aarch64-efi/readme.txt b/board/aarch64-efi/readme.txt
index 65a6345b6ce..164993eea49 100644
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
index 99600575edf..da9ee45defc 100644
--- a/configs/aarch64_efi_defconfig
+++ b/configs/aarch64_efi_defconfig
@@ -5,7 +5,7 @@ BR2_aarch64=y
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 
 # System
-BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+BR2_TARGET_GENERIC_GETTY_PORT="console"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 
 ## Required tools to create bootable media
@@ -23,13 +23,13 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
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
 
-- 
2.30.2
