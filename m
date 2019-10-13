From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sun, 13 Oct 2019 23:21:28 +0200
Subject: [Buildroot] [PATCH] configs/licheepi_zero: support both standard
 and dock variant
Message-ID: <20191013212128.28763-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to support both the standard and the dock variant, a
different dtb must be choosen, else some of the board hardware
doesn't work as expected (like the RGB led).

This patch configures both the genimage.cfg and the boot.scr with
the correct dtb version before assembling the image.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 board/licheepi/genimage.cfg     |  1 -
 board/licheepi/genimage.sh      | 51 +++++++++++++++++++++++++++++++++
 board/licheepi/readme.txt       |  6 ++++
 configs/licheepi_zero_defconfig |  6 ++--
 4 files changed, 60 insertions(+), 4 deletions(-)
 create mode 100755 board/licheepi/genimage.sh

diff --git a/board/licheepi/genimage.cfg b/board/licheepi/genimage.cfg
index 0d8540f2a0..4faed4de3e 100644
--- a/board/licheepi/genimage.cfg
+++ b/board/licheepi/genimage.cfg
@@ -2,7 +2,6 @@ image boot.vfat {
 	vfat {
 		files = {
 			"zImage",
-			"sun8i-v3s-licheepi-zero-dock.dtb",
 			"sun8i-v3s-licheepi-zero.dtb",
 			"boot.scr"
 		}
diff --git a/board/licheepi/genimage.sh b/board/licheepi/genimage.sh
new file mode 100755
index 0000000000..37a43c87a6
--- /dev/null
+++ b/board/licheepi/genimage.sh
@@ -0,0 +1,51 @@
+#!/usr/bin/env bash
+
+die() {
+  cat <<EOF >&2
+Error: $@
+
+Usage: ${0} -c GENIMAGE_CONFIG_FILE
+EOF
+  exit 1
+}
+
+echo $@
+
+# Parse arguments and put into argument list of the script
+opts="$(getopt -n "${0##*/}" -o c:d: -- "$@")" || exit $?
+eval set -- "$opts"
+
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+GENIMAGE_CFG_TMP="${BUILD_DIR}/genimage.cfg"
+
+while true ; do
+	case "$1" in
+	-c)
+	  GENIMAGE_CFG="${2}";
+	  shift 2 ;;
+	-d)
+	  DTB_CFG="${2}";
+	  shift 2 ;;
+	--) # Discard all non-option parameters
+	  shift 1;
+	  break ;;
+	*)
+	  die "unknown option '${1}'" ;;
+	esac
+done
+
+[ -n "${GENIMAGE_CFG}" ] || die "Missing argument"
+[ -n "${DTB_CFG}" ] || die "Missing argument"
+
+cp "${GENIMAGE_CFG}" "${GENIMAGE_CFG_TMP}"
+sed -i "s/sun8i-v3s-licheepi-zero/${DTB_CFG}/g" "${GENIMAGE_CFG_TMP}"
+sed -i "s/sun8i-v3s-licheepi-zero/${DTB_CFG}/g" "${BINARIES_DIR}/boot.scr"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage \
+	--rootpath "${TARGET_DIR}"     \
+	--tmppath "${GENIMAGE_TMP}"    \
+	--inputpath "${BINARIES_DIR}"  \
+	--outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG_TMP}"
diff --git a/board/licheepi/readme.txt b/board/licheepi/readme.txt
index 6b8bf94b45..b687849c37 100644
--- a/board/licheepi/readme.txt
+++ b/board/licheepi/readme.txt
@@ -12,6 +12,12 @@ Configure Buildroot
 
   $ make licheepi_zero_defconfig
 
+Build the dock variant
+-----------------------
+
+In order to have a working dock variant of the board, you need to change
+BR2_LINUX_KERNEL_INTREE_DTS_NAME to sun8i-v3s-licheepi-zero-dock.
+
 Build the rootfs
 ----------------
 
diff --git a/configs/licheepi_zero_defconfig b/configs/licheepi_zero_defconfig
index 8bb21292ca..467aab852f 100644
--- a/configs/licheepi_zero_defconfig
+++ b/configs/licheepi_zero_defconfig
@@ -11,8 +11,8 @@ BR2_TARGET_GENERIC_HOSTNAME="licheepi-zero"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the LicheePi Zero"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/licheepi/genimage.cfg"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/licheepi/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/licheepi/genimage.cfg -d $(BR2_LINUX_KERNEL_INTREE_DTS_NAME)"
 
 # Kernel
 BR2_LINUX_KERNEL=y
@@ -20,7 +20,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.3.5"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-v3s-licheepi-zero sun8i-v3s-licheepi-zero-dock"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-v3s-licheepi-zero"
 
 BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX=y
-- 
2.17.1
