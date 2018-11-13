From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Nov 2018 22:35:10 +0100
Subject: [Buildroot] [PATCH] libsigsegv: add RISC-V support
Message-ID: <20181113213510.21886-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit backports an upstream commit adding RISC-V support to
libsigsegv, and adds a patch that finalizes the RISC-V support to make
it compatible with cross-compilation.

Fixes:

  http://autobuild.buildroot.net/results/bd12cb3db3b46860a4ab8fb91052319dce75202a/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...001-Improve-support-for-Linux-RISC-V.patch | 79 +++++++++++++++++++
 ...irection-RISC-V-stack-grows-downward.patch | 35 ++++++++
 package/libsigsegv/libsigsegv.mk              |  3 +
 3 files changed, 117 insertions(+)
 create mode 100644 package/libsigsegv/0001-Improve-support-for-Linux-RISC-V.patch
 create mode 100644 package/libsigsegv/0002-m4-stack-direction-RISC-V-stack-grows-downward.patch

diff --git a/package/libsigsegv/0001-Improve-support-for-Linux-RISC-V.patch b/package/libsigsegv/0001-Improve-support-for-Linux-RISC-V.patch
new file mode 100644
index 0000000000..8426ad9af6
--- /dev/null
+++ b/package/libsigsegv/0001-Improve-support-for-Linux-RISC-V.patch
@@ -0,0 +1,79 @@
+From 4e6e6b52fe2f88584645a761bb342ac89d6c2860 Mon Sep 17 00:00:00 2001
+From: Bruno Haible <bruno@clisp.org>
+Date: Thu, 15 Mar 2018 19:01:27 +0100
+Subject: [PATCH] Improve support for Linux/RISC-V.
+
+[Thomas: backported from upstream commit
+671b2528b55c57eda1a8fe5872ff1ef61014235f, drop ChangeLog changes.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ configure.ac              |  3 +++
+ src/Makefile.am           |  1 +
+ src/fault-linux-riscv64.h | 29 +++++++++++++++++++++++++++++
+ 3 files changed, 33 insertions(+)
+ create mode 100644 src/fault-linux-riscv64.h
+
+diff --git a/configure.ac b/configure.ac
+index 74ce6b4..9775cfb 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -428,6 +428,9 @@ if test -z "$CFG_FAULT" && test "$sv_cv_fault_posix" = yes; then
+             powerpc* | rs6000)
+               CFG_FAULT=fault-linux-powerpc.h
+               ;;
++            riscv64)
++              CFG_FAULT=fault-linux-riscv64.h
++              ;;
+             s390*)
+               CFG_FAULT=fault-linux-s390.h
+               ;;
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 3afa398..9a9982f 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -42,6 +42,7 @@ noinst_HEADERS = \
+   fault-linux-m68k.h fault-linux-m68k-old.h fault-linux-m68k-old.c \
+   fault-linux-mips.h fault-linux-mips-old.h \
+   fault-linux-powerpc.h fault-linux-powerpc-old.h \
++  fault-linux-riscv64.h \
+   fault-linux-s390.h fault-linux-s390-old.h \
+   fault-linux-sh.h fault-linux-sh-old.h \
+   fault-linux-sparc.h fault-linux-sparc-old.h \
+diff --git a/src/fault-linux-riscv64.h b/src/fault-linux-riscv64.h
+new file mode 100644
+index 0000000..14831bf
+--- /dev/null
++++ b/src/fault-linux-riscv64.h
+@@ -0,0 +1,29 @@
++/* Fault handler information.  Linux/RISC-V 64-bit version.
++   Copyright (C) 2018  Bruno Haible <bruno@clisp.org>
++
++   This program is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by
++   the Free Software Foundation; either version 2, or (at your option)
++   any later version.
++
++   This program is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++   GNU General Public License for more details.
++
++   You should have received a copy of the GNU General Public License
++   along with this program; if not, write to the Free Software Foundation,
++   Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.  */
++
++#include "fault-posix-ucontext.h"
++
++/* See glibc/sysdeps/unix/sysv/linux/riscv/sys/ucontext.h
++   and the definition of GET_STACK in
++   glibc/sysdeps/unix/sysv/linux/riscv/sigcontextinfo.h.
++   Note that the 'mcontext_t' defined in
++   glibc/sysdeps/unix/sysv/linux/riscv/sys/ucontext.h
++   and the 'struct sigcontext' defined in
++   glibc/sysdeps/unix/sysv/linux/riscv/bits/sigcontext.h
++   start with the same block of 32 general-purpose registers.  */
++
++#define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.__gregs[REG_SP]
+-- 
+2.19.1
+
diff --git a/package/libsigsegv/0002-m4-stack-direction-RISC-V-stack-grows-downward.patch b/package/libsigsegv/0002-m4-stack-direction-RISC-V-stack-grows-downward.patch
new file mode 100644
index 0000000000..336181edf7
--- /dev/null
+++ b/package/libsigsegv/0002-m4-stack-direction-RISC-V-stack-grows-downward.patch
@@ -0,0 +1,35 @@
+From 9dd1989f5ae6cd3f2051732318e26bf742a4c89b Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 13 Nov 2018 22:24:03 +0100
+Subject: [PATCH] m4/stack-direction: RISC-V stack grows downward
+
+While commit 671b2528b55c57eda1a8fe5872ff1ef61014235f ("Improve
+support for Linux/RISC-V") adds some support for the RISC-V
+architecture, it doesn't update m4/stack-direction.m4 to properly
+support cross-compiling libsigsegv for a RISC-V architecture.
+
+According to
+https://riscv.org/wp-content/uploads/2015/01/riscv-calling.pdf: "In
+the standard RISC-V calling convention, the stack grows downward", so
+let's update m4/stack-direction.m4 accordingly.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ m4/stack-direction.m4 | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/m4/stack-direction.m4 b/m4/stack-direction.m4
+index c373f1c..9504f88 100644
+--- a/m4/stack-direction.m4
++++ b/m4/stack-direction.m4
+@@ -43,6 +43,7 @@ AC_DEFUN([SV_STACK_DIRECTION],
+       pdp11 | \
+       pj* | \
+       powerpc* | rs6000 | \
++      riscv* | \
+       romp | \
+       s390* | \
+       sh* | \
+-- 
+2.19.1
+
diff --git a/package/libsigsegv/libsigsegv.mk b/package/libsigsegv/libsigsegv.mk
index 6fa0929bba..7ca39dbe4b 100644
--- a/package/libsigsegv/libsigsegv.mk
+++ b/package/libsigsegv/libsigsegv.mk
@@ -10,5 +10,8 @@ LIBSIGSEGV_INSTALL_STAGING = YES
 LIBSIGSEGV_CONF_ENV = sv_cv_fault_posix=yes
 LIBSIGSEGV_LICENSE = GPL-2.0+
 LIBSIGSEGV_LICENSE_FILES = COPYING
+# 0001-Improve-support-for-Linux-RISC-V.patch
+# 0002-m4-stack-direction-RISC-V-stack-grows-downward.patch
+LIBSIGSEGV_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
2.19.1
