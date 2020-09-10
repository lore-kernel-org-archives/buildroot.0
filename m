From: Alexander Egorenkov <egorenar@linux.ibm.com>
Date: Thu, 10 Sep 2020 19:41:42 +0200
Subject: [Buildroot] [PATCH 2/3] arch: new architecture IBM s390x
In-Reply-To: <20200910174143.311039-1-egorenar@linux.ibm.com>
References: <20200910174143.311039-1-egorenar@linux.ibm.com>
Message-ID: <20200910174143.311039-3-egorenar@linux.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

New IBM s390x and Z big-endian architecture.

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
---
 DEVELOPERS                              |  3 +++
 Makefile                                |  1 +
 arch/Config.in                          | 13 +++++++++
 arch/Config.in.s390x                    | 35 +++++++++++++++++++++++++
 board/qemu/s390x/linux.config           | 35 +++++++++++++++++++++++++
 board/qemu/s390x/post-build.sh          | 11 ++++++++
 board/qemu/s390x/readme.txt             |  6 +++++
 configs/qemu_s390x_defconfig            | 11 ++++++++
 linux/Config.in                         |  2 +-
 package/cmake/Config.in                 |  3 ++-
 package/gcc/gcc.mk                      |  5 ++++
 package/go/Config.in.host               |  2 +-
 package/kexec/Config.in                 |  2 +-
 package/liburcu/Config.in               |  2 +-
 package/makedumpfile/Config.in          |  2 +-
 package/systemd/Config.in               |  1 +
 toolchain/toolchain-buildroot/Config.in |  6 ++---
 17 files changed, 131 insertions(+), 9 deletions(-)
 create mode 100644 arch/Config.in.s390x
 create mode 100644 board/qemu/s390x/linux.config
 create mode 100755 board/qemu/s390x/post-build.sh
 create mode 100644 board/qemu/s390x/readme.txt
 create mode 100644 configs/qemu_s390x_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index b1e60e505f..5e6e8c330c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -146,6 +146,9 @@ N:	Alexander Egorenkov <egorenar-dev@posteo.net>
 F:	package/makedumpfile/
 F:	package/multipath-tools/
 
+N:	Alexander Egorenkov <egorenar@linux.ibm.com>
+F:	arch/Config.in.s390x
+
 N:	Alexander Kurz <akurz@blala.de>
 F:	package/minimodem/
 
diff --git a/Makefile b/Makefile
index 9648fa58d8..384bfe3fe9 100644
--- a/Makefile
+++ b/Makefile
@@ -445,6 +445,7 @@ KERNEL_ARCH := $(shell echo "$(ARCH)" | sed -e "s/-.*//" \
 	-e s/ppc.*/powerpc/ -e s/mips.*/mips/ \
 	-e s/riscv.*/riscv/ \
 	-e s/sh.*/sh/ \
+	-e s/s390x/s390/ \
 	-e s/microblazeel/microblaze/)
 
 ZCAT := $(call qstrip,$(BR2_ZCAT))
diff --git a/arch/Config.in b/arch/Config.in
index 0707c076e2..155403c363 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -219,6 +219,15 @@ config BR2_riscv
 	  https://riscv.org/
 	  https://en.wikipedia.org/wiki/RISC-V
 
+config BR2_s390x
+	bool "s390x"
+	select BR2_ARCH_IS_64
+	select BR2_ARCH_HAS_MMU_MANDATORY
+	help
+	  s390x is a big-endian architecture made by IBM.
+	  http://www.ibm.com/
+	  http://en.wikipedia.org/wiki/IBM_System/390
+
 config BR2_sh
 	bool "SuperH"
 	select BR2_ARCH_HAS_MMU_OPTIONAL
@@ -457,6 +466,10 @@ if BR2_riscv
 source "arch/Config.in.riscv"
 endif
 
+if BR2_s390x
+source "arch/Config.in.s390x"
+endif
+
 if BR2_sh
 source "arch/Config.in.sh"
 endif
