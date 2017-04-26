From: Erico Nunes <nunes.erico@gmail.com>
Date: Wed, 26 Apr 2017 23:39:52 +0200
Subject: [Buildroot] [PATCH v2 7/8] grub2: add usage notes for Grub 2 ARM
	and aarch64
In-Reply-To: <20170426213953.14904-1-nunes.erico@gmail.com>
References: <20170426213953.14904-1-nunes.erico@gmail.com>
Message-ID: <20170426213953.14904-8-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add notes to test grub2 running on ARM using qemu. arm shows how to run
it using u-boot and aarch64 shows how to do it using efi, which is
similar to what has to be done for x86_64.

The source for OVMF builds is also changed to
https://www.kraxel.org/repos/jenkins/edk2/ which is the source for
nightly builds (as rpms but which can be extracted in any distribution),
as the sourceforge link provided only very old builds.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
This was not in v1
---
 boot/grub2/readme.txt | 141 ++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 137 insertions(+), 4 deletions(-)

diff --git a/boot/grub2/readme.txt b/boot/grub2/readme.txt
index 278d770..14a966a 100644
--- a/boot/grub2/readme.txt
+++ b/boot/grub2/readme.txt
@@ -53,8 +53,8 @@ To test your BIOS image in Qemu
 
 qemu-system-{i386,x86-64} -hda disk.img
 
-Notes on using Grub2 for EFI-based platforms
-============================================
+Notes on using Grub2 for x86/x86_64 EFI-based platforms
+=======================================================
 
 1. Create a disk image
    dd if=/dev/zero of=disk.img bs=1M count=32
@@ -83,16 +83,149 @@ Notes on using Grub2 for EFI-based platforms
    sudo losetup -d /dev/loop0
 7. Your disk.img is ready!
 
-To test your EFI image in Qemu
+To test your i386/x86-64 EFI image in Qemu
 ------------------------------
 
 1. Download the EFI BIOS for Qemu
    Version IA32 or X64 depending on the chosen Grub2
    platform (i386-efi vs. x86-64-efi)
-   http://sourceforge.net/projects/edk2/files/OVMF/
+   https://www.kraxel.org/repos/jenkins/edk2/
+   (or use one provided by your distribution as OVMF)
 2. Extract, and rename OVMF.fd to bios.bin and
    CirrusLogic5446.rom to vgabios-cirrus.bin.
 3. qemu-system-{i386,x86-64} -L ovmf-dir/ -hda disk.img
 4. Make sure to pass pci=nocrs to the kernel command line,
    to workaround a bug in the EFI BIOS regarding the
    EFI framebuffer.
+
+Notes on using Grub2 for ARM u-boot-based platforms
+===================================================
+
+The following steps are used to exemplify the arm-uboot platform working in the
+simplest way possible and with a single buildroot-generated filesystem. The
+steps can of course be adapted to have a more common setup (i.e. with a
+separate boot partition).
+
+ 1. Load qemu_arm_vexpress_defconfig
+ 2. Enable u-boot with the vexpress_ca9x4 board name and with u-boot.elf image
+    format.
+ 3. Enable grub2 for the arm-uboot platform.
+ 4. Enable "Install kernel image to /boot in target" in the kernel menu to
+    populate a /boot directory with zImage in it.
+ 5. The upstream u-boot vexpress_ca9x4 doesn't have CONFIG_API enabled by
+    default, which is required.
+    Before building, patch u-boot (for example, make u-boot-extract to edit the
+    source before buildling) file include/configs/vexpress_common.h to define:
+
+    #define CONFIG_API
+    #define CONFIG_SYS_MMC_MAX_DEVICE   1
+
+ 6. Create a custom grub2 menu entries config file with the following contents
+    and set its path in BR2_TARGET_GRUB2_CFG:
+
+    set default="0"
+    set timeout="5"
+
+    menuentry "Buildroot" {
+        set root='(hd0)'
+        linux /boot/zImage root=/dev/mmcblk0 console=ttyAMA0
+        devicetree /boot/vexpress-v2p-ca9.dtb
+    }
+
+ 7. Create a custom builtin config file with the following contents and set its
+    path in BR2_TARGET_GRUB2_BUILTIN_CONFIG:
+
+    set root=(hd0)
+    set prefix=/boot/grub
+
+ 8. Create a custom post-build script which copies files from
+    ${BINARIES_DIR}/boot-part to $(TARGET_DIR)/boot (set its path in
+    BR2_ROOTFS_POST_BUILD_SCRIPT):
+
+    #!/bin/sh
+    cp -r ${BINARIES_DIR}/boot-part/* ${TARGET_DIR}/boot/
+
+ 9. make
+10. Run qemu with:
+
+    qemu-system-arm -M vexpress-a9 -kernel output/images/u-boot -m 1024 \
+    -nographic -sd output/images/rootfs.ext2
+
+11. In u-boot, stop at the prompt and run grub2 with:
+
+  => ext2load mmc 0:0 ${loadaddr} /boot/grub/grub.img
+  => bootm
+
+12. This should bring the grub2 menu, upon which selecting the "Buildroot"
+    entry should boot Linux.
+
+
+Notes on using Grub2 for Aarch64 EFI-based platforms
+====================================================
+
+The following steps are used to exemplify the arm64-efi platform with the use
+of qemu and EFI firmware built for qemu.
+
+ 1. Load qemu_aarch64_virt_defconfig
+ 2. Enable grub2 for the arm64-efi platform.
+ 3. Create a custom grub2 menu entries config file with the following contents
+    and set its path in BR2_TARGET_GRUB2_CFG:
+
+    set default="0"
+    set timeout="5"
+    menuentry "Buildroot" {
+        linux /Image console=ttyAMA0
+    }
+
+ 4. Enable host genimage and create a genimage.cfg script which creates the
+    disk image containing a EFI system partition:
+
+    image efi-part.vfat {
+      vfat {
+        file startup.nsh {
+          image = "efi-part/startup.nsh"
+        }
+        file EFI {
+          image = "efi-part/EFI"
+        }
+        file Image {
+          image = "Image"
+        }
+      }
+      size = 16M
+    }
+    image disk.img {
+      hdimage {
+      }
+      partition boot {
+        partition-type = 0xEF
+        image = "efi-part.vfat"
+      }
+    }
+
+ 5. Create a custom post-image script  (set its path in BR2_ROOTFS_POST_IMAGE_SCRIPT):
+
+    BOARD_DIR="$(dirname $0)"
+    GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+    GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+    rm -rf "${GENIMAGE_TMP}"
+    genimage                              \
+           --rootpath "${TARGET_DIR}"     \
+           --tmppath "${GENIMAGE_TMP}"    \
+           --inputpath "${BINARIES_DIR}"  \
+           --outputpath "${BINARIES_DIR}" \
+           --config "${GENIMAGE_CFG}"
+
+ 6. Run qemu with:
+ 7. Download the EFI firmware for qemu aarch64
+    https://www.kraxel.org/repos/jenkins/edk2/
+    (or use one provided by your distribution as OVMF-aarch64 or AAVMF)
+
+ 8. Run qemu with:
+
+    qemu-system-aarch64 -M virt -cpu cortex-a57 -m 512 -nographic \
+    -bios <path/to/EDK2>/QEMU_EFI.fd -hda output/images/disk.img \
+    -netdev user,id=eth0 -device virtio-net-device,netdev=eth0
+
+ 9. This should bring the grub2 menu, upon which selecting the "Buildroot"
+    entry should boot Linux.
-- 
2.9.3
