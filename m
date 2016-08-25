From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Thu, 25 Aug 2016 17:04:40 +0300
Subject: [Buildroot] [PATCH v1 2/9] board/intel/common: Add common files for
	x86 boards
In-Reply-To: <1472133887-34746-1-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1472133887-34746-1-git-send-email-andriy.shevchenko@linux.intel.com>
Message-ID: <1472133887-34746-3-git-send-email-andriy.shevchenko@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There are several x86 boards that can utilize same image creation
infrastructure.

Add common configuration, cmdline, post-image.sh, post-build.sh scripts and
placeholders for their extensions.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 board/intel/common/README.rst                      | 96 ++++++++++++++++++++++
 board/intel/common/cmdline                         |  1 +
 board/intel/common/libshell-intel                  | 26 ++++++
 board/intel/common/post-build.d/10-install-modules | 23 ++++++
 board/intel/common/post-build.d/README             |  4 +
 board/intel/common/post-build.sh                   | 16 ++++
 board/intel/common/post-image.d/10-prepare-cmdline | 26 ++++++
 .../common/post-image.d/30-append-custom-cmdline   | 17 ++++
 board/intel/common/post-image.d/40-prepare-initrd  | 14 ++++
 board/intel/common/post-image.d/README             |  4 +
 board/intel/common/post-image.sh                   | 16 ++++
 configs/intel_defconfig                            | 27 ++++++
 12 files changed, 270 insertions(+)
 create mode 100644 board/intel/common/README.rst
 create mode 100644 board/intel/common/cmdline
 create mode 100644 board/intel/common/libshell-intel
 create mode 100755 board/intel/common/post-build.d/10-install-modules
 create mode 100644 board/intel/common/post-build.d/README
 create mode 100755 board/intel/common/post-build.sh
 create mode 100755 board/intel/common/post-image.d/10-prepare-cmdline
 create mode 100755 board/intel/common/post-image.d/30-append-custom-cmdline
 create mode 100755 board/intel/common/post-image.d/40-prepare-initrd
 create mode 100644 board/intel/common/post-image.d/README
 create mode 100755 board/intel/common/post-image.sh
 create mode 100644 configs/intel_defconfig

