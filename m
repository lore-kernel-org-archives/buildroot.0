From: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Date: Mon, 4 Sep 2017 11:42:19 +0200
Subject: [Buildroot] [PATCH 1/1] New board: SolidRun ClearFog Base
Message-ID: <mailman.1.1504518752.13310.buildroot@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

My goal was to rely on upstreamed features as much as possible, which
means that some bits are only half-baked for now:

- Due to the DTS restructuring in upstream kernel, we require 4.11+. The
latest LTS or CIP kernels do not know about the -Base model.

- Linux has no generic support for SFP cages (yet). It seems that this
has hit the net-next tree in August 2017, but there's been no release
(it's probably targettting 4.14). Also, the merge only included the
required infrastructure; the mvneta driver conversion is not included.
Patches which finalize this exist in Russel King's tree and also in
random vendor trees.

- There's no access to the SPI flash in These versions of
uboot/linux/dts.

- The U-Boot configuration looks pretty hacky; surely there must be a
better way of overwriting the environment and getting rid of the generic
setup with references to, e.g., EFI.

Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz>
---
 board/solidrun/clearfog/genimage.cfg               | 16 ++++++++++++
 board/solidrun/clearfog/linux.fragment             |  1 +
 .../clearfog/patches/uboot-bootcmd-env.patch       | 19 ++++++++++++++
 board/solidrun/clearfog/post-image.sh              | 14 ++++++++++
 configs/clearfog_defconfig                         | 30 ++++++++++++++++++++++
 5 files changed, 80 insertions(+)
 create mode 100644 board/solidrun/clearfog/genimage.cfg
 create mode 100644 board/solidrun/clearfog/linux.fragment
 create mode 100644 board/solidrun/clearfog/patches/uboot-bootcmd-env.patch
 create mode 100755 board/solidrun/clearfog/post-image.sh
 create mode 100644 configs/clearfog_defconfig

diff --git a/board/solidrun/clearfog/genimage.cfg b/board/solidrun/clearfog/genimage.cfg
new file mode 100644
index 0000000..8963619
--- /dev/null
+++ b/board/solidrun/clearfog/genimage.cfg
@@ -0,0 +1,16 @@
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot-spl.kwb"
+		offset = 512
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		offset = 1M
+	}
+}
diff --git a/board/solidrun/clearfog/linux.fragment b/board/solidrun/clearfog/linux.fragment
new file mode 100644
index 0000000..b7ed5b0
--- /dev/null
+++ b/board/solidrun/clearfog/linux.fragment
@@ -0,0 +1 @@
+CONFIG_SENSORS_MCP3021=y
diff --git a/board/solidrun/clearfog/patches/uboot-bootcmd-env.patch b/board/solidrun/clearfog/patches/uboot-bootcmd-env.patch
new file mode 100644
index 0000000..f1e5a7d
--- /dev/null
+++ b/board/solidrun/clearfog/patches/uboot-bootcmd-env.patch
@@ -0,0 +1,19 @@
+diff --git a/include/configs/clearfog.h b/include/configs/clearfog.h
+index 5061f6c..7bdd883 100644
+--- a/include/configs/clearfog.h
++++ b/include/configs/clearfog.h
+@@ -171,9 +171,12 @@
+ #define CONFIG_EXTRA_ENV_SETTINGS \
+ 	RELOCATION_LIMITS_ENV_SETTINGS \
+ 	LOAD_ADDRESS_ENV_SETTINGS \
+-	"fdtfile=" CONFIG_DEFAULT_DEVICE_TREE ".dtb\0" \
++	"fdtfile=armada-388-clearfog-base.dtb\0" \
+ 	"console=ttyS0,115200\0" \
+-	BOOTENV
++	"bootargs=root=/dev/mmcblk0p1\0" \
++	"bootcmd=ext4load mmc 0:1 ${kernel_addr_r} boot/zImage;" \
++	" ext4load mmc 0:1 ${fdt_addr_r} boot/${fdtfile};" \
++	" bootz ${kernel_addr_r} - ${fdt_addr_r}\0"
+ 
+ #endif /* CONFIG_SPL_BUILD */
+ 
diff --git a/board/solidrun/clearfog/post-image.sh b/board/solidrun/clearfog/post-image.sh
new file mode 100755
index 0000000..b4ac460
--- /dev/null
+++ b/board/solidrun/clearfog/post-image.sh
@@ -0,0 +1,14 @@
+#!/usr/bin/env bash
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage \
+  --rootpath "${TARGET_DIR}" \
+  --tmppath "${GENIMAGE_TMP}" \
+  --inputpath "${BINARIES_DIR}" \
+  --outputpath "${BINARIES_DIR}" \
+  --config "${GENIMAGE_CFG}"
diff --git a/configs/clearfog_defconfig b/configs/clearfog_defconfig
new file mode 100644
index 0000000..797c072
--- /dev/null
+++ b/configs/clearfog_defconfig
@@ -0,0 +1,30 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_NEON=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TARGET_GENERIC_PASSWD_SHA512=y
+BR2_INIT_SYSTEMD=y
+# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/solidrun/clearfog/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.12.10"
+BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v7"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/solidrun/clearfog/linux.fragment"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="armada-388-clearfog-base"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_PATCH="board/solidrun/clearfog/patches/uboot-bootcmd-env.patch"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="clearfog"
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-spl.kwb"
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.10.2
