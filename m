From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Thu, 25 Aug 2016 17:04:41 +0300
Subject: [Buildroot] [PATCH v1 3/9] board/intel/common: Add possibility for
	adding ACPI tables to the initrd
In-Reply-To: <1472133887-34746-1-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1472133887-34746-1-git-send-email-andriy.shevchenko@linux.intel.com>
Message-ID: <1472133887-34746-4-git-send-email-andriy.shevchenko@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add script which takes ASL files as input, compiles them to AML bytecode,
and prepends the whole thing to the initrd archive. They are placed in
kernel/firmware/acpi directory where the kernel is able to find and use
them.

The script requires iasl host tool that would be provided by acpica package.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 board/intel/common/README.rst                  | 19 +++++-
 board/intel/common/post-image.d/80-acpi-tables | 86 ++++++++++++++++++++++++++
 configs/intel_defconfig                        |  3 +
 3 files changed, 107 insertions(+), 1 deletion(-)
 create mode 100755 board/intel/common/post-image.d/80-acpi-tables

diff --git a/board/intel/common/README.rst b/board/intel/common/README.rst
index e427067..f7f677e 100644
--- a/board/intel/common/README.rst
+++ b/board/intel/common/README.rst
@@ -52,6 +52,9 @@ like::
 
 in order to take advantage of these.
 
+BOARD_INTEL_ACPI_TABLES
+	list of table names to built into the ``initrd``.
+
 BOARD_INTEL_CUSTOM_CMDLINE
 	provides a custom appendix to the command line.
 
@@ -68,6 +71,20 @@ By default ``ttyS0`` is used as a default cosole for both kernel and userspace.
 The **BR2_TARGET_GENERIC_GETTY_PORT** variable could be used to alterate this
 setting.
 
+Adding custom ACPI SSDT tables
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+You can add additional ACPI tables to the ``initrd`` (think of device tree
+overlays) if you need to have some special devices for example. The ASL files
+should be stored in board specific directories as they vary from one board to
+another. Below we add SPI test device for Intel `Joule`_ board::
+
+	% make KERNEL_SRC=~/linux BR2_TARGET_GENERIC_GETTY_PORT=ttyS2		\
+				  BOARD_INTEL_DIR=board/intel/joule		\
+				  BOARD_INTEL_ACPI_TABLES=spidev.asl
+
+The resulting image is called ``output/images/joule-acpi-rootfs.cpio``.
+
 Supported boards
 ~~~~~~~~~~~~~~~~
 
@@ -85,7 +102,7 @@ Examples
 
 	% make KERNEL_SRC=~/linux BR2_TARGET_GENERIC_GETTY_PORT=ttyS1
 
-- Joule (Broxton), Edison (Merrifield)::
+- _`Joule` (Broxton), Edison (Merrifield)::
 
 	% make KERNEL_SRC=~/linux BR2_TARGET_GENERIC_GETTY_PORT=ttyS2
 
diff --git a/board/intel/common/post-image.d/80-acpi-tables b/board/intel/common/post-image.d/80-acpi-tables
new file mode 100755
index 0000000..c9495d8
--- /dev/null
+++ b/board/intel/common/post-image.d/80-acpi-tables
@@ -0,0 +1,86 @@
+#!/bin/sh -e
+
+#
+# Copyright (c) 2016 Intel Corp.
+#
+
+#
+# Environment:
+#
+# BOARD_INTEL_ACPI_TABLES	- ASL files to build separated by spaces
+#
+# BOARD_INTEL_DIR		- Directory holding board specific
+# 				  configuration. Should contain directory
+# 				  called "acpi" which holds the ASL tables.
+#
+# For example following variables compile two ACPI SSDTs into updated
+# initrd image called $BINARIES_DIR/joule-acpi-rootfs.cpio.
+#
+# BOARD_INTEL_DIR="board/intel/joule"
+# BOARD_INTEL_ACPI_TABLES="at25.asl spidev.asl"
+#
+
+PROG_NAME="${0##*/}"
+PROG_DIR="${0%/*}"
+
+. $PROG_DIR/../libshell-intel
+
+ACPI_DIR="$(intel_folder_lookup "acpi")"
+ACPI_TABLES="$BOARD_INTEL_ACPI_TABLES"
+
+[ -d "$ACPI_DIR" ] || exit 0
+[ -z "$ACPI_TABLES" ] && exit 0
+
+# Pick iASL.
+# First try from buildroot and if not there then try from the host.
+[ -x "$HOST_DIR/usr/bin/iasl" ] && iasl="$HOST_DIR/usr/bin/iasl" || iasl=$(which iasl)
+
+[ -x "$iasl" ] || {
+	echo "You need to to have iASL compiler available. You can either enable"
+	echo "BR2_PACKAGE_HOST_ACPICA or install it locally for your host."
+	echo "Typically the package is called acpica-tools in major distros".
+	exit 1
+}
+
+# The name of the folder is the name of a board
+board_name="${BOARD_DIR##*/}"
+[ "$board_name" = "common" ] && {
+	echo "Adding ACPI tables is always specific to a board!"
+	echo "You are not supposed to use common as board here!"
+	exit 1
+}
+
+# Always prefix with the board name to avoid mistakes if the initrd is used
+# with another board.
+updated_initrd_name="${board_name}-acpi-rootfs.cpio"
+updated_initrd="$BINARIES_DIR/$updated_initrd_name"
+initrd="$(readlink -enq "$BINARIES_DIR/initrd")"
+tmpamldir="$BINARIES_DIR/acpi-tables"
+
+# Make sure existing tables get cleared
+rm -fr $tmpamldir
+mkdir -p $tmpamldir/kernel/firmware/acpi
+
+for table in $ACPI_TABLES; do
+	[ -f "$ACPI_DIR/$table" ] || continue
+
+	$iasl -p $tmpamldir/kernel/firmware/acpi/$table "$ACPI_DIR/$table" > /dev/null 2>&1
+
+	echo "ACPI: Compiled ASL from $(realpath --relative-to=$PWD $ACPI_DIR/$table)"
+done
+
+# Exit if no tables were compiled
+[ -n "$(find $tmpamldir -type f)" ] || {
+	echo "ACPI: No tables were compiled"
+	exit 0
+}
+
+# Attach compiled tables to initrd
+(
+	cd $tmpamldir
+	find kernel | cpio -H newc -o > $updated_initrd 2>/dev/null
+	cat $initrd >> $updated_initrd
+	ln -sf "$updated_initrd_name" "$BINARIES_DIR/initrd"
+)
+
+echo "ACPI: Created initrd with updated ACPI tables in $(realpath --relative-to=$PWD $updated_initrd)"
diff --git a/configs/intel_defconfig b/configs/intel_defconfig
index 8aff9e1..24167fc 100644
--- a/configs/intel_defconfig
+++ b/configs/intel_defconfig
@@ -17,6 +17,9 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/intel/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/intel/common/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS=""
 
+# Host tools
+BR2_PACKAGE_HOST_ACPICA=y
+
 # Busybox utilities (target)
 BR2_PACKAGE_BUSYBOX_WATCHDOG=y
 
-- 
2.8.1
