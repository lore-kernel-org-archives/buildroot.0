From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Aug 2013 06:54:33 +0200
Subject: [Buildroot] [git commit] board: add support for the i.MX6 Wandboard
	platform
Message-ID: <20130831213337.611339B591@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fd4a399e4d4fad4c9985d7a3bbdca0f23da5a3da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Wandboard is a low cost iMX6 system consiting of an EDM standard
processor module and a small base board.

http://www.wandboard.org

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/wandboard/readme.txt    |   37 +++++++++++++++++++++++++++++++++++++
 board/wandboard/uboot-env.txt |   20 ++++++++++++++++++++
 configs/wandboard_defconfig   |   22 ++++++++++++++++++++++
 3 files changed, 79 insertions(+), 0 deletions(-)

diff --git a/board/wandboard/readme.txt b/board/wandboard/readme.txt
new file mode 100644
index 0000000..4dd9c2c
--- /dev/null
+++ b/board/wandboard/readme.txt
@@ -0,0 +1,37 @@
+Minimal board support for the Wandboard
+
+Wandboard's homepage is here: http://www.wandboard.org/
+
+This config is only tested with the dual core wandboard.
+
+Installing:
+
+You need a micro SD card and a slot/adapter for your development machine.
+
+Partition the SD card leaving at least 1 MB in front of the first partition.
+
+Partition layout (example):
+
+Disk /dev/sdi: 3965 MB, 3965190144 bytes
+255 heads, 63 sectors/track, 482 cylinders
+Units = cylinders of 16065 * 512 = 8225280 bytes
+Sector size (logical/physical): 512 bytes / 512 bytes
+I/O size (minimum/optimal): 512 bytes / 512 bytes
+Disk identifier: 0x77b47445
+
+   Device Boot      Start         End      Blocks   Id  System
+/dev/sdi1               2         482     3863632+  83  Linux
+
+Copy u-boot and its environment to the SD card:
+sudo dd if=output/images/u-boot.imx bs=512 seek=2 of=/dev/sd<x>
+sudo dd if=output/images/uboot-env.bin bs=512 seek=768 of=/dev/sd<x>
+
+Copy the root filesystem:
+sudo dd if=output/images/rootfs.ext2 of=/dev/sd<x>1
+
+Alternative commands to copy root filesystem:
+sudo mkfs.ext4 /dev/sd<x>1
+sudo mount /dev/sd<x>1 /mnt
+sudo tar xf output/images/rootfs.tar -C /mnt
+sudo umount /mnt
+
diff --git a/board/wandboard/uboot-env.txt b/board/wandboard/uboot-env.txt
new file mode 100644
index 0000000..7ca2b1a
--- /dev/null
+++ b/board/wandboard/uboot-env.txt
@@ -0,0 +1,20 @@
+baudrate=115200
+bootcmd=mmc dev ${mmcdev}; if mmc rescan; then if run loadbootscript; then run bootscript; else if run loaduimage; then run mmcboot; else run netboot; fi; fi; else run netboot; fi
+bootdelay=3
+bootscript=echo Running bootscript from mmc ...; source
+console=ttymxc0
+ethact=FEC
+ethaddr=00:1f:7b:b2:05:ee
+ethprime=FEC
+loadaddr=0x12000000
+loadbootscript=ext2load mmc ${mmcdev}:${mmcpart} ${loadaddr} ${script};
+loaduimage=ext2load mmc ${mmcdev}:${mmcpart} ${loadaddr} ${uimage}
+mmcargs=setenv bootargs console=${console},${baudrate} root=${mmcroot}
+mmcboot=echo Booting from mmc ...; run mmcargs;  bootm; 
+mmcdev=0
+mmcpart=1
+mmcroot=/dev/mmcblk0p1 rootwait rw
+netargs=setenv bootargs console=${console},${baudrate} root=/dev/nfs ip=dhcp nfsroot=${serverip}:${nfsroot},v3,tcp
+netboot=echo Booting from net ...; run netargs; if test ${ip_dyn} = yes; then setenv get_cmd dhcp; else setenv get_cmd tftp; fi; ${get_cmd} ${uimage}; if test ${boot_fdt} = yes || test ${boot_fdt} = try; then if ${get_cmd} ${fdt_addr} ${fdt_file}; then bootm ${loadaddr} - ${fdt_addr}; else if test ${boot_fdt} = try; then bootm; else echo WARN: Cannot load the DT; fi; fi; else bootm; fi;
+script=boot/boot.scr
+uimage=boot/uImage
diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
new file mode 100644
index 0000000..ca4ce87
--- /dev/null
+++ b/configs/wandboard_defconfig
@@ -0,0 +1,22 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_KERNEL_HEADERS_3_0=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="wandboard_dl"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="git://git.denx.de/u-boot-imx.git"
+BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="326ea986ac150acdc7656d57fca647db80b50158"
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.imx"
+BR2_TARGET_UBOOT_ENVIMAGE=y
+BR2_TARGET_UBOOT_ENVIMAGE_SOURCE="board/wandboard/uboot-env.txt"
+BR2_TARGET_UBOOT_ENVIMAGE_SIZE="0x2000"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://repo.or.cz/wandboard.git"
+BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="86429847b5152f040f190015faedcac49b243328"
+BR2_LINUX_KERNEL_DEFCONFIG="wandboard"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
