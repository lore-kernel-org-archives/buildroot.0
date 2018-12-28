From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Dec 2018 11:50:11 +0100
Subject: [Buildroot] [git commit] configs/lego_ev3: update to Linux kernel
 4.19 and U-Boot 2018.11
Message-ID: <20181228104548.18D3C83B2C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f816a35b18c810ba2fb8dad584e431e65a168ada
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This updates LEGO MINDSTORMS EV3 to Linux kernel 4.19 and U-Boot
2018.11. This kernel brings Bluetooth support, so some Bluez packages
are also added. Also, we now have proper device tree support, so a few
things are rearranged in the flash and SD card images since the DTB is
no longer appended to the kernel image.

Signed-off-by: David Lechner <david@lechnology.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/lego/ev3/genimage.cfg                        | 12 +++++++--
 board/lego/ev3/linux.fragment                      |  6 +++++
 ...onfigs-legoev3-increase-flash-image-sizes.patch | 31 ----------------------
 board/lego/ev3/readme.txt                          | 17 ++++++++++++
 configs/lego_ev3_defconfig                         | 19 ++++++++-----
 5 files changed, 45 insertions(+), 40 deletions(-)

diff --git a/board/lego/ev3/genimage.cfg b/board/lego/ev3/genimage.cfg
index 65d9714650..14880e8f11 100644
--- a/board/lego/ev3/genimage.cfg
+++ b/board/lego/ev3/genimage.cfg
@@ -18,8 +18,13 @@ image flash.bin {
 		image = "u-boot.bin"
 		size = 256K
 	}
+	partition dtb {
+		image = "da850-lego-ev3.dtb"
+		size = 64K
+		offset = 0x40000
+	}
 	partition uimage {
-		image = "uImage.da850-lego-ev3"
+		image = "uImage"
 		size = 4M
 		offset = 0x50000
 	}
