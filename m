From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 22 Nov 2013 23:50:58 +0100
Subject: [Buildroot] [PATCH 5/5] board/raspberrypi: provide partition
	description for the new genimanges
In-Reply-To: <cover.1385157864.git.yann.morin.1998@free.fr>
References: <cover.1385157864.git.yann.morin.1998@free.fr>
Message-ID: <932a7029e1685747fff04ec40650ffc69b76f53e.1385157864.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Now we can generate a complete target storage image with the genimages
infra, add a partition table layout description for the Raspberry Pi
as an example for how to use genimages.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 board/raspberrypi/partitions  | 31 +++++++++++++++++++++++++++++++
 configs/raspberrypi_defconfig |  9 +++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 board/raspberrypi/partitions

diff --git a/board/raspberrypi/partitions b/board/raspberrypi/partitions
new file mode 100644
index 0000000..e9084dd
--- /dev/null
+++ b/board/raspberrypi/partitions
@@ -0,0 +1,31 @@
+[global]
+extract=tar
+devices=mmcblk0
+
+[mmcblk0]
+type=boot
+boot_type=mbr
+mbr_bootcode=
+partitions=boot,root
+partalign=$((1048576))
+
+[root]
+type=fs
+size=$((128*1048576))
+mbr_type=$((0x83))
+fs_type=ext
+fs_vfstype=ext4
+fs_mntops=discard
+fs_root=/
+fs_label=ROOT
+ext_gen=4
+ext_rev=1
+
+[boot]
+type=fs
+size=$((9*1048576))
+mbr_type=$((0xc))
+fs_type=vfat
+fs_root=/boot
+fs_label=BOOT
+vfat_size=16
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index db34717..118f9df 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -21,3 +21,12 @@ BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="1587f77"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi_quick"
 BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+BR2_TARGET_ROOTFS_CUSTOM_PARTITION_TABLE="$(TOPDIR)/board/raspberrypi/partitions"
+
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_E2FSPROGS=y
+BR2_PACKAGE_HOST_GENEXT2FS=y
+BR2_PACKAGE_HOST_GENPART=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
1.8.1.2
