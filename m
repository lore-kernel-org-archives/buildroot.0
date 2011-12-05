From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  5 Dec 2011 09:01:34 -0300
Subject: [Buildroot] [PATCH] uClibc: remove deprecated 0.9.30 series
Message-ID: <1323086494-4178-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/uClibc/Config.in                         |    6 -
 .../uClibc-0.9.30.3-fix-error-locale-utf-8.patch   |   17 --
 .../uClibc-0.9.30.3-xtensa-000p-fix-procfs.patch   |   24 --
 .../uClibc-0.9.30.3-xtensa-005-sigcontext.patch    |   45 ----
 .../uClibc-0.9.30.3-xtensa-009-testandset.patch    |   59 -----
 .../uClibc-0.9.30.3-xtensa-010-sigaction.c.patch   |   11 -
 .../uClibc-0.9.30.3-xtensa-011-sysdep.h.patch      |   19 --
 .../uClibc-0.9.30.3-xtensa-012-fnmatch_old.c.patch |   11 -
 .../uClibc-0.9.30.3-xtensa-013-atomic.h.patch      |  165 -------------
 .../uClibc-0.9.30.3-xtensa-014-setjump.S.patch     |   11 -
 toolchain/uClibc/uClibc-0.9.30.config              |  247 --------------------
 11 files changed, 0 insertions(+), 615 deletions(-)
 delete mode 100644 toolchain/uClibc/uClibc-0.9.30.3-fix-error-locale-utf-8.patch
 delete mode 100644 toolchain/uClibc/uClibc-0.9.30.3-xtensa-000p-fix-procfs.patch
 delete mode 100644 toolchain/uClibc/uClibc-0.9.30.3-xtensa-005-sigcontext.patch
 delete mode 100644 toolchain/uClibc/uClibc-0.9.30.3-xtensa-009-testandset.patch
 delete mode 100644 toolchain/uClibc/uClibc-0.9.30.3-xtensa-010-sigaction.c.patch
 delete mode 100644 toolchain/uClibc/uClibc-0.9.30.3-xtensa-011-sysdep.h.patch
 delete mode 100644 toolchain/uClibc/uClibc-0.9.30.3-xtensa-012-fnmatch_old.c.patch
 delete mode 100644 toolchain/uClibc/uClibc-0.9.30.3-xtensa-013-atomic.h.patch
 delete mode 100644 toolchain/uClibc/uClibc-0.9.30.3-xtensa-014-setjump.S.patch
 delete mode 100644 toolchain/uClibc/uClibc-0.9.30.config

diff --git a/toolchain/uClibc/Config.in b/toolchain/uClibc/Config.in
index 34aaa13..4b480fd 100644
--- a/toolchain/uClibc/Config.in
+++ b/toolchain/uClibc/Config.in
@@ -10,10 +10,6 @@ choice
 	help
 	  Select the version of uClibc you wish to use.
 
-	config BR2_UCLIBC_VERSION_0_9_30
-		depends on BR2_DEPRECATED
-		bool "uClibc 0.9.30.x"
-
 	config BR2_UCLIBC_VERSION_0_9_31
 		bool "uClibc 0.9.31.x"
 
@@ -35,14 +31,12 @@ config BR2_USE_UCLIBC_SNAPSHOT
 
 config BR2_UCLIBC_VERSION_STRING
 	string
-	default 0.9.30.3	if BR2_UCLIBC_VERSION_0_9_30
 	default 0.9.31.1	if BR2_UCLIBC_VERSION_0_9_31
 	default 0.9.32		if BR2_UCLIBC_VERSION_0_9_32
 	default $BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
 config BR2_UCLIBC_CONFIG
 	string "uClibc configuration file to use?"
-	default "toolchain/uClibc/uClibc-0.9.30.config" if BR2_UCLIBC_VERSION_0_9_30
 	default "toolchain/uClibc/uClibc-0.9.31.config" if BR2_UCLIBC_VERSION_0_9_31
 	default "toolchain/uClibc/uClibc-0.9.32.config" if BR2_UCLIBC_VERSION_0_9_32
 	default "toolchain/uClibc/uClibc-snapshot.config" if BR2_UCLIBC_VERSION_SNAPSHOT
