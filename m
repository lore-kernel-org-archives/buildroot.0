From: Alistair Francis <alistair.francis@wdc.com>
Date: Mon, 31 Aug 2020 16:20:51 -0700
Subject: [Buildroot] [PATCH] qemu_riscv32_virt: Update to mainline glibc and
 kernel 5.4
Message-ID: <20200831232051.2303515-1-alistair.francis@wdc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that RISC-V 32-bit (RV32) support has been merged into mainilne
glibc we can us upstream glibc and the 5.4 kernel.

This patch removes the old files for the RV32 glibc fork and replaces
them with new files for the latest SHA from upstream glibc. We also need
to update the kernel as RV32 requires a 5.4+ kernel.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 ...ert-riscv-Use-latest-system-call-ABI.patch | 66 -------------------
 board/qemu/riscv32-virt/readme.txt            |  2 +-
 configs/qemu_riscv32_virt_defconfig           |  7 +-
 ...001-riscv-Do-not-use-__has_include__.patch | 28 --------
 .../glibc.hash                                |  2 +-
 package/glibc/glibc.mk                        |  6 +-
 6 files changed, 9 insertions(+), 102 deletions(-)
 delete mode 100644 board/qemu/riscv32-virt/patches/linux/0001-Revert-riscv-Use-latest-system-call-ABI.patch
 delete mode 100644 package/glibc/06983fe52cfe8e4779035c27e8cc5d2caab31531/0001-riscv-Do-not-use-__has_include__.patch
 rename package/glibc/{06983fe52cfe8e4779035c27e8cc5d2caab31531 => 2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99}/glibc.hash (69%)

diff --git a/board/qemu/riscv32-virt/patches/linux/0001-Revert-riscv-Use-latest-system-call-ABI.patch b/board/qemu/riscv32-virt/patches/linux/0001-Revert-riscv-Use-latest-system-call-ABI.patch
deleted file mode 100644
index e0dfaa1501..0000000000
--- a/board/qemu/riscv32-virt/patches/linux/0001-Revert-riscv-Use-latest-system-call-ABI.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 15f62343916fcb3cae82e618da28eaa82bc8c007 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Tue, 16 Apr 2019 09:03:41 -0700
-Subject: [PATCH] Revert "riscv: Use latest system call ABI"
-
-This reverts commit d4c08b9776b392e20efc6198ebe1bc8ec1911d9b.
-
-The latest RISC-V 32bit glibc submission doesn't work with this patch,
-so let's revert it. This revert can be reverted when the glibc
-submission is updated to work on the 5.1 kernel.
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
----
- arch/riscv/Kconfig                   | 1 +
- arch/riscv/include/uapi/asm/unistd.h | 5 ++++-
- arch/riscv/kernel/vdso/Makefile      | 2 --
- 3 files changed, 5 insertions(+), 3 deletions(-)
-
-diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
-index eb56c82d8aa1..43dd2680c696 100644
---- a/arch/riscv/Kconfig
-+++ b/arch/riscv/Kconfig
-@@ -11,6 +11,7 @@ config 32BIT
- 
- config RISCV
- 	def_bool y
-+	select ARCH_32BIT_OFF_T if !64BIT
- 	# even on 32-bit, physical (and DMA) addresses are > 32-bits
- 	select PHYS_ADDR_T_64BIT
- 	select OF
-diff --git a/arch/riscv/include/uapi/asm/unistd.h b/arch/riscv/include/uapi/asm/unistd.h
-index 0e2eeeb1fd27..486a288b454c 100644
---- a/arch/riscv/include/uapi/asm/unistd.h
-+++ b/arch/riscv/include/uapi/asm/unistd.h
-@@ -17,8 +17,11 @@
- 
- #ifdef __LP64__
- #define __ARCH_WANT_NEW_STAT
--#define __ARCH_WANT_SET_GET_RLIMIT
- #endif /* __LP64__ */
-+#define __ARCH_WANT_SET_GET_RLIMIT
-+#ifndef __LP64__
-+#define __ARCH_WANT_TIME32_SYSCALLS
-+#endif
- 
- #include <asm-generic/unistd.h>
- 
-diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
-index fec62b24df89..eed1c137f618 100644
---- a/arch/riscv/kernel/vdso/Makefile
-+++ b/arch/riscv/kernel/vdso/Makefile
-@@ -2,11 +2,9 @@
- 
- # Symbols present in the vdso
- vdso-syms  = rt_sigreturn
--ifdef CONFIG_64BIT
- vdso-syms += gettimeofday
- vdso-syms += clock_gettime
- vdso-syms += clock_getres
--endif
- vdso-syms += getcpu
- vdso-syms += flush_icache
- 
--- 
-2.21.0
-
diff --git a/board/qemu/riscv32-virt/readme.txt b/board/qemu/riscv32-virt/readme.txt
index 6a848270bd..32b4333512 100644
--- a/board/qemu/riscv32-virt/readme.txt
+++ b/board/qemu/riscv32-virt/readme.txt
@@ -1,5 +1,5 @@
 Run Linux in emulation with:
 
