From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 29 Dec 2008 15:22:23 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20081229152223.D059676C21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-29 15:22:23 +0000 (Mon, 29 Dec 2008)
New Revision: 24605

Log:
toolchain/uclibc: fix 0.9.30 x86 build with 2.6.28 headers (from r24515)

Added:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.30-x86-2.6.28+-headers-fix.patch


Changeset:
Added: trunk/buildroot/toolchain/uClibc/uClibc-0.9.30-x86-2.6.28+-headers-fix.patch
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.30-x86-2.6.28+-headers-fix.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.30-x86-2.6.28+-headers-fix.patch	2008-12-29 15:22:23 UTC (rev 24605)
@@ -0,0 +1,34 @@
+From df180f43dd9fc651ac760e7fe4a4dcf9e6dd42f1 Mon Sep 17 00:00:00 2001
+From: kraj <kraj@69ca8d6d-28ef-0310-b511-8ec308f3f277>
+Date: Tue, 23 Dec 2008 09:04:50 +0000
+Subject: [PATCH] These defines needs to be considered after recent linux kernel combined i386 and x86_64 into x86
+
+git-svn-id: svn+ssh://uclibc.org/svn/trunk/uClibc at 24515 69ca8d6d-28ef-0310-b511-8ec308f3f277
+---
+ libc/sysdeps/linux/i386/bits/kernel_types.h |    8 ++++++--
+ 1 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/libc/sysdeps/linux/i386/bits/kernel_types.h b/libc/sysdeps/linux/i386/bits/kernel_types.h
+index 6609dd3..8641a48 100644
+--- a/libc/sysdeps/linux/i386/bits/kernel_types.h
++++ b/libc/sysdeps/linux/i386/bits/kernel_types.h
+@@ -7,10 +7,14 @@
+ 
+ /* a hack for compiling a 32 bit user space with 64 bit
+  * kernel on x86_64  */
+-#if !defined(__ARCH_I386_POSIX_TYPES_H) && !defined(_ASM_X86_64_POSIX_TYPES_H)
++#if !defined(__ARCH_I386_POSIX_TYPES_H) && \
++    !defined(_ASM_X86_64_POSIX_TYPES_H) && \
++    !defined(_ASM_X86_POSIX_TYPES_32_H) && \
++    !defined(_ASM_X86_POSIX_TYPES_64_H)
+ #define _ASM_X86_64_POSIX_TYPES_H
+ #define __ARCH_I386_POSIX_TYPES_H
+-
++#define _ASM_X86_POSIX_TYPES_32_H
++#define _ASM_X86_POSIX_TYPES_64_H
+ typedef unsigned short	__kernel_dev_t;
+ typedef unsigned long	__kernel_ino_t;
+ typedef unsigned short	__kernel_mode_t;
+-- 
+1.5.6.5
+
