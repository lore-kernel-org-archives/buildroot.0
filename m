From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 25 Jul 2009 21:08:55 +0200
Subject: [Buildroot] [git commit] toolchain/uclibc: xtensa patches
Message-ID: <20090725191956.E1453777FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c1b3b6cab0c921e74534b8fe789b8f7f8dbe62b4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

New files missing from 58050c28.

Signed-off-by: Maxim Grigoriev <maxim2405@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../uClibc-0.9.30-xtensa-000p-fix-procfs.patch     |   24 +++
 .../uClibc-0.9.30-xtensa-005-sigcontext.patch      |   45 ++++++
 .../uClibc-0.9.30-xtensa-009-testandset.patch      |   59 +++++++
 .../uClibc-0.9.30-xtensa-010-sigaction.c.patch     |   11 ++
 .../uClibc/uClibc-0.9.30-xtensa-011-sysdep.h.patch |   19 +++
 .../uClibc-0.9.30-xtensa-012-fnmatch_old.c.patch   |   11 ++
 .../uClibc/uClibc-0.9.30-xtensa-013-atomic.h.patch |  165 ++++++++++++++++++++
 .../uClibc-0.9.30-xtensa-014-setjump.S.patch       |   11 ++
 8 files changed, 345 insertions(+), 0 deletions(-)
 create mode 100644 toolchain/uClibc/uClibc-0.9.30-xtensa-000p-fix-procfs.patch
 create mode 100644 toolchain/uClibc/uClibc-0.9.30-xtensa-005-sigcontext.patch
 create mode 100644 toolchain/uClibc/uClibc-0.9.30-xtensa-009-testandset.patch
 create mode 100644 toolchain/uClibc/uClibc-0.9.30-xtensa-010-sigaction.c.patch
 create mode 100644 toolchain/uClibc/uClibc-0.9.30-xtensa-011-sysdep.h.patch
 create mode 100644 toolchain/uClibc/uClibc-0.9.30-xtensa-012-fnmatch_old.c.patch
 create mode 100644 toolchain/uClibc/uClibc-0.9.30-xtensa-013-atomic.h.patch
 create mode 100644 toolchain/uClibc/uClibc-0.9.30-xtensa-014-setjump.S.patch

