From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Oct 2017 16:27:53 +0200
Subject: [Buildroot] [git commit] configs/pc: refactor to use genimage and
	grub.cfg
Message-ID: <20171022142754.E8AED8111D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6fab2432375cb2ba0f9aa1af4de55d43afae68a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This simplifies the pc configs and respective post image scripts to use
the shared genimage script and separate grub config files.
Separate grub files are cleaner to maintain and easier to copy and
modify, for example to support booting the pc defconfigs in qemu.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/pc/grub-bios.cfg           |  6 ++++++
 board/pc/grub-efi.cfg            |  6 ++++++
 board/pc/post-image.sh           | 29 ++++-------------------------
 configs/pc_x86_64_bios_defconfig |  3 ++-
 configs/pc_x86_64_efi_defconfig  |  3 ++-
 5 files changed, 20 insertions(+), 27 deletions(-)

diff --git a/board/pc/grub-bios.cfg b/board/pc/grub-bios.cfg
new file mode 100644
index 0000000..bd3e3f0
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
index 0000000..222301a
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
index c88ecb1..bdd0847 100755
--- a/board/pc/post-image.sh
+++ b/board/pc/post-image.sh
@@ -1,35 +1,14 @@
 #!/bin/sh
 
+BOARD_DIR="$(dirname $0)"
+
 # Detect boot strategy, EFI or BIOS
 if [ -f ${BINARIES_DIR}/efi-part/startup.nsh ]; then
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
+  cp -f ${BOARD_DIR}/grub-efi.cfg ${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg
 else
-  BOOT_TYPE=bios
+  cp -f ${BOARD_DIR}/grub-bios.cfg ${TARGET_DIR}/boot/grub/grub.cfg
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
index ddbd776..47787bc 100644
--- a/configs/pc_x86_64_bios_defconfig
+++ b/configs/pc_x86_64_bios_defconfig
@@ -19,7 +19,8 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image.sh support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pc/genimage-bios.cfg"
 
 # Linux headers same as kernel, a 4.13 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
diff --git a/configs/pc_x86_64_efi_defconfig b/configs/pc_x86_64_efi_defconfig
index 9438525..67ba5bc 100644
--- a/configs/pc_x86_64_efi_defconfig
+++ b/configs/pc_x86_64_efi_defconfig
@@ -22,7 +22,8 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image.sh support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pc/genimage-efi.cfg"
 
 # Linux headers same as kernel, a 4.13 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
