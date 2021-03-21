From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 21 Mar 2021 12:40:00 +0100
Subject: [Buildroot] [PATCH v4 1/3] package/rpi-firmware: rework boot/config
 file handling
Message-ID: <20210321114002.31000-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Try to be less smart (focused on the one target/one use-case),
instead reduce the rpi-firmware package to a selectable list
of (verbatim) installed firmware files.

- change rpi-firmware config handling from rpi-variant/rpi-flavour
  choices to bootcode.bin, pi-default/-extended/-cut-down and
  pi4-/default/-extended/-cut-down selection

- add BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE option to select installable
  config.txt file

- remove config.txt modify code/handling from raspberry post-image.sh
  script

- add different customized config.txt files to the raspberry board
  section

- change raspberry defconfigs to select appropiate rpi-firmware
  and config.txt files

- change genimage-raspberrypi4.cfg/genimage-raspberrypi4-64.cfg to
  use start4.elf and fixup4.dat

With this changes a better support for custom use-cases should
be possible, specially multi-target SD cards as suggested by
Stefan Agner ([1]).

[1] http://lists.busybox.net/pipermail/buildroot/2021-February/303318.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - update genimage-raspberrypi4.cfg/genimage-raspberrypi4-64.cfg to
    use start4.elf and fixup4.dat

Changes v2 -> v3:
  - remove duplicated BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4 from
    configs/raspberrypi4_64_defconfig
  - fix BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE entry from
    configs/raspberrypi4_64_defconfig
  - change firmware list to one-assignment style (suggested by Yann E. MORIN)
  - change firmware install to make-level foreach loop (suggested by Yann E. MORIN)

Changes v3 -> v4:
  - fix config.in typo (Patch vs. Path)
  - fix 64bit config.txt files (kernel image name zImage vs. Image,
    previously done by 'post-image.sh --aarch64')
---
 .../raspberrypi/config_0w.txt                 |  7 +-
 board/raspberrypi/config_3.txt                | 26 +++++++
 board/raspberrypi/config_3_64bit.txt          | 30 +++++++
 board/raspberrypi/config_3_qt5we.txt          | 26 +++++++
 board/raspberrypi/config_4.txt                | 26 +++++++
 board/raspberrypi/config_4_64bit.txt          | 30 +++++++
 board/raspberrypi/config_default.txt          | 23 ++++++
 .../raspberrypi/genimage-raspberrypi4-64.cfg  |  4 +-
 board/raspberrypi/genimage-raspberrypi4.cfg   |  4 +-
 board/raspberrypi/post-image.sh               | 33 --------
 configs/raspberrypi0_defconfig                |  3 +
 configs/raspberrypi0w_defconfig               |  4 +-
 configs/raspberrypi2_defconfig                |  3 +
 configs/raspberrypi3_64_defconfig             |  4 +-
 configs/raspberrypi3_defconfig                |  4 +-
 configs/raspberrypi3_qt5we_defconfig          |  4 +-
 configs/raspberrypi4_64_defconfig             |  2 +-
 configs/raspberrypi4_defconfig                |  2 +-
 configs/raspberrypi_defconfig                 |  3 +
 package/rpi-firmware/Config.in                | 78 ++++++++-----------
 package/rpi-firmware/rpi-firmware.mk          | 34 +++++---
 21 files changed, 249 insertions(+), 101 deletions(-)
 rename package/rpi-firmware/config.txt => board/raspberrypi/config_0w.txt (79%)
 create mode 100644 board/raspberrypi/config_3.txt
 create mode 100644 board/raspberrypi/config_3_64bit.txt
 create mode 100644 board/raspberrypi/config_3_qt5we.txt
 create mode 100644 board/raspberrypi/config_4.txt
 create mode 100644 board/raspberrypi/config_4_64bit.txt
 create mode 100644 board/raspberrypi/config_default.txt

diff --git a/package/rpi-firmware/config.txt b/board/raspberrypi/config_0w.txt
similarity index 79%
rename from package/rpi-firmware/config.txt
rename to board/raspberrypi/config_0w.txt
index 4a92a4dd95..771b975046 100644
--- a/package/rpi-firmware/config.txt
+++ b/board/raspberrypi/config_0w.txt
@@ -1,11 +1,9 @@
 # Please note that this is only a sample, we recommend you to change it to fit
 # your needs.
