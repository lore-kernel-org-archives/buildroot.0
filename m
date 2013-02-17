From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 18 Feb 2013 00:10:28 +0100
Subject: [Buildroot] [PATCH 3/4] fs/ext2: rename to 'ext' as it can now
	build ext2/3/4 filesystems
In-Reply-To: <cover.1361142401.git.yann.morin.1998@free.fr>
References: <cover.1361142401.git.yann.morin.1998@free.fr>
Message-ID: <bcd3b138016eb551aa3b5e3dfe461e718e83bcb3.1361142401.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update defconfigs and boards readmes accordingly.

Signed-off-by: yann.morin.1998 at free.fr
---
 board/arm/foundation-v8/readme.txt          |    2 +-
 board/boundarydevices/nitrogen6x/readme.txt |    8 +++---
 board/qemu/arm-versatile/readme.txt         |    2 +-
 board/qemu/arm-vexpress/readme.txt          |    2 +-
 board/qemu/mips-malta/readme.txt            |    2 +-
 board/qemu/mips64-malta/readme.txt          |    2 +-
 board/qemu/mipsel-malta/readme.txt          |    2 +-
 board/qemu/powerpc-g3beige/readme.txt       |    2 +-
 board/qemu/sh4-r2d/readme.txt               |    2 +-
 board/qemu/sparc-ss10/readme.txt            |    2 +-
 board/qemu/x86/readme.txt                   |    2 +-
 board/qemu/x86_64/readme.txt                |    2 +-
 configs/arm_foundationv8_defconfig          |    2 +-
 configs/beaglebone_defconfig                |    2 +-
 configs/mx53loco_defconfig                  |    2 +-
 configs/nitrogen6x_defconfig                |    2 +-
 configs/pandaboard_defconfig                |    2 +-
 configs/qemu_arm_versatile_defconfig        |    2 +-
 configs/qemu_arm_vexpress_defconfig         |    2 +-
 configs/qemu_mips64_malta_defconfig         |    2 +-
 configs/qemu_mips_malta_defconfig           |    2 +-
 configs/qemu_mipsel_malta_defconfig         |    2 +-
 configs/qemu_ppc_g3beige_defconfig          |    2 +-
 configs/qemu_sh4_r2d_defconfig              |    2 +-
 configs/qemu_sparc_ss10_defconfig           |    2 +-
 configs/qemu_x86_64_defconfig               |    2 +-
 configs/qemu_x86_defconfig                  |    2 +-
 fs/Config.in                                |    2 +-
 fs/{ext2 => ext}/Config.in                  |   38 +++++++++++++-------------
 fs/ext/ext.mk                               |   27 +++++++++++++++++++
 fs/{ext2/genext2fs.sh => ext/genextfs.sh}   |    0
 fs/ext2/ext2.mk                             |   27 -------------------
 32 files changed, 77 insertions(+), 77 deletions(-)
 rename fs/{ext2 => ext}/Config.in (55%)
 create mode 100644 fs/ext/ext.mk
 rename fs/{ext2/genext2fs.sh => ext/genextfs.sh} (100%)
 delete mode 100644 fs/ext2/ext2.mk

diff --git a/board/arm/foundation-v8/readme.txt b/board/arm/foundation-v8/readme.txt
index 7f419a0..9812fe0 100644
--- a/board/arm/foundation-v8/readme.txt
+++ b/board/arm/foundation-v8/readme.txt
@@ -12,7 +12,7 @@ Finally, boot your system with:
 
  ${LOCATION_OF_FOUNDATIONV8_SIMULATOR}/Foundation_v8 \
     --image output/images/linux-system.axf \
-    --block-device output/images/rootfs.ext2 \
+    --block-device output/images/rootfs.ext \
     --network=nat
 
 You can get network access from within the simulated environment
diff --git a/board/boundarydevices/nitrogen6x/readme.txt b/board/boundarydevices/nitrogen6x/readme.txt
index 6e9b95c..896228f 100644
--- a/board/boundarydevices/nitrogen6x/readme.txt
+++ b/board/boundarydevices/nitrogen6x/readme.txt
@@ -6,11 +6,11 @@ Notice: U-Boot as shipped on the board has a bug reading rev 0 ext2
 file systems (which is what genext2fs generates). To convert it to rev
 1, do:
 
-tune2fs -O filetype output/images/rootfs.ext2
-e2fsck -a output/images/rootfs.ext2
+tune2fs -O filetype output/images/rootfs.ext
+e2fsck -a output/images/rootfs.ext
 