diff --git a/arch/Config.in.s390x b/arch/Config.in.s390x
new file mode 100644
index 0000000000..26db901df0
--- /dev/null
+++ b/arch/Config.in.s390x
@@ -0,0 +1,35 @@
+
+choice
+	prompt "Target Architecture Variant"
+	default BR2_s390x_z13
+	depends on BR2_s390x
+	help
+	  Specific CPU variant to use
+
+config BR2_s390x_z13
+	bool "z13"
+	depends on BR2_s390x
+
+config BR2_s390x_z14
+	bool "z14"
+	depends on BR2_s390x
+
+config BR2_s390x_z15
+	bool "z15"
+	depends on BR2_s390x
+
+endchoice
+
+config BR2_ARCH
+	default "s390x"	if BR2_s390x
+
+config BR2_ENDIAN
+	default "BIG"
+
+config BR2_GCC_TARGET_ARCH
+	default "arch11" if BR2_s390x_z13
+	default "arch12" if BR2_s390x_z14
+	default "arch13" if BR2_s390x_z15
+
+config BR2_READELF_ARCH_NAME
+	default "IBM S/390"	if BR2_s390x
diff --git a/board/qemu/s390x/linux.config b/board/qemu/s390x/linux.config
new file mode 100644
index 0000000000..06a3eaa0de
--- /dev/null
+++ b/board/qemu/s390x/linux.config
@@ -0,0 +1,35 @@
+CONFIG_SYSVIPC=y
+CONFIG_CGROUPS=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_PCI=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_SCSI_VIRTIO=y
+CONFIG_ATA=y
+CONFIG_ATA_PIIX=y
+CONFIG_MD=y
+CONFIG_BLK_DEV_DM=m
+CONFIG_DM_CRYPT=m
+CONFIG_DM_MULTIPATH=m
+CONFIG_DM_MULTIPATH_QL=m
+CONFIG_DM_MULTIPATH_ST=m
+CONFIG_NETDEVICES=y
+CONFIG_VIRTIO_NET=y
+CONFIG_HW_RANDOM_VIRTIO=m
+CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_BALLOON=y
+CONFIG_VIRTIO_INPUT=y
+CONFIG_VIRTIO_MMIO=y
+CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
+CONFIG_EXT4_FS=y
+CONFIG_AUTOFS4_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/s390x/post-build.sh b/board/qemu/s390x/post-build.sh
new file mode 100755
index 0000000000..bf83a002c2
--- /dev/null
+++ b/board/qemu/s390x/post-build.sh
@@ -0,0 +1,11 @@
+#!/bin/sh
+
+set -u
+set -e
+
+# Add a console on tty1
+if [ -e ${TARGET_DIR}/etc/inittab ]; then
+    grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
+	sed -i '/GENERIC_SERIAL/a\
+tty1::respawn:/sbin/getty -L  tty1 0 vt100 # QEMU graphical window' ${TARGET_DIR}/etc/inittab
+fi
diff --git a/board/qemu/s390x/readme.txt b/board/qemu/s390x/readme.txt
new file mode 100644
index 0000000000..13e7ae80a3
--- /dev/null
+++ b/board/qemu/s390x/readme.txt
@@ -0,0 +1,6 @@
+Run the emulation with:
+
+  qemu-system-s390x -M s390-ccw-virtio -cpu max,zpci=on -m 4G -smp 2 \
+    -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw \
+    -append "rootwait root=/dev/vda net.ifnames=0 biosdevname=0" -display none -serial mon:stdio \
+    -net nic,model=virtio -net user,host=10.0.2.10,hostfwd=tcp:127.0.0.1:10021-:22
diff --git a/configs/qemu_s390x_defconfig b/configs/qemu_s390x_defconfig
new file mode 100644
index 0000000000..7b4e4acc3d
--- /dev/null
+++ b/configs/qemu_s390x_defconfig
@@ -0,0 +1,11 @@
+BR2_s390x=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/qemu/s390x/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/s390x/linux.config"
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
diff --git a/linux/Config.in b/linux/Config.in
index 49da2b81b2..ec74e1e65a 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -226,7 +226,7 @@ config BR2_LINUX_KERNEL_APPENDED_UIMAGE
 
 config BR2_LINUX_KERNEL_BZIMAGE
 	bool "bzImage"
-	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_i386 || BR2_x86_64 || BR2_s390x
 
 config BR2_LINUX_KERNEL_ZIMAGE
 	bool "zImage"
diff --git a/package/cmake/Config.in b/package/cmake/Config.in
index e7bd14e69a..3c47fdcb49 100644
--- a/package/cmake/Config.in
+++ b/package/cmake/Config.in
@@ -5,7 +5,8 @@ config BR2_PACKAGE_CMAKE_ARCH_SUPPORTS
 		BR2_m68k      || BR2_mips        || BR2_mips64   || \
 		BR2_mipsel    || BR2_mips64el    || BR2_powerpc  || \
 		BR2_powerpc64 || BR2_powerpc64le || BR2_sparc    || \
