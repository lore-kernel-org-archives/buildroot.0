From: Erico Nunes <nunes.erico@gmail.com>
Date: Sun, 22 Oct 2017 11:38:41 +0200
Subject: [Buildroot] [PATCH 3/4] configs/pc: refactor to use genimage and
	grub.cfg
In-Reply-To: <20171022093842.21788-1-nunes.erico@gmail.com>
References: <20171022093842.21788-1-nunes.erico@gmail.com>
Message-ID: <20171022093842.21788-4-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This refactors the pc configs and respective config files to use common
Buildroot features instead of reimplementing them in the post image
script.
The genimage script in support/ can be used as is done in many configs.
The grub.cfg file can be set with BR2_TARGET_GRUB2_CFG instead of
overwriting it in the script.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 board/pc/grub-bios.cfg           |  6 ++++++
 board/pc/grub-efi.cfg            |  6 ++++++
 board/pc/post-image.sh           | 28 +---------------------------
 configs/pc_x86_64_bios_defconfig |  4 +++-
 configs/pc_x86_64_efi_defconfig  |  4 +++-
 5 files changed, 19 insertions(+), 29 deletions(-)
 create mode 100644 board/pc/grub-bios.cfg
 create mode 100755 board/pc/grub-efi.cfg

diff --git a/board/pc/grub-bios.cfg b/board/pc/grub-bios.cfg
new file mode 100644
index 0000000000..bd3e3f0006
--- /dev/null
+++ b/board/pc/grub-bios.cfg
@@ -0,0 +1,6 @@
+set default="0"
+set timeout="5"
+
+menuentry "Buildroot" {
+	linux /boot/bzImage root=/dev/sda1 rootwait console=tty1
+}
diff --git a/board/pc/grub-efi.cfg b/board/pc/grub-efi.cfg
new file mode 100755
index 0000000000..222301a4e0
--- /dev/null
+++ b/board/pc/grub-efi.cfg
@@ -0,0 +1,6 @@
+set default="0"
+set timeout="5"
+
+menuentry "Buildroot" {
+	linux /bzImage root=/dev/sda2 rootwait console=tty1
+}
diff --git a/board/pc/post-image.sh b/board/pc/post-image.sh
index c88ecb1dc2..59845ea3f3 100755
--- a/board/pc/post-image.sh
+++ b/board/pc/post-image.sh
@@ -1,35 +1,9 @@
 #!/bin/sh
 
 # Detect boot strategy, EFI or BIOS
-if [ -f ${BINARIES_DIR}/efi-part/startup.nsh ]; then
-  BOOT_TYPE=efi
-  # grub.cfg needs customization for EFI since the root partition is
-  # number 2, and bzImage is in the EFI partition (1)
-  cat >${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg <<__EOF__
-set default="0"
-set timeout="5"
-
-menuentry "Buildroot" {
-	linux /bzImage root=/dev/sda2 rootwait console=tty1
-}
-__EOF__
-else
-  BOOT_TYPE=bios
+if [ ! -f ${BINARIES_DIR}/efi-part/startup.nsh ]; then
   # Copy grub 1st stage to binaries, required for genimage
   cp -f ${HOST_DIR}/lib/grub/i386-pc/boot.img ${BINARIES_DIR}
 fi
 
-BOARD_DIR="$(dirname $0)"
-GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOOT_TYPE}.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-rm -rf "${GENIMAGE_TMP}"
-
-genimage                           \
-       --rootpath "${TARGET_DIR}"     \
-       --tmppath "${GENIMAGE_TMP}"    \
-       --inputpath "${BINARIES_DIR}"  \
-       --outputpath "${BINARIES_DIR}" \
-       --config "${GENIMAGE_CFG}"
-
 exit $?
diff --git a/configs/pc_x86_64_bios_defconfig b/configs/pc_x86_64_bios_defconfig
index ddbd776154..ae6619e36f 100644
--- a/configs/pc_x86_64_bios_defconfig
+++ b/configs/pc_x86_64_bios_defconfig
@@ -13,13 +13,15 @@ BR2_PACKAGE_HOST_GENIMAGE=y
 
 # Bootloader
 BR2_TARGET_GRUB2=y
+BR2_TARGET_GRUB2_CFG="board/pc/grub-bios.cfg"
 
 # Filesystem / image
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image.sh support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pc/genimage-bios.cfg"
 
 # Linux headers same as kernel, a 4.13 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
diff --git a/configs/pc_x86_64_efi_defconfig b/configs/pc_x86_64_efi_defconfig
index 94385252b9..304a0ce5b1 100644
--- a/configs/pc_x86_64_efi_defconfig
+++ b/configs/pc_x86_64_efi_defconfig
@@ -16,13 +16,15 @@ BR2_PACKAGE_HOST_MTOOLS=y
 # Bootloader
 BR2_TARGET_GRUB2=y
 BR2_TARGET_GRUB2_X86_64_EFI=y
+BR2_TARGET_GRUB2_CFG="board/pc/grub-efi.cfg"
 
 # Filesystem / image
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pc/genimage-efi.cfg"
 
 # Linux headers same as kernel, a 4.13 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
-- 
2.13.6