diff --git a/toolchain/uClibc/uClibc-0.9.30-xtensa-000p-fix-procfs.patch b/toolchain/uClibc/uClibc-0.9.30-xtensa-000p-fix-procfs.patch
new file mode 100644
index 0000000..8e62d20
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.30-xtensa-000p-fix-procfs.patch
@@ -0,0 +1,24 @@
+--- uClibc-0.9.29-orig/libc/sysdeps/linux/xtensa/sys/procfs.h	2007-11-16 23:21:00.000000000 -0800
++++ uClibc-0.9.29/libc/sysdeps/linux/xtensa/sys/procfs.h	2007-11-16 23:26:59.000000000 -0800
+@@ -32,19 +32,11 @@
+ #include <sys/time.h>
+ #include <sys/types.h>
+ #include <sys/user.h>
++#include <asm/elf.h>
+ 
+ __BEGIN_DECLS
+ 
+-/* Type for a general-purpose register.  */
+-typedef unsigned long elf_greg_t;
+-
+-#define ELF_NGREG 128
+-typedef elf_greg_t elf_gregset_t[ELF_NGREG];
+-
+-/* Register set for the floating-point registers.  */
+-#define ELF_NFPREG 18
+-typedef unsigned long elf_fpreg_t;
+-typedef elf_fpreg_t elf_fpregset_t[ELF_NFPREG];
++/* Note: we get elf_gregset_t and elf_fpregset_t from <asm/elf.h>.  */
+ 
+ /* Signal info.  */
+ struct elf_siginfo
diff --git a/toolchain/uClibc/uClibc-0.9.30-xtensa-005-sigcontext.patch b/toolchain/uClibc/uClibc-0.9.30-xtensa-005-sigcontext.patch
new file mode 100644
index 0000000..7d7d684
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.30-xtensa-005-sigcontext.patch
@@ -0,0 +1,45 @@
+diff -u /dev/null uClibc-0.9.30/libc/sysdeps/linux/xtensa/bits/sigcontext.h
+--- /dev/null
++++ uClibc-0.9.30/libc/sysdeps/linux/xtensa/bits/sigcontext.h
+@@ -0,0 +1,41 @@
++/* Copyright (C) 2006, 2007, 2008, 2009 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, Inc., 51 Franklin Street - Fifth Floor,
++   Boston, MA 02110-1301, USA.  */
++
++#if !defined _SIGNAL_H && !defined _SYS_UCONTEXT_H
++# error "Never use <bits/sigcontext.h> directly; include <signal.h> instead."
++#endif
++
++#ifndef _BITS_SIGCONTEXT_H
++#define _BITS_SIGCONTEXT_H 1
++
++struct sigcontext
++{
++  unsigned long sc_pc;
++  unsigned long sc_ps;
++  unsigned long sc_lbeg;
++  unsigned long sc_lend;
++  unsigned long sc_lcount;
++  unsigned long sc_sar;
++  unsigned long sc_acclo;
++  unsigned long sc_acchi;
++  void *sc_xtregs;
++  unsigned long sc_a[16];
++};
++
++#endif /* _BITS_SIGCONTEXT_H */
++
diff --git a/toolchain/uClibc/uClibc-0.9.30-xtensa-009-testandset.patch b/toolchain/uClibc/uClibc-0.9.30-xtensa-009-testandset.patch
new file mode 100644
index 0000000..f0e4eb2
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.30-xtensa-009-testandset.patch
@@ -0,0 +1,59 @@
+--- uClibc-0.9.29/libpthread/linuxthreads.old/sysdeps/xtensa/pt-machine.h.orig	2008-09-12 09:51:50.000000000 -0700
++++ uClibc-0.9.29/libpthread/linuxthreads.old/sysdeps/xtensa/pt-machine.h	2008-10-04 12:14:57.000000000 -0700
+@@ -26,19 +26,51 @@
+ #include <asm/unistd.h>
+ 
+ #ifndef PT_EI
+-# define PT_EI __extern_always_inline
++# define PT_EI extern inline __attribute__ ((gnu_inline))
+ #endif
+ 
+-/* Memory barrier.  */
+ #define MEMORY_BARRIER() __asm__ ("memw" : : : "memory")
++#define HAS_COMPARE_AND_SWAP
++
++extern long int testandset (int *spinlock);
++extern int __compare_and_swap (long int *p, long int oldval, long int newval);
+ 
+ /* Spinlock implementation; required.  */
+ PT_EI long int
+ testandset (int *spinlock)
+ {
+-  int unused = 0;
+-  return INTERNAL_SYSCALL (xtensa, , 4, SYS_XTENSA_ATOMIC_SET,
+-			   spinlock, 1, unused);
++	unsigned long tmp;
++	__asm__ volatile (
++"	movi	%0, 0			\n"
++"	wsr	%0, SCOMPARE1		\n"
++"	movi	%0, 1			\n"
++"	s32c1i	%0, %1, 0		\n"
++	: "=&a" (tmp)
++	: "a" (spinlock)
++	: "memory"
++	);
++	return tmp;
++}
++
++PT_EI int
++__compare_and_swap (long int *p, long int oldval, long int newval)
++{
++        unsigned long tmp;
++        unsigned long value;
++        __asm__ volatile (
++"1:     l32i    %0, %2, 0            \n"
++"       bne     %0, %4, 2f           \n"
++"       wsr     %0, SCOMPARE1        \n"
++"       mov     %1, %0               \n"
++"       mov     %0, %3               \n"
++"       s32c1i  %0, %2, 0            \n"
++"       bne     %1, %0, 1b           \n"
++"2:                                  \n"
++          : "=&a" (tmp), "=&a" (value)
++          : "a" (p), "a" (newval), "a" (oldval)
++          : "memory" );
++
++        return tmp == oldval;
+ }
+ 
+ /* Get some notion of the current stack.  Need not be exactly the top
diff --git a/toolchain/uClibc/uClibc-0.9.30-xtensa-010-sigaction.c.patch b/toolchain/uClibc/uClibc-0.9.30-xtensa-010-sigaction.c.patch
new file mode 100644
index 0000000..5717c25
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.30-xtensa-010-sigaction.c.patch
@@ -0,0 +1,11 @@
+--- a/libc/sysdeps/linux/xtensa/sigaction.c	2008-09-23 21:11:02.000000000 -0700
++++ b/libc/sysdeps/linux/xtensa/sigaction.c	2008-09-23 21:12:31.000000000 -0700
+@@ -17,6 +17,8 @@
+ 
+ #define SA_RESTORER	0x04000000	
+ 
++extern __typeof(sigaction) __libc_sigaction;
++
+ extern void __default_sa_restorer (void);
+ 
+ libc_hidden_proto(memcpy)
diff --git a/toolchain/uClibc/uClibc-0.9.30-xtensa-011-sysdep.h.patch b/toolchain/uClibc/uClibc-0.9.30-xtensa-011-sysdep.h.patch
new file mode 100644
index 0000000..692b0a7
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.30-xtensa-011-sysdep.h.patch
@@ -0,0 +1,19 @@
+--- a/libc/sysdeps/linux/xtensa/sysdep.h	2008-09-23 21:17:42.000000000 -0700
++++ b/libc/sysdeps/linux/xtensa/sysdep.h	2008-09-23 21:17:59.000000000 -0700
+@@ -114,15 +114,7 @@
+ 
+ #define ret_ERRVAL retw
+ 
+-#if RTLD_PRIVATE_ERRNO
+-# define SYSCALL_ERROR_HANDLER						      \
+-0:	movi	a4, rtld_errno;						      \
+-	neg	a2, a2;							      \
+-	s32i	a2, a4, 0;						      \
+-	movi	a2, -1;							      \
+-	j	.Lpseudo_end;
+-
+-#elif defined _LIBC_REENTRANT
++#if defined _LIBC_REENTRANT
+ 
+ # if USE___THREAD
+ #  ifndef NOT_IN_libc
diff --git a/toolchain/uClibc/uClibc-0.9.30-xtensa-012-fnmatch_old.c.patch b/toolchain/uClibc/uClibc-0.9.30-xtensa-012-fnmatch_old.c.patch
new file mode 100644
index 0000000..66cb1f6
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.30-xtensa-012-fnmatch_old.c.patch
@@ -0,0 +1,11 @@
+--- a/libc/misc/fnmatch/fnmatch_old.c	2008-09-23 21:23:13.000000000 -0700
++++ b/libc/misc/fnmatch/fnmatch_old.c	2008-09-23 21:23:33.000000000 -0700
+@@ -15,7 +15,7 @@
+ not, write to the Free Software Foundation, Inc., 675 Mass Ave,
+ Cambridge, MA 02139, USA.  */
+ 
+-#if HAVE_CONFIG_H
++#ifdef HAVE_CONFIG_H
+ # include <config.h>
+ #endif
+ 
diff --git a/toolchain/uClibc/uClibc-0.9.30-xtensa-013-atomic.h.patch b/toolchain/uClibc/uClibc-0.9.30-xtensa-013-atomic.h.patch
new file mode 100644
index 0000000..fd20371
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.30-xtensa-013-atomic.h.patch
@@ -0,0 +1,165 @@
+--- /dev/null	2008-09-18 06:50:54.356228028 -0700
++++ uClibc-0.9.29/libc/sysdeps/linux/xtensa/bits/atomic.h	2008-10-04 11:40:21.000000000 -0700
+@@ -0,0 +1,162 @@
++/*
++ * Copyright (C) 2008 Tensilica, Inc.
++ * Contributed by Joe Taylor <joe@tensilica.com> 2008
++ *
++ * This file is subject to the terms and conditions of the GNU Lesser General
++ * Public License.  See the file "COPYING.LIB" in the main directory of this
++ * archive for more details.
++ */
++
++#ifndef _XTENSA_BITS_ATOMIC_H
++#define _XTENSA_BITS_ATOMIC_H  1
++
++/* Xtensa has only a 32-bit form of a store-conditional instruction,
++   so just stub out the rest. */
++
++/* Atomically store NEWVAL in *MEM if *MEM is equal to OLDVAL.
++   Return the old *MEM value.  */
++
++#define __arch_compare_and_exchange_val_32_acq(mem, newval, oldval)  \
++  ({__typeof__(*(mem)) __tmp, __value;                               \
++    __asm__ __volatile__(                                            \
++      "1:     l32i    %1, %2, 0               \n"                    \
++      "       bne     %1, %4, 2f              \n"                    \
++      "       wsr     %1, SCOMPARE1           \n"                    \
++      "       mov     %0, %1                  \n"                    \
++      "       mov     %1, %3                  \n"                    \
++      "       s32c1i  %1, %2, 0               \n"                    \
++      "       bne     %0, %1, 1b              \n"                    \
++      "2:                                     \n"                    \
++      : "=&a" (__value), "=&a" (__tmp)                               \
++      : "a" (mem), "a" (newval), "a" (oldval)                        \
++      : "memory" );                                                  \
++    __tmp;                                                           \
++  })
++
++/* Atomically store NEWVAL in *MEM if *MEM is equal to OLDVAL.
++   Return zero if *MEM was changed or non-zero if no exchange happened.  */
++
++#define __arch_compare_and_exchange_bool_32_acq(mem, newval, oldval) \
++  ({__typeof__(*(mem)) __tmp, __value;                               \
++    __asm__ __volatile__(                                            \
++      "1:     l32i    %0, %2, 0               \n"                    \
++      "       sub     %1, %4, %0              \n"                    \
++      "       bnez    %1, 2f                  \n"                    \
++      "       wsr     %0, SCOMPARE1           \n"                    \
++      "       mov     %1, %3                  \n"                    \
++      "       s32c1i  %1, %2, 0               \n"                    \
++      "       bne     %0, %1, 1b              \n"                    \
++      "       movi    %1, 0                   \n"                    \
++      "2:                                     \n"                    \
++      : "=&a" (__value), "=&a" (__tmp)                               \
++      : "a" (mem), "a" (newval), "a" (oldval)                        \
++      : "memory" );                                                  \
++    __tmp != 0;                                                      \
++  })
++
++/* Store NEWVALUE in *MEM and return the old value.  */
++
++#define __arch_exchange_32_acq(mem, newval)                          \
++  ({__typeof__(*(mem)) __tmp, __value;                               \
++    __asm__ __volatile__(                                            \
++      "1:     l32i    %0, %2, 0               \n"                    \
++      "       wsr     %0, SCOMPARE1           \n"                    \
++      "       mov     %1, %3                  \n"                    \
++      "       s32c1i  %1, %2, 0               \n"                    \
++      "       bne     %0, %1, 1b              \n"                    \
++      : "=&a" (__value), "=&a" (__tmp)                               \
++      : "a" (mem), "a" (newval)                                      \
++      : "memory" );                                                  \
++    __tmp;                                                           \
++  })
++
++/* Add VALUE to *MEM and return the old value of *MEM.  */
++
++#define __arch_atomic_exchange_and_add_32(mem, value)                \
++  ({__typeof__(*(mem)) __tmp, __value;                               \
++    __asm__ __volatile__(                                            \
++      "1:     l32i    %0, %2, 0               \n"                    \
++      "       wsr     %0, SCOMPARE1           \n"                    \
++      "       add     %1, %0, %3              \n"                    \
++      "       s32c1i  %1, %2, 0               \n"                    \
++      "       bne     %0, %1, 1b              \n"                    \
++      : "=&a" (__value), "=&a" (__tmp)                               \
++      : "a" (mem), "a" (value)                                       \
++      : "memory" );                                                  \
++    __tmp;                                                           \
++  })
++
++/* Subtract VALUE from *MEM and return the old value of *MEM.  */
++
++#define __arch_atomic_exchange_and_sub_32(mem, value)                \
++  ({__typeof__(*(mem)) __tmp, __value;                               \
++    __asm__ __volatile__(                                            \
++      "1:     l32i    %0, %2, 0               \n"                    \
++      "       wsr     %0, SCOMPARE1           \n"                    \
++      "       sub     %1, %0, %3              \n"                    \
++      "       s32c1i  %1, %2, 0               \n"                    \
++      "       bne     %0, %1, 1b              \n"                    \
++      : "=&a" (__value), "=&a" (__tmp)                               \
++      : "a" (mem), "a" (value)                                       \
++      : "memory" );                                                  \
++    __tmp;                                                           \
++  })
++
++/* Decrement *MEM if it is > 0, and return the old value.  */
++
++#define __arch_atomic_decrement_if_positive_32(mem)                  \
++  ({__typeof__(*(mem)) __tmp, __value;                               \
++    __asm__ __volatile__(                                            \
++      "1:     l32i    %0, %2, 0               \n"                    \
++      "       blti    %0, 1, 2f               \n"                    \
++      "       wsr     %0, SCOMPARE1           \n"                    \
++      "       addi    %1, %0, -1              \n"                    \
++      "       s32c1i  %1, %2, 0               \n"                    \
++      "       bne     %0, %1, 1b              \n"                    \
++      "2:                                     \n"                    \
++      : "=&a" (__value), "=&a" (__tmp)                               \
++      : "a" (mem)                                                    \
++      : "memory" );                                                  \
++    __tmp;                                                           \
++  })
++
++
++/* These are the preferred public interfaces: */
++
++#define atomic_compare_and_exchange_val_acq(mem, newval, oldval)     \
++  ({                                                                 \
++    if (sizeof (*mem) != 4)                                          \
++      abort();                                                       \
++    __arch_compare_and_exchange_val_32_acq(mem, newval, oldval);     \
++  })
++
++#define atomic_exchange_acq(mem, newval)                             \
++  ({                                                                 \
++    if (sizeof(*(mem)) != 4)                                         \
++      abort();                                                       \
++    __arch_exchange_32_acq(mem, newval);                             \
++  })
++
++#define atomic_exchange_and_add(mem, newval)                         \
++  ({                                                                 \
++    if (sizeof(*(mem)) != 4)                                         \
++      abort();                                                       \
++    __arch_atomic_exchange_and_add_32(mem, newval);                  \
++  })
++
++#define atomic_exchange_and_sub(mem, newval)                         \
++  ({                                                                 \
++    if (sizeof(*(mem)) != 4)                                         \
++      abort();                                                       \
++    __arch_atomic_exchange_and_sub_32(mem, newval);                  \
++  })
++
++#define atomic_decrement_if_positive(mem)                            \
++  ({                                                                 \
++    if (sizeof(*(mem)) != 4)                                         \
++      abort();                                                       \
++    __arch_atomic_decrement_if_positive_32(mem);                     \
++  })
++
++#endif /* _XTENSA_BITS_ATOMIC_H */
++
diff --git a/toolchain/uClibc/uClibc-0.9.30-xtensa-014-setjump.S.patch b/toolchain/uClibc/uClibc-0.9.30-xtensa-014-setjump.S.patch
new file mode 100644
index 0000000..720b44b
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.30-xtensa-014-setjump.S.patch
@@ -0,0 +1,11 @@
+--- uClibc-0.9.30/libc/sysdeps/linux/xtensa/setjmp.S.orig	2009-05-01 16:57:16.195893000 -0700
++++ uClibc-0.9.30/libc/sysdeps/linux/xtensa/setjmp.S	2009-05-01 16:58:03.885160000 -0700
+@@ -86,7 +86,7 @@ ENTRY (__sigsetjmp)
+ 	/* Copy 0-8 words from the register overflow area.  */
+ 	extui	a3, a0, 30, 2
+ 	blti	a3, 2, .Lendsj
+-	l32i	a7, a1, 4
++	l32i	a7, a5, 4
+ 	slli	a4, a3, 4
+ 	sub	a5, a7, a4
+ 	addi	a6, a2, 16
-- 
1.6.3.3
