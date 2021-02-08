From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 8 Feb 2021 08:35:05 +0100
Subject: [Buildroot] [git commit] package/libsigsegv: bump version to 2.13
Message-ID: <20210208071901.726AD81730@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=540450e8dda7d24588db4d89798db171205b569b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patches applied upstream:

0001-Improve-support-for-Linux-RISC-V.patch
https://github.com/roswell/libsigsegv/commit/671b2528b55c57eda1a8fe5872ff1ef61014235f

0002-m4-stack-direction-RISC-V-stack-grows-downward.patch
https://github.com/roswell/libsigsegv/commit/fd0e3d99d109b46d73ef37f38a23076f5acd1053

0003-Improve-support-for-Linux-nds32.patch
0004-m4-stack-direction-NDS32-stack-grows-downward.patch
https://github.com/roswell/libsigsegv/commit/51a03192a3e024931309bdf11a9c055985de0ddf

Reformatted hashes.

Release notes: https://github.com/roswell/libsigsegv/blob/master/NEWS

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Improve-support-for-Linux-RISC-V.patch    | 79 ----------------------
 ...ack-direction-RISC-V-stack-grows-downward.patch | 35 ----------
 .../0003-Improve-support-for-Linux-nds32.patch     | 76 ---------------------
 ...tack-direction-NDS32-stack-grows-downward.patch | 25 -------
 package/libsigsegv/libsigsegv.hash                 |  6 +-
 package/libsigsegv/libsigsegv.mk                   |  7 +-
 6 files changed, 4 insertions(+), 224 deletions(-)