-To install, simply extract rootfs.ext2 to first partition of a uSD card:
+To install, simply extract rootfs.ext to first partition of a uSD card:
 
-sudo dd if=output/images/rootfs.ext2 of=/dev/sdX1
+sudo dd if=output/images/rootfs.ext of=/dev/sdX1
 
 Where 'sdX1' is the device node of the uSD partition.
diff --git a/board/qemu/arm-versatile/readme.txt b/board/qemu/arm-versatile/readme.txt
index 51364c7..b2dc3c3 100644
--- a/board/qemu/arm-versatile/readme.txt
+++ b/board/qemu/arm-versatile/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-arm -M versatilepb -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=scsi -append "root=/dev/sda console=ttyAMA0,115200" -serial stdio -net nic,model=smc91c111 -net user
+  qemu-system-arm -M versatilepb -kernel output/images/zImage -drive file=output/images/rootfs.ext,if=scsi -append "root=/dev/sda console=ttyAMA0,115200" -serial stdio -net nic,model=smc91c111 -net user
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
diff --git a/board/qemu/arm-vexpress/readme.txt b/board/qemu/arm-vexpress/readme.txt
index c74bfcd..8a86a3d 100644
--- a/board/qemu/arm-vexpress/readme.txt
+++ b/board/qemu/arm-vexpress/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-arm -M vexpress-a9 -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=sd -append "console=ttyAMA0,115200 root=/dev/mmcblk0" -serial stdio -net nic,model=lan9118 -net user
+  qemu-system-arm -M vexpress-a9 -kernel output/images/zImage -drive file=output/images/rootfs.ext,if=sd -append "console=ttyAMA0,115200 root=/dev/mmcblk0" -serial stdio -net nic,model=lan9118 -net user
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
diff --git a/board/qemu/mips-malta/readme.txt b/board/qemu/mips-malta/readme.txt
index d3d8446..af5e055 100644
--- a/board/qemu/mips-malta/readme.txt
+++ b/board/qemu/mips-malta/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
- qemu-system-mips -M malta -kernel output/images/vmlinux -serial stdio -hda output/images/rootfs.ext2 -append "root=/dev/hda"
+ qemu-system-mips -M malta -kernel output/images/vmlinux -serial stdio -hda output/images/rootfs.ext -append "root=/dev/hda"
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
diff --git a/board/qemu/mips64-malta/readme.txt b/board/qemu/mips64-malta/readme.txt
index 1d6ff10..ba360c2 100644
--- a/board/qemu/mips64-malta/readme.txt
+++ b/board/qemu/mips64-malta/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
- qemu-system-mips64 -M malta -kernel output/images/vmlinux -serial stdio -hda output/images/rootfs.ext2 -append "root=/dev/hda"
+ qemu-system-mips64 -M malta -kernel output/images/vmlinux -serial stdio -hda output/images/rootfs.ext -append "root=/dev/hda"
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
diff --git a/board/qemu/mipsel-malta/readme.txt b/board/qemu/mipsel-malta/readme.txt
index 8dd4024..24be4a1 100644
--- a/board/qemu/mipsel-malta/readme.txt
+++ b/board/qemu/mipsel-malta/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
- qemu-system-mipsel -M malta -kernel output/images/vmlinux -serial stdio -hda output/images/rootfs.ext2 -append "root=/dev/hda"
+ qemu-system-mipsel -M malta -kernel output/images/vmlinux -serial stdio -hda output/images/rootfs.ext -append "root=/dev/hda"
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
diff --git a/board/qemu/powerpc-g3beige/readme.txt b/board/qemu/powerpc-g3beige/readme.txt
index 05aa380..e047c8e 100644
--- a/board/qemu/powerpc-g3beige/readme.txt
+++ b/board/qemu/powerpc-g3beige/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-ppc -M g3beige -kernel output/images/vmlinux -hda output/images/rootfs.ext2 -append "console=ttyS0 root=/dev/hdc" -serial stdio
+  qemu-system-ppc -M g3beige -kernel output/images/vmlinux -hda output/images/rootfs.ext -append "console=ttyS0 root=/dev/hdc" -serial stdio
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
diff --git a/board/qemu/sh4-r2d/readme.txt b/board/qemu/sh4-r2d/readme.txt
index 9ae7496..061e644 100644
--- a/board/qemu/sh4-r2d/readme.txt
+++ b/board/qemu/sh4-r2d/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-sh4 -M r2d -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=ide -append "root=/dev/sda console=ttySC1,115200 noiotrap" -serial null -serial stdio
+  qemu-system-sh4 -M r2d -kernel output/images/zImage -drive file=output/images/rootfs.ext,if=ide -append "root=/dev/sda console=ttySC1,115200 noiotrap" -serial null -serial stdio
 
 The login prompt will appear in the terminal that started Qemu.
 The graphical window is the framebuffer.
