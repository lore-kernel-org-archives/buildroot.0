From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 23 Feb 2017 20:58:33 -0300
Subject: [Buildroot] [PATCH next] libsigsegv: bump to version 2.11
Message-ID: <20170223235833.15578-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop all patches, they're upstream.
And match that by dropping autoreconf as well.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...ck-direction-for-the-AArch64-architecture.patch | 28 -------------------
 ...direction-for-the-Microblaze-architecture.patch | 26 ------------------
 ...k-direction-for-the-Blackfin-architecture.patch | 29 --------------------
 ...ck-direction-for-the-Nios-II-architecture.patch | 31 ----------------------
 .../libsigsegv/0005-fix-sparc64-stackpointer.patch | 16 -----------
 package/libsigsegv/libsigsegv.hash                 |  2 +-
 package/libsigsegv/libsigsegv.mk                   |  4 +--
 7 files changed, 2 insertions(+), 134 deletions(-)
 delete mode 100644 package/libsigsegv/0001-Add-stack-direction-for-the-AArch64-architecture.patch
 delete mode 100644 package/libsigsegv/0002-Add-stack-direction-for-the-Microblaze-architecture.patch
 delete mode 100644 package/libsigsegv/0003-Add-stack-direction-for-the-Blackfin-architecture.patch
 delete mode 100644 package/libsigsegv/0004-Add-stack-direction-for-the-Nios-II-architecture.patch
 delete mode 100644 package/libsigsegv/0005-fix-sparc64-stackpointer.patch

