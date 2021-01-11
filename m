From: Michael Walle <michael@walle.cc>
Date: Tue, 12 Jan 2021 00:28:49 +0100
Subject: [Buildroot] [PATCH] configs/kontron_smarc_sal28: enable u-boot
Message-ID: <20210111232849.11810-1-michael@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable building of the bootloader and integrate it into the resulting
image.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 board/kontron/smarc-sal28/genimage.cfg |  6 ++++++
 board/kontron/smarc-sal28/readme.txt   | 15 +++++++++++++++
 configs/kontron_smarc_sal28_defconfig  |  9 +++++++++
 3 files changed, 30 insertions(+)

diff --git a/board/kontron/smarc-sal28/genimage.cfg b/board/kontron/smarc-sal28/genimage.cfg
index 9ef37de757..d75234d997 100644
--- a/board/kontron/smarc-sal28/genimage.cfg
+++ b/board/kontron/smarc-sal28/genimage.cfg
@@ -3,6 +3,12 @@ image sdcard-emmc.img {
 		gpt = true
 	}
 
+	partition u-boot {
+		offset = 1M
+		in-partition-table = "no"
+		image = "u-boot.rom"
+	}
+
 	partition rootfs {
 		offset = 2M
 		image = rootfs.ext4
diff --git a/board/kontron/smarc-sal28/readme.txt b/board/kontron/smarc-sal28/readme.txt
index 2047f09b64..bdf2258b59 100644
--- a/board/kontron/smarc-sal28/readme.txt
+++ b/board/kontron/smarc-sal28/readme.txt
@@ -71,3 +71,18 @@ You will see something like this at boot time:
 [    4.563565] GPT:Alternate GPT header not at the end of the disk.
 [    4.569596] GPT:266272 != 7864319
 [    4.572925] GPT: Use GNU Parted to correct GPT errors.
+
+Updating the bootloader
+=======================
+
+Buildroot will automatically build the u-boot bootloader. The resulting
+image is called u-boot.rom and you can find it in the images/ directory.
+
+To update the bootloader on the board you could either copy it to an
+USB thumb drive or you could put it on a TFTP server. The following
+example assumes you have the bootloader image copied to the root of
+a thumb drive:
+
+  # usb start
+  # load usb 0:1 $loadaddr u-boot.rom
+  # sf probe 0 && sf update $fileaddr 0x210000 $filesize
diff --git a/configs/kontron_smarc_sal28_defconfig b/configs/kontron_smarc_sal28_defconfig
index b88f1aef4f..767858f601 100644
--- a/configs/kontron_smarc_sal28_defconfig
+++ b/configs/kontron_smarc_sal28_defconfig
@@ -19,5 +19,14 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="kontron_sl28"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.rom"
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.20.1
