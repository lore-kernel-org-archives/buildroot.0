From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 12 Jan 2009 15:57:29 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20090112155730.69F0E766E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-12 15:57:28 +0000 (Mon, 12 Jan 2009)
New Revision: 24802

Log:
uclibc: 0.9.30-x86-2.6.28+headers-fix: add r24799 as well

Handle x86_84 as well. From uclibc r24799.

Modified:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.30-x86-2.6.28+-headers-fix.patch


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uClibc-0.9.30-x86-2.6.28+-headers-fix.patch
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.30-x86-2.6.28+-headers-fix.patch	2009-01-12 15:22:41 UTC (rev 24801)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.30-x86-2.6.28+-headers-fix.patch	2009-01-12 15:57:28 UTC (rev 24802)
@@ -4,8 +4,10 @@
 Subject: [PATCH] These defines needs to be considered after recent linux kernel combined i386 and x86_64 into x86
 
 git-svn-id: svn+ssh://uclibc.org/svn/trunk/uClibc at 24515 69ca8d6d-28ef-0310-b511-8ec308f3f277
+git-svn-id: svn+ssh://uclibc.org/svn/trunk/uClibc at 24799 69ca8d6d-28ef-0310-b511-8ec308f3f277
 ---
- libc/sysdeps/linux/i386/bits/kernel_types.h |    8 ++++++--
+ libc/sysdeps/linux/i386/bits/kernel_types.h   |    8 ++++++--
+ libc/sysdeps/linux/x86_64/bits/kernel_types.h |   11 ++++++++++-
  1 files changed, 6 insertions(+), 2 deletions(-)
 
 diff --git a/libc/sysdeps/linux/i386/bits/kernel_types.h b/libc/sysdeps/linux/i386/bits/kernel_types.h
@@ -29,6 +31,29 @@
  typedef unsigned short	__kernel_dev_t;
  typedef unsigned long	__kernel_ino_t;
  typedef unsigned short	__kernel_mode_t;
+diff --git a/libc/sysdeps/linux/x86_64/bits/kernel_types.h b/libc/sysdeps/linux/x86_64/bits/kernel_types.h
+index 73f6ffb..b2f7341 100644
+--- a/libc/sysdeps/linux/x86_64/bits/kernel_types.h
++++ b/libc/sysdeps/linux/x86_64/bits/kernel_types.h
+@@ -4,8 +4,17 @@
+  * our private content, and not the kernel header, will win.
+  *  -Erik
+  */
+-#ifndef _ASM_X86_64_POSIX_TYPES_H
++
++/* a hack for compiling a 32 bit user space with 64 bit
++ * kernel on x86_64  */
++#if !defined(__ARCH_I386_POSIX_TYPES_H) && \
++    !defined(_ASM_X86_64_POSIX_TYPES_H) && \
++    !defined(_ASM_X86_POSIX_TYPES_32_H) && \
++    !defined(_ASM_X86_POSIX_TYPES_64_H)
+ #define _ASM_X86_64_POSIX_TYPES_H
++#define __ARCH_I386_POSIX_TYPES_H
++#define _ASM_X86_POSIX_TYPES_32_H
++#define _ASM_X86_POSIX_TYPES_64_H
+ 
+ typedef unsigned long	__kernel_dev_t;
+ typedef unsigned long	__kernel_ino_t;
 -- 
 1.5.6.5
 
