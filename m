From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Mar 2018 22:22:02 +0100
Subject: [Buildroot] [git commit] configs/freescale_t1040d4rdb_defconfig:
 new board
Message-ID: <20180311212257.2C10182DF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad6ed6643aa806f05fb14bb699d10c88d8f97c90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The T1 QoriQ from NXP has had a few varients of RDB dev boards.
This target is against the latest D4RDB version.  Any of the
other versions before D4RDB (plain RDB), may require backing off
the uboot version to SDK 1.6 and/or adjusting the kernel dtb used.

This board configuration provides an upstream kernel build which
has been verified to boot on target.

The target assumes the user still uses the NXP suggested prebuilts
in the SDK2.0 (last release for PowerPC). If a uboot rebuild is
required, the source for SDK2.0 can be found in the following repo.

http://git.freescale.com/git/cgit.cgi/ppc/sdk/u-boot.git/tag/?id=fsl-sdk-v2.0-1703

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .gitlab-ci.yml                         |  1 +
 DEVELOPERS                             |  2 ++
 board/freescale/t1040d4rdb/readme.txt  | 24 ++++++++++++++++++++++++
 configs/freescale_t1040d4rdb_defconfig | 20 ++++++++++++++++++++
 4 files changed, 47 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 0fe91ae586..f44c3a9bf9 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -122,6 +122,7 @@ freescale_imx6sxsabresd_defconfig: *defconfig
 freescale_imx6ulevk_defconfig: *defconfig
 freescale_imx7dsabresd_defconfig: *defconfig
 freescale_p1025twr_defconfig: *defconfig
+freescale_t1040d4rdb_defconfig: *defconfig
 friendlyarm_nanopi_a64_defconfig: *defconfig
 friendlyarm_nanopi_neo2_defconfig: *defconfig
 galileo_defconfig: *defconfig
diff --git a/DEVELOPERS b/DEVELOPERS
index b42e28dfa0..c5a1a6a1f7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1151,7 +1151,9 @@ F:	package/ts4900-fpga/
 
 N:	Matt Weber <matthew.weber@rockwellcollins.com>
 F:	board/freescale/p*
+F:	board/freescale/t*
 F:	configs/freescale_p*
+F:	configs/freescale_t*
 F:	package/argp-standalone/
 F:	package/aufs/
 F:	package/aufs-util/
diff --git a/board/freescale/t1040d4rdb/readme.txt b/board/freescale/t1040d4rdb/readme.txt
new file mode 100644
index 0000000000..04d6b01531
--- /dev/null
+++ b/board/freescale/t1040d4rdb/readme.txt
@@ -0,0 +1,24 @@
+For the bootloader, NXP has stablized at SDK2.0 (final release). It is
+suggested to download the prebuilt from NXP downloads and follow the
+release notes for reflashing.
+
+To program the kernel and rootfs created by buildroot into the flash. The
+fast way is to tftp transfer the files via one of the network interfaces.
+Make sure your devkit has ipaddr and serverip defined to reach your tftp
+server.
+
+(Assuming the default u-boot env from NXP)
+1. Program the DTB to NOR flash
+
+    => tftpboot $loadaddr t1040d4rdb.dtb; protect off 0xe8800000 +$filesize; erase 0xe8800000 +$filesize; cp.b $loadaddr 0xe8800000 $filesize; protect on 0xe8800000 +$filesize; cmp.b $loadaddr 0xe8800000 $filesize
+
+2. Program the kernel and rootfs to NOR flash
+
+    => tftpboot $loadaddr uImage; protect off 0xe8020000 +$filesize; erase 0xe8020000 +$filesize; cp.b $loadaddr 0xe8020000 $filesize; protect on 0xe8020000 +$filesize; cmp.b $loadaddr 0xe8020000 $filesize
+    => tftpboot $loadaddr rootfs.cpio.uboot; protect off 0xe9300000 +$filesize; erase 0xe9300000 +$filesize; cp.b $loadaddr 0xe9300000 $filesize; protect on 0xe9300000 +$filesize; cmp.b $loadaddr 0xe9300000 $filesize
+
+3. Booting your new system
+
+    => boot
+
+    You can login with user "root".
diff --git a/configs/freescale_t1040d4rdb_defconfig b/configs/freescale_t1040d4rdb_defconfig
new file mode 100644
index 0000000000..6b09e69646
--- /dev/null
+++ b/configs/freescale_t1040d4rdb_defconfig
@@ -0,0 +1,20 @@
+# Architecture
+BR2_powerpc64=y
+BR2_powerpc_e5500=y
+
+# Serial port config
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15.7"
+BR2_LINUX_KERNEL_DEFCONFIG="corenet64_smp"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="fsl/t1040d4rdb"
+
+# Filesystem
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ROOTFS_CPIO_GZIP=y
+BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
+# BR2_TARGET_ROOTFS_TAR is not set
