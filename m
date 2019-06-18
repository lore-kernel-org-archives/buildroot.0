From: Alistair Francis <alistair.francis@wdc.com>
Date: Tue, 18 Jun 2019 16:53:58 -0700
Subject: [Buildroot] [PATCH 2/2] configs/qemu_riscv32_virt: Update to 5.1
 kernel
In-Reply-To: <20190618235358.10613-1-alistair.francis@wdc.com>
References: <20190618235358.10613-1-alistair.francis@wdc.com>
Message-ID: <20190618235358.10613-2-alistair.francis@wdc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the 32-bit defconfig to use the latest kernel. This requires a
patch to revert a ABI to ensure that the glibc port continues to work.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 ...ert-riscv-Use-latest-system-call-ABI.patch | 66 +++++++++++++++++++
 configs/qemu_riscv32_virt_defconfig           |  9 +--
 2 files changed, 68 insertions(+), 7 deletions(-)
 create mode 100644 board/qemu/riscv32-virt/0001-Revert-riscv-Use-latest-system-call-ABI.patch

diff --git a/board/qemu/riscv32-virt/0001-Revert-riscv-Use-latest-system-call-ABI.patch b/board/qemu/riscv32-virt/0001-Revert-riscv-Use-latest-system-call-ABI.patch
new file mode 100644
index 0000000000..e0dfaa1501
--- /dev/null
+++ b/board/qemu/riscv32-virt/0001-Revert-riscv-Use-latest-system-call-ABI.patch
@@ -0,0 +1,66 @@
+From 15f62343916fcb3cae82e618da28eaa82bc8c007 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Tue, 16 Apr 2019 09:03:41 -0700
+Subject: [PATCH] Revert "riscv: Use latest system call ABI"
+
+This reverts commit d4c08b9776b392e20efc6198ebe1bc8ec1911d9b.
+
+The latest RISC-V 32bit glibc submission doesn't work with this patch,
+so let's revert it. This revert can be reverted when the glibc
+submission is updated to work on the 5.1 kernel.
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+---
+ arch/riscv/Kconfig                   | 1 +
+ arch/riscv/include/uapi/asm/unistd.h | 5 ++++-
+ arch/riscv/kernel/vdso/Makefile      | 2 --
+ 3 files changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
+index eb56c82d8aa1..43dd2680c696 100644
+--- a/arch/riscv/Kconfig
++++ b/arch/riscv/Kconfig
+@@ -11,6 +11,7 @@ config 32BIT
+ 
+ config RISCV
+ 	def_bool y
++	select ARCH_32BIT_OFF_T if !64BIT
+ 	# even on 32-bit, physical (and DMA) addresses are > 32-bits
+ 	select PHYS_ADDR_T_64BIT
+ 	select OF
+diff --git a/arch/riscv/include/uapi/asm/unistd.h b/arch/riscv/include/uapi/asm/unistd.h
+index 0e2eeeb1fd27..486a288b454c 100644
+--- a/arch/riscv/include/uapi/asm/unistd.h
++++ b/arch/riscv/include/uapi/asm/unistd.h
+@@ -17,8 +17,11 @@
+ 
+ #ifdef __LP64__
+ #define __ARCH_WANT_NEW_STAT
+-#define __ARCH_WANT_SET_GET_RLIMIT
+ #endif /* __LP64__ */
++#define __ARCH_WANT_SET_GET_RLIMIT
++#ifndef __LP64__
++#define __ARCH_WANT_TIME32_SYSCALLS
++#endif
+ 
+ #include <asm-generic/unistd.h>
+ 
+diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
+index fec62b24df89..eed1c137f618 100644
+--- a/arch/riscv/kernel/vdso/Makefile
++++ b/arch/riscv/kernel/vdso/Makefile
+@@ -2,11 +2,9 @@
+ 
+ # Symbols present in the vdso
+ vdso-syms  = rt_sigreturn
+-ifdef CONFIG_64BIT
+ vdso-syms += gettimeofday
+ vdso-syms += clock_gettime
+ vdso-syms += clock_getres
+-endif
+ vdso-syms += getcpu
+ vdso-syms += flush_icache
+ 
+-- 
+2.21.0
+
diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
index 84f7b6ab9c..77ac411258 100644
--- a/configs/qemu_riscv32_virt_defconfig
+++ b/configs/qemu_riscv32_virt_defconfig
@@ -10,15 +10,10 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 
-# Linux headers same as kernel, a 4.20 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_20=y
-
 # Kernel
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.20.17"
-BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/riscv32-virt/linux.config.fragment"
+BR2_LINUX_KERNEL_DEFCONFIG="rv32"
+BR2_LINUX_KERNEL_PATCH="board/qemu/riscv32-virt/0001-Revert-riscv-Use-latest-system-call-ABI.patch"
 BR2_LINUX_KERNEL_IMAGE=y
 
 # Bootloader
-- 
2.22.0
