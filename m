From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Jul 2013 10:03:24 +0200
Subject: [Buildroot] [PATCHv3 13/14] uclibc: add Thumb2 fixes
In-Reply-To: <1373961805-3901-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1373961805-3901-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1373961805-3901-14-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds three patches to uClibc that are needed to make
Thumb2 support work properly:

 uclibc-0006-arm-clone-restore-stack-pointer-just-after-return-fr.patch
 uclibc-0007-arm-clone.S-Add-missing-IT-instruction-for-Thumb2.patch
 uclibc-0008-arm-move-check-for-BX-to-its-own-header.patch

The first one is a necessary dependency of the second one. Both of
those patches have already been merged upstream, after 0.9.33.2. The
third one hasn't been merged upstream yet, but it has already been
submitted a while ago by Yann E. Morin, without receiving attention
from upstream.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...estore-stack-pointer-just-after-return-fr.patch |  42 ++++
 ...e.S-Add-missing-IT-instruction-for-Thumb2.patch |  29 +++
 ...8-arm-move-check-for-BX-to-its-own-header.patch | 257 +++++++++++++++++++++
 3 files changed, 328 insertions(+)
 create mode 100644 package/uclibc/0.9.33.2/uclibc-0006-arm-clone-restore-stack-pointer-just-after-return-fr.patch
 create mode 100644 package/uclibc/0.9.33.2/uclibc-0007-arm-clone.S-Add-missing-IT-instruction-for-Thumb2.patch
 create mode 100644 package/uclibc/0.9.33.2/uclibc-0008-arm-move-check-for-BX-to-its-own-header.patch

