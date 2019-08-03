From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 16:17:22 +0200
Subject: [Buildroot] [git commit] package/libsigsegv: add nds32 support
Message-ID: <20190803141606.0B75E809DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0273e2053b0a62f44f1e2e66a4b53524536dd88e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/a2fc44575a900f2221c2a3a11491c527871555ee/

Signed-off-by: Nylon Chen <nylon7@andestech.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0003-Improve-support-for-Linux-nds32.patch     | 76 ++++++++++++++++++++++
 ...tack-direction-NDS32-stack-grows-downward.patch | 25 +++++++
 package/libsigsegv/libsigsegv.mk                   |  2 +
 3 files changed, 103 insertions(+)

diff --git a/package/libsigsegv/0003-Improve-support-for-Linux-nds32.patch b/package/libsigsegv/0003-Improve-support-for-Linux-nds32.patch
new file mode 100644
index 0000000000..90dcfacc10
--- /dev/null
+++ b/package/libsigsegv/0003-Improve-support-for-Linux-nds32.patch
@@ -0,0 +1,76 @@
+From ef0890d6bd6a3252fd99392705bbda39956b6b8f Mon Sep 17 00:00:00 2001
+From: Nylon Chen <nylon7@andestech.com>
+Date: Fri, 26 Apr 2019 15:55:22 +0800
+Subject: [PATCH] Improve support for Linux/nds32.
+
+Signed-off-by:Nylon Chen <nylon7@andestech.com>
+---
+ configure.ac            |  3 +++
+ src/Makefile.am         |  1 +
+ src/fault-linux-nds32.h | 28 ++++++++++++++++++++++++++++
+ 3 files changed, 32 insertions(+)
+ create mode 100644 src/fault-linux-nds32.h
+
+diff --git a/configure.ac b/configure.ac
+index 22b8eff..e44d573 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -425,6 +425,9 @@ if test -z "$CFG_FAULT" && test "$sv_cv_fault_posix" = yes; then
+             mips*)
+               CFG_FAULT=fault-linux-mips.h
+               ;;
++            nds32*)
++              CFG_FAULT=fault-linux-nds32.h
++              ;;
+             powerpc* | rs6000)
+               CFG_FAULT=fault-linux-powerpc.h
+               ;;
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 9a9982f..8910be8 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -41,6 +41,7 @@ noinst_HEADERS = \
+   fault-linux-ia64.h fault-linux-ia64-old.h \
+   fault-linux-m68k.h fault-linux-m68k-old.h fault-linux-m68k-old.c \
+   fault-linux-mips.h fault-linux-mips-old.h \
++  fault-linux-nds32.h \
+   fault-linux-powerpc.h fault-linux-powerpc-old.h \
+   fault-linux-riscv64.h \
+   fault-linux-s390.h fault-linux-s390-old.h \
+diff --git a/src/fault-linux-nds32.h b/src/fault-linux-nds32.h
+new file mode 100644
+index 0000000..3a5a47f
+--- /dev/null
++++ b/src/fault-linux-nds32.h
+@@ -0,0 +1,28 @@
++/* Fault handler information.  Andse NDS32 32-bit version.
++   Copyright (C) 2018  Nylon Chen <nylon7@andestech.com>
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
++/* See glibc/sysdeps/unix/sysv/linux/nds32/sys/ucontext.h
++   and the definition of GET_STACK in
++   glibc/sysdeps/unix/sysv/linux/nds32/sigcontextinfo.h.
++   Note that the 'mcontext_t' defined in
++   glibc/sysdeps/unix/sysv/linux/arm/nds32/ucontext.h
++   and the 'struct sigcontext' defined in <asm/sigcontext.h>
++*/
++
++#define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.nds32_sp
+-- 
+2.18.0
+
diff --git a/package/libsigsegv/0004-m4-stack-direction-NDS32-stack-grows-downward.patch b/package/libsigsegv/0004-m4-stack-direction-NDS32-stack-grows-downward.patch
new file mode 100644
index 0000000000..36a23aa670
--- /dev/null
+++ b/package/libsigsegv/0004-m4-stack-direction-NDS32-stack-grows-downward.patch
@@ -0,0 +1,25 @@
+From 55600de29790051671a411d8f2d99ecc3c65ae13 Mon Sep 17 00:00:00 2001
+From: Nylon Chen <nylon7@andestech.com>
+Date: Fri, 26 Apr 2019 15:56:39 +0800
+Subject: [PATCH] m4/stack-direction: NDS32 stack grows downward
+
+Signed-off-by: Nylon Chen <nylon7@andestech.com>
+---
+ m4/stack-direction.m4 | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/m4/stack-direction.m4 b/m4/stack-direction.m4
+index ffd4bce..a7df7ea 100644
+--- a/m4/stack-direction.m4
++++ b/m4/stack-direction.m4
+@@ -39,6 +39,7 @@ AC_DEFUN([SV_STACK_DIRECTION],
+       mn10200 | \
+       mn10300 | \
+       nios2 | \
++      nds32* | \
+       ns32k | \
+       pdp11 | \
+       pj* | \
+-- 
+2.18.0
+
diff --git a/package/libsigsegv/libsigsegv.mk b/package/libsigsegv/libsigsegv.mk
index 7ca39dbe4b..28c061dd73 100644
--- a/package/libsigsegv/libsigsegv.mk
+++ b/package/libsigsegv/libsigsegv.mk
@@ -12,6 +12,8 @@ LIBSIGSEGV_LICENSE = GPL-2.0+
 LIBSIGSEGV_LICENSE_FILES = COPYING
 # 0001-Improve-support-for-Linux-RISC-V.patch
 # 0002-m4-stack-direction-RISC-V-stack-grows-downward.patch
+# 0003-Improve-support-for-Linux-nds32.patch
+# 0004-m4-stack-direction-NDS32-stack-grows-downward.patch
 LIBSIGSEGV_AUTORECONF = YES
 
 $(eval $(autotools-package))
