From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Mar 2018 22:19:39 +0100
Subject: [Buildroot] [git commit] configs/freescale_p1025twr_defconfig: new
 board
Message-ID: <20180311212257.1CFFB82DF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b98e5414133e032e4f3733c76823b61c4c2d197b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replacing the p1010rdb, this board is based on the tower development
system still available by NXP. The board is setup to track upstream
Linux and has been bumped from 4.1 to 4.15 (compared to p1010).

The target does not build uboot and assumes the user still uses the NXP
suggested prebuilts in the SDK2.0 (last release for PowerPC). If a
uboot is required, the source for SDK2.0 can be found in the following
repo.
http://git.freescale.com/git/cgit.cgi/ppc/sdk/u-boot.git/tag/?id=fsl-sdk-v2.0-1703

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .gitlab-ci.yml                       |  1 +
 DEVELOPERS                           |  2 ++
 board/freescale/p1025twr/readme.txt  | 25 +++++++++++++++++++++++++
 configs/freescale_p1025twr_defconfig | 20 ++++++++++++++++++++
 4 files changed, 48 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e2de78d89c..0fe91ae586 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -121,6 +121,7 @@ freescale_imx6sololiteevk_defconfig: *defconfig
 freescale_imx6sxsabresd_defconfig: *defconfig
 freescale_imx6ulevk_defconfig: *defconfig
 freescale_imx7dsabresd_defconfig: *defconfig
+freescale_p1025twr_defconfig: *defconfig
 friendlyarm_nanopi_a64_defconfig: *defconfig
 friendlyarm_nanopi_neo2_defconfig: *defconfig
 galileo_defconfig: *defconfig
diff --git a/DEVELOPERS b/DEVELOPERS
index e3c4a9c824..b42e28dfa0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1150,6 +1150,8 @@ F:	configs/ts4900_defconfig
 F:	package/ts4900-fpga/
 
 N:	Matt Weber <matthew.weber@rockwellcollins.com>
+F:	board/freescale/p*
+F:	configs/freescale_p*
 F:	package/argp-standalone/
 F:	package/aufs/
 F:	package/aufs-util/
diff --git a/board/freescale/p1025twr/readme.txt b/board/freescale/p1025twr/readme.txt
new file mode 100644
index 0000000000..9179aeac64
--- /dev/null
+++ b/board/freescale/p1025twr/readme.txt
@@ -0,0 +1,25 @@
+The bootloader is no longer buildable in the latest Freescale/NXP tree or
+upstream.  As such, retrieve the "Image: SDK V1.2 e500v2 Binary ISO" from
+NXP downloads and follow the release notes for reflashing.
+
+For programming the kernel and rootfs created by buildroot into the flash.
+The fast way is to tftp transfer the files via one of the network interfaces.
+Make sure your devkit has ipaddr and serverip defined to reach your tftp
+server.
+
+(Assuming the default u-boot env from NXP)
+1. Program the DTB to NOR flash
+
+    => setenv dtbfile p1025twr.dtb
+    => run dtbflash
+
+2. Program the kernel and rootfs to NOR flash (reusing orignal rootfs
+   NOR location, as the kernel location is to small)
+
+    => tftpboot $loadaddr uImage; protect off 0xeeb80000 +$filesize; erase 0xeeb80000 +$filesize; cp.b $loadaddr 0xeeb80000 $filesize; protect on 0xeeb80000 +$filesize; cmp.b $loadaddr 0xefa80000 $filesize
+
+3. Booting your new system
+
+    => bootm 0xeeb80000 - 0xefe80000
+
+    You can login with user "root".
diff --git a/configs/freescale_p1025twr_defconfig b/configs/freescale_p1025twr_defconfig
new file mode 100644
index 0000000000..f7cc50f093
--- /dev/null
+++ b/configs/freescale_p1025twr_defconfig
@@ -0,0 +1,20 @@
+# Architecture
+BR2_powerpc=y
+BR2_powerpc_8548=y
+
+# Serial port config
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15.7"
+BR2_LINUX_KERNEL_DEFCONFIG="mpc85xx_smp"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="fsl/p1025twr"
+
+# Filesystem
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ROOTFS_CPIO_GZIP=y
+BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
+# BR2_TARGET_ROOTFS_TAR is not set