-# You should override this file using a post-build script.
+# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
 # See http://buildroot.org/manual.html#rootfs-custom
 # and http://elinux.org/RPiconfig for a description of config.txt syntax
 
-# We always use the same names, the real used variant is selected by
-# BR2_PACKAGE_RPI_FIRMWARE_{DEFAULT,X,CD} choice
 start_file=start.elf
 fixup_file=fixup.dat
 
@@ -23,3 +21,6 @@ disable_overscan=1
 gpu_mem_256=100
 gpu_mem_512=100
 gpu_mem_1024=100
+
+# fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
+dtoverlay=miniuart-bt
diff --git a/board/raspberrypi/config_3.txt b/board/raspberrypi/config_3.txt
new file mode 100644
index 0000000000..771b975046
--- /dev/null
+++ b/board/raspberrypi/config_3.txt
@@ -0,0 +1,26 @@
+# Please note that this is only a sample, we recommend you to change it to fit
+# your needs.
+# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
+# See http://buildroot.org/manual.html#rootfs-custom
+# and http://elinux.org/RPiconfig for a description of config.txt syntax
+
+start_file=start.elf
+fixup_file=fixup.dat
+
+kernel=zImage
+
+# To use an external initramfs file
+#initramfs rootfs.cpio.gz
+
+# Disable overscan assuming the display supports displaying the full resolution
+# If the text shown on the screen disappears off the edge, comment this out
+disable_overscan=1
+
+# How much memory in MB to assign to the GPU on Pi models having
+# 256, 512 or 1024 MB total memory
+gpu_mem_256=100
+gpu_mem_512=100
+gpu_mem_1024=100
+
+# fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
+dtoverlay=miniuart-bt
diff --git a/board/raspberrypi/config_3_64bit.txt b/board/raspberrypi/config_3_64bit.txt
new file mode 100644
index 0000000000..5d0be88d48
--- /dev/null
+++ b/board/raspberrypi/config_3_64bit.txt
@@ -0,0 +1,30 @@
+# Please note that this is only a sample, we recommend you to change it to fit
+# your needs.
+# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
+# See http://buildroot.org/manual.html#rootfs-custom
+# and http://elinux.org/RPiconfig for a description of config.txt syntax
+
+start_file=start.elf
+fixup_file=fixup.dat
+
+kernel=Image
+
+# To use an external initramfs file
+#initramfs rootfs.cpio.gz
+
+# Disable overscan assuming the display supports displaying the full resolution
+# If the text shown on the screen disappears off the edge, comment this out
+disable_overscan=1
+
+# How much memory in MB to assign to the GPU on Pi models having
+# 256, 512 or 1024 MB total memory
+gpu_mem_256=100
+gpu_mem_512=100
+gpu_mem_1024=100
+
+# fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
+dtoverlay=miniuart-bt
+
+# enable 64bits support
+arm_64bit=1
+
diff --git a/board/raspberrypi/config_3_qt5we.txt b/board/raspberrypi/config_3_qt5we.txt
new file mode 100644
index 0000000000..752310b179
--- /dev/null
+++ b/board/raspberrypi/config_3_qt5we.txt
@@ -0,0 +1,26 @@
+# Please note that this is only a sample, we recommend you to change it to fit
+# your needs.
+# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
+# See http://buildroot.org/manual.html#rootfs-custom
+# and http://elinux.org/RPiconfig for a description of config.txt syntax
+
+start_file=start.elf
+fixup_file=fixup.dat
+
+kernel=zImage
+
+# To use an external initramfs file
+#initramfs rootfs.cpio.gz
+
+# Disable overscan assuming the display supports displaying the full resolution
+# If the text shown on the screen disappears off the edge, comment this out
+disable_overscan=1
+
+# How much memory in MB to assign to the GPU on Pi models having
+# 256, 512 or 1024 MB total memory
+gpu_mem_256=100
+gpu_mem_512=100
+gpu_mem_1024=200
+
+# fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
+dtoverlay=miniuart-bt
diff --git a/board/raspberrypi/config_4.txt b/board/raspberrypi/config_4.txt
new file mode 100644
index 0000000000..01f60395b3
--- /dev/null
+++ b/board/raspberrypi/config_4.txt
@@ -0,0 +1,26 @@
+# Please note that this is only a sample, we recommend you to change it to fit
+# your needs.
+# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
+# See http://buildroot.org/manual.html#rootfs-custom
+# and http://elinux.org/RPiconfig for a description of config.txt syntax
+
+start_file=start4.elf
+fixup_file=fixup4.dat
+
+kernel=zImage
+
+# To use an external initramfs file
+#initramfs rootfs.cpio.gz
+
+# Disable overscan assuming the display supports displaying the full resolution
+# If the text shown on the screen disappears off the edge, comment this out
+disable_overscan=1
+
+# How much memory in MB to assign to the GPU on Pi models having
+# 256, 512 or 1024 MB total memory
+gpu_mem_256=100
+gpu_mem_512=100
+gpu_mem_1024=100
+
+# fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
+dtoverlay=miniuart-bt
diff --git a/board/raspberrypi/config_4_64bit.txt b/board/raspberrypi/config_4_64bit.txt
new file mode 100644
index 0000000000..6cd8a729cd
--- /dev/null
+++ b/board/raspberrypi/config_4_64bit.txt
@@ -0,0 +1,30 @@
+# Please note that this is only a sample, we recommend you to change it to fit
+# your needs.
+# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
+# See http://buildroot.org/manual.html#rootfs-custom
+# and http://elinux.org/RPiconfig for a description of config.txt syntax
+
+start_file=start4.elf
+fixup_file=fixup4.dat
+
+kernel=Image
+
+# To use an external initramfs file
+#initramfs rootfs.cpio.gz
+
+# Disable overscan assuming the display supports displaying the full resolution
+# If the text shown on the screen disappears off the edge, comment this out
+disable_overscan=1
+
+# How much memory in MB to assign to the GPU on Pi models having
+# 256, 512 or 1024 MB total memory
+gpu_mem_256=100
+gpu_mem_512=100
+gpu_mem_1024=100
+
+# fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
+dtoverlay=miniuart-bt
+
+# enable 64bits support
+arm_64bit=1
+
diff --git a/board/raspberrypi/config_default.txt b/board/raspberrypi/config_default.txt
new file mode 100644
index 0000000000..c09ecca1a9
--- /dev/null
+++ b/board/raspberrypi/config_default.txt
@@ -0,0 +1,23 @@
+# Please note that this is only a sample, we recommend you to change it to fit
+# your needs.
+# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
+# See http://buildroot.org/manual.html#rootfs-custom
+# and http://elinux.org/RPiconfig for a description of config.txt syntax
+
+start_file=start.elf
+fixup_file=fixup.dat
+
+kernel=zImage
+
+# To use an external initramfs file
+#initramfs rootfs.cpio.gz
+
+# Disable overscan assuming the display supports displaying the full resolution
+# If the text shown on the screen disappears off the edge, comment this out
+disable_overscan=1
+
+# How much memory in MB to assign to the GPU on Pi models having
+# 256, 512 or 1024 MB total memory
+gpu_mem_256=100
+gpu_mem_512=100
+gpu_mem_1024=100
diff --git a/board/raspberrypi/genimage-raspberrypi4-64.cfg b/board/raspberrypi/genimage-raspberrypi4-64.cfg
index 854e0c7e31..3c480e98f0 100644
--- a/board/raspberrypi/genimage-raspberrypi4-64.cfg
+++ b/board/raspberrypi/genimage-raspberrypi4-64.cfg
@@ -4,8 +4,8 @@ image boot.vfat {
       "bcm2711-rpi-4-b.dtb",
       "rpi-firmware/cmdline.txt",
       "rpi-firmware/config.txt",
-      "rpi-firmware/fixup.dat",
-      "rpi-firmware/start.elf",
+      "rpi-firmware/fixup4.dat",
+      "rpi-firmware/start4.elf",
       "rpi-firmware/overlays",
       "Image"
     }
