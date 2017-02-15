From: Abhimanyu V <abhimanyu.vishwakarma@imgtec.com>
Date: Wed, 15 Feb 2017 13:03:41 +0530
Subject: [Buildroot] [PATCH v2 2/2] Add defconfig for MIPS Creator ci40
In-Reply-To: <1487144021-27808-1-git-send-email-abhimanyu.vishwakarma@imgtec.com>
References: <1487144021-27808-1-git-send-email-abhimanyu.vishwakarma@imgtec.com>
Message-ID: <1487144021-27808-2-git-send-email-abhimanyu.vishwakarma@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>

Signed-off-by: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
Reviewed-by: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
---
 Changes v1 -> v2
  - No change

 board/ci40/readme.txt  | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 configs/ci40_defconfig | 27 +++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 board/ci40/readme.txt
 create mode 100644 configs/ci40_defconfig

diff --git a/board/ci40/readme.txt b/board/ci40/readme.txt
new file mode 100644
index 0000000..8ce7ed8
--- /dev/null
+++ b/board/ci40/readme.txt
@@ -0,0 +1,49 @@
+*********************
+* MIPS Creator CI40 *
+*********************
+
+The 'ci40_defconfig' will create a root filesystem and a kernel image
+under the 'output/images/' directory. This document will try to explain how
+to use them in order to run Buildroot in the MIPS Creator CI40 board.
+
+The current bootloader by default boot fitImage, so we would need to create
+command to be able to boot from uImage. Assuming you are at the U-Boot prompt
+of the MIPS Creator CI40, you can use following way to boot.
+
+Booting from network (nfsboot)
+------------------------------
+  pistachio # setenv netboot_legacy 'sf probe 1:0;mtdparts default;setenv bootargs $console $earlycon $netroot nfsroot=$serverip:$rootpath $bootextra $mtdparts;dhcp $loadaddr  $legacy_bootfile; dhcp $fdtaddr $fdtfile;'
+
+  pistachio # run netboot_legacy
+
+  It will set variable to boot from tftp server and uses nfsroot
+
+Booting from USB/MMC
+--------------------
+Extract the generated root filesystem, uImage and dtb file into a USB drive
+or SD-Card. Here you have the instructions to boot from the two of them.
+You have to choose the one your prefer:
+
+From USB
+  pistachio # setenv usbboot_legacy 'sf probe 1:0;mtdparts default;setenv bootargs $console $earlycon $usbroot $bootextra $mtdparts;usb start;ext4load usb $usbdev $fdtaddr $bootdir$fdtfile;ext4load usb $usbdev $loadaddr $bootdir$legacy_bootfile;'
+
+  pistachio # run usbboot_legacy
+
+From SD-Card
+  pistachio # setenv mmcboot_legacy 'sf probe 1:0;mtdparts default;setenv bootargs $console $earlycon $mmcroot $bootextra $mtdparts;setenv verify n;mmcinfo; mmc dev $mmcdev;ext4load mmc $mmcdev $fdtaddr $bootdir$fdtfile;ext4load mmc $mmcdev $loadaddr $bootdir$legacy_bootfile;'
+
+  pistachio # run mmcboot_legacy
+
+Finally boot from the loaded file:
+
+  pistachio # bootm $loadaddr - $fdtaddr;
+
+
+Online docs
+-----------
+mostly for openwrt but it also applicable on buildroot
+https://docs.creatordev.io/ci40/guides/openwrt-platform/#overview
+
+Prebuilt uboot
+--------------
+http://downloads.creatordev.io/?q=u-boot/
diff --git a/configs/ci40_defconfig b/configs/ci40_defconfig
new file mode 100644
index 0000000..5363347
--- /dev/null
+++ b/configs/ci40_defconfig
@@ -0,0 +1,27 @@
+BR2_mipsel=y
+BR2_mips_32r2=y
+# BR2_MIPS_SOFT_FLOAT is not set
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS=y
+BR2_TARGET_GENERIC_HOSTNAME="Ci40"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Ci40"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
+BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
+BR2_SYSTEM_DHCP="eth0"
+BR2_ENABLE_LOCALE_WHITELIST="C en_US en_GB"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/CreatorDev/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="2319a2476a2bc0c582a9811cd45a6fa3c0beba37"
+BR2_LINUX_KERNEL_DEFCONFIG="pistachio"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="img/pistachio_marduk"
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_UCCP420WLAN=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="pistachio_marduk"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/CreatorDev/u-boot/archive/v1.0.4.tar.gz"
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-pistachio_marduk-2015.10-v1.0.4.img"
-- 
2.7.4
