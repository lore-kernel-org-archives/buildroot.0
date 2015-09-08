From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue,  8 Sep 2015 23:28:54 +0200
Subject: [Buildroot] [RFC 6/6] **** DO NOT COMMIT THIS **** ugly stuff to
	test mdev-only /dev management
In-Reply-To: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
References: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1441747734-18730-7-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2 init systems (busybox, sysvinit) x 5 /dev management = 10 defconfigs.
All based on qemu_arm_versatile_defconfig + external toolchain +
read-only rootfs (to test in the worst possible conditions).

To run-test one:
./run <your_output_dir> (default "output/")

To build- and run-test all:
./test-all build
./test-all run

Not-signed-off-by: anybody
---
 .gitignore                             |  1 +
 configs/test_bb_dyn_devtmpfs_defconfig | 12 ++++++++++++
 configs/test_bb_dyn_eudev_defconfig    | 13 +++++++++++++
 configs/test_bb_dyn_mdev_defconfig     | 13 +++++++++++++
 configs/test_bb_mdev_only_defconfig    | 13 +++++++++++++
 configs/test_bb_static_defconfig       | 13 +++++++++++++
 configs/test_sv_dyn_devtmpfs_defconfig | 13 +++++++++++++
 configs/test_sv_dyn_eudev_defconfig    | 14 ++++++++++++++
 configs/test_sv_dyn_mdev_defconfig     | 14 ++++++++++++++
 configs/test_sv_mdev_only_defconfig    | 14 ++++++++++++++
 configs/test_sv_static_defconfig       | 14 ++++++++++++++
 run                                    | 12 ++++++++++++
 test-all                               | 34 ++++++++++++++++++++++++++++++++++
 13 files changed, 180 insertions(+)
 create mode 100644 configs/test_bb_dyn_devtmpfs_defconfig
 create mode 100644 configs/test_bb_dyn_eudev_defconfig
 create mode 100644 configs/test_bb_dyn_mdev_defconfig
 create mode 100644 configs/test_bb_mdev_only_defconfig
 create mode 100644 configs/test_bb_static_defconfig
 create mode 100644 configs/test_sv_dyn_devtmpfs_defconfig
 create mode 100644 configs/test_sv_dyn_eudev_defconfig
 create mode 100644 configs/test_sv_dyn_mdev_defconfig
 create mode 100644 configs/test_sv_mdev_only_defconfig
 create mode 100644 configs/test_sv_static_defconfig
 create mode 100755 run
 create mode 100755 test-all

diff --git a/.gitignore b/.gitignore
index bb02d9f..9f335cc 100644
--- a/.gitignore
+++ b/.gitignore
@@ -13,3 +13,4 @@
 *.rej
 *~
 *.pyc