@@ -35,7 +40,10 @@ image flash.bin {
 image boot.vfat {
 	vfat {
 		file uImage {
-			image = "uImage.da850-lego-ev3"
+			image = "uImage"
+		}
+		file da850-lego-ev3.dtb {
+			image = "da850-lego-ev3.dtb"
 		}
 	}
 	size = 16M
diff --git a/board/lego/ev3/linux.fragment b/board/lego/ev3/linux.fragment
index 30dea57b6c..79efd27d37 100644
--- a/board/lego/ev3/linux.fragment
+++ b/board/lego/ev3/linux.fragment
@@ -1,3 +1,4 @@
+CONFIG_ARM_APPENDED_DTB=n
 CONFIG_ARCH_DAVINCI_DM644x=n
 CONFIG_ARCH_DAVINCI_DM355=n
 CONFIG_ARCH_DAVINCI_DM646x=n
@@ -60,3 +61,8 @@ CONFIG_DRM_DUMB_VGA_DAC=n
 CONFIG_DRM_TINYDRM=y
 CONFIG_TINYDRM_ST7586=y
 CONFIG_FB_DA8XX=n
+CONFIG_COMMON_CLK_PWM=y
+CONFIG_BT=y
+CONFIG_BT_HS=n
+CONFIG_BT_LE=n
+CONFIG_RFKILL=y
diff --git a/board/lego/ev3/patches/uboot/configs-legoev3-increase-flash-image-sizes.patch b/board/lego/ev3/patches/uboot/configs-legoev3-increase-flash-image-sizes.patch
deleted file mode 100644
index ee0ce61603..0000000000
--- a/board/lego/ev3/patches/uboot/configs-legoev3-increase-flash-image-sizes.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From cdd8d11858fa34f6e813fae46b5556e9fb3570dc Mon Sep 17 00:00:00 2001
-From: David Lechner <david@lechnology.com>
-Date: Sun, 19 Nov 2017 19:54:32 -0600
-Subject: [PATCH] configs: legoev3: increase flash image sizes
-
-This increases the kernel image to 4M and the rootfs image to 10M.
-
-It is getting hard to get a kernel image to fit in 3M and the rootfs image
-size now matches the filesyssize variable.
-
-Signed-off-by: David Lechner <david@lechnology.com>
----
- include/configs/legoev3.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/configs/legoev3.h b/include/configs/legoev3.h
-index 79fa3c4..2eeaf85 100644
---- a/include/configs/legoev3.h
-+++ b/include/configs/legoev3.h
-@@ -204,7 +204,7 @@
- 	"mmcargs=setenv bootargs mem=${memsize} console=${console} root=/dev/mmcblk0p2 rw rootwait lpj=747520\0" \
- 	"mmcboot=bootm ${loadaddr}\0" \
- 	"flashargs=setenv bootargs mem=${memsize} initrd=${filesysaddr},${filesyssize} root=/dev/ram0 rw rootfstype=squashfs console=${console} lpj=747520\0" \
--	"flashboot=sf probe 0; sf read ${loadaddr} 0x50000 0x300000; sf read ${filesysaddr} 0x350000 0x960000; bootm ${loadaddr}\0" \
-+	"flashboot=sf probe 0; sf read ${loadaddr} 0x50000 0x400000; sf read ${filesysaddr} 0x450000 0xA00000; bootm ${loadaddr}\0" \
- 	"loadimage=fatload mmc 0 ${loadaddr} uImage\0" \
- 	"loadbootscr=fatload mmc 0 ${bootscraddr} boot.scr\0" \
- 	"bootscript=source ${bootscraddr}\0" \
--- 
-2.7.4
-
diff --git a/board/lego/ev3/readme.txt b/board/lego/ev3/readme.txt
index 8df91ac111..648bca1e91 100644
--- a/board/lego/ev3/readme.txt
+++ b/board/lego/ev3/readme.txt
@@ -70,6 +70,13 @@ official Lego Mindstorms EV3 programming software firmware update tool to load
 the image. To use sdcard.img, use a disk writing tool such as Etcher or dd to
 write the image to the ??SD card.
 
+NOTE: The sdcard.img created by lego_ev3_defconfig won't boot if the official
+LEGO firmware is installed on the EV3 (it has an old version of U-Boot that
+doesn't know about device tree). You must either set the kernel configuration
+option to append the device tree to the kernel or you can create a boot.scr
+that chainloads a newer U-Boot or you can install a newer U-Boot in the flash
+memory (just flashing u-boot.bin is enough).
+
 Finish
 ======
 
@@ -80,3 +87,13 @@ See:
 - http://botbench.com/blog/2013/08/05/mindsensors-ev3-usb-console-adapter/
 
 The serial port config to use is 115200/8-N-1.
+
+Bluetooth
+=========
+
+To enable Bluetooth:
+
+    # modprobe hci_uart
+    # /usr/libexec/bluetooth/bluetoothd &
+    # bluetoothctl
+    [bluetooth]# power on
diff --git a/configs/lego_ev3_defconfig b/configs/lego_ev3_defconfig
index 0281924133..cf2809059e 100644
--- a/configs/lego_ev3_defconfig
+++ b/configs/lego_ev3_defconfig
@@ -2,28 +2,33 @@
 BR2_arm=y
 BR2_arm926t=y
 
-# Build options
-BR2_GLOBAL_PATCH_DIR="board/lego/ev3/patches"
+# Toolchain
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 
 # system
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/lego/ev3/post-image.sh"
-# Linux headers same as kernel, a 4.14 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19"
 BR2_LINUX_KERNEL_DEFCONFIG="davinci_all"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/lego/ev3/linux.fragment"
+BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0xc0008000"
-BR2_LINUX_KERNEL_APPENDED_UIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="da850-lego-ev3"
 
 # Target packages
 BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/lego/ev3/busybox.fragment"
+BR2_PACKAGE_BLUEZ5_UTILS=y
+BR2_PACKAGE_BLUEZ5_UTILS_CLIENT=y
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_TI_CC2560=y
 
 # filesystem
 BR2_TARGET_ROOTFS_EXT2=y
@@ -36,7 +41,7 @@ BR2_TARGET_ROOTFS_SQUASHFS4_XZ=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.11"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="legoev3"
 
 # host