diff --git a/board/qemu/sparc-ss10/readme.txt b/board/qemu/sparc-ss10/readme.txt
index 4290c55..2ad8edc 100644
--- a/board/qemu/sparc-ss10/readme.txt
+++ b/board/qemu/sparc-ss10/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-sparc -M SS-10 -kernel output/images/zImage -drive file=output/images/rootfs.ext2 -append "root=/dev/sda console=ttyS0,115200" -serial stdio
+  qemu-system-sparc -M SS-10 -kernel output/images/zImage -drive file=output/images/rootfs.ext -append "root=/dev/sda console=ttyS0,115200" -serial stdio
 
 The login prompt will appear in the terminal that started Qemu.
 The graphical window is the framebuffer.
diff --git a/board/qemu/x86/readme.txt b/board/qemu/x86/readme.txt
index 4342556..1e34972 100644
--- a/board/qemu/x86/readme.txt
+++ b/board/qemu/x86/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-i386 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=ide -append root=/dev/sda
+  qemu-system-i386 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext,if=ide -append root=/dev/sda
 
 The login prompt will appear in the graphical window.
 
diff --git a/board/qemu/x86_64/readme.txt b/board/qemu/x86_64/readme.txt
index 7d3c6c5..c044eba 100644
--- a/board/qemu/x86_64/readme.txt
+++ b/board/qemu/x86_64/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-x86_64 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=ide -append root=/dev/sda
+  qemu-system-x86_64 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext,if=ide -append root=/dev/sda
 
 The login prompt will appear in the graphical window.
 
diff --git a/configs/arm_foundationv8_defconfig b/configs/arm_foundationv8_defconfig
index 7a50b1a..f3bcb32 100644
--- a/configs/arm_foundationv8_defconfig
+++ b/configs/arm_foundationv8_defconfig
@@ -1,7 +1,7 @@
 BR2_aarch64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
-BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_BOOT_WRAPPER_AARCH64=y
 BR2_TARGET_BOOT_WRAPPER_AARCH64_DTS="vexpress-foundation-v8"
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index e19cdcb..6fd9e4e 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -6,7 +6,7 @@ BR2_TARGET_GENERIC_HOSTNAME="beaglebone"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
 # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
-BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT=y
 # BR2_TARGET_ROOTFS_TAR is not set
 # Lock down headers to avoid breaking with new defaults
 BR2_KERNEL_HEADERS_VERSION=y
diff --git a/configs/mx53loco_defconfig b/configs/mx53loco_defconfig
index ff3948b..504f506 100644
--- a/configs/mx53loco_defconfig
+++ b/configs/mx53loco_defconfig
@@ -13,7 +13,7 @@ BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
 BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="rel_imx_2.6.35_11.09.01"
 
 # filesystem
-BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index e3a78c7..492ed2c 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -8,7 +8,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/boundarydevices/nitrogen6x/post-build.sh"
 
 # filesystem
-BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT=y
 
 # bootloader
 BR2_TARGET_UBOOT=y
diff --git a/configs/pandaboard_defconfig b/configs/pandaboard_defconfig
index 9496b7f..2fe2610 100644
--- a/configs/pandaboard_defconfig
+++ b/configs/pandaboard_defconfig
@@ -8,7 +8,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyO2"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
 
 # filesystem
-BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
 # Kernel
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index cbd7dd1..27b9f26 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -7,7 +7,7 @@ BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 
 # filesystem
-BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
 # Lock to 3.7 headers to avoid breaking with newer kernels
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index 8ff5a46..8e80342 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -11,7 +11,7 @@ BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 
 # Filesystem
-BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
 # Lock to 3.7 headers to avoid breaking with newer kernels
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index b8ca948..46642d3 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -7,7 +7,7 @@ BR2_MIPS_NABI64=y
 BR2_PREFER_STATIC_LIB=y
 
 # Filesystem
-BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
 # Lock to 3.7 headers to avoid breaking with newer kernels
