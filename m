From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Dec 2013 23:32:55 +0100
Subject: [Buildroot] [PATCH 2/4] board/raspberrypi: provide partition
	description for the new genimages
In-Reply-To: <cover.1387578655.git.yann.morin.1998@free.fr>
References: <cover.1387578655.git.yann.morin.1998@free.fr>
Message-ID: <c2432ce8aebe84be29a64743e343700286066c06.1387578655.git.yann.morin.1998@free.fr>
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
Cc: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 board/raspberrypi/partitions  | 36 ++++++++++++++++++++++++++++++++++++
 configs/raspberrypi_defconfig |  8 ++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 board/raspberrypi/partitions

diff --git a/board/raspberrypi/partitions b/board/raspberrypi/partitions
new file mode 100644
index 0000000..c5e8de5
--- /dev/null
+++ b/board/raspberrypi/partitions
@@ -0,0 +1,36 @@
+[global]
+extract=tar
+devices=mmcblk0
+
+[mmcblk0]
+type=boot
+boot_type=mbr
+partitions=boot,root
+partalign=$((1048576))
+
+[root]
+type=fs
+size=$((32*1048576))
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
+# FAT32 is not possible under 9MiB
+size=$((9*1048576))
+mbr_type=$((0xc))
+fs_type=vfat
+fs_files_0=rpi-firmware/bootcode.bin
+fs_files_1=rpi-firmware/start.elf
+fs_files_2=rpi-firmware/fixup.dat
+fs_files_3=rpi-firmware/config.txt
+fs_files_4=rpi-firmware/cmdline.txt
+fs_files_5=zImage
+fs_label=BOOT
+vfat_size=16
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 4df0f4b..c571817 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -21,3 +21,11 @@ BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="5ebf1db80e2c03e92d570605b53f91a06112574f"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi_quick"
 BR2_LINUX_KERNEL_ZIMAGE=y
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