diff --git a/toolchain/uClibc/uClibc-0.9.30.3-fix-error-locale-utf-8.patch b/toolchain/uClibc/uClibc-0.9.30.3-fix-error-locale-utf-8.patch
deleted file mode 100644
index 2fe6c50..0000000
--- a/toolchain/uClibc/uClibc-0.9.30.3-fix-error-locale-utf-8.patch
+++ /dev/null
@@ -1,17 +0,0 @@
----
- extra/locale/gen_wc8bit.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: uClibc-0.9.30.3/extra/locale/gen_wc8bit.c
-===================================================================
---- uClibc-0.9.30.3.orig/extra/locale/gen_wc8bit.c
-+++ uClibc-0.9.30.3/extra/locale/gen_wc8bit.c
-@@ -119,7 +119,7 @@
- 		}
- 
-  locale_failure:
--		printf("could not find a UTF8 locale ... please enable en_US.UTF-8\n");
-+		fprintf(stderr, "could not find a UTF8 locale ... please enable en_US.UTF-8\n");
- 		return EXIT_FAILURE;
-  locale_success:
- 		pclose(fp);
diff --git a/toolchain/uClibc/uClibc-0.9.30.3-xtensa-000p-fix-procfs.patch b/toolchain/uClibc/uClibc-0.9.30.3-xtensa-000p-fix-procfs.patch
deleted file mode 100644
index 8e62d20..0000000
--- a/toolchain/uClibc/uClibc-0.9.30.3-xtensa-000p-fix-procfs.patch
+++ /dev/null
@@ -1,24 +0,0 @@
---- uClibc-0.9.29-orig/libc/sysdeps/linux/xtensa/sys/procfs.h	2007-11-16 23:21:00.000000000 -0800
-+++ uClibc-0.9.29/libc/sysdeps/linux/xtensa/sys/procfs.h	2007-11-16 23:26:59.000000000 -0800
-@@ -32,19 +32,11 @@
- #include <sys/time.h>
- #include <sys/types.h>
- #include <sys/user.h>
-+#include <asm/elf.h>
- 
- __BEGIN_DECLS
- 
--/* Type for a general-purpose register.  */
--typedef unsigned long elf_greg_t;
--
--#define ELF_NGREG 128
--typedef elf_greg_t elf_gregset_t[ELF_NGREG];
--
--/* Register set for the floating-point registers.  */
--#define ELF_NFPREG 18
--typedef unsigned long elf_fpreg_t;
--typedef elf_fpreg_t elf_fpregset_t[ELF_NFPREG];
-+/* Note: we get elf_gregset_t and elf_fpregset_t from <asm/elf.h>.  */
- 
- /* Signal info.  */
- struct elf_siginfo
diff --git a/toolchain/uClibc/uClibc-0.9.30.3-xtensa-005-sigcontext.patch b/toolchain/uClibc/uClibc-0.9.30.3-xtensa-005-sigcontext.patch
deleted file mode 100644
index 7d7d684..0000000
--- a/toolchain/uClibc/uClibc-0.9.30.3-xtensa-005-sigcontext.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-diff -u /dev/null uClibc-0.9.30/libc/sysdeps/linux/xtensa/bits/sigcontext.h
---- /dev/null
-+++ uClibc-0.9.30/libc/sysdeps/linux/xtensa/bits/sigcontext.h
-@@ -0,0 +1,41 @@
-+/* Copyright (C) 2006, 2007, 2008, 2009 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, write to the Free
-+   Software Foundation, Inc., 51 Franklin Street - Fifth Floor,
-+   Boston, MA 02110-1301, USA.  */
-+
-+#if !defined _SIGNAL_H && !defined _SYS_UCONTEXT_H
-+# error "Never use <bits/sigcontext.h> directly; include <signal.h> instead."
-+#endif
-+
-+#ifndef _BITS_SIGCONTEXT_H
-+#define _BITS_SIGCONTEXT_H 1
-+
-+struct sigcontext
-+{
-+  unsigned long sc_pc;
-+  unsigned long sc_ps;
-+  unsigned long sc_lbeg;
-+  unsigned long sc_lend;
-+  unsigned long sc_lcount;
-+  unsigned long sc_sar;
-+  unsigned long sc_acclo;
-+  unsigned long sc_acchi;
-+  void *sc_xtregs;
-+  unsigned long sc_a[16];
-+};
-+
-+#endif /* _BITS_SIGCONTEXT_H */
-+
diff --git a/toolchain/uClibc/uClibc-0.9.30.3-xtensa-009-testandset.patch b/toolchain/uClibc/uClibc-0.9.30.3-xtensa-009-testandset.patch
deleted file mode 100644
index f0e4eb2..0000000
--- a/toolchain/uClibc/uClibc-0.9.30.3-xtensa-009-testandset.patch
+++ /dev/null
@@ -1,59 +0,0 @@
---- uClibc-0.9.29/libpthread/linuxthreads.old/sysdeps/xtensa/pt-machine.h.orig	2008-09-12 09:51:50.000000000 -0700
-+++ uClibc-0.9.29/libpthread/linuxthreads.old/sysdeps/xtensa/pt-machine.h	2008-10-04 12:14:57.000000000 -0700
-@@ -26,19 +26,51 @@
- #include <asm/unistd.h>
- 
- #ifndef PT_EI
--# define PT_EI __extern_always_inline
-+# define PT_EI extern inline __attribute__ ((gnu_inline))
- #endif
- 
--/* Memory barrier.  */
- #define MEMORY_BARRIER() __asm__ ("memw" : : : "memory")
-+#define HAS_COMPARE_AND_SWAP
-+
-+extern long int testandset (int *spinlock);
-+extern int __compare_and_swap (long int *p, long int oldval, long int newval);
- 
- /* Spinlock implementation; required.  */
- PT_EI long int
- testandset (int *spinlock)
- {
--  int unused = 0;
--  return INTERNAL_SYSCALL (xtensa, , 4, SYS_XTENSA_ATOMIC_SET,
--			   spinlock, 1, unused);
-+	unsigned long tmp;
-+	__asm__ volatile (
-+"	movi	%0, 0			\n"
-+"	wsr	%0, SCOMPARE1		\n"
-+"	movi	%0, 1			\n"
-+"	s32c1i	%0, %1, 0		\n"
-+	: "=&a" (tmp)
-+	: "a" (spinlock)
-+	: "memory"
-+	);
-+	return tmp;
-+}
-+
-+PT_EI int
-+__compare_and_swap (long int *p, long int oldval, long int newval)
-+{
-+        unsigned long tmp;
-+        unsigned long value;
-+        __asm__ volatile (
-+"1:     l32i    %0, %2, 0            \n"
-+"       bne     %0, %4, 2f           \n"
-+"       wsr     %0, SCOMPARE1        \n"
-+"       mov     %1, %0               \n"
-+"       mov     %0, %3               \n"
-+"       s32c1i  %0, %2, 0            \n"
-+"       bne     %1, %0, 1b           \n"
-+"2:                                  \n"
-+          : "=&a" (tmp), "=&a" (value)
-+          : "a" (p), "a" (newval), "a" (oldval)
-+          : "memory" );
-+
-+        return tmp == oldval;
- }
- 
- /* Get some notion of the current stack.  Need not be exactly the top
diff --git a/toolchain/uClibc/uClibc-0.9.30.3-xtensa-010-sigaction.c.patch b/toolchain/uClibc/uClibc-0.9.30.3-xtensa-010-sigaction.c.patch
deleted file mode 100644
index 5717c25..0000000
--- a/toolchain/uClibc/uClibc-0.9.30.3-xtensa-010-sigaction.c.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/libc/sysdeps/linux/xtensa/sigaction.c	2008-09-23 21:11:02.000000000 -0700
-+++ b/libc/sysdeps/linux/xtensa/sigaction.c	2008-09-23 21:12:31.000000000 -0700
-@@ -17,6 +17,8 @@
- 
- #define SA_RESTORER	0x04000000	
- 
-+extern __typeof(sigaction) __libc_sigaction;
-+
- extern void __default_sa_restorer (void);
- 
- libc_hidden_proto(memcpy)
diff --git a/toolchain/uClibc/uClibc-0.9.30.3-xtensa-011-sysdep.h.patch b/toolchain/uClibc/uClibc-0.9.30.3-xtensa-011-sysdep.h.patch
deleted file mode 100644
index 692b0a7..0000000
--- a/toolchain/uClibc/uClibc-0.9.30.3-xtensa-011-sysdep.h.patch
+++ /dev/null
@@ -1,19 +0,0 @@
---- a/libc/sysdeps/linux/xtensa/sysdep.h	2008-09-23 21:17:42.000000000 -0700
-+++ b/libc/sysdeps/linux/xtensa/sysdep.h	2008-09-23 21:17:59.000000000 -0700
-@@ -114,15 +114,7 @@
- 
- #define ret_ERRVAL retw
- 
--#if RTLD_PRIVATE_ERRNO
--# define SYSCALL_ERROR_HANDLER						      \
--0:	movi	a4, rtld_errno;						      \
--	neg	a2, a2;							      \
--	s32i	a2, a4, 0;						      \
--	movi	a2, -1;							      \
--	j	.Lpseudo_end;
--
--#elif defined _LIBC_REENTRANT
-+#if defined _LIBC_REENTRANT
- 
- # if USE___THREAD
- #  ifndef NOT_IN_libc
diff --git a/toolchain/uClibc/uClibc-0.9.30.3-xtensa-012-fnmatch_old.c.patch b/toolchain/uClibc/uClibc-0.9.30.3-xtensa-012-fnmatch_old.c.patch
deleted file mode 100644
index 66cb1f6..0000000
--- a/toolchain/uClibc/uClibc-0.9.30.3-xtensa-012-fnmatch_old.c.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/libc/misc/fnmatch/fnmatch_old.c	2008-09-23 21:23:13.000000000 -0700
-+++ b/libc/misc/fnmatch/fnmatch_old.c	2008-09-23 21:23:33.000000000 -0700
-@@ -15,7 +15,7 @@
- not, write to the Free Software Foundation, Inc., 675 Mass Ave,
- Cambridge, MA 02139, USA.  */
- 
--#if HAVE_CONFIG_H
-+#ifdef HAVE_CONFIG_H
- # include <config.h>
- #endif
- 
diff --git a/toolchain/uClibc/uClibc-0.9.30.3-xtensa-013-atomic.h.patch b/toolchain/uClibc/uClibc-0.9.30.3-xtensa-013-atomic.h.patch
deleted file mode 100644
index fd20371..0000000
--- a/toolchain/uClibc/uClibc-0.9.30.3-xtensa-013-atomic.h.patch
+++ /dev/null
@@ -1,165 +0,0 @@
---- /dev/null	2008-09-18 06:50:54.356228028 -0700
-+++ uClibc-0.9.29/libc/sysdeps/linux/xtensa/bits/atomic.h	2008-10-04 11:40:21.000000000 -0700
-@@ -0,0 +1,162 @@
-+/*
-+ * Copyright (C) 2008 Tensilica, Inc.
-+ * Contributed by Joe Taylor <joe@tensilica.com> 2008
-+ *
-+ * This file is subject to the terms and conditions of the GNU Lesser General
-+ * Public License.  See the file "COPYING.LIB" in the main directory of this
-+ * archive for more details.
-+ */
-+
-+#ifndef _XTENSA_BITS_ATOMIC_H
-+#define _XTENSA_BITS_ATOMIC_H  1
-+
-+/* Xtensa has only a 32-bit form of a store-conditional instruction,
-+   so just stub out the rest. */
-+
-+/* Atomically store NEWVAL in *MEM if *MEM is equal to OLDVAL.
-+   Return the old *MEM value.  */
-+
-+#define __arch_compare_and_exchange_val_32_acq(mem, newval, oldval)  \
-+  ({__typeof__(*(mem)) __tmp, __value;                               \
-+    __asm__ __volatile__(                                            \
-+      "1:     l32i    %1, %2, 0               \n"                    \
-+      "       bne     %1, %4, 2f              \n"                    \
-+      "       wsr     %1, SCOMPARE1           \n"                    \
-+      "       mov     %0, %1                  \n"                    \
-+      "       mov     %1, %3                  \n"                    \
-+      "       s32c1i  %1, %2, 0               \n"                    \
-+      "       bne     %0, %1, 1b              \n"                    \
-+      "2:                                     \n"                    \
-+      : "=&a" (__value), "=&a" (__tmp)                               \
-+      : "a" (mem), "a" (newval), "a" (oldval)                        \
-+      : "memory" );                                                  \
-+    __tmp;                                                           \
-+  })
-+
-+/* Atomically store NEWVAL in *MEM if *MEM is equal to OLDVAL.
-+   Return zero if *MEM was changed or non-zero if no exchange happened.  */
-+
-+#define __arch_compare_and_exchange_bool_32_acq(mem, newval, oldval) \
-+  ({__typeof__(*(mem)) __tmp, __value;                               \
-+    __asm__ __volatile__(                                            \
-+      "1:     l32i    %0, %2, 0               \n"                    \
-+      "       sub     %1, %4, %0              \n"                    \
-+      "       bnez    %1, 2f                  \n"                    \
-+      "       wsr     %0, SCOMPARE1           \n"                    \
-+      "       mov     %1, %3                  \n"                    \
-+      "       s32c1i  %1, %2, 0               \n"                    \
-+      "       bne     %0, %1, 1b              \n"                    \
-+      "       movi    %1, 0                   \n"                    \
-+      "2:                                     \n"                    \
-+      : "=&a" (__value), "=&a" (__tmp)                               \
-+      : "a" (mem), "a" (newval), "a" (oldval)                        \
-+      : "memory" );                                                  \
-+    __tmp != 0;                                                      \
-+  })
-+
-+/* Store NEWVALUE in *MEM and return the old value.  */
-+
-+#define __arch_exchange_32_acq(mem, newval)                          \
-+  ({__typeof__(*(mem)) __tmp, __value;                               \
-+    __asm__ __volatile__(                                            \
-+      "1:     l32i    %0, %2, 0               \n"                    \
-+      "       wsr     %0, SCOMPARE1           \n"                    \
-+      "       mov     %1, %3                  \n"                    \
-+      "       s32c1i  %1, %2, 0               \n"                    \
-+      "       bne     %0, %1, 1b              \n"                    \
-+      : "=&a" (__value), "=&a" (__tmp)                               \
-+      : "a" (mem), "a" (newval)                                      \
-+      : "memory" );                                                  \
-+    __tmp;                                                           \
-+  })
-+
-+/* Add VALUE to *MEM and return the old value of *MEM.  */
-+
-+#define __arch_atomic_exchange_and_add_32(mem, value)                \
-+  ({__typeof__(*(mem)) __tmp, __value;                               \
-+    __asm__ __volatile__(                                            \
-+      "1:     l32i    %0, %2, 0               \n"                    \
-+      "       wsr     %0, SCOMPARE1           \n"                    \
-+      "       add     %1, %0, %3              \n"                    \
-+      "       s32c1i  %1, %2, 0               \n"                    \
-+      "       bne     %0, %1, 1b              \n"                    \
-+      : "=&a" (__value), "=&a" (__tmp)                               \
-+      : "a" (mem), "a" (value)                                       \
-+      : "memory" );                                                  \
-+    __tmp;                                                           \
-+  })
-+
-+/* Subtract VALUE from *MEM and return the old value of *MEM.  */
-+
-+#define __arch_atomic_exchange_and_sub_32(mem, value)                \
-+  ({__typeof__(*(mem)) __tmp, __value;                               \
-+    __asm__ __volatile__(                                            \
-+      "1:     l32i    %0, %2, 0               \n"                    \
-+      "       wsr     %0, SCOMPARE1           \n"                    \
-+      "       sub     %1, %0, %3              \n"                    \
-+      "       s32c1i  %1, %2, 0               \n"                    \
-+      "       bne     %0, %1, 1b              \n"                    \
-+      : "=&a" (__value), "=&a" (__tmp)                               \
-+      : "a" (mem), "a" (value)                                       \
-+      : "memory" );                                                  \
-+    __tmp;                                                           \
-+  })
-+
-+/* Decrement *MEM if it is > 0, and return the old value.  */
-+
-+#define __arch_atomic_decrement_if_positive_32(mem)                  \
-+  ({__typeof__(*(mem)) __tmp, __value;                               \
-+    __asm__ __volatile__(                                            \
-+      "1:     l32i    %0, %2, 0               \n"                    \
-+      "       blti    %0, 1, 2f               \n"                    \
-+      "       wsr     %0, SCOMPARE1           \n"                    \
-+      "       addi    %1, %0, -1              \n"                    \
-+      "       s32c1i  %1, %2, 0               \n"                    \
-+      "       bne     %0, %1, 1b              \n"                    \
-+      "2:                                     \n"                    \
-+      : "=&a" (__value), "=&a" (__tmp)                               \
-+      : "a" (mem)                                                    \
-+      : "memory" );                                                  \
-+    __tmp;                                                           \
-+  })
-+
-+
-+/* These are the preferred public interfaces: */
-+
-+#define atomic_compare_and_exchange_val_acq(mem, newval, oldval)     \
-+  ({                                                                 \
-+    if (sizeof (*mem) != 4)                                          \
-+      abort();                                                       \
-+    __arch_compare_and_exchange_val_32_acq(mem, newval, oldval);     \
-+  })
-+
-+#define atomic_exchange_acq(mem, newval)                             \
-+  ({                                                                 \
-+    if (sizeof(*(mem)) != 4)                                         \
-+      abort();                                                       \
-+    __arch_exchange_32_acq(mem, newval);                             \
-+  })
-+
-+#define atomic_exchange_and_add(mem, newval)                         \
-+  ({                                                                 \
-+    if (sizeof(*(mem)) != 4)                                         \
-+      abort();                                                       \
-+    __arch_atomic_exchange_and_add_32(mem, newval);                  \
-+  })
-+
-+#define atomic_exchange_and_sub(mem, newval)                         \
-+  ({                                                                 \
-+    if (sizeof(*(mem)) != 4)                                         \
-+      abort();                                                       \
-+    __arch_atomic_exchange_and_sub_32(mem, newval);                  \
-+  })
-+
-+#define atomic_decrement_if_positive(mem)                            \
-+  ({                                                                 \
-+    if (sizeof(*(mem)) != 4)                                         \
-+      abort();                                                       \
-+    __arch_atomic_decrement_if_positive_32(mem);                     \
-+  })
-+
-+#endif /* _XTENSA_BITS_ATOMIC_H */
-+
diff --git a/toolchain/uClibc/uClibc-0.9.30.3-xtensa-014-setjump.S.patch b/toolchain/uClibc/uClibc-0.9.30.3-xtensa-014-setjump.S.patch
deleted file mode 100644
index 720b44b..0000000
--- a/toolchain/uClibc/uClibc-0.9.30.3-xtensa-014-setjump.S.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- uClibc-0.9.30/libc/sysdeps/linux/xtensa/setjmp.S.orig	2009-05-01 16:57:16.195893000 -0700
-+++ uClibc-0.9.30/libc/sysdeps/linux/xtensa/setjmp.S	2009-05-01 16:58:03.885160000 -0700
-@@ -86,7 +86,7 @@ ENTRY (__sigsetjmp)
- 	/* Copy 0-8 words from the register overflow area.  */
- 	extui	a3, a0, 30, 2
- 	blti	a3, 2, .Lendsj
--	l32i	a7, a1, 4
-+	l32i	a7, a5, 4
- 	slli	a4, a3, 4
- 	sub	a5, a7, a4
- 	addi	a6, a2, 16
diff --git a/toolchain/uClibc/uClibc-0.9.30.config b/toolchain/uClibc/uClibc-0.9.30.config
deleted file mode 100644
index 49ac3ef..0000000
--- a/toolchain/uClibc/uClibc-0.9.30.config
+++ /dev/null
@@ -1,247 +0,0 @@
-#
-# Automatically generated make config: don't edit
-#
-# TARGET_alpha is not set
-# TARGET_arm is not set
-# TARGET_avr32 is not set
-# TARGET_bfin is not set
-# TARGET_cris is not set
-# TARGET_e1 is not set
-# TARGET_frv is not set
-# TARGET_h8300 is not set
-# TARGET_hppa is not set
-# TARGET_i386 is not set
-# TARGET_i960 is not set
-# TARGET_ia64 is not set
-# TARGET_m68k is not set
-# TARGET_microblaze is not set
-# TARGET_mips is not set
-# TARGET_nios is not set
-# TARGET_nios2 is not set
-# TARGET_powerpc is not set
-# TARGET_sh is not set
-# TARGET_sh64 is not set
-# TARGET_sparc is not set
-# TARGET_v850 is not set
-# TARGET_vax is not set
-# TARGET_x86_64 is not set
-# TARGET_xtensa is not set
-
-#
-# Target Architecture Features and Options
-#
-TARGET_ARCH="none"
-FORCE_OPTIONS_FOR_ARCH=y
-# ARCH_LITTLE_ENDIAN is not set
-# ARCH_BIG_ENDIAN is not set
-# ARCH_WANTS_LITTLE_ENDIAN is not set
-# ARCH_WANTS_BIG_ENDIAN is not set
-
-#
-# Using Little Endian
-#
-ARCH_HAS_MMU=y
-ARCH_USE_MMU=y
-UCLIBC_HAS_FLOATS=y
-UCLIBC_HAS_FPU=y
-DO_C99_MATH=y
-# UCLIBC_HAS_FENV is not set
-UCLIBC_HAS_LONG_DOUBLE_MATH=y
-KERNEL_HEADERS="/usr/src/linux/include"
-HAVE_DOT_CONFIG=y
-
-#
-# General Library Settings
-#
-# HAVE_NO_PIC is not set
-DOPIC=y
-# ARCH_HAS_NO_SHARED is not set
-# ARCH_HAS_NO_LDSO is not set
-HAVE_SHARED=y
-FORCE_SHAREABLE_TEXT_SEGMENTS=y
-LDSO_LDD_SUPPORT=y
-# LDSO_CACHE_SUPPORT is not set
-# LDSO_PRELOAD_FILE_SUPPORT is not set
-# UCLIBC_STATIC_LDCONFIG is not set
-LDSO_RUNPATH=y
-UCLIBC_CTOR_DTOR=y
-# LDSO_GNU_HASH_SUPPORT is not set
-# HAS_NO_THREADS is not set
-UCLIBC_HAS_THREADS=y
-# PTHREADS_DEBUG_SUPPORT is not set
-LINUXTHREADS_OLD=y
-UCLIBC_HAS_SYSLOG=y
-UCLIBC_HAS_LFS=y
-# MALLOC is not set
-# MALLOC_SIMPLE is not set
-MALLOC_STANDARD=y
-MALLOC_GLIBC_COMPAT=y
-UCLIBC_DYNAMIC_ATEXIT=y
-# COMPAT_ATEXIT is not set
-# UCLIBC_SUSV3_LEGACY is not set
-# UCLIBC_SUSV3_LEGACY_MACROS is not set
-# UCLIBC_HAS_STUBS is not set
-UCLIBC_HAS_SHADOW=y
-UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y
-UCLIBC_HAS___PROGNAME=y
-UCLIBC_HAS_PTY=y
-ASSUME_DEVPTS=y
-UNIX98PTY_ONLY=y
-UCLIBC_HAS_GETPT=y
-UCLIBC_HAS_TM_EXTENSIONS=y
-UCLIBC_HAS_TZ_CACHING=y
-UCLIBC_HAS_TZ_FILE=y
-UCLIBC_HAS_TZ_FILE_READ_MANY=y
-UCLIBC_TZ_FILE_PATH="/etc/TZ"
-
-#
-# Advanced Library Settings
-#
-UCLIBC_PWD_BUFFER_SIZE=256
-UCLIBC_GRP_BUFFER_SIZE=256
-UCLIBC_HAS_NONREENTRANT=y
-
-#
-# Support various families of functions
-#
-UCLIBC_LINUX_MODULE_24=y
-UCLIBC_LINUX_SPECIFIC=y
-UCLIBC_HAS_GNU_ERROR=y
-UCLIBC_BSD_SPECIFIC=y
-UCLIBC_HAS_BSD_ERR=y
-# UCLIBC_HAS_OBSOLETE_BSD_SIGNAL is not set
-# UCLIBC_HAS_OBSOLETE_SYSV_SIGNAL is not set
-# UCLIBC_NTP_LEGACY is not set
-# UCLIBC_SV4_DEPRECATED is not set
-UCLIBC_HAS_REALTIME=y
-UCLIBC_HAS_ADVANCED_REALTIME=y
-UCLIBC_HAS_EPOLL=y
-UCLIBC_HAS_XATTR=y
-UCLIBC_HAS_PROFILING=y
-UCLIBC_HAS_CRYPT_IMPL=y
-UCLIBC_HAS_CRYPT=y
-UCLIBC_HAS_NETWORK_SUPPORT=y
-UCLIBC_HAS_SOCKET=y
-UCLIBC_HAS_IPV4=y
-# UCLIBC_HAS_IPV6 is not set
-# UCLIBC_HAS_RPC is not set
-# UCLIBC_HAS_FULL_RPC is not set
-# UCLIBC_HAS_REENTRANT_RPC is not set
-UCLIBC_USE_NETLINK=y
-# UCLIBC_SUPPORT_AI_ADDRCONFIG is not set
-# UCLIBC_HAS_BSD_RES_CLOSE is not set
-
-#
-# String and Stdio Support
-#
-# UCLIBC_HAS_STRING_GENERIC_OPT is not set
-UCLIBC_HAS_STRING_ARCH_OPT=y
-UCLIBC_HAS_CTYPE_TABLES=y
-UCLIBC_HAS_CTYPE_SIGNED=y
-# UCLIBC_HAS_CTYPE_UNSAFE is not set
-# UCLIBC_HAS_CTYPE_CHECKED is not set
-UCLIBC_HAS_CTYPE_ENFORCED=y
-# UCLIBC_HAS_WCHAR is not set
-# UCLIBC_HAS_LOCALE is not set
-UCLIBC_HAS_HEXADECIMAL_FLOATS=y
-UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
-# USE_OLD_VFPRINTF is not set
-UCLIBC_PRINTF_SCANF_POSITIONAL_ARGS=9
-UCLIBC_HAS_SCANF_GLIBC_A_FLAG=y
-# UCLIBC_HAS_STDIO_BUFSIZ_NONE is not set
-# UCLIBC_HAS_STDIO_BUFSIZ_256 is not set
-# UCLIBC_HAS_STDIO_BUFSIZ_512 is not set
-# UCLIBC_HAS_STDIO_BUFSIZ_1024 is not set
-# UCLIBC_HAS_STDIO_BUFSIZ_2048 is not set
-UCLIBC_HAS_STDIO_BUFSIZ_4096=y
-# UCLIBC_HAS_STDIO_BUFSIZ_8192 is not set
-UCLIBC_HAS_STDIO_BUILTIN_BUFFER_NONE=y
-# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_4 is not set
-# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_8 is not set
-# UCLIBC_HAS_STDIO_SHUTDOWN_ON_ABORT is not set
-# UCLIBC_HAS_STDIO_GETC_MACRO is not set
-# UCLIBC_HAS_STDIO_PUTC_MACRO is not set
-UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
-# UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set
-UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
-UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
-UCLIBC_HAS_PRINTF_M_SPEC=y
-UCLIBC_HAS_ERRNO_MESSAGES=y
-# UCLIBC_HAS_SYS_ERRLIST is not set
-UCLIBC_HAS_SIGNUM_MESSAGES=y
-# UCLIBC_HAS_SYS_SIGLIST is not set
-UCLIBC_HAS_GNU_GETOPT=y
-# UCLIBC_HAS_GNU_GETSUBOPT is not set
-
-#
-# Big and Tall
-#
-UCLIBC_HAS_REGEX=y
-# UCLIBC_HAS_REGEX_OLD is not set
-UCLIBC_HAS_FNMATCH=y
-# UCLIBC_HAS_FNMATCH_OLD is not set
-# UCLIBC_HAS_WORDEXP is not set
-UCLIBC_HAS_FTW=y
-UCLIBC_HAS_GLOB=y
-UCLIBC_HAS_GNU_GLOB=y
-
-#
-# Library Installation Options
-#
-SHARED_LIB_LOADER_PREFIX="/lib"
-RUNTIME_PREFIX="/"
-DEVEL_PREFIX="/usr/"
-
-#
-# Security options
-#
-# UCLIBC_BUILD_PIE is not set
-# UCLIBC_HAS_ARC4RANDOM is not set
-# HAVE_NO_SSP is not set
-UCLIBC_HAS_SSP=y
-# UCLIBC_HAS_SSP_COMPAT is not set
-# SSP_QUICK_CANARY is not set
-PROPOLICE_BLOCK_ABRT=y
-# PROPOLICE_BLOCK_SEGV is not set
-# UCLIBC_BUILD_SSP is not set
-UCLIBC_BUILD_RELRO=y
-UCLIBC_BUILD_NOW=y
-UCLIBC_BUILD_NOEXECSTACK=y
-
-#
-# uClibc development/debugging options
-#
-CROSS_COMPILER_PREFIX=""
-UCLIBC_EXTRA_CFLAGS=""
-# DODEBUG is not set
-# DODEBUG_PT is not set
-DOSTRIP=y
-# DOASSERTS is not set
-# SUPPORT_LD_DEBUG is not set
-# SUPPORT_LD_DEBUG_EARLY is not set
-# UCLIBC_MALLOC_DEBUGGING is not set
-WARNINGS="-Wall"
-# EXTRA_WARNINGS is not set
-# DOMULTI is not set
-# UCLIBC_MJN3_ONLY is not set
-
-# USE_BX is not set
-# CONFIG_GENERIC_ARM is not set
-# CONFIG_ARM610 is not set
-# CONFIG_ARM710 is not set
-# CONFIG_ARM7TDMI is not set
-# CONFIG_ARM720T is not set
-# CONFIG_ARM920T is not set
-# CONFIG_ARM922T is not set
-# CONFIG_ARM926T is not set
-# CONFIG_ARM10T is not set
-# CONFIG_ARM1136JF_S is not set
-# CONFIG_ARM1176JZ_S is not set
-# CONFIG_ARM1176JZF_S is not set
-# CONFIG_ARM_CORTEX_M3 is not set
-# CONFIG_ARM_CORTEX_M1 is not set
-# CONFIG_ARM_SA110 is not set
-# CONFIG_ARM_SA1100 is not set
-# CONFIG_ARM_XSCALE is not set
-# CONFIG_ARM_IWMMXT is not set
-
-- 
1.7.3.4