-  qemu-system-riscv32 -M virt -kernel output/images/fw_jump.elf -device loader,file=output/images/Image,addr=0x80400000 -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic # qemu_riscv32_virt_defconfig
+  qemu-system-riscv32 -M virt -bios output/images/fw_jump.elf -kernel output/images/Image -append "rootwait root=/dev/vda ro" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic # qemu_riscv32_virt_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
index 166c41f1f0..5447342dd9 100644
--- a/configs/qemu_riscv32_virt_defconfig
+++ b/configs/qemu_riscv32_virt_defconfig
@@ -5,7 +5,6 @@ BR2_RISCV_32=y
 # System
 BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY=y
-BR2_GLOBAL_PATCH_DIR="board/qemu/riscv32-virt/patches/"
 
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
@@ -14,13 +13,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_1=y
+# Linux headers same as kernel, a 5.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.1.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.61"
 BR2_LINUX_KERNEL_DEFCONFIG="rv32"
 BR2_LINUX_KERNEL_IMAGE=y
 
diff --git a/package/glibc/06983fe52cfe8e4779035c27e8cc5d2caab31531/0001-riscv-Do-not-use-__has_include__.patch b/package/glibc/06983fe52cfe8e4779035c27e8cc5d2caab31531/0001-riscv-Do-not-use-__has_include__.patch
deleted file mode 100644
index 93159e9a7b..0000000000
--- a/package/glibc/06983fe52cfe8e4779035c27e8cc5d2caab31531/0001-riscv-Do-not-use-__has_include__.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 28dd3939221ab26c6774097e9596e30d9753f758 Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Thu, 6 Jun 2019 11:24:32 +0200
-Subject: [PATCH] riscv: Do not use __has_include__
-
-The user-visible preprocessor construct is called __has_include.
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- sysdeps/unix/sysv/linux/riscv/flush-icache.c | 2 +-
- 2 files changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/sysdeps/unix/sysv/linux/riscv/flush-icache.c b/sysdeps/unix/sysv/linux/riscv/flush-icache.c
-index cd5c400977..f2dfcc50d0 100644
---- a/sysdeps/unix/sysv/linux/riscv/flush-icache.c
-+++ b/sysdeps/unix/sysv/linux/riscv/flush-icache.c
-@@ -21,7 +21,7 @@
- #include <stdlib.h>
- #include <atomic.h>
- #include <sys/cachectl.h>
--#if __has_include__ (<asm/syscalls.h>)
-+#if __has_include (<asm/syscalls.h>)
- # include <asm/syscalls.h>
- #else
- # include <asm/unistd.h>
--- 
-2.25.4
-
diff --git a/package/glibc/06983fe52cfe8e4779035c27e8cc5d2caab31531/glibc.hash b/package/glibc/2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99/glibc.hash
similarity index 69%
rename from package/glibc/06983fe52cfe8e4779035c27e8cc5d2caab31531/glibc.hash
rename to package/glibc/2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99/glibc.hash
index ce378c0bd1..c9e6912ea9 100644
--- a/package/glibc/06983fe52cfe8e4779035c27e8cc5d2caab31531/glibc.hash
+++ b/package/glibc/2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256 703877c0df77fce00719fe55cc62b07bb8d5f44fdb704bbb1b0bf2cf38afe10a  glibc-06983fe52cfe8e4779035c27e8cc5d2caab31531.tar.gz
+sha256 c3828224d69a42f5b6982cbec8ae01cf494fe975ce9023e36ff2c10a2fb93e42 glibc-2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99.tar.gz
 
 # Hashes for license files
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index ed03a6911f..f2b5b4caf6 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -8,8 +8,10 @@ ifeq ($(BR2_arc),y)
 GLIBC_VERSION =  arc-2020.03-release
 GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VERSION))
 else ifeq ($(BR2_RISCV_32),y)
-GLIBC_VERSION = 06983fe52cfe8e4779035c27e8cc5d2caab31531
-GLIBC_SITE = $(call github,riscv,riscv-glibc,$(GLIBC_VERSION))
+# RISC-V 32-bit (RV32) requires glibc 2.33 or newer
+# Until 2.33 is released, just use master
+GLIBC_VERSION = 2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99
+GLIBC_SITE = $(call github,bminor,glibc,$(GLIBC_VERSION))
 else ifeq ($(BR2_csky),y)
 GLIBC_VERSION = 7630ed2fa60caea98f500e4a7a51b88f9bf1e176
 GLIBC_SITE = $(call github,c-sky,glibc,$(GLIBC_VERSION))
-- 
2.28.0