diff --git a/configs/qemu_mips_malta_defconfig b/configs/qemu_mips_malta_defconfig
index 6b034f6..35f9426 100644
--- a/configs/qemu_mips_malta_defconfig
+++ b/configs/qemu_mips_malta_defconfig
@@ -3,7 +3,7 @@ BR2_mips=y
 BR2_mips_32r2=y
 
 # filesystem
-BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
 # Lock to 3.7 headers to avoid breaking with newer kernels
diff --git a/configs/qemu_mipsel_malta_defconfig b/configs/qemu_mipsel_malta_defconfig
index adaaedd..95b1817 100644
--- a/configs/qemu_mipsel_malta_defconfig
+++ b/configs/qemu_mipsel_malta_defconfig
@@ -3,7 +3,7 @@ BR2_mipsel=y
 BR2_mips_32r2=y
 
 # filesystem
-BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
 # Lock to 3.7 headers to avoid breaking with newer kernels
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index 080ee4d..a0c6637 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -3,7 +3,7 @@ BR2_powerpc=y
 BR2_powerpc_750=y
 
 # filesystem
-BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
 # Lock to 3.7 headers to avoid breaking with newer kernels
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index 4dfccd9..fc6910f 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -7,7 +7,7 @@ BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
 
 # filesystem
-BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
 # Avoid 3.3+ headers
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 906671b..2ba1e0e 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -3,7 +3,7 @@ BR2_sparc=y
 BR2_sparc_v8=y
 
 # filesystem
-BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
 # Lock to 3.7 headers to avoid breaking with newer kernels
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index 74011fc..53d0e00 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -6,7 +6,7 @@ BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 
 # filesystem
-BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
 # Lock to 3.7 headers to avoid breaking with newer kernels
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index 2734fdb..3756b07 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -7,7 +7,7 @@ BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 
 # filesystem
-BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
 # Lock to 3.7 headers to avoid breaking with newer kernels
diff --git a/fs/Config.in b/fs/Config.in
index da4c5ff..27c6586 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -3,7 +3,7 @@ menu "Filesystem images"
 source "fs/cloop/Config.in"
 source "fs/cpio/Config.in"
 source "fs/cramfs/Config.in"
-source "fs/ext2/Config.in"
+source "fs/ext/Config.in"
 source "fs/initramfs/Config.in"
 source "fs/iso9660/Config.in"
 source "fs/jffs2/Config.in"
diff --git a/fs/ext2/Config.in b/fs/ext/Config.in
similarity index 55%
rename from fs/ext2/Config.in
rename to fs/ext/Config.in
index 00f11a2..1a7a315 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext/Config.in
@@ -1,71 +1,71 @@
-config BR2_TARGET_ROOTFS_EXT2
+config BR2_TARGET_ROOTFS_EXT
 	bool "ext2/3/4 root filesystem"
 	help
 	  Build an ext2/3/4 root filesystem
 
-if BR2_TARGET_ROOTFS_EXT2
+if BR2_TARGET_ROOTFS_EXT
 
 choice
 	bool "ext generation"
-	default BR2_TARGET_ROOTFS_EXT2_2
+	default BR2_TARGET_ROOTFS_EXT_EXT2
 
-config BR2_TARGET_ROOTFS_EXT2_2
+config BR2_TARGET_ROOTFS_EXT_EXT2
 	bool "ext2"
 
-config BR2_TARGET_ROOTFS_EXT2_3
+config BR2_TARGET_ROOTFS_EXT_EXT3
 	bool "ext3"
 	select BR2_PACKAGE_HOST_E2FSPROGS
 
-config BR2_TARGET_ROOTFS_EXT2_4
+config BR2_TARGET_ROOTFS_EXT_EXT4
 	bool "ext4"
 	select BR2_PACKAGE_HOST_E2FSPROGS
 
 endchoice
 
-config BR2_TARGET_ROOTFS_EXT2_GEN
+config BR2_TARGET_ROOTFS_EXT_GEN
 	int
-	default 2 if BR2_TARGET_ROOTFS_EXT2_2
-	default 3 if BR2_TARGET_ROOTFS_EXT2_3
-	default 4 if BR2_TARGET_ROOTFS_EXT2_4
+	default 2 if BR2_TARGET_ROOTFS_EXT_EXT2
+	default 3 if BR2_TARGET_ROOTFS_EXT_EXT3
+	default 4 if BR2_TARGET_ROOTFS_EXT_EXT4
 
-config BR2_TARGET_ROOTFS_EXT2_BLOCKS
+config BR2_TARGET_ROOTFS_EXT_BLOCKS
 	int "size in blocks (leave at 0 for auto calculation)"
 	default 0
 