-		BR2_i386      || BR2_x86_64      || BR2_xtensa
+		BR2_i386      || BR2_x86_64      || BR2_xtensa   || \
+		BR2_s390x
 
 config BR2_PACKAGE_CMAKE
 	bool
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index b834269adc..0912c07a71 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -241,6 +241,11 @@ HOST_GCC_COMMON_CONF_OPTS += \
 	--with-long-double-128
 endif
 
+ifeq ($(BR2_s390x),y)
+HOST_GCC_COMMON_CONF_OPTS += \
+	--with-long-double-128
+endif
+
 HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_CROSS_PATH_SUFFIX='".br_real"'
 
 # For gcc-initial, we need to tell gcc that the C library will be
diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 3f16dbaec3..87942c7a1e 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
 	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
 		|| BR2_i386 || BR2_x86_64 || BR2_powerpc64le \
-		|| BR2_mips64 || BR2_mips64el
+		|| BR2_mips64 || BR2_mips64el || BR2_s390x
 	depends on !BR2_ARM_CPU_ARMV4
 	# MIPS R6 support in Go has not yet been developed.
 	depends on !BR2_MIPS_CPU_MIPS64R6
diff --git a/package/kexec/Config.in b/package/kexec/Config.in
index 410e503d9e..90a7bc2672 100644
--- a/package/kexec/Config.in
+++ b/package/kexec/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_KEXEC
 	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_armeb || \
 		BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el || \
 		BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
-		BR2_sh4 || BR2_sh4a || BR2_aarch64
+		BR2_sh4 || BR2_sh4a || BR2_aarch64 || BR2_s390x
 	help
 	  Kexec is a user space utility for loading another kernel
 	  and asking the currently running kernel to do something with
diff --git a/package/liburcu/Config.in b/package/liburcu/Config.in
index 7d29642084..5dc8528971 100644
--- a/package/liburcu/Config.in
+++ b/package/liburcu/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_aarch64_be || \
 		BR2_i386 || BR2_mips || BR2_mips64 || BR2_mipsel || \
 		BR2_mips64el || BR2_nios2 || BR2_powerpc || BR2_powerpc64 || \
-		BR2_powerpc64le || BR2_riscv || BR2_sparc64 || BR2_x86_64
+		BR2_powerpc64le || BR2_riscv || BR2_sparc64 || BR2_s390x || BR2_x86_64
 	depends on BR2_USE_MMU # fork() in test
 
 config BR2_PACKAGE_LIBURCU
diff --git a/package/makedumpfile/Config.in b/package/makedumpfile/Config.in
index a90ccbdf3c..d1efbc6e51 100644
--- a/package/makedumpfile/Config.in
+++ b/package/makedumpfile/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_MAKEDUMPFILE_ARCH_SUPPORTS
 	default y if BR2_arm || BR2_armeb
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
-	default y if BR2_sparc64
+	default y if BR2_s390x || BR2_sparc64
 
 comment "makedumpfile needs a uClibc or glibc toolchain w/ wchar, dynamic library"
 	depends on BR2_PACKAGE_MAKEDUMPFILE_ARCH_SUPPORTS
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 74029aff05..7956370b83 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 	default y if BR2_riscv
 	default y if BR2_sh4 || BR2_sh4eb || BR2_sh4a || BR2_sh4aeb
 	default y if BR2_sparc || BR2_sparc64
+	default y if BR2_s390x
 
 menuconfig BR2_PACKAGE_SYSTEMD
 	bool "systemd"
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 418d5cb387..1c4705600e 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -46,9 +46,9 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 		   BR2_aarch64_be  || BR2_i386       || BR2_mips    || \
 		   BR2_mipsel      || BR2_mips64     || BR2_mips64el|| \
 		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
-		   BR2_riscv       || BR2_sh         || BR2_sparc64     || \
-		   BR2_x86_64      || BR2_microblaze || BR2_nios2       || \
-		   (BR2_arc && BR2_ARC_ATOMIC_EXT)   || BR2_csky
+		   BR2_riscv       || BR2_s390x      || BR2_sh          || \
+		   BR2_sparc64     || BR2_x86_64     || BR2_microblaze  || \
+		   BR2_nios2       || (BR2_arc && BR2_ARC_ATOMIC_EXT)   || BR2_csky
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
-- 
2.26.2
