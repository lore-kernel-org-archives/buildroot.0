From: Julien Grossholtz <julien.grossholtz@gmail.com>
Date: Thu, 10 Aug 2017 18:14:11 -0400
Subject: [Buildroot] [PATCH v2 1/1] configs: add defconfig for TS-7680
Message-ID: <20170810221411.4324-1-julien.grossholtz@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The TS-7680 is an i.MX286 ARM ARM926EJ-S board with 10/100 Ethernet,
USB port, eMMC and CAN ports.

The TS-7680 uses a 3.14.28 Linux kernel provided by Technologic Systems:
https://github.com/embeddedarm/linux-3.14.28-imx28
This kernel is patched to compile with gcc version 5.x and later.

U-Boot is not provided as the manufacturer recommends not to update the
built-in bootloader.

For more informations please see:
https://wiki.embeddedarm.com/wiki/TS-7680

Signed-off-by: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>
---
Changes v1 -> v2:
   - Fix Linux v3.14 build for gcc version > gcc5.x by applying upstream
   patches

 board/technologic/ts7680/genimage.cfg              |  14 +
 ...LLVMLinux-use-static-inline-in-ARM-ftrace.patch |  52 +++
 ...ux-Change-extern-inline-to-static-inline-.patch |  59 ++++
 ...c-integrate-the-various-compiler-gcc-345-.patch | 367 +++++++++++++++++++++
 board/technologic/ts7680/post-image.sh             |  17 +
 board/technologic/ts7680/readme.txt                |  51 +++
 configs/ts7680_defconfig                           |  20 ++
 7 files changed, 580 insertions(+)
 create mode 100644 board/technologic/ts7680/genimage.cfg
 create mode 100644 board/technologic/ts7680/patches/linux/0001-ARM-8158-1-LLVMLinux-use-static-inline-in-ARM-ftrace.patch
 create mode 100644 board/technologic/ts7680/patches/linux/0002-ARM-LLVMLinux-Change-extern-inline-to-static-inline-.patch
 create mode 100644 board/technologic/ts7680/patches/linux/0003-compiler-gcc-integrate-the-various-compiler-gcc-345-.patch
 create mode 100755 board/technologic/ts7680/post-image.sh
 create mode 100644 board/technologic/ts7680/readme.txt
 create mode 100644 configs/ts7680_defconfig