diff --git a/board/raspberrypi/genimage-raspberrypi4.cfg b/board/raspberrypi/genimage-raspberrypi4.cfg
index 60e1f23bcc..4e4742f3ef 100644
--- a/board/raspberrypi/genimage-raspberrypi4.cfg
+++ b/board/raspberrypi/genimage-raspberrypi4.cfg
@@ -4,8 +4,8 @@ image boot.vfat {
       "bcm2711-rpi-4-b.dtb",
       "rpi-firmware/cmdline.txt",
       "rpi-firmware/config.txt",
-      "rpi-firmware/fixup.dat",
-      "rpi-firmware/start.elf",
+      "rpi-firmware/fixup4.dat",
+      "rpi-firmware/start4.elf",
       "rpi-firmware/overlays",
       "zImage"
     }
diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index 9dbd98ef9b..6cad20fb9e 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -7,39 +7,6 @@ BOARD_NAME="$(basename ${BOARD_DIR})"
 GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOARD_NAME}.cfg"
 GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 
-for arg in "$@"
-do
-	case "${arg}" in
-		--add-miniuart-bt-overlay)
-		if ! grep -qE '^dtoverlay=' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
-			echo "Adding 'dtoverlay=miniuart-bt' to config.txt (fixes ttyAMA0 serial console)."
-			cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
-
-# fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
-dtoverlay=miniuart-bt
-__EOF__
-		fi
-		;;
-		--aarch64)
-		# Run a 64bits kernel (armv8)
-		sed -e '/^kernel=/s,=.*,=Image,' -i "${BINARIES_DIR}/rpi-firmware/config.txt"
-		if ! grep -qE '^arm_64bit=1' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
-			cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
-
-# enable 64bits support
-arm_64bit=1
-__EOF__
-		fi
-		;;
-		--gpu_mem_256=*|--gpu_mem_512=*|--gpu_mem_1024=*)
-		# Set GPU memory
-		gpu_mem="${arg:2}"
-		sed -e "/^${gpu_mem%=*}=/s,=.*,=${gpu_mem##*=}," -i "${BINARIES_DIR}/rpi-firmware/config.txt"
-		;;
-	esac
-
-done
-
 # Pass an empty rootpath. genimage makes a full copy of the given rootpath to
 # ${GENIMAGE_TMP}/root so passing TARGET_DIR would be a waste of time and disk
 # space. We don't rely on genimage to build the rootfs image, just to insert a
diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
index c06d6dfcb5..3f6fbbf176 100644
--- a/configs/raspberrypi0_defconfig
+++ b/configs/raspberrypi0_defconfig
@@ -20,6 +20,9 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-zero"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN=y
+BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi0/config_default.txt"
 # BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is not set
 
 # Required tools to create the SD image
diff --git a/configs/raspberrypi0w_defconfig b/configs/raspberrypi0w_defconfig
index b54bb34ad9..82413ef327 100644
--- a/configs/raspberrypi0w_defconfig
+++ b/configs/raspberrypi0w_defconfig
@@ -16,6 +16,9 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-zero-w"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN=y
+BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi0w/config_0w.txt"
 
 # Required tools to create the SD image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
@@ -29,4 +32,3 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi0w/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi0w/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay"
diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index 5104422cb1..9a56e15f0a 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -22,6 +22,9 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2709-rpi-2-b"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN=y
+BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi/config_default.txt"
 # BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is not set
 
 # Required tools to create the SD image
diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
index 65c1291e6a..d964058c96 100644
--- a/configs/raspberrypi3_64_defconfig
+++ b/configs/raspberrypi3_64_defconfig
@@ -21,6 +21,9 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2710-rpi-
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN=y
+BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi3-64/config_3_64bit.txt"
 
 # Required tools to create the SD image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
@@ -34,4 +37,3 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3-64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3-64/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="--aarch64 --add-miniuart-bt-overlay"
diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index 96eca54f0d..b5fa794d5c 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -21,6 +21,9 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2710-rpi-3-b bcm2710-rpi-3-b-plus bcm2710-r
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN=y
+BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi3/config_3.txt"
 
 # Required tools to create the SD image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