diff --git a/package/uclibc/0.9.33.2/uclibc-0006-arm-clone-restore-stack-pointer-just-after-return-fr.patch b/package/uclibc/0.9.33.2/uclibc-0006-arm-clone-restore-stack-pointer-just-after-return-fr.patch
new file mode 100644
index 0000000..de97850
--- /dev/null
+++ b/package/uclibc/0.9.33.2/uclibc-0006-arm-clone-restore-stack-pointer-just-after-return-fr.patch
@@ -0,0 +1,42 @@
+From 963671276c0ef14458e0a7990107bcd2c075f3cd Mon Sep 17 00:00:00 2001
+From: Filippo Arcidiacono <filippo.arcidiacono@st.com>
+Date: Mon, 10 Dec 2012 09:50:52 +0100
+Subject: [PATCH 6/8] arm: clone: restore stack pointer just after return from
+ syscall
+
+If the syscall returns with an error the stack pointer and r4 register
+are not restored because the instruction 'ldmnefd sp!, {r4}' is executed
+after branching to '__error' label.
+This bug has been spotted out by running './utstest clone 5' from LTP
+built with -fstack-protector-all compiler flag as log below:
+
+root at cortex-a9:/usr/tests/ltp/testcases/bin# ./utstest clone 5
+stack smashing detected: ./utstest terminated()
+
+Regression introduced by commit e58798e107d652644629a1daaa95d76430808d53
+
+Signed-off-by: Filippo Arcidiacono <filippo.arcidiacono@st.com>
+Signed-off-by: Giuseppe Di Giore <giuseppe.di-giore@st.com>
+Signed-off-by: Carmelo Amoroso <carmelo.amoroso@st.com>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ libc/sysdeps/linux/arm/clone.S | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libc/sysdeps/linux/arm/clone.S b/libc/sysdeps/linux/arm/clone.S
+index fdc05b8..e4101ba 100644
+--- a/libc/sysdeps/linux/arm/clone.S
++++ b/libc/sysdeps/linux/arm/clone.S
+@@ -111,8 +111,8 @@ __clone:
+ 	ldr	r4, [sp, #12]
+ 	DO_CALL (clone)
+ 	movs	a1, a1
+-	blt	__error
+ 	ldmnefd	sp!, {r4}
++	blt	__error
+ 	IT(t, ne)
+ #if defined(__USE_BX__)
+ 	bxne	lr
+-- 
+1.8.1.2
+
diff --git a/package/uclibc/0.9.33.2/uclibc-0007-arm-clone.S-Add-missing-IT-instruction-for-Thumb2.patch b/package/uclibc/0.9.33.2/uclibc-0007-arm-clone.S-Add-missing-IT-instruction-for-Thumb2.patch
new file mode 100644
index 0000000..f4097e9
--- /dev/null
+++ b/package/uclibc/0.9.33.2/uclibc-0007-arm-clone.S-Add-missing-IT-instruction-for-Thumb2.patch
@@ -0,0 +1,29 @@
+From c12211a2f1832169e31063512b3e2081e503e856 Mon Sep 17 00:00:00 2001
+From: Will Newton <will.newton@linaro.org>
+Date: Tue, 2 Apr 2013 13:53:35 +0100
+Subject: [PATCH 7/8] arm/clone.S: Add missing IT instruction for Thumb2.
+
+The conditional load needs to be made part of an IT block on Thumb2
+cores.
+
+Signed-off-by: Will Newton <will.newton@linaro.org>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ libc/sysdeps/linux/arm/clone.S | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libc/sysdeps/linux/arm/clone.S b/libc/sysdeps/linux/arm/clone.S
+index e4101ba..1f7f09d 100644
+--- a/libc/sysdeps/linux/arm/clone.S
++++ b/libc/sysdeps/linux/arm/clone.S
+@@ -111,6 +111,7 @@ __clone:
+ 	ldr	r4, [sp, #12]
+ 	DO_CALL (clone)
+ 	movs	a1, a1
++	IT(t, ne)
+ 	ldmnefd	sp!, {r4}
+ 	blt	__error
+ 	IT(t, ne)
+-- 
+1.8.1.2
+
diff --git a/package/uclibc/0.9.33.2/uclibc-0008-arm-move-check-for-BX-to-its-own-header.patch b/package/uclibc/0.9.33.2/uclibc-0008-arm-move-check-for-BX-to-its-own-header.patch
new file mode 100644
index 0000000..c3031b4
--- /dev/null
+++ b/package/uclibc/0.9.33.2/uclibc-0008-arm-move-check-for-BX-to-its-own-header.patch
@@ -0,0 +1,257 @@
+From 06827e81c976d16aa5861a40ac0d780b63a4d470 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Thu, 11 Apr 2013 23:02:03 +0200
+Subject: [PATCH 8/8] arm: move check for BX to its own header
+
+As Will noticed, the header this check is currently done in
+is asm-only, and is not meant to be included from C code.
+This breaks compilation when compiled for a Thumb2-aware CPU.
+
+Move the BX check to its own header, and revert 7a246fd.
+
+Reported-by: Will Newton <will.newton@gmail.com>
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Cc: Will Newton <will.newton@gmail.com>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ ldso/ldso/arm/dl-startup.h            |  2 +-
+ ldso/ldso/arm/resolve.S               |  1 +
+ libc/string/arm/_memcpy.S             |  1 +
+ libc/string/arm/memcmp.S              |  1 +
+ libc/string/arm/memset.S              |  1 +
+ libc/string/arm/strcmp.S              |  1 +
+ libc/string/arm/strlen.S              |  1 +
+ libc/sysdeps/linux/arm/__longjmp.S    |  2 +-
+ libc/sysdeps/linux/arm/bits/arm_asm.h |  8 --------
+ libc/sysdeps/linux/arm/bits/arm_bx.h  | 34 ++++++++++++++++++++++++++++++++++
+ libc/sysdeps/linux/arm/clone.S        |  1 +
+ libc/sysdeps/linux/arm/mmap64.S       |  1 +
+ libc/sysdeps/linux/arm/syscall-eabi.S |  1 +
+ libc/sysdeps/linux/arm/sysdep.h       |  2 +-
+ libc/sysdeps/linux/arm/vfork.S        |  1 +
+ 15 files changed, 47 insertions(+), 11 deletions(-)
+ create mode 100644 libc/sysdeps/linux/arm/bits/arm_bx.h
+
+diff --git a/ldso/ldso/arm/dl-startup.h b/ldso/ldso/arm/dl-startup.h
+index f7d6052..8d6122b 100644
+--- a/ldso/ldso/arm/dl-startup.h
++++ b/ldso/ldso/arm/dl-startup.h
+@@ -7,7 +7,7 @@
+  */
+ 
+ #include <features.h>
+-#include <bits/arm_asm.h>
++#include <bits/arm_bx.h>
+ 
+ #if !defined(__thumb__)
+ __asm__(
+diff --git a/ldso/ldso/arm/resolve.S b/ldso/ldso/arm/resolve.S
+index 08889d0..600d3af 100644
+--- a/ldso/ldso/arm/resolve.S
++++ b/ldso/ldso/arm/resolve.S
+@@ -92,6 +92,7 @@
+ 
+ #include <sys/syscall.h>
+ #include <bits/arm_asm.h>
++#include <bits/arm_bx.h>
+ 
+ #include <features.h>
+ 
+diff --git a/libc/string/arm/_memcpy.S b/libc/string/arm/_memcpy.S
+index b26080d..c59f5b8 100644
+--- a/libc/string/arm/_memcpy.S
++++ b/libc/string/arm/_memcpy.S
+@@ -40,6 +40,7 @@
+ #include <features.h>
+ #include <endian.h>
+ #include <bits/arm_asm.h>
++#include <bits/arm_bx.h>
+ 
+ #if !defined(THUMB1_ONLY)
+ /*
+diff --git a/libc/string/arm/memcmp.S b/libc/string/arm/memcmp.S
+index 65409f4..9f78415 100644
+--- a/libc/string/arm/memcmp.S
++++ b/libc/string/arm/memcmp.S
+@@ -31,6 +31,7 @@
+ 
+ #include <features.h>
+ #include <bits/arm_asm.h>
++#include <bits/arm_bx.h>
+ 
+ .text
+ .global memcmp
+diff --git a/libc/string/arm/memset.S b/libc/string/arm/memset.S
+index 66aa603..6f78128 100644
+--- a/libc/string/arm/memset.S
++++ b/libc/string/arm/memset.S
+@@ -20,6 +20,7 @@
+ #include <features.h>
+ #include <sys/syscall.h>
+ #include <bits/arm_asm.h>
++#include <bits/arm_bx.h>
+ 
+ .text
+ .global memset
+diff --git a/libc/string/arm/strcmp.S b/libc/string/arm/strcmp.S
+index 97363c1..8b77ab0 100644
+--- a/libc/string/arm/strcmp.S
++++ b/libc/string/arm/strcmp.S
+@@ -31,6 +31,7 @@
+ 
+ #include <features.h>
+ #include <bits/arm_asm.h>
++#include <bits/arm_bx.h>
+ 
+ .text
+ .global strcmp
+diff --git a/libc/string/arm/strlen.S b/libc/string/arm/strlen.S
+index 949e918..141f849 100644
+--- a/libc/string/arm/strlen.S
++++ b/libc/string/arm/strlen.S
+@@ -21,6 +21,7 @@
+ #include <endian.h>
+ #include <sys/syscall.h>
+ #include <bits/arm_asm.h>
++#include <bits/arm_bx.h>
+ 
+ /* size_t strlen(const char *S)
+  * entry: r0 -> string
+diff --git a/libc/sysdeps/linux/arm/__longjmp.S b/libc/sysdeps/linux/arm/__longjmp.S
+index 5faf4ec..7418dc2 100644
+--- a/libc/sysdeps/linux/arm/__longjmp.S
++++ b/libc/sysdeps/linux/arm/__longjmp.S
+@@ -19,11 +19,11 @@
+ 
+ #include <features.h>
+ #include <bits/arm_asm.h>
++#include <bits/arm_bx.h>
+ #define _SETJMP_H
+ #define _ASM
+ #include <bits/setjmp.h>
+ 
+-
+ .global __longjmp
+ .type __longjmp,%function
+ .align 2
+diff --git a/libc/sysdeps/linux/arm/bits/arm_asm.h b/libc/sysdeps/linux/arm/bits/arm_asm.h
+index 921c9a3..ff8ea92 100644
+--- a/libc/sysdeps/linux/arm/bits/arm_asm.h
++++ b/libc/sysdeps/linux/arm/bits/arm_asm.h
+@@ -24,12 +24,4 @@
+ #define THUMB1_ONLY 1
+ #endif
+ 
+-#if defined(__USE_BX__)
+-# if (   defined (__ARM_ARCH_2__)  || defined (__ARM_ARCH_3__) \
+-      || defined (__ARM_ARCH_3M__) || defined (__ARM_ARCH_4__) \
+-     )
+-#  error Use of BX was requested, but is not available on the target processor.
+-# endif /* ARCH level */
+-#endif /* __USE_BX__ */
+-
+ #endif /* _ARM_ASM_H */
+diff --git a/libc/sysdeps/linux/arm/bits/arm_bx.h b/libc/sysdeps/linux/arm/bits/arm_bx.h
+new file mode 100644
+index 0000000..321490e
+--- /dev/null
++++ b/libc/sysdeps/linux/arm/bits/arm_bx.h
+@@ -0,0 +1,34 @@
++/* Copyright (C) 2013 Yann E. MORIN <yann.morin.1998@free.fr>
++ *
++ * This file is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU Lesser General Public License as
++ * published by the Free Software Foundation; either version 2.1 of
++ * the License, or (at your option) any later version.
++ *
++ * This file is distributed in the hope that it will be useful, but
++ * WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ * Lesser General Public License for more details.
++ *
++ * You should have received a copy of the GNU Lesser General Public
++ * License along with the GNU C Library; if not, see
++ * <http://www.gnu.org/licenses/>.
++ */
++
++#ifndef _ARM_BX_H
++#define _ARM_BX_H
++
++/* We need features.h first */
++#if !defined _FEATURES_H
++#error Please include features.h first
++#endif /* features.h not yet included */
++
++#if defined(__USE_BX__)
++# if (   defined (__ARM_ARCH_2__)  || defined (__ARM_ARCH_3__) \
++      || defined (__ARM_ARCH_3M__) || defined (__ARM_ARCH_4__) \
++     )
++#  error Use of BX was requested, but is not available on the target processor.
++# endif /* ARCH level */
++#endif /* __USE_BX__ */
++
++#endif /* _ARM_BX_H */
+diff --git a/libc/sysdeps/linux/arm/clone.S b/libc/sysdeps/linux/arm/clone.S
+index 1f7f09d..4d646be 100644
+--- a/libc/sysdeps/linux/arm/clone.S
++++ b/libc/sysdeps/linux/arm/clone.S
+@@ -25,6 +25,7 @@
+ #include <bits/errno.h>
+ #include <sys/syscall.h>
+ #include <bits/arm_asm.h>
++#include <bits/arm_bx.h>
+ 
+ #if defined(__NR_clone)
+ /* int clone(int (*fn)(void *arg), void *child_stack, int flags, void *arg); */
+diff --git a/libc/sysdeps/linux/arm/mmap64.S b/libc/sysdeps/linux/arm/mmap64.S
+index 7071541..bd2cfb8 100644
+--- a/libc/sysdeps/linux/arm/mmap64.S
++++ b/libc/sysdeps/linux/arm/mmap64.S
+@@ -21,6 +21,7 @@
+ #include <bits/errno.h>
+ #include <sys/syscall.h>
+ #include <bits/arm_asm.h>
++#include <bits/arm_bx.h>
+ 
+ #if defined __UCLIBC_HAS_LFS__ && defined __NR_mmap2
+ 
+diff --git a/libc/sysdeps/linux/arm/syscall-eabi.S b/libc/sysdeps/linux/arm/syscall-eabi.S
+index b931882..019f701 100644
+--- a/libc/sysdeps/linux/arm/syscall-eabi.S
++++ b/libc/sysdeps/linux/arm/syscall-eabi.S
+@@ -18,6 +18,7 @@
+ 
+ #include <sys/syscall.h>
+ #include <bits/arm_asm.h>
++#include <bits/arm_bx.h>
+ 
+ /* In the EABI syscall interface, we don't need a special syscall to
+    implement syscall().  It won't work reliably with 64-bit arguments
+diff --git a/libc/sysdeps/linux/arm/sysdep.h b/libc/sysdeps/linux/arm/sysdep.h
+index e498695..9c1dbca 100644
+--- a/libc/sysdeps/linux/arm/sysdep.h
++++ b/libc/sysdeps/linux/arm/sysdep.h
+@@ -21,7 +21,7 @@
+ #define _LINUX_ARM_SYSDEP_H 1
+ 
+ #include <common/sysdep.h>
+-#include <bits/arm_asm.h>
++#include <bits/arm_bx.h>
+ 
+ #include <sys/syscall.h>
+ /* For Linux we can use the system call table in the header file
+diff --git a/libc/sysdeps/linux/arm/vfork.S b/libc/sysdeps/linux/arm/vfork.S
+index 17d6a4d..6c55d71 100644
+--- a/libc/sysdeps/linux/arm/vfork.S
++++ b/libc/sysdeps/linux/arm/vfork.S
+@@ -7,6 +7,7 @@
+ 
+ #include <features.h>
+ #include <bits/arm_asm.h>
++#include <bits/arm_bx.h>
+ 
+ #define _ERRNO_H
+ #include <bits/errno.h>
+-- 
+1.8.1.2
+
-- 
1.8.1.2