-config BR2_TARGET_ROOTFS_EXT2_INODES
+config BR2_TARGET_ROOTFS_EXT_INODES
 	int "inodes (leave at 0 for auto calculation)"
 	default 0
 
-config BR2_TARGET_ROOTFS_EXT2_RESBLKS
+config BR2_TARGET_ROOTFS_EXT_RESBLKS
 	int "reserved blocks percentage"
 	default 0
 
 choice
 	prompt "Compression method"
-	default BR2_TARGET_ROOTFS_EXT2_NONE
+	default BR2_TARGET_ROOTFS_EXT_NONE
 	help
 	  Select compressor for ext2/3/4 filesystem of the root filesystem
 
-config BR2_TARGET_ROOTFS_EXT2_NONE
+config BR2_TARGET_ROOTFS_EXT_NONE
 	bool "no compression"
 	help
 	  Do not compress the ext2/3/4 filesystem.
 
-config BR2_TARGET_ROOTFS_EXT2_GZIP
+config BR2_TARGET_ROOTFS_EXT_GZIP
 	bool "gzip"
 	help
 	  Do compress the ext2/3/4 filesystem with gzip.
 
-config BR2_TARGET_ROOTFS_EXT2_BZIP2
+config BR2_TARGET_ROOTFS_EXT_BZIP2
 	bool "bzip2"
 	help
 	  Do compress the ext2/3/4 filesystem with bzip2.
 
-config BR2_TARGET_ROOTFS_EXT2_LZMA
+config BR2_TARGET_ROOTFS_EXT_LZMA
 	bool "lzma"
 	help
 	  Do compress the ext2/3/4 filesystem with lzma.
 
 endchoice
 
-endif # BR2_TARGET_ROOTFS_EXT2
+endif # BR2_TARGET_ROOTFS_EXT
diff --git a/fs/ext/ext.mk b/fs/ext/ext.mk
new file mode 100644
index 0000000..cdc22ba
--- /dev/null
+++ b/fs/ext/ext.mk
@@ -0,0 +1,27 @@
+#############################################################
+#
+# Build the ext2/3/4 root filesystem image
+#
+#############################################################
+
+EXT_OPTS :=
+
+ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT_BLOCKS)),0)
+EXT_OPTS += -b $(BR2_TARGET_ROOTFS_EXT_BLOCKS)
+endif
+
+ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT_INODES)),0)
+EXT_OPTS += -N $(BR2_TARGET_ROOTFS_EXT_INODES)
+endif
+
+ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT_RESBLKS)),0)
+EXT_OPTS += -m $(BR2_TARGET_ROOTFS_EXT_RESBLKS)
+endif
+
+ROOTFS_EXT_DEPENDENCIES = host-genext2fs $(if $(BR2_PACKAGE_HOST_E2FSPROGS),host-e2fsprogs)
+
+define ROOTFS_EXT_CMD
+	PATH=$(TARGET_PATH) fs/ext/genextfs.sh -d $(TARGET_DIR) $(EXT_OPTS) -$(BR2_TARGET_ROOTFS_EXT_GEN) $@
+endef
+
+$(eval $(call ROOTFS_TARGET,ext))
diff --git a/fs/ext2/genext2fs.sh b/fs/ext/genextfs.sh
similarity index 100%
rename from fs/ext2/genext2fs.sh
rename to fs/ext/genextfs.sh
diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
deleted file mode 100644
index 80ad93f..0000000
--- a/fs/ext2/ext2.mk
+++ /dev/null
@@ -1,27 +0,0 @@
-#############################################################
-#
-# Build the ext2 root filesystem image
-#
-#############################################################
-
-EXT2_OPTS :=
-
-ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)),0)
-EXT2_OPTS += -b $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)
-endif
-
-ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_INODES)),0)
-EXT2_OPTS += -N $(BR2_TARGET_ROOTFS_EXT2_INODES)
-endif
-
-ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)),0)
-EXT2_OPTS += -m $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)
-endif
-
-ROOTFS_EXT2_DEPENDENCIES = host-genext2fs $(if $(BR2_PACKAGE_HOST_E2FSPROGS),host-e2fsprogs)
-
-define ROOTFS_EXT2_CMD
-	PATH=$(TARGET_PATH) fs/ext2/genext2fs.sh -d $(TARGET_DIR) $(EXT2_OPTS) -$(BR2_TARGET_ROOTFS_EXT2_GEN) $@
-endef
-
-$(eval $(call ROOTFS_TARGET,ext2))
-- 
1.7.2.5
