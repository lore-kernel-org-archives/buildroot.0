From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 11 Sep 2016 16:42:05 -0300
Subject: [Buildroot] [PATCH 3/4] wandboard: Use U-Boot 2016.07
In-Reply-To: <1473622926-5476-1-git-send-email-festevam@gmail.com>
References: <1473622926-5476-1-git-send-email-festevam@gmail.com>
Message-ID: <1473622926-5476-3-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <fabio.estevam@nxp.com>

Upgrade U-Boot version to 2016.07 and make proper use of U-Boot
distro configuration features.

Provide a boot.scr binary script that is one of the standard ways to
pass a U-Boot script with distro features enabled.

With this method the uboot-env.txt file is no longer needed, so it is
removed.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 board/wandboard/boot.scr.txt  |  7 +++++++
 board/wandboard/genimage.cfg  |  7 -------
 board/wandboard/post-build.sh |  8 ++++++++
 board/wandboard/uboot-env.txt | 28 ----------------------------
 configs/wandboard_defconfig   | 10 +++-------
 5 files changed, 18 insertions(+), 42 deletions(-)
 create mode 100644 board/wandboard/boot.scr.txt
 create mode 100755 board/wandboard/post-build.sh
 delete mode 100644 board/wandboard/uboot-env.txt

diff --git a/board/wandboard/boot.scr.txt b/board/wandboard/boot.scr.txt
new file mode 100644
index 0000000..7a8aa4b
--- /dev/null
+++ b/board/wandboard/boot.scr.txt
@@ -0,0 +1,7 @@
+setenv finduuid "part uuid mmc 0:1 uuid"
+run finduuid
+run findfdt
+setenv bootargs "console=ttymxc0,115200 root=PARTUUID=${uuid} rootwait rootfstype=ext4"
+load mmc 0:1 ${fdt_addr} boot/${fdtfile}
+load mmc 0:1 ${loadaddr} boot/zImage
+bootz ${loadaddr} - ${fdt_addr}
diff --git a/board/wandboard/genimage.cfg b/board/wandboard/genimage.cfg
index 745cec3..b23a91b 100644
--- a/board/wandboard/genimage.cfg
+++ b/board/wandboard/genimage.cfg
@@ -23,13 +23,6 @@ image sdcard.img {
     offset = 70656
   }
 
-  partition u-boot-env {
-    in-partition-table = "no"
-    image = "uboot-env.bin"
-    offset = 393216
-    size = 8192
-  }
-
   partition rootfs {
     partition-type = 0x83
     image = "rootfs.ext4"
diff --git a/board/wandboard/post-build.sh b/board/wandboard/post-build.sh
new file mode 100755
index 0000000..07c480e
--- /dev/null
+++ b/board/wandboard/post-build.sh
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+
+$HOST_DIR/usr/bin/mkimage -A arm -O linux -T script -C none  \
+-n "boot script" -d $BOARD_DIR/boot.scr.txt $BOARD_DIR/boot.scr
+
+install -m 0644 -D $BOARD_DIR/boot.scr $TARGET_DIR/boot/boot.scr
diff --git a/board/wandboard/uboot-env.txt b/board/wandboard/uboot-env.txt
deleted file mode 100644
index f8c4fc1..0000000
--- a/board/wandboard/uboot-env.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-baudrate=115200
-boot_fdt=try
-bootcmd=run findfdt; mmc dev ${mmcdev}; if mmc rescan; then if run loadbootscript; then run bootscript; else if run loadimage; then run mmcboot; else run netboot; fi; fi; else run netboot; fi
-bootdelay=3
-bootscript=echo Running bootscript from mmc ...; source
-console=ttymxc0
-ethact=FEC
-ethaddr=00:1f:7b:b2:05:ee
-ethprime=FEC
-loadaddr=0x12000000
-fdt_addr=0x18000000
-fdt_high=0xffffffff
-fdtfile=undefined
-findfdt=if test $board_rev = MX6Q ; then setenv fdtfile imx6q-wandboard.dtb; fi; if test $board_rev = MX6DL ; then setenv fdtfile imx6dl-wandboard.dtb; fi; if test $fdtfile = undefined; then echo WARNING: Could not determine dtb to use; fi;
-loadfdt=ext2load mmc ${mmcdev}:${mmcpart} ${fdt_addr} /boot/${fdtfile}
-loadbootscript=ext2load mmc ${mmcdev}:${mmcpart} ${loadaddr} ${script};
-loadimage=ext2load mmc ${mmcdev}:${mmcpart} ${loadaddr} ${image}
-mmcargs=setenv bootargs console=${console},${baudrate} root=${mmcroot}; run videoargs
-videoargs=setenv nextcon 0; if hdmidet; then setenv bootargs ${bootargs} video=mxcfb${nextcon}:dev=hdmi,1280x720M at 60,if=RGB24; setenv fbmen fbmem=28M; setexpr nextcon ${nextcon} + 1; else echo - no HDMI monitor;fi; i2c dev 1; if i2c probe 0x10; then setenv bootargs ${bootargs} video=mxcfb${nextcon}:dev=lcd,800x480 at 60,if=RGB666,bpp=32; if test 0 -eq ${nextcon}; then setenv fbmem fbmem=10M; else setenv fbmem ${fbmem},10M; fi; setexpr nextcon ${nextcon} + 1; else echo '- no FWBADAPT-7WVGA-LCD-F07A-0102 display';fi; setenv bootargs ${bootargs} ${fbmem}
-mmcboot=echo Booting from mmc ...; run mmcargs; if test ${boot_fdt} = yes || test ${boot_fdt} = try; then if run loadfdt; then bootz ${loadaddr} - ${fdt_addr}; else if test ${boot_fdt} = try; then bootz; else echo WARN: Cannot load the DT; fi; fi; else bootz; fi;
-mmcdev=0
-mmcpart=1
-mmcroot=/dev/mmcblk2p1 rootwait rw
-netargs=setenv bootargs console=${console},${baudrate} root=/dev/nfs ip=dhcp nfsroot=${serverip}:${nfsroot},v3,tcp
-netboot=echo Booting from net ...; run netargs; if test ${ip_dyn} = yes; then setenv get_cmd dhcp; else setenv get_cmd tftp; fi; ${get_cmd} ${image}; if test ${boot_fdt} = yes || test ${boot_fdt} = try; then if ${get_cmd} ${fdt_addr} /boot/${fdtfile}; then bootz ${loadaddr} - ${fdt_addr}; else if test ${boot_fdt} = try; then bootz; else echo WARN: Cannot load the DT; fi; fi; else bootz; fi;
-script=boot/boot.scr
-image=boot/zImage
-splashpos=m,m
diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index 33b7f0d..4795b12 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -4,21 +4,17 @@ BR2_cortex_a9=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/wandboard/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/wandboard/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_USE_DEFCONFIG=y
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="wandboard"
+BR2_TARGET_UBOOT_BOARDNAME="wandboard"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.07"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
-BR2_TARGET_UBOOT_ENVIMAGE=y
-BR2_TARGET_UBOOT_ENVIMAGE_SOURCE="board/wandboard/uboot-env.txt"
-BR2_TARGET_UBOOT_ENVIMAGE_SIZE="0x2000"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-- 
2.7.4