+bld
diff --git a/configs/test_bb_dyn_devtmpfs_defconfig b/configs/test_bb_dyn_devtmpfs_defconfig
new file mode 100644
index 0000000..fdddb63
--- /dev/null
+++ b/configs/test_bb_dyn_devtmpfs_defconfig
@@ -0,0 +1,12 @@
+BR2_arm=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.2.config"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/test_bb_dyn_eudev_defconfig b/configs/test_bb_dyn_eudev_defconfig
new file mode 100644
index 0000000..bb07e99
--- /dev/null
+++ b/configs/test_bb_dyn_eudev_defconfig
@@ -0,0 +1,13 @@
+BR2_arm=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.2.config"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/test_bb_dyn_mdev_defconfig b/configs/test_bb_dyn_mdev_defconfig
new file mode 100644
index 0000000..5f6a715
--- /dev/null
+++ b/configs/test_bb_dyn_mdev_defconfig
@@ -0,0 +1,13 @@
+BR2_arm=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.2.config"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/test_bb_mdev_only_defconfig b/configs/test_bb_mdev_only_defconfig
new file mode 100644
index 0000000..e2e7ec8
--- /dev/null
+++ b/configs/test_bb_mdev_only_defconfig
@@ -0,0 +1,13 @@
+BR2_arm=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV_ONLY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.2.config"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/test_bb_static_defconfig b/configs/test_bb_static_defconfig
new file mode 100644
index 0000000..9e79fca
--- /dev/null
+++ b/configs/test_bb_static_defconfig
@@ -0,0 +1,13 @@
+BR2_arm=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_ROOTFS_DEVICE_CREATION_STATIC=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.2.config"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/test_sv_dyn_devtmpfs_defconfig b/configs/test_sv_dyn_devtmpfs_defconfig
new file mode 100644
index 0000000..b0d758b
--- /dev/null
+++ b/configs/test_sv_dyn_devtmpfs_defconfig
@@ -0,0 +1,13 @@
+BR2_arm=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_INIT_SYSV=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.2.config"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/test_sv_dyn_eudev_defconfig b/configs/test_sv_dyn_eudev_defconfig
new file mode 100644
index 0000000..a2142be
--- /dev/null
+++ b/configs/test_sv_dyn_eudev_defconfig
@@ -0,0 +1,14 @@
+BR2_arm=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_INIT_SYSV=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.2.config"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/test_sv_dyn_mdev_defconfig b/configs/test_sv_dyn_mdev_defconfig
new file mode 100644
index 0000000..02d6ca3
--- /dev/null
+++ b/configs/test_sv_dyn_mdev_defconfig
@@ -0,0 +1,14 @@
+BR2_arm=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_INIT_SYSV=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.2.config"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/test_sv_mdev_only_defconfig b/configs/test_sv_mdev_only_defconfig
new file mode 100644
index 0000000..7e7489f
--- /dev/null
+++ b/configs/test_sv_mdev_only_defconfig
@@ -0,0 +1,14 @@
+BR2_arm=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_INIT_SYSV=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV_ONLY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.2.config"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/test_sv_static_defconfig b/configs/test_sv_static_defconfig
new file mode 100644
index 0000000..2177aa0
--- /dev/null
+++ b/configs/test_sv_static_defconfig
@@ -0,0 +1,14 @@
+BR2_arm=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_INIT_SYSV=y
+BR2_ROOTFS_DEVICE_CREATION_STATIC=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.2.config"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
diff --git a/run b/run
new file mode 100755
index 0000000..56618a4
--- /dev/null
+++ b/run
@@ -0,0 +1,12 @@
+#!/bin/sh
+
+set -e
+set -u
+
+OUTDIR=$([ -z "$1" ] && echo output || echo $1)
+
+qemu-system-arm -M versatilepb \
+    -kernel ${OUTDIR}/images/zImage \
+    -drive file=${OUTDIR}/images/rootfs.ext2,if=scsi \
+    -append "root=/dev/sda console=ttyAMA0,115200" \
+    -serial stdio -net nic,model=rtl8139 -net user
diff --git a/test-all b/test-all
new file mode 100755
index 0000000..21fdb2b
--- /dev/null
+++ b/test-all
@@ -0,0 +1,34 @@
+#!/bin/sh
+
+set -e
+set -u
+
+usage()
+{
+    echo "Usage: $0 {build|run}"
+}
+
+if [ -z "$1" ]; then
+    usage
+    exit 1
+fi
+
+for INIT in bb sv; do
+    for DEV in  static mdev_only dyn_devtmpfs dyn_eudev dyn_mdev; do
+	TARGET="${INIT}_${DEV}"
+	case "$1" in
+	    build)
+		make O=bld/${TARGET} test_${TARGET}_defconfig
+		make O=bld/${TARGET}
+		;;
+	    run)
+		echo "================= running ${TARGET} ==================="
+		./run bld/${TARGET}
+		echo "----------------- finished ${TARGET} -------------------"
+		;;
+	    *)
+		usage
+		exit 1
+	esac
+    done
+done
-- 
1.9.1