diff --git a/package/libsigsegv/0001-Add-stack-direction-for-the-AArch64-architecture.patch b/package/libsigsegv/0001-Add-stack-direction-for-the-AArch64-architecture.patch
deleted file mode 100644
index a3b03a0..0000000
--- a/package/libsigsegv/0001-Add-stack-direction-for-the-AArch64-architecture.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 790e8f620f06834f3fd03c310cbecd1416536987 Mon Sep 17 00:00:00 2001
-From: Will Newton <will.newton@linaro.org>
-Date: Tue, 28 May 2013 18:31:46 +0100
-Subject: [PATCH 2/5] Add stack direction for the AArch64 architecture
-
-On this architecture, the stack grows downward.
-
-Signed-off-by: Will Newton <will.newton@linaro.org>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- m4/stack-direction.m4 | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/m4/stack-direction.m4 b/m4/stack-direction.m4
-index 39c1a28..3f70530 100644
---- a/m4/stack-direction.m4
-+++ b/m4/stack-direction.m4
-@@ -13,6 +13,7 @@ AC_DEFUN([SV_STACK_DIRECTION],
-     case "$host_cpu" in
-       dnl See the #define STACK_GROWS_DOWNWARD in gcc-3.1/gcc/config/*/*.h.
-       a29k | \
-+      aarch64* | \
-       alpha* | \
-       arc | \
-       arm* | strongarm* | xscale* | \
--- 
-2.1.0
-
diff --git a/package/libsigsegv/0002-Add-stack-direction-for-the-Microblaze-architecture.patch b/package/libsigsegv/0002-Add-stack-direction-for-the-Microblaze-architecture.patch
deleted file mode 100644
index d3795d3..0000000
--- a/package/libsigsegv/0002-Add-stack-direction-for-the-Microblaze-architecture.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From f4395ff932758884416753f88f5d98f33ec67479 Mon Sep 17 00:00:00 2001
-From: Spenser Gilliland <spenser@gillilanding.com>
-Date: Mon, 29 Dec 2014 13:54:54 +0100
-Subject: [PATCH 3/5] Add stack direction for the Microblaze architecture
-
-Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- m4/stack-direction.m4 | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/m4/stack-direction.m4 b/m4/stack-direction.m4
-index 3f70530..53f4216 100644
---- a/m4/stack-direction.m4
-+++ b/m4/stack-direction.m4
-@@ -32,6 +32,7 @@ AC_DEFUN([SV_STACK_DIRECTION],
-       m68* | \
-       m88k | \
-       mcore | \
-+      microblaze | \
-       mips* | \
-       mmix | \
-       mn10200 | \
--- 
-2.1.0
-
diff --git a/package/libsigsegv/0003-Add-stack-direction-for-the-Blackfin-architecture.patch b/package/libsigsegv/0003-Add-stack-direction-for-the-Blackfin-architecture.patch
deleted file mode 100644
index 5d8232a..0000000
--- a/package/libsigsegv/0003-Add-stack-direction-for-the-Blackfin-architecture.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 55a707283dbb3b2fdcaaa4e177d050e122cfc2a0 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Mon, 29 Dec 2014 13:55:16 +0100
-Subject: [PATCH 4/5] Add stack direction for the Blackfin architecture
-
-The stack grows downward on Blackfin, see
-https://sourceware.org/binutils/docs/as/Blackfin-Syntax.html: "The
-stack grows by decrementing the stack pointer.".
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- m4/stack-direction.m4 | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/m4/stack-direction.m4 b/m4/stack-direction.m4
-index 53f4216..1a97d5a 100644
---- a/m4/stack-direction.m4
-+++ b/m4/stack-direction.m4
-@@ -18,6 +18,7 @@ AC_DEFUN([SV_STACK_DIRECTION],
-       arc | \
-       arm* | strongarm* | xscale* | \
-       avr | \
-+      bfin | \
-       c1 | c2 | c32 | c34 | c38 | \
-       clipper | \
-       cris | \
--- 
-2.1.0
-
diff --git a/package/libsigsegv/0004-Add-stack-direction-for-the-Nios-II-architecture.patch b/package/libsigsegv/0004-Add-stack-direction-for-the-Nios-II-architecture.patch
deleted file mode 100644
index ee4778e..0000000
--- a/package/libsigsegv/0004-Add-stack-direction-for-the-Nios-II-architecture.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 24bac122bf4ffe437bb4f6ca633ad08f31a23d73 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Mon, 29 Dec 2014 13:56:54 +0100
-Subject: [PATCH 5/5] Add stack direction for the Nios II architecture
-
-According to Altera Application Binary Interface document for the Nios
-II architecture
-(http://www.altera.com/literature/hb/nios2/n2cpu_nii51016.pdf):
-
- "The stack grows downward (i.e. towards lower addresses). ".
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- m4/stack-direction.m4 | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/m4/stack-direction.m4 b/m4/stack-direction.m4
-index 1a97d5a..d9c5157 100644
---- a/m4/stack-direction.m4
-+++ b/m4/stack-direction.m4
-@@ -38,6 +38,7 @@ AC_DEFUN([SV_STACK_DIRECTION],
-       mmix | \
-       mn10200 | \
-       mn10300 | \
-+      nios2 | \
-       ns32k | \
-       pdp11 | \
-       pj* | \
--- 
-2.1.0
-
diff --git a/package/libsigsegv/0005-fix-sparc64-stackpointer.patch b/package/libsigsegv/0005-fix-sparc64-stackpointer.patch
deleted file mode 100644
index 62de35f..0000000
--- a/package/libsigsegv/0005-fix-sparc64-stackpointer.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Fix sparc64 build.
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur libsigsegv-2.10.orig/src/fault-linux-sparc.h libsigsegv-2.10/src/fault-linux-sparc.h
---- libsigsegv-2.10.orig/src/fault-linux-sparc.h	2009-08-01 17:06:49.000000000 +0200
-+++ libsigsegv-2.10/src/fault-linux-sparc.h	2015-11-29 11:55:29.000000000 +0100
-@@ -27,4 +27,8 @@
-    (see also <asm/sigcontext.h>)
-    are quite different types.  */
- 
-+#if __WORDSIZE == 64
-+#define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.mc_gregs[REG_O6]
-+#else
- #define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.gregs[REG_O6]
-+#endif
diff --git a/package/libsigsegv/libsigsegv.hash b/package/libsigsegv/libsigsegv.hash
index 0151105..e937259 100644
--- a/package/libsigsegv/libsigsegv.hash
+++ b/package/libsigsegv/libsigsegv.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	8460a4a3dd4954c3d96d7a4f5dd5bc4d9b76f5754196aa245287553b26d2199a	libsigsegv-2.10.tar.gz
+sha256	dd7c2eb2ef6c47189406d562c1dc0f96f2fc808036834d596075d58377e37a18	libsigsegv-2.11.tar.gz
diff --git a/package/libsigsegv/libsigsegv.mk b/package/libsigsegv/libsigsegv.mk
index a5bb31c..1473369 100644
--- a/package/libsigsegv/libsigsegv.mk
+++ b/package/libsigsegv/libsigsegv.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-LIBSIGSEGV_VERSION = 2.10
+LIBSIGSEGV_VERSION = 2.11
 LIBSIGSEGV_SITE = $(BR2_GNU_MIRROR)/libsigsegv
 LIBSIGSEGV_INSTALL_STAGING = YES
 LIBSIGSEGV_CONF_ENV = sv_cv_fault_posix=yes
 LIBSIGSEGV_LICENSE = GPLv2+
 LIBSIGSEGV_LICENSE_FILES = COPYING
 
-LIBSIGSEGV_AUTORECONF = YES
-
 $(eval $(autotools-package))
-- 
2.10.2