@@ -34,4 +37,3 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay"
diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
index 8015288acb..ffdc258534 100644
--- a/configs/raspberrypi3_qt5we_defconfig
+++ b/configs/raspberrypi3_qt5we_defconfig
@@ -31,6 +31,9 @@ BR2_PACKAGE_QT5BASE_PNG=y
 BR2_PACKAGE_QT5WEBENGINE=y
 BR2_PACKAGE_QT5WEBENGINE_PROPRIETARY_CODECS=y
 BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN=y
+BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi3/config_3_qt5we.txt"
 BR2_PACKAGE_RPI_USERLAND=y
 BR2_PACKAGE_CA_CERTIFICATES=y
 BR2_PACKAGE_NTP=y
@@ -48,4 +51,3 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="400M"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay --gpu_mem_1024=200"
diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
index 94ac5cf5ec..e3e91b5a00 100644
--- a/configs/raspberrypi4_64_defconfig
+++ b/configs/raspberrypi4_64_defconfig
@@ -22,6 +22,7 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 BR2_PACKAGE_RPI_FIRMWARE=y
 BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi4-64/config_4_64bit.txt"
 
 # Required tools to create the SD image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
@@ -35,4 +36,3 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4-64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4-64/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay --aarch64"
diff --git a/configs/raspberrypi4_defconfig b/configs/raspberrypi4_defconfig
index c2ed5e73c5..f9a90eb1cb 100644
--- a/configs/raspberrypi4_defconfig
+++ b/configs/raspberrypi4_defconfig
@@ -22,6 +22,7 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 BR2_PACKAGE_RPI_FIRMWARE=y
 BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi4/config_4.txt"
 
 # Required tools to create the SD image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
@@ -35,4 +36,3 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay"
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 2d3bb536bf..9c9513277b 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -21,6 +21,9 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-b bcm2708-rpi-b-plus bcm2708-rpi-c
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN=y
+BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi/config_default.txt"
 # BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is not set
 
 # Required tools to create the SD image
diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index f5a25c5680..9e401829c6 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -11,63 +11,53 @@ config BR2_PACKAGE_RPI_FIRMWARE
 
 if BR2_PACKAGE_RPI_FIRMWARE
 
-choice
-	bool "rpi variant"
+config BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN
+	bool "rpi 0/1/2/3 bootcode.bin"
 	help
-	  The Raspberry Pi 4 introduced a slightly different naming
-	  convention and set of boot files. This option controls which
-	  format to use.
+	  The bootcode.bin for versions Zero/1/2/3 (not needed on rpi4,
+	  because it has been replaced by boot code in the onboard
+	  EEPROM).
 
 config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI
-	bool "rpi 0/1/2/3"
+	bool "rpi 0/1/2/3 (default)"
 	help
-	  The default set of files, for versions pre-4
+	  The default set of files for versions Zero/1/2/3.
 
-config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4
-	bool "rpi 4"
+config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_X
+	bool "rpi 0/1/2/3 (extended)"
 	help
-	  The Raspberry Pi 4 files
-endchoice
+	  The extended set of files for versions Zero/1/2/3 (additional
+	  GPU features, eg. more audio/video codecs).
 
-choice
-	bool "Firmware to boot"
-	default BR2_PACKAGE_RPI_FIRMWARE_DEFAULT
+config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_CD
+	bool "rpi 0/1/2/3 (cut-down)"
 	help
-	  There are three different firmware files:
-	    - the default firmware, that enables standard GPU
-	      features;
-	    - the extended firmware, that enables additional GPU
-	      features (eg. more audio/video codecs);
-	    - the cut-down firmware, for emergency situations, with
-	      only features required to boot a Linux kernel.
-
-config BR2_PACKAGE_RPI_FIRMWARE_DEFAULT
-	bool "default"
+	  The cut-down set of files for versions Zero/1/2/3 (only
+	  features required to boot a Linux kernel).
+
+config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4
+	bool "rpi 4 (default)"
+	help
+	  The default set of files for versions 4 (standard GPU
+	  features).
+
+config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_X
+	bool "rpi 4 (extended)"
 	help
-	  The default firmware, that enables standard GPU features.
+	  The extended set of files for versions 4 (additional GPU
+	  features, eg. more audio/video codecs).
 
