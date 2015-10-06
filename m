From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Oct 2015 09:51:28 +0100
Subject: [Buildroot] [git commit] wandboard_defconfig: bump u-boot to
	2015.07 and kernel to 3.14.28_1.0.0
Message-ID: <20151006085147.B70C481E3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0d71ab41720b1a1afd221db9b14a05bc277f7eac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump U-boot version to 2015.07 from the mainline repository. Since there
is SPL support for the wandboard in the U-boot 2015.07, it is now
possible to boot the same U-boot image for all wandboard variants
(solo/dual/quad).

Bump kernel version to 3.14.28_1.0.0 from the wandboard git repository.

Tested on Wandboard Solo, Wandboard Dual and Wandboard Quad.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Tested-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/wandboard/genimage.cfg  |   10 ++++++++--
 board/wandboard/uboot-env.txt |   22 +++++++++++++++-------
 configs/wandboard_defconfig   |   24 +++++++++++++++---------
 3 files changed, 38 insertions(+), 18 deletions(-)

diff --git a/board/wandboard/genimage.cfg b/board/wandboard/genimage.cfg
index 24c4049..f5df1ff 100644
--- a/board/wandboard/genimage.cfg
+++ b/board/wandboard/genimage.cfg
@@ -11,12 +11,18 @@ image sdcard.img {
   hdimage {
   }
 
-  partition u-boot {
+  partition spl {
     in-partition-table = "no"
-    image = "u-boot.imx"
+    image = "SPL"
     offset = 1024
   }
 
+  partition u-boot {
+    in-partition-table = "no"
+    image = "u-boot.img"
+    offset = 70656
+  }
+
   partition u-boot-env {
     in-partition-table = "no"
     image = "uboot-env.bin"
diff --git a/board/wandboard/uboot-env.txt b/board/wandboard/uboot-env.txt
index 7ca2b1a..f8c4fc1 100644
--- a/board/wandboard/uboot-env.txt
+++ b/board/wandboard/uboot-env.txt
@@ -1,5 +1,6 @@
 baudrate=115200
-bootcmd=mmc dev ${mmcdev}; if mmc rescan; then if run loadbootscript; then run bootscript; else if run loaduimage; then run mmcboot; else run netboot; fi; fi; else run netboot; fi
+boot_fdt=try
+bootcmd=run findfdt; mmc dev ${mmcdev}; if mmc rescan; then if run loadbootscript; then run bootscript; else if run loadimage; then run mmcboot; else run netboot; fi; fi; else run netboot; fi
 bootdelay=3
 bootscript=echo Running bootscript from mmc ...; source
 console=ttymxc0
@@ -7,14 +8,21 @@ ethact=FEC
 ethaddr=00:1f:7b:b2:05:ee
 ethprime=FEC
 loadaddr=0x12000000
+fdt_addr=0x18000000
+fdt_high=0xffffffff
+fdtfile=undefined
+findfdt=if test $board_rev = MX6Q ; then setenv fdtfile imx6q-wandboard.dtb; fi; if test $board_rev = MX6DL ; then setenv fdtfile imx6dl-wandboard.dtb; fi; if test $fdtfile = undefined; then echo WARNING: Could not determine dtb to use; fi;
+loadfdt=ext2load mmc ${mmcdev}:${mmcpart} ${fdt_addr} /boot/${fdtfile}
 loadbootscript=ext2load mmc ${mmcdev}:${mmcpart} ${loadaddr} ${script};
-loaduimage=ext2load mmc ${mmcdev}:${mmcpart} ${loadaddr} ${uimage}
-mmcargs=setenv bootargs console=${console},${baudrate} root=${mmcroot}
-mmcboot=echo Booting from mmc ...; run mmcargs;  bootm; 
+loadimage=ext2load mmc ${mmcdev}:${mmcpart} ${loadaddr} ${image}
+mmcargs=setenv bootargs console=${console},${baudrate} root=${mmcroot}; run videoargs
+videoargs=setenv nextcon 0; if hdmidet; then setenv bootargs ${bootargs} video=mxcfb${nextcon}:dev=hdmi,1280x720M at 60,if=RGB24; setenv fbmen fbmem=28M; setexpr nextcon ${nextcon} + 1; else echo - no HDMI monitor;fi; i2c dev 1; if i2c probe 0x10; then setenv bootargs ${bootargs} video=mxcfb${nextcon}:dev=lcd,800x480 at 60,if=RGB666,bpp=32; if test 0 -eq ${nextcon}; then setenv fbmem fbmem=10M; else setenv fbmem ${fbmem},10M; fi; setexpr nextcon ${nextcon} + 1; else echo '- no FWBADAPT-7WVGA-LCD-F07A-0102 display';fi; setenv bootargs ${bootargs} ${fbmem}
+mmcboot=echo Booting from mmc ...; run mmcargs; if test ${boot_fdt} = yes || test ${boot_fdt} = try; then if run loadfdt; then bootz ${loadaddr} - ${fdt_addr}; else if test ${boot_fdt} = try; then bootz; else echo WARN: Cannot load the DT; fi; fi; else bootz; fi;
 mmcdev=0
 mmcpart=1
-mmcroot=/dev/mmcblk0p1 rootwait rw
+mmcroot=/dev/mmcblk2p1 rootwait rw
 netargs=setenv bootargs console=${console},${baudrate} root=/dev/nfs ip=dhcp nfsroot=${serverip}:${nfsroot},v3,tcp
-netboot=echo Booting from net ...; run netargs; if test ${ip_dyn} = yes; then setenv get_cmd dhcp; else setenv get_cmd tftp; fi; ${get_cmd} ${uimage}; if test ${boot_fdt} = yes || test ${boot_fdt} = try; then if ${get_cmd} ${fdt_addr} ${fdt_file}; then bootm ${loadaddr} - ${fdt_addr}; else if test ${boot_fdt} = try; then bootm; else echo WARN: Cannot load the DT; fi; fi; else bootm; fi;
+netboot=echo Booting from net ...; run netargs; if test ${ip_dyn} = yes; then setenv get_cmd dhcp; else setenv get_cmd tftp; fi; ${get_cmd} ${image}; if test ${boot_fdt} = yes || test ${boot_fdt} = try; then if ${get_cmd} ${fdt_addr} /boot/${fdtfile}; then bootz ${loadaddr} - ${fdt_addr}; else if test ${boot_fdt} = try; then bootz; else echo WARN: Cannot load the DT; fi; fi; else bootz; fi;
 script=boot/boot.scr
-uimage=boot/uImage
+image=boot/zImage
+splashpos=m,m
diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index 5d74fc3..1875db0 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -1,26 +1,32 @@
 BR2_arm=y
 BR2_cortex_a9=y
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.0.101"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_0=y
+BR2_KERNEL_HEADERS_3_14=y
+BR2_DEFAULT_KERNEL_HEADERS="3.14.54"
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/wandboard/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="wandboard_dl"
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_USE_DEFCONFIG=y
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="wandboard"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.denx.de/u-boot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="326ea986ac150acdc7656d57fca647db80b50158"
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.denx.de/u-boot.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="33711bdd4a4dce942fb5ae85a68899a8357bdd94"
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.imx"
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.img"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="SPL"
 BR2_TARGET_UBOOT_ENVIMAGE=y
 BR2_TARGET_UBOOT_ENVIMAGE_SOURCE="board/wandboard/uboot-env.txt"
 BR2_TARGET_UBOOT_ENVIMAGE_SIZE="0x2000"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://repo.or.cz/wandboard.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="86429847b5152f040f190015faedcac49b243328"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/wandboard-org/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="e2213f9a98dd7413ee5a9ca40cf60e8cb8292f4a"
 BR2_LINUX_KERNEL_DEFCONFIG="wandboard"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-wandboard imx6dl-wandboard"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