diff --git a/package/libsigsegv/0001-Improve-support-for-Linux-RISC-V.patch b/package/libsigsegv/0001-Improve-support-for-Linux-RISC-V.patch
deleted file mode 100644
index 8426ad9af6..0000000000
--- a/package/libsigsegv/0001-Improve-support-for-Linux-RISC-V.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 4e6e6b52fe2f88584645a761bb342ac89d6c2860 Mon Sep 17 00:00:00 2001
-From: Bruno Haible <bruno@clisp.org>
-Date: Thu, 15 Mar 2018 19:01:27 +0100
-Subject: [PATCH] Improve support for Linux/RISC-V.
-
-[Thomas: backported from upstream commit
-671b2528b55c57eda1a8fe5872ff1ef61014235f, drop ChangeLog changes.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- configure.ac              |  3 +++
- src/Makefile.am           |  1 +
- src/fault-linux-riscv64.h | 29 +++++++++++++++++++++++++++++
- 3 files changed, 33 insertions(+)
- create mode 100644 src/fault-linux-riscv64.h
-
-diff --git a/configure.ac b/configure.ac
-index 74ce6b4..9775cfb 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -428,6 +428,9 @@ if test -z "$CFG_FAULT" && test "$sv_cv_fault_posix" = yes; then
-             powerpc* | rs6000)
-               CFG_FAULT=fault-linux-powerpc.h
-               ;;
-+            riscv64)
-+              CFG_FAULT=fault-linux-riscv64.h
-+              ;;
-             s390*)
-               CFG_FAULT=fault-linux-s390.h
-               ;;
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 3afa398..9a9982f 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -42,6 +42,7 @@ noinst_HEADERS = \
-   fault-linux-m68k.h fault-linux-m68k-old.h fault-linux-m68k-old.c \
-   fault-linux-mips.h fault-linux-mips-old.h \
-   fault-linux-powerpc.h fault-linux-powerpc-old.h \
-+  fault-linux-riscv64.h \
-   fault-linux-s390.h fault-linux-s390-old.h \
-   fault-linux-sh.h fault-linux-sh-old.h \
-   fault-linux-sparc.h fault-linux-sparc-old.h \
-diff --git a/src/fault-linux-riscv64.h b/src/fault-linux-riscv64.h
-new file mode 100644
-index 0000000..14831bf
---- /dev/null
-+++ b/src/fault-linux-riscv64.h
-@@ -0,0 +1,29 @@
-+/* Fault handler information.  Linux/RISC-V 64-bit version.
-+   Copyright (C) 2018  Bruno Haible <bruno@clisp.org>
-+
-+   This program is free software; you can redistribute it and/or modify
-+   it under the terms of the GNU General Public License as published by
-+   the Free Software Foundation; either version 2, or (at your option)
-+   any later version.
-+
-+   This program is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+   GNU General Public License for more details.
-+
-+   You should have received a copy of the GNU General Public License
-+   along with this program; if not, write to the Free Software Foundation,
-+   Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.  */
-+
-+#include "fault-posix-ucontext.h"
-+
-+/* See glibc/sysdeps/unix/sysv/linux/riscv/sys/ucontext.h
-+   and the definition of GET_STACK in
-+   glibc/sysdeps/unix/sysv/linux/riscv/sigcontextinfo.h.
-+   Note that the 'mcontext_t' defined in
-+   glibc/sysdeps/unix/sysv/linux/riscv/sys/ucontext.h
-+   and the 'struct sigcontext' defined in
-+   glibc/sysdeps/unix/sysv/linux/riscv/bits/sigcontext.h
-+   start with the same block of 32 general-purpose registers.  */
-+
-+#define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.__gregs[REG_SP]
--- 
-2.19.1
-
diff --git a/package/libsigsegv/0002-m4-stack-direction-RISC-V-stack-grows-downward.patch b/package/libsigsegv/0002-m4-stack-direction-RISC-V-stack-grows-downward.patch
deleted file mode 100644
index 336181edf7..0000000000
--- a/package/libsigsegv/0002-m4-stack-direction-RISC-V-stack-grows-downward.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 9dd1989f5ae6cd3f2051732318e26bf742a4c89b Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Tue, 13 Nov 2018 22:24:03 +0100
-Subject: [PATCH] m4/stack-direction: RISC-V stack grows downward
-
-While commit 671b2528b55c57eda1a8fe5872ff1ef61014235f ("Improve
-support for Linux/RISC-V") adds some support for the RISC-V
-architecture, it doesn't update m4/stack-direction.m4 to properly
-support cross-compiling libsigsegv for a RISC-V architecture.
-
-According to
-https://riscv.org/wp-content/uploads/2015/01/riscv-calling.pdf: "In
-the standard RISC-V calling convention, the stack grows downward", so
-let's update m4/stack-direction.m4 accordingly.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- m4/stack-direction.m4 | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/m4/stack-direction.m4 b/m4/stack-direction.m4
-index c373f1c..9504f88 100644
---- a/m4/stack-direction.m4
-+++ b/m4/stack-direction.m4
-@@ -43,6 +43,7 @@ AC_DEFUN([SV_STACK_DIRECTION],
-       pdp11 | \
-       pj* | \
-       powerpc* | rs6000 | \
-+      riscv* | \
-       romp | \
-       s390* | \
-       sh* | \
--- 
-2.19.1
-
diff --git a/package/libsigsegv/0003-Improve-support-for-Linux-nds32.patch b/package/libsigsegv/0003-Improve-support-for-Linux-nds32.patch
deleted file mode 100644
index 90dcfacc10..0000000000
--- a/package/libsigsegv/0003-Improve-support-for-Linux-nds32.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From ef0890d6bd6a3252fd99392705bbda39956b6b8f Mon Sep 17 00:00:00 2001
-From: Nylon Chen <nylon7@andestech.com>
-Date: Fri, 26 Apr 2019 15:55:22 +0800
-Subject: [PATCH] Improve support for Linux/nds32.
-
-Signed-off-by:Nylon Chen <nylon7@andestech.com>
----
- configure.ac            |  3 +++
- src/Makefile.am         |  1 +
- src/fault-linux-nds32.h | 28 ++++++++++++++++++++++++++++
- 3 files changed, 32 insertions(+)
- create mode 100644 src/fault-linux-nds32.h
-
-diff --git a/configure.ac b/configure.ac
-index 22b8eff..e44d573 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -425,6 +425,9 @@ if test -z "$CFG_FAULT" && test "$sv_cv_fault_posix" = yes; then
-             mips*)
-               CFG_FAULT=fault-linux-mips.h
-               ;;
-+            nds32*)
-+              CFG_FAULT=fault-linux-nds32.h
-+              ;;
-             powerpc* | rs6000)
-               CFG_FAULT=fault-linux-powerpc.h
-               ;;
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 9a9982f..8910be8 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -41,6 +41,7 @@ noinst_HEADERS = \
-   fault-linux-ia64.h fault-linux-ia64-old.h \
-   fault-linux-m68k.h fault-linux-m68k-old.h fault-linux-m68k-old.c \
-   fault-linux-mips.h fault-linux-mips-old.h \
-+  fault-linux-nds32.h \
-   fault-linux-powerpc.h fault-linux-powerpc-old.h \
-   fault-linux-riscv64.h \
-   fault-linux-s390.h fault-linux-s390-old.h \
-diff --git a/src/fault-linux-nds32.h b/src/fault-linux-nds32.h
-new file mode 100644
-index 0000000..3a5a47f
---- /dev/null
-+++ b/src/fault-linux-nds32.h
-@@ -0,0 +1,28 @@
-+/* Fault handler information.  Andse NDS32 32-bit version.
-+   Copyright (C) 2018  Nylon Chen <nylon7@andestech.com>
-+
-+   This program is free software; you can redistribute it and/or modify
-+   it under the terms of the GNU General Public License as published by
-+   the Free Software Foundation; either version 2, or (at your option)
-+   any later version.
-+
-+   This program is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+   GNU General Public License for more details.
-+
-+   You should have received a copy of the GNU General Public License
-+   along with this program; if not, write to the Free Software Foundation,
-+   Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.  */
-+
-+#include "fault-posix-ucontext.h"
-+
-+/* See glibc/sysdeps/unix/sysv/linux/nds32/sys/ucontext.h
-+   and the definition of GET_STACK in
-+   glibc/sysdeps/unix/sysv/linux/nds32/sigcontextinfo.h.
-+   Note that the 'mcontext_t' defined in
-+   glibc/sysdeps/unix/sysv/linux/arm/nds32/ucontext.h
-+   and the 'struct sigcontext' defined in <asm/sigcontext.h>
-+*/
-+
-+#define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.nds32_sp
--- 
-2.18.0
-
diff --git a/package/libsigsegv/0004-m4-stack-direction-NDS32-stack-grows-downward.patch b/package/libsigsegv/0004-m4-stack-direction-NDS32-stack-grows-downward.patch
deleted file mode 100644
index 36a23aa670..0000000000
--- a/package/libsigsegv/0004-m4-stack-direction-NDS32-stack-grows-downward.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 55600de29790051671a411d8f2d99ecc3c65ae13 Mon Sep 17 00:00:00 2001
-From: Nylon Chen <nylon7@andestech.com>
-Date: Fri, 26 Apr 2019 15:56:39 +0800
-Subject: [PATCH] m4/stack-direction: NDS32 stack grows downward
-
-Signed-off-by: Nylon Chen <nylon7@andestech.com>
----
- m4/stack-direction.m4 | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/m4/stack-direction.m4 b/m4/stack-direction.m4
-index ffd4bce..a7df7ea 100644
---- a/m4/stack-direction.m4
-+++ b/m4/stack-direction.m4
-@@ -39,6 +39,7 @@ AC_DEFUN([SV_STACK_DIRECTION],
-       mn10200 | \
-       mn10300 | \
-       nios2 | \
-+      nds32* | \
-       ns32k | \
-       pdp11 | \
-       pj* | \
--- 
-2.18.0
-
diff --git a/package/libsigsegv/libsigsegv.hash b/package/libsigsegv/libsigsegv.hash
index 47ba356821..c827e6b866 100644
--- a/package/libsigsegv/libsigsegv.hash
+++ b/package/libsigsegv/libsigsegv.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/libsigsegv/libsigsegv-2.12.tar.gz.sig
-sha256	3ae1af359eebaa4ffc5896a1aee3568c052c99879316a1ab57f8fe1789c390b6	libsigsegv-2.12.tar.gz
+# https://ftp.gnu.org/gnu/libsigsegv/libsigsegv-2.13.tar.gz.sig
+sha256  be78ee4176b05f7c75ff03298d84874db90f4b6c9d5503f0da1226b3a3c48119  libsigsegv-2.13.tar.gz
 # Locally calculated
-sha256	8f2983e9a940367f48999881c14775db725ee643bce1e2f1ba195eb629a33cde	COPYING
+sha256  8f2983e9a940367f48999881c14775db725ee643bce1e2f1ba195eb629a33cde  COPYING
diff --git a/package/libsigsegv/libsigsegv.mk b/package/libsigsegv/libsigsegv.mk
index 28c061dd73..87a5d7a124 100644
--- a/package/libsigsegv/libsigsegv.mk
+++ b/package/libsigsegv/libsigsegv.mk
@@ -4,16 +4,11 @@
 #
 ################################################################################
 
-LIBSIGSEGV_VERSION = 2.12
+LIBSIGSEGV_VERSION = 2.13
 LIBSIGSEGV_SITE = $(BR2_GNU_MIRROR)/libsigsegv
 LIBSIGSEGV_INSTALL_STAGING = YES
 LIBSIGSEGV_CONF_ENV = sv_cv_fault_posix=yes
 LIBSIGSEGV_LICENSE = GPL-2.0+
 LIBSIGSEGV_LICENSE_FILES = COPYING
-# 0001-Improve-support-for-Linux-RISC-V.patch
-# 0002-m4-stack-direction-RISC-V-stack-grows-downward.patch
-# 0003-Improve-support-for-Linux-nds32.patch
-# 0004-m4-stack-direction-NDS32-stack-grows-downward.patch
-LIBSIGSEGV_AUTORECONF = YES
 
 $(eval $(autotools-package))