diff --git a/board/intel/common/README.rst b/board/intel/common/README.rst
new file mode 100644
index 0000000..e427067
--- /dev/null
+++ b/board/intel/common/README.rst
@@ -0,0 +1,96 @@
+===========
+ Intel IoT
+===========
+
+----------------------------------------
+ Common infrastructure for Intel boards
+----------------------------------------
+
+:Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
+:Date: 2016-08-17
+
+Quick instructions
+------------------
+
+Building an image
+~~~~~~~~~~~~~~~~~
+
+For building a normal bootable image, you need to do following steps:
+
+1) Build your own kernel.
+
+2) Configure Buildroot.
+
+The Buildroot configuration would be done by running::
+
+	% make <BOARD>_defconfig
+
+For most of the boards it's good enough to use generic [intel_defconfig]_.
+
+3) Build Buildroot.
+
+Build the necessary Buildroot packages and resulting image::
+
+	% make KERNEL_SRC=~/linux
+
+where ``~/linux`` is whatever the path to the kernel output folder is.
+
+4) Get the resulting image.
+
+The resulting image is placed under output/images and is called either
+``rootfs.cpio.bz2`` or ``initrd``. ``initrd`` is the link to the last modified
+image since some scripts may alter it on post image stage.
+
+Supported environment variables
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The scripts under ``board/intel/common`` accept several environment variables
+that can be used to alter the default behaviour. Typically you do something
+like::
+
+	% make KERNEL_SRC=~/linux
+
+in order to take advantage of these.
+
+BOARD_INTEL_CUSTOM_CMDLINE
+	provides a custom appendix to the command line.
+
+BOARD_INTEL_DIR
+	points to a specific board directory.
+
+KERNEL_SRC
+	path to your kernel output folder.
+
+Alterate console
+~~~~~~~~~~~~~~~~
+
+By default ``ttyS0`` is used as a default cosole for both kernel and userspace.
+The **BR2_TARGET_GENERIC_GETTY_PORT** variable could be used to alterate this
+setting.
+
+Supported boards
+~~~~~~~~~~~~~~~~
+
+.. [intel_defconfig] Generic config for most of Intel SoCs.
+
+Examples
+~~~~~~~~
+
+- ASuS T100TA and the rest with ``ttyUSB0``::
+
+	% make KERNEL_SRC=~/linux BR2_TARGET_GENERIC_GETTY_PORT=ttyUSB0		\
+				  BOARD_INTEL_CUSTOM_CMDLINE="reboot=h,p"
+
+- Galileo (Quark)::
+
+	% make KERNEL_SRC=~/linux BR2_TARGET_GENERIC_GETTY_PORT=ttyS1
+
+- Joule (Broxton), Edison (Merrifield)::
+
+	% make KERNEL_SRC=~/linux BR2_TARGET_GENERIC_GETTY_PORT=ttyS2
+
+- Minnowboard [#]_::
+
+	% make KERNEL_SRC=~/linux BR2_TARGET_GENERIC_GETTY_PORT=ttyPCH0
+
+.. [#] Minnowboard MAX goes the standard way with ``ttyS0``.
diff --git a/board/intel/common/cmdline b/board/intel/common/cmdline
new file mode 100644
index 0000000..54465ef
--- /dev/null
+++ b/board/intel/common/cmdline
@@ -0,0 +1 @@
+console=tty1 console=ttyS0,115200n8
diff --git a/board/intel/common/libshell-intel b/board/intel/common/libshell-intel
new file mode 100644
index 0000000..f834ecb
--- /dev/null
+++ b/board/intel/common/libshell-intel
@@ -0,0 +1,26 @@
+#
+# Copyright (c) 2016 Intel Corp.
+#
+
+#
+# Environment:
+#
+# BOARD_INTEL_DIR		- Directory holding board specific
+#				  configuration
+#
+
+# Use this folder to provide board specific files
+BOARD_DIR_DEFAULT="$(dirname $(dirname "$0"))"
+BOARD_DIR="$(readlink -mnq "${BOARD_INTEL_DIR:-$BOARD_DIR_DEFAULT}")"
+
+[ -d "$BOARD_DIR" ] || echo "Warning: $BOARD_INTEL_DIR does not exist"
+
+# Looking up for a custom file if provided, otherwise fallback to the original name
+intel_file_lookup() {
+	[ -f "$BOARD_DIR/$1" ] && echo "$BOARD_DIR/$1" || echo "$BOARD_DIR_DEFAULT/$1"
+}
+
+# Looking up for a custom folder if provided, otherwise fallback to the original name
+intel_folder_lookup() {
+	[ -d "$BOARD_DIR/$1" ] && echo "$BOARD_DIR/$1" || echo "$BOARD_DIR_DEFAULT/$1"
+}
diff --git a/board/intel/common/post-build.d/10-install-modules b/board/intel/common/post-build.d/10-install-modules
new file mode 100755
index 0000000..4f88d8f
--- /dev/null
+++ b/board/intel/common/post-build.d/10-install-modules
@@ -0,0 +1,23 @@
+#!/bin/sh -e
+
+#
+# Copyright (c) 2016 Intel Corp.
+#
+
+#
+# Environment:
+#
+# BOARD_INTEL_LEAVE_MODULES	- If defined, the modules from previous kernel
+#				  will be left untouched. Otherwise cleans up
+#				  /lib/modules folder completely.
+#
+# KERNEL_SRC			- Directory holding output of Linux kernel
+#				  build. If defined, it will be used to install
+#				  kernel modules from.
+#
+
+# Leave old modules in the /lib/modules folder if asked
+[ -z "$BOARD_INTEL_LEAVE_MODULES" ] && rm -rf $TARGET_DIR/lib/modules/*
+
+# Install kernel modules
+[ -d "$KERNEL_SRC" ] && make -C "$KERNEL_SRC" INSTALL_MOD_PATH="$1" modules_install
diff --git a/board/intel/common/post-build.d/README b/board/intel/common/post-build.d/README
new file mode 100644
index 0000000..5bcb10b
--- /dev/null
+++ b/board/intel/common/post-build.d/README
@@ -0,0 +1,4 @@
+#
+# This folder contains the shell scripts which will be executed in alphabetical
+# order on post build stage.
+#
diff --git a/board/intel/common/post-build.sh b/board/intel/common/post-build.sh
new file mode 100755
index 0000000..28cf638
--- /dev/null
+++ b/board/intel/common/post-build.sh
@@ -0,0 +1,16 @@
+#!/bin/sh -e
+
+#
+# Copyright (c) 2016 Intel Corp.
+#
+
+SCRIPT_LOCATION="$(dirname $0)"
+SCRIPT_DIR="$SCRIPT_LOCATION/post-build.d"
+
+find "$SCRIPT_DIR" -maxdepth 1 -type f -perm -u+x | sort -u | while read script; do
+	name=$(basename $script)
+
+	echo "Executing $name..."
+
+	$script "$@"
+done
diff --git a/board/intel/common/post-image.d/10-prepare-cmdline b/board/intel/common/post-image.d/10-prepare-cmdline
new file mode 100755
index 0000000..a222a1e
--- /dev/null
+++ b/board/intel/common/post-image.d/10-prepare-cmdline
@@ -0,0 +1,26 @@
+#!/bin/sh -e
+
+#
+# Copyright (c) 2016 Intel Corp.
+#
+
+#
+# Environment:
+#
+# BR2_TARGET_GENERIC_GETTY_PORT		- set console port
+#
+
+PROG_NAME="${0##*/}"
+PROG_DIR="${0%/*}"
+
+. $PROG_DIR/../libshell-intel
+
+# Assign default console which should be the same as provided in cmdline
+console_default="ttyS0"
+console="${BR2_TARGET_GENERIC_GETTY_PORT:-$console_default}"
+
+# Get initial cmdline
+cmdline="$(intel_file_lookup "cmdline")"
+
+# Read cmdline and modify console parameter
+sed -e "s#$console_default#$console#" "$cmdline" > "$BINARIES_DIR/cmdline"
diff --git a/board/intel/common/post-image.d/30-append-custom-cmdline b/board/intel/common/post-image.d/30-append-custom-cmdline
new file mode 100755
index 0000000..cbc07da
--- /dev/null
+++ b/board/intel/common/post-image.d/30-append-custom-cmdline
@@ -0,0 +1,17 @@
+#!/bin/sh -e
+
+#
+# Copyright (c) 2016 Intel Corp.
+#
+
+#
+# Environment:
+#
+# BOARD_INTEL_CUSTOM_CMDLINE	- Provides an addition to the default kernel
+#				  command line
+#
+
+[ -n "$BOARD_INTEL_CUSTOM_CMDLINE" ] || exit 0
+
+# Append custom part of cmdline
+echo "$(cat "$BINARIES_DIR/cmdline") $BOARD_INTEL_CUSTOM_CMDLINE" > "$BINARIES_DIR/cmdline"
diff --git a/board/intel/common/post-image.d/40-prepare-initrd b/board/intel/common/post-image.d/40-prepare-initrd
new file mode 100755
index 0000000..7bf7769
--- /dev/null
+++ b/board/intel/common/post-image.d/40-prepare-initrd
@@ -0,0 +1,14 @@
+#!/bin/sh -e
+
+#
+# Copyright (c) 2016 Intel Corp.
+#
+
+#
+# Environment:
+#
+# None
+#
+
+# Link to the initial ramfs image as stated in intel_defconfig
+ln -sf "rootfs.cpio.bz2" "$BINARIES_DIR/initrd"
diff --git a/board/intel/common/post-image.d/README b/board/intel/common/post-image.d/README
new file mode 100644
index 0000000..d214a4e
--- /dev/null
+++ b/board/intel/common/post-image.d/README
@@ -0,0 +1,4 @@
+#
+# This folder contains the shell scripts which will be executed in alphabetical
+# order on post image stage.
+#
diff --git a/board/intel/common/post-image.sh b/board/intel/common/post-image.sh
new file mode 100755
index 0000000..4166845
--- /dev/null
+++ b/board/intel/common/post-image.sh
@@ -0,0 +1,16 @@
+#!/bin/sh -e
+
+#
+# Copyright (c) 2016 Intel Corp.
+#
+
+SCRIPT_LOCATION="$(dirname $0)"
+SCRIPT_DIR="$SCRIPT_LOCATION/post-image.d"
+
+find "$SCRIPT_DIR" -maxdepth 1 -type f -perm -u+x | sort -u | while read script; do
+	name=$(basename $script)
+
+	echo "Executing $name..."
+
+	$script "$@"
+done
diff --git a/configs/intel_defconfig b/configs/intel_defconfig
new file mode 100644
index 0000000..8aff9e1
--- /dev/null
+++ b/configs/intel_defconfig
@@ -0,0 +1,27 @@
+# Architecture
+BR2_i386=y
+BR2_x86_i586=y
+
+# Misc
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
+
+# Root FS
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ROOTFS_CPIO_BZIP2=y
+
+# Root FS hooks
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/intel/common/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/intel/common/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS=""
+
+# Busybox utilities (target)
+BR2_PACKAGE_BUSYBOX_WATCHDOG=y
+
+# Packages
+BR2_PACKAGE_KEXEC=y
+BR2_PACKAGE_KEXEC_ZLIB=y
+BR2_PACKAGE_LRZSZ=y
+BR2_PACKAGE_SCREEN=y
-- 
2.8.1
