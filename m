From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 21:32:24 +0100
Subject: [Buildroot] [git commit] configs/minnowboard_max_defconfig: bump
 kernel to 5.10.11
Message-ID: <20210131201228.9ABB586150@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=552cafd7a8b96b1a2472c18f81f48577b95f8cc9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Explicitly enable PCI support in the kernel after commit eb01d42a77785 (PCI:
consolidate PCI config entry in drivers/pci) and change to GPT partitions /
root=PARTLABEL to find the rootfs instead of hardcoding /dev/mmcblk2p2 as
the mmc probing order has changed since commit 21b2cec61c04bd1 (mmc: Set
PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.4).

This has the additional advantage that the same image will work when written
to a USB drive instead of a microsd.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/minnowboard/genimage.cfg    | 5 +++--
 board/minnowboard/grub.cfg        | 2 +-
 board/minnowboard/linux.config    | 1 +
 configs/minnowboard_max_defconfig | 6 +++---
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/board/minnowboard/genimage.cfg b/board/minnowboard/genimage.cfg
index 6cf7874307..c5b07179b4 100644
--- a/board/minnowboard/genimage.cfg
+++ b/board/minnowboard/genimage.cfg
@@ -19,15 +19,16 @@ image efi-part.vfat {
 #  * the efi-partition created above
 image sdcard.img {
 	hdimage {
+		gpt = true
 	}
 
 	partition boot {
-		partition-type = 0xEF
+		partition-type-uuid = U
 		image = "efi-part.vfat"
 	}
 
 	partition rootfs {
-		partition-type = 0x83
+		partition-type-uuid = L
 		image = "rootfs.ext4"
 		size = 512M
 	}
diff --git a/board/minnowboard/grub.cfg b/board/minnowboard/grub.cfg
index 3d6feb7023..206f734f13 100644
--- a/board/minnowboard/grub.cfg
+++ b/board/minnowboard/grub.cfg
@@ -2,5 +2,5 @@ set default="0"
 set timeout="5"
 
 menuentry "Buildroot" {
-	linux /bzImage root=/dev/mmcblk2p2 rootwait console=tty0 console=ttyS0,115200
+	linux /bzImage root=PARTLABEL=rootfs rootwait console=tty0 console=ttyS0,115200
 }
diff --git a/board/minnowboard/linux.config b/board/minnowboard/linux.config
index 27077dbcda..928e353c1c 100644
--- a/board/minnowboard/linux.config
+++ b/board/minnowboard/linux.config
@@ -14,6 +14,7 @@ CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
+CONFIG_PCI=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_CHR_DEV_SG=y
 CONFIG_ATA=y
diff --git a/configs/minnowboard_max_defconfig b/configs/minnowboard_max_defconfig
index fef597c350..1270f23953 100644
--- a/configs/minnowboard_max_defconfig
+++ b/configs/minnowboard_max_defconfig
@@ -8,8 +8,8 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/minnowboard/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/minnowboard/genimage.cfg"
 
-# Linux headers same as kernel, a 4.19 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 # Needed for grub2
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 
@@ -24,7 +24,7 @@ BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.11"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard/linux.config"
 