diff --git a/board/technologic/ts7680/genimage.cfg b/board/technologic/ts7680/genimage.cfg
new file mode 100644
index 0000000..b559982
--- /dev/null
+++ b/board/technologic/ts7680/genimage.cfg
@@ -0,0 +1,14 @@
+image sdcard.img {
+	hdimage {
+	}
+
+	partition unused {
+		size =  512B
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 256M
+	}
+}
diff --git a/board/technologic/ts7680/patches/linux/0001-ARM-8158-1-LLVMLinux-use-static-inline-in-ARM-ftrace.patch b/board/technologic/ts7680/patches/linux/0001-ARM-8158-1-LLVMLinux-use-static-inline-in-ARM-ftrace.patch
new file mode 100644
index 0000000..dc5f4c6
--- /dev/null
+++ b/board/technologic/ts7680/patches/linux/0001-ARM-8158-1-LLVMLinux-use-static-inline-in-ARM-ftrace.patch
@@ -0,0 +1,52 @@
+From aeea3592a13bf12861943e44fc48f1f270941f8d Mon Sep 17 00:00:00 2001
+From: Behan Webster <behanw@converseincode.com>
+Date: Wed, 24 Sep 2014 01:06:46 +0100
+Subject: [PATCH] ARM: 8158/1: LLVMLinux: use static inline in ARM ftrace.h
+
+With compilers which follow the C99 standard (like modern versions of gcc and
+clang), "extern inline" does the wrong thing (emits code for an externally
+linkable version of the inline function). In this case using static inline
+and removing the NULL version of return_address in return_address.c does
+the right thing.
+
+Signed-off-by: Behan Webster <behanw@converseincode.com>
+Reviewed-by: Mark Charlebois <charlebm@gmail.com>
+Acked-by: Steven Rostedt <rostedt@goodmis.org>
+Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
+---
+ arch/arm/include/asm/ftrace.h    | 2 +-
+ arch/arm/kernel/return_address.c | 5 -----
+ 2 files changed, 1 insertion(+), 6 deletions(-)
+
+diff --git a/arch/arm/include/asm/ftrace.h b/arch/arm/include/asm/ftrace.h
+index 39eb16b..bfe2a2f 100644
+--- a/arch/arm/include/asm/ftrace.h
++++ b/arch/arm/include/asm/ftrace.h
+@@ -45,7 +45,7 @@ void *return_address(unsigned int);
+ 
+ #else
+ 
+-extern inline void *return_address(unsigned int level)
++static inline void *return_address(unsigned int level)
+ {
+ 	return NULL;
+ }
+diff --git a/arch/arm/kernel/return_address.c b/arch/arm/kernel/return_address.c
+index fafedd8..f6aa84d 100644
+--- a/arch/arm/kernel/return_address.c
++++ b/arch/arm/kernel/return_address.c
+@@ -63,11 +63,6 @@ void *return_address(unsigned int level)
+ #warning "TODO: return_address should use unwind tables"
+ #endif
+ 
+-void *return_address(unsigned int level)
+-{
+-	return NULL;
+-}
+-
+ #endif /* if defined(CONFIG_FRAME_POINTER) && !defined(CONFIG_ARM_UNWIND) / else */
+ 
+ EXPORT_SYMBOL_GPL(return_address);
+-- 
+2.9.4
+
diff --git a/board/technologic/ts7680/patches/linux/0002-ARM-LLVMLinux-Change-extern-inline-to-static-inline-.patch b/board/technologic/ts7680/patches/linux/0002-ARM-LLVMLinux-Change-extern-inline-to-static-inline-.patch
new file mode 100644
index 0000000..035a5fb
--- /dev/null
+++ b/board/technologic/ts7680/patches/linux/0002-ARM-LLVMLinux-Change-extern-inline-to-static-inline-.patch
@@ -0,0 +1,59 @@
+From 76ae03828756bac2c1fa2c7eff7485e5f815dbdb Mon Sep 17 00:00:00 2001
+From: Behan Webster <behanw@converseincode.com>
+Date: Tue, 3 Sep 2013 22:27:26 -0400
+Subject: [PATCH] ARM: LLVMLinux: Change "extern inline" to "static inline" in
+ glue-cache.h
+
+With compilers which follow the C99 standard (like modern versions of gcc and
+clang), "extern inline" does the wrong thing (emits code for an externally
+linkable version of the inline function). "static inline" is the correct choice
+instead.
+
+Author: Behan Webster <behanw@converseincode.com>
+Signed-off-by: Behan Webster <behanw@converseincode.com>
+Reviewed-by: Mark Charlebois <charlebm@gmail.com>
+---
+ arch/arm/include/asm/glue-cache.h | 22 +++++++++++-----------
+ 1 file changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/arch/arm/include/asm/glue-cache.h b/arch/arm/include/asm/glue-cache.h
+index c81adc0..a3c24cd 100644
+--- a/arch/arm/include/asm/glue-cache.h
++++ b/arch/arm/include/asm/glue-cache.h
+@@ -130,22 +130,22 @@
+ #endif
+ 
+ #ifndef __ASSEMBLER__
+-extern inline void nop_flush_icache_all(void) { }
+-extern inline void nop_flush_kern_cache_all(void) { }
+-extern inline void nop_flush_kern_cache_louis(void) { }
+-extern inline void nop_flush_user_cache_all(void) { }
+-extern inline void nop_flush_user_cache_range(unsigned long a,
++static inline void nop_flush_icache_all(void) { }
++static inline void nop_flush_kern_cache_all(void) { }
++static inline void nop_flush_kern_cache_louis(void) { }
++static inline void nop_flush_user_cache_all(void) { }
++static inline void nop_flush_user_cache_range(unsigned long a,
+ 		unsigned long b, unsigned int c) { }
+ 
+-extern inline void nop_coherent_kern_range(unsigned long a, unsigned long b) { }
+-extern inline int nop_coherent_user_range(unsigned long a,
++static inline void nop_coherent_kern_range(unsigned long a, unsigned long b) { }
++static inline int nop_coherent_user_range(unsigned long a,
+ 		unsigned long b) { return 0; }
+-extern inline void nop_flush_kern_dcache_area(void *a, size_t s) { }
++static inline void nop_flush_kern_dcache_area(void *a, size_t s) { }
+ 
+-extern inline void nop_dma_flush_range(const void *a, const void *b) { }
++static inline void nop_dma_flush_range(const void *a, const void *b) { }
+ 
+-extern inline void nop_dma_map_area(const void *s, size_t l, int f) { }
+-extern inline void nop_dma_unmap_area(const void *s, size_t l, int f) { }
++static inline void nop_dma_map_area(const void *s, size_t l, int f) { }
++static inline void nop_dma_unmap_area(const void *s, size_t l, int f) { }
+ #endif
+ 
+ #ifndef MULTI_CACHE
+-- 
+2.9.4
+
diff --git a/board/technologic/ts7680/patches/linux/0003-compiler-gcc-integrate-the-various-compiler-gcc-345-.patch b/board/technologic/ts7680/patches/linux/0003-compiler-gcc-integrate-the-various-compiler-gcc-345-.patch
new file mode 100644
index 0000000..e4aba02
--- /dev/null
+++ b/board/technologic/ts7680/patches/linux/0003-compiler-gcc-integrate-the-various-compiler-gcc-345-.patch
@@ -0,0 +1,367 @@
+From 3711edaf01a01818f2aed9f21efe29b9818134b9 Mon Sep 17 00:00:00 2001
+From: Joe Perches <joe@perches.com>
+Date: Thu, 25 Jun 2015 15:01:02 -0700
+Subject: [PATCH] compiler-gcc: integrate the various compiler-gcc[345].h files
+
+commit f320793e52aee78f0fbb8bcaf10e6614d2e67bfc upstream.
+
+[ Upstream commit cb984d101b30eb7478d32df56a0023e4603cba7f ]
+
+As gcc major version numbers are going to advance rather rapidly in the
+future, there's no real value in separate files for each compiler
+version.
+
+Deduplicate some of the macros #defined in each file too.
+
+Neaten comments using normal kernel commenting style.
+
+Signed-off-by: Joe Perches <joe@perches.com>
+Cc: Andi Kleen <andi@firstfloor.org>
+Cc: Michal Marek <mmarek@suse.cz>
+Cc: Segher Boessenkool <segher@kernel.crashing.org>
+Cc: Sasha Levin <levinsasha928@gmail.com>
+Cc: Anton Blanchard <anton@samba.org>
+Cc: Alan Modra <amodra@gmail.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Sasha Levin <sasha.levin@oracle.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ include/linux/compiler-gcc.h  | 120 ++++++++++++++++++++++++++++++++++++++++--
+ include/linux/compiler-gcc3.h |  23 --------
+ include/linux/compiler-gcc4.h |  88 -------------------------------
+ include/linux/compiler-gcc5.h |  66 -----------------------
+ 4 files changed, 116 insertions(+), 181 deletions(-)
+ delete mode 100644 include/linux/compiler-gcc3.h
+ delete mode 100644 include/linux/compiler-gcc4.h
+ delete mode 100644 include/linux/compiler-gcc5.h
+
+diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
+index 02ae99e..bb2cdcd 100644
+--- a/include/linux/compiler-gcc.h
++++ b/include/linux/compiler-gcc.h
+@@ -100,10 +100,122 @@
+ #define __maybe_unused			__attribute__((unused))
+ #define __always_unused			__attribute__((unused))
+ 
+-#define __gcc_header(x) #x
+-#define _gcc_header(x) __gcc_header(linux/compiler-gcc##x.h)
+-#define gcc_header(x) _gcc_header(x)
+-#include gcc_header(__GNUC__)
++/* gcc version specific checks */
++
++#if GCC_VERSION < 30200
++# error Sorry, your compiler is too old - please upgrade it.
++#endif
++
++#if GCC_VERSION < 30300
++# define __used			__attribute__((__unused__))
++#else
++# define __used			__attribute__((__used__))
++#endif
++
++#ifdef CONFIG_GCOV_KERNEL
++# if GCC_VERSION < 30400
++#   error "GCOV profiling support for gcc versions below 3.4 not included"
++# endif /* __GNUC_MINOR__ */
++#endif /* CONFIG_GCOV_KERNEL */
++
++#if GCC_VERSION >= 30400
++#define __must_check		__attribute__((warn_unused_result))
++#endif
++
++#if GCC_VERSION >= 40000
++
++/* GCC 4.1.[01] miscompiles __weak */
++#ifdef __KERNEL__
++# if GCC_VERSION >= 40100 &&  GCC_VERSION <= 40101
++#  error Your version of gcc miscompiles the __weak directive
++# endif
++#endif
++
++#define __used			__attribute__((__used__))
++#define __compiler_offsetof(a, b)					\
++	__builtin_offsetof(a, b)
++
++#if GCC_VERSION >= 40100 && GCC_VERSION < 40600
++# define __compiletime_object_size(obj) __builtin_object_size(obj, 0)
++#endif
++
++#if GCC_VERSION >= 40300
++/* Mark functions as cold. gcc will assume any path leading to a call
++ * to them will be unlikely.  This means a lot of manual unlikely()s
++ * are unnecessary now for any paths leading to the usual suspects
++ * like BUG(), printk(), panic() etc. [but let's keep them for now for
++ * older compilers]
++ *
++ * Early snapshots of gcc 4.3 don't support this and we can't detect this
++ * in the preprocessor, but we can live with this because they're unreleased.
++ * Maketime probing would be overkill here.
++ *
++ * gcc also has a __attribute__((__hot__)) to move hot functions into
++ * a special section, but I don't see any sense in this right now in
++ * the kernel context
++ */
++#define __cold			__attribute__((__cold__))
++
++#define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
++
++#ifndef __CHECKER__
++# define __compiletime_warning(message) __attribute__((warning(message)))
++# define __compiletime_error(message) __attribute__((error(message)))
++#endif /* __CHECKER__ */
++#endif /* GCC_VERSION >= 40300 */
++
++#if GCC_VERSION >= 40500
++/*
++ * Mark a position in code as unreachable.  This can be used to
++ * suppress control flow warnings after asm blocks that transfer
++ * control elsewhere.
++ *
++ * Early snapshots of gcc 4.5 don't support this and we can't detect
++ * this in the preprocessor, but we can live with this because they're
++ * unreleased.  Really, we need to have autoconf for the kernel.
++ */
++#define unreachable() __builtin_unreachable()
++
++/* Mark a function definition as prohibited from being cloned. */
++#define __noclone	__attribute__((__noclone__))
++
++#endif /* GCC_VERSION >= 40500 */
++
++#if GCC_VERSION >= 40600
++/*
++ * Tell the optimizer that something else uses this function or variable.
++ */
++#define __visible	__attribute__((externally_visible))
++#endif
++
++/*
++ * GCC 'asm goto' miscompiles certain code sequences:
++ *
++ *   http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58670
++ *
++ * Work it around via a compiler barrier quirk suggested by Jakub Jelinek.
++ *
++ * (asm goto is automatically volatile - the naming reflects this.)
++ */
++#define asm_volatile_goto(x...)	do { asm goto(x); asm (""); } while (0)
++
++#ifdef CONFIG_ARCH_USE_BUILTIN_BSWAP
++#if GCC_VERSION >= 40400
++#define __HAVE_BUILTIN_BSWAP32__
++#define __HAVE_BUILTIN_BSWAP64__
++#endif
++#if GCC_VERSION >= 40800 || (defined(__powerpc__) && GCC_VERSION >= 40600)
++#define __HAVE_BUILTIN_BSWAP16__
++#endif
++#endif /* CONFIG_ARCH_USE_BUILTIN_BSWAP */
++
++#if GCC_VERSION >= 50000
++#define KASAN_ABI_VERSION 4
++#elif GCC_VERSION >= 40902
++#define KASAN_ABI_VERSION 3
++#endif
++
++#endif	/* gcc version >= 40000 specific checks */
+ 
+ #if !defined(__noclone)
+ #define __noclone	/* not needed */
+diff --git a/include/linux/compiler-gcc3.h b/include/linux/compiler-gcc3.h
+deleted file mode 100644
+index 7d89feb..0000000
+--- a/include/linux/compiler-gcc3.h
++++ /dev/null
+@@ -1,23 +0,0 @@
+-#ifndef __LINUX_COMPILER_H
+-#error "Please don't include <linux/compiler-gcc3.h> directly, include <linux/compiler.h> instead."
+-#endif
+-
+-#if GCC_VERSION < 30200
+-# error Sorry, your compiler is too old - please upgrade it.
+-#endif
+-
+-#if GCC_VERSION >= 30300
+-# define __used			__attribute__((__used__))
+-#else
+-# define __used			__attribute__((__unused__))
+-#endif
+-
+-#if GCC_VERSION >= 30400
+-#define __must_check		__attribute__((warn_unused_result))
+-#endif
+-
+-#ifdef CONFIG_GCOV_KERNEL
+-# if GCC_VERSION < 30400
+-#   error "GCOV profiling support for gcc versions below 3.4 not included"
+-# endif /* __GNUC_MINOR__ */
+-#endif /* CONFIG_GCOV_KERNEL */
+diff --git a/include/linux/compiler-gcc4.h b/include/linux/compiler-gcc4.h
+deleted file mode 100644
+index 2507fd2..0000000
+--- a/include/linux/compiler-gcc4.h
++++ /dev/null
+@@ -1,88 +0,0 @@
+-#ifndef __LINUX_COMPILER_H
+-#error "Please don't include <linux/compiler-gcc4.h> directly, include <linux/compiler.h> instead."
+-#endif
+-
+-/* GCC 4.1.[01] miscompiles __weak */
+-#ifdef __KERNEL__
+-# if GCC_VERSION >= 40100 &&  GCC_VERSION <= 40101
+-#  error Your version of gcc miscompiles the __weak directive
+-# endif
+-#endif
+-
+-#define __used			__attribute__((__used__))
+-#define __must_check 		__attribute__((warn_unused_result))
+-#define __compiler_offsetof(a,b) __builtin_offsetof(a,b)
+-
+-#if GCC_VERSION >= 40100 && GCC_VERSION < 40600
+-# define __compiletime_object_size(obj) __builtin_object_size(obj, 0)
+-#endif
+-
+-#if GCC_VERSION >= 40300
+-/* Mark functions as cold. gcc will assume any path leading to a call
+-   to them will be unlikely.  This means a lot of manual unlikely()s
+-   are unnecessary now for any paths leading to the usual suspects
+-   like BUG(), printk(), panic() etc. [but let's keep them for now for
+-   older compilers]
+-
+-   Early snapshots of gcc 4.3 don't support this and we can't detect this
+-   in the preprocessor, but we can live with this because they're unreleased.
+-   Maketime probing would be overkill here.
+-
+-   gcc also has a __attribute__((__hot__)) to move hot functions into
+-   a special section, but I don't see any sense in this right now in
+-   the kernel context */
+-#define __cold			__attribute__((__cold__))
+-
+-#define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
+-
+-#ifndef __CHECKER__
+-# define __compiletime_warning(message) __attribute__((warning(message)))
+-# define __compiletime_error(message) __attribute__((error(message)))
+-#endif /* __CHECKER__ */
+-#endif /* GCC_VERSION >= 40300 */
+-
+-#if GCC_VERSION >= 40500
+-/*
+- * Mark a position in code as unreachable.  This can be used to
+- * suppress control flow warnings after asm blocks that transfer
+- * control elsewhere.
+- *
+- * Early snapshots of gcc 4.5 don't support this and we can't detect
+- * this in the preprocessor, but we can live with this because they're
+- * unreleased.  Really, we need to have autoconf for the kernel.
+- */
+-#define unreachable() __builtin_unreachable()
+-
+-/* Mark a function definition as prohibited from being cloned. */
+-#define __noclone	__attribute__((__noclone__))
+-
+-#endif /* GCC_VERSION >= 40500 */
+-
+-#if GCC_VERSION >= 40600
+-/*
+- * Tell the optimizer that something else uses this function or variable.
+- */
+-#define __visible __attribute__((externally_visible))
+-#endif
+-
+-/*
+- * GCC 'asm goto' miscompiles certain code sequences:
+- *
+- *   http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58670
+- *
+- * Work it around via a compiler barrier quirk suggested by Jakub Jelinek.
+- * Fixed in GCC 4.8.2 and later versions.
+- *
+- * (asm goto is automatically volatile - the naming reflects this.)
+- */
+-#define asm_volatile_goto(x...)	do { asm goto(x); asm (""); } while (0)
+-
+-#ifdef CONFIG_ARCH_USE_BUILTIN_BSWAP
+-#if GCC_VERSION >= 40400
+-#define __HAVE_BUILTIN_BSWAP32__
+-#define __HAVE_BUILTIN_BSWAP64__
+-#endif
+-#if GCC_VERSION >= 40800 || (defined(__powerpc__) && GCC_VERSION >= 40600)
+-#define __HAVE_BUILTIN_BSWAP16__
+-#endif
+-#endif /* CONFIG_ARCH_USE_BUILTIN_BSWAP */
+diff --git a/include/linux/compiler-gcc5.h b/include/linux/compiler-gcc5.h
+deleted file mode 100644
+index cdd1cc2..0000000
+--- a/include/linux/compiler-gcc5.h
++++ /dev/null
+@@ -1,66 +0,0 @@
+-#ifndef __LINUX_COMPILER_H
+-#error "Please don't include <linux/compiler-gcc5.h> directly, include <linux/compiler.h> instead."
+-#endif
+-
+-#define __used				__attribute__((__used__))
+-#define __must_check			__attribute__((warn_unused_result))
+-#define __compiler_offsetof(a, b)	__builtin_offsetof(a, b)
+-
+-/* Mark functions as cold. gcc will assume any path leading to a call
+-   to them will be unlikely.  This means a lot of manual unlikely()s
+-   are unnecessary now for any paths leading to the usual suspects
+-   like BUG(), printk(), panic() etc. [but let's keep them for now for
+-   older compilers]
+-
+-   Early snapshots of gcc 4.3 don't support this and we can't detect this
+-   in the preprocessor, but we can live with this because they're unreleased.
+-   Maketime probing would be overkill here.
+-
+-   gcc also has a __attribute__((__hot__)) to move hot functions into
+-   a special section, but I don't see any sense in this right now in
+-   the kernel context */
+-#define __cold			__attribute__((__cold__))
+-
+-#define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
+-
+-#ifndef __CHECKER__
+-# define __compiletime_warning(message) __attribute__((warning(message)))
+-# define __compiletime_error(message) __attribute__((error(message)))
+-#endif /* __CHECKER__ */
+-
+-/*
+- * Mark a position in code as unreachable.  This can be used to
+- * suppress control flow warnings after asm blocks that transfer
+- * control elsewhere.
+- *
+- * Early snapshots of gcc 4.5 don't support this and we can't detect
+- * this in the preprocessor, but we can live with this because they're
+- * unreleased.  Really, we need to have autoconf for the kernel.
+- */
+-#define unreachable() __builtin_unreachable()
+-
+-/* Mark a function definition as prohibited from being cloned. */
+-#define __noclone	__attribute__((__noclone__))
+-
+-/*
+- * Tell the optimizer that something else uses this function or variable.
+- */
+-#define __visible __attribute__((externally_visible))
+-
+-/*
+- * GCC 'asm goto' miscompiles certain code sequences:
+- *
+- *   http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58670
+- *
+- * Work it around via a compiler barrier quirk suggested by Jakub Jelinek.
+- * Fixed in GCC 4.8.2 and later versions.
+- *
+- * (asm goto is automatically volatile - the naming reflects this.)
+- */
+-#define asm_volatile_goto(x...)	do { asm goto(x); asm (""); } while (0)
+-
+-#ifdef CONFIG_ARCH_USE_BUILTIN_BSWAP
+-#define __HAVE_BUILTIN_BSWAP32__
+-#define __HAVE_BUILTIN_BSWAP64__
+-#define __HAVE_BUILTIN_BSWAP16__
+-#endif /* CONFIG_ARCH_USE_BUILTIN_BSWAP */
+-- 
+2.9.4
+
diff --git a/board/technologic/ts7680/post-image.sh b/board/technologic/ts7680/post-image.sh
new file mode 100755
index 0000000..c3f5a4a
--- /dev/null
+++ b/board/technologic/ts7680/post-image.sh
@@ -0,0 +1,17 @@
+#!/bin/bash
+#
+# Copyright (C) 2017 Savoir-faire Linux, Inc.
+# Post image generation script.
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP=${BUILD_DIR}/.genimage_tmp
+
+rm -rf ${GENIMAGE_TMP}
+
+${HOST_DIR}/usr/bin/genimage \
+        --config ${GENIMAGE_CFG} \
+        --rootpath ${TARGET_DIR} \
+        --tmppath ${GENIMAGE_TMP} \
+        --inputpath $BINARIES_DIR \
+        --outputpath $BINARIES_DIR
diff --git a/board/technologic/ts7680/readme.txt b/board/technologic/ts7680/readme.txt
new file mode 100644
index 0000000..416e892
--- /dev/null
+++ b/board/technologic/ts7680/readme.txt
@@ -0,0 +1,51 @@
+Technologic Systems TS-7680 SBC
+===============================
+
+This document explains how to set up a basic Buildroot system for
+the Technologic Systems TS-7680 Single Board Computer.
+
+The TS-7680 SBC is based on the Freescale i.MX286 ARM ARM926EJ-S
+running at 454MHz. The TS-7680 features are 10/100 Ethernet ports,
+Wi-Fi, microSD card, eMMC, NOR Flash, USB host port, CAN ports,
+relays and ADC/DAC. More details on the board here:
+https://wiki.embeddedarm.com/wiki/TS-7680
+
+The TS-7680 uses a 3.14.28 Linux kernel provided by
+Technologic Systems.
+
+To build the default configuration you only have to run:
+
+  $ make ts7680_defconfig
+  $ make
+
+The output looks like:
+output/images
+??? imx28-ts7680.dtb
+??? rootfs.ext2
+??? rootfs.ext4 -> rootfs.ext2
+??? rootfs.tar
+??? sdcard.img
+??? uImage
+
+The provided post-image script generates an image file containing
+two partitions. The first one is unused, but mandatory as the
+TS-7680 built-in bootloader loads the Linux uImage from the /boot
+directory in the second partition. The second partition contains the
+rootfs with the Linux uImage into the /boot directory.
+
+  $ fdisk output/images/sdcard.img
+  output/images/sdcard.img1          1      1       1  512B  0 Empty
+  output/images/sdcard.img2          2 524289  524288  256M 83 Linux
+
+This image can be directly written to an SD card.
+
+    $ sudo dd if=output/images/sdcard.img of=/dev/mmcblk0
+
+To boot with Buildroot, insert this SD card on the board, make sure
+the SD jumper is present and the U-Boot jumper is not.
+
+The bootloader comes pre-flashed on the board on an SPI flash. Since
+updating the bootloader is risky and not trivial, it is not included
+in the Buildroot defconfig. Refer to
+https://wiki.embeddedarm.com/wiki/TS-7680#U-Boot for details on
+which U-Boot config to use and how to flash it.
diff --git a/configs/ts7680_defconfig b/configs/ts7680_defconfig
new file mode 100644
index 0000000..df4e8f3
--- /dev/null
+++ b/configs/ts7680_defconfig
@@ -0,0 +1,20 @@
+BR2_arm=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.14.28"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/technologic/ts7680/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/embeddedarm/linux-3.14.28-imx28.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="93872644d70b5c6420cb16f8b05b156faef94a5b"
+BR2_LINUX_KERNEL_PATCH="board/technologic/ts7680/patches/linux"
+BR2_LINUX_KERNEL_DEFCONFIG="ts76xx"
+BR2_LINUX_KERNEL_UIMAGE=y
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x40008000"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx28-ts7680"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.9.4