-config BR2_PACKAGE_RPI_FIRMWARE_X
-	bool "extended ('x', more codecs)"
+config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_CD
+	bool "rpi 4 (cut-down)"
 	help
-	  The extended firmware, that enables additional GPU features
-	  (eg. more audio/video codecs).
+	  The cut-down set of files for versions 4 (only features
+	  required to boot a Linux kernel).
 
-config BR2_PACKAGE_RPI_FIRMWARE_CD
-	bool "cut-down ('cd', emergency)"
+config BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE
+	string "Path to a file stored as boot/config.txt"
 	help
-	  The cut-down firmware, for emergency situations, with only
-	  features required to boot a Linux kernel.
-
-endchoice
-
-config BR2_PACKAGE_RPI_FIRMWARE_BOOT
-	string
-	default ""      if BR2_PACKAGE_RPI_FIRMWARE_DEFAULT && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI
-	default "4"     if BR2_PACKAGE_RPI_FIRMWARE_DEFAULT && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4
-	default "_x"    if BR2_PACKAGE_RPI_FIRMWARE_X && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI
-	default "4x"    if BR2_PACKAGE_RPI_FIRMWARE_X && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4
-	default "_cd"   if BR2_PACKAGE_RPI_FIRMWARE_CD && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI
-	default "4cd"   if BR2_PACKAGE_RPI_FIRMWARE_CD && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4
+	  Path to a file stored as config.txt in the boot partiton
+	  of the generated SD card image.
 
 config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
 	bool "Install Device Tree Blobs (DTBs)"
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index f3d28ef825..7905791d1d 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -10,6 +10,27 @@ RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
 RPI_FIRMWARE_INSTALL_IMAGES = YES
 
+RPI_FIRMWARE_FILES = \
+	$(if $(BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN), bootcode.bin) \
+	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI), start.elf fixup.dat) \
+	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_X), startx.elf fixupx.dat) \
+	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_CD), start_cd.elf fixup_cd.dat) \
+	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4), start4.elf fixup4.dat) \
+	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_X), start4x.elf fixup4x.dat) \
+	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_CD), start4cd.elf fixup4cd.dat)
+
+define RPI_FIRMWARE_INSTALL_BIN
+	$(foreach f,$(RPI_FIRMWARE_FILES), \
+		$(INSTALL) -D -m 0644 $(@D)/boot/$(f) $(BINARIES_DIR)/rpi-firmware/$(f)
+	)
+endef
+
+ifneq ($(BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE),)
+define RPI_FIRMWARE_INSTALL_CONFIG
+	$(INSTALL) -D -m 0644 $(BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE) $(BINARIES_DIR)/rpi-firmware/config.txt
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS),y)
 define RPI_FIRMWARE_INSTALL_DTB
 	$(foreach dtb,$(wildcard $(@D)/boot/*.dtb), \
@@ -41,19 +62,10 @@ define RPI_FIRMWARE_INSTALL_TARGET_CMDS
 endef
 endif # INSTALL_VCDBG
 
-ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI),y)
-# bootcode.bin is not used on rpi4, because it has been replaced by boot code in the onboard EEPROM
-define RPI_FIRMWARE_INSTALL_BOOTCODE_BIN
-	$(INSTALL) -D -m 0644 $(@D)/boot/bootcode.bin $(BINARIES_DIR)/rpi-firmware/bootcode.bin
-endef
-endif
-
 define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
-	$(INSTALL) -D -m 0644 package/rpi-firmware/config.txt $(BINARIES_DIR)/rpi-firmware/config.txt
 	$(INSTALL) -D -m 0644 package/rpi-firmware/cmdline.txt $(BINARIES_DIR)/rpi-firmware/cmdline.txt
-	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start.elf
-	$(INSTALL) -D -m 0644 $(@D)/boot/fixup$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/fixup.dat
-	$(RPI_FIRMWARE_INSTALL_BOOTCODE_BIN)
+	$(RPI_FIRMWARE_INSTALL_BIN)
+	$(RPI_FIRMWARE_INSTALL_CONFIG)
 	$(RPI_FIRMWARE_INSTALL_DTB)
 	$(RPI_FIRMWARE_INSTALL_DTB_OVERLAYS)
 endef
-- 
2.30.2
