From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Jan 2017 19:52:14 +0100
Subject: [Buildroot] [git commit] uclibc: add kernel module syscall wrappers
Message-ID: <20170106185252.7CB0081DDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ffad94e6ddde09c8388bdc0b5f825ddf77702182
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Revert the decision to remove the wrappers, but remove the extra
Config symbol and add it by default. Required for kmod package.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...nit_module-delete_module-syscall-wrappers.patch | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/package/uclibc/0001-add-init_module-delete_module-syscall-wrappers.patch b/package/uclibc/0001-add-init_module-delete_module-syscall-wrappers.patch
new file mode 100644
index 0000000..4a3e07f
--- /dev/null
+++ b/package/uclibc/0001-add-init_module-delete_module-syscall-wrappers.patch
@@ -0,0 +1,59 @@
+From f60f9d6f1f73ab3f77771dafa4f90c2e0de2a7e2 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@uclibc-ng.org>
+Date: Tue, 27 Dec 2016 09:24:24 +0100
+Subject: [PATCH] add init_module/delete_module syscall wrappers
+
+Add the wrappers unconditionally, because kmod package
+still uses them.
+
+Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
+---
+ libc/sysdeps/linux/common/Makefile.in |  1 +
+ libc/sysdeps/linux/common/module.c    | 23 +++++++++++++++++++++++
+ 2 files changed, 24 insertions(+)
+ create mode 100644 libc/sysdeps/linux/common/module.c
+
+diff --git a/libc/sysdeps/linux/common/Makefile.in b/libc/sysdeps/linux/common/Makefile.in
+index 595074c..faed6fd 100644
+--- a/libc/sysdeps/linux/common/Makefile.in
++++ b/libc/sysdeps/linux/common/Makefile.in
+@@ -31,6 +31,7 @@ CSRC-$(UCLIBC_LINUX_SPECIFIC) += \
+ 	ioperm.c \
+ 	iopl.c \
+ 	modify_ldt.c \
++	module.c \
+ 	personality.c \
+ 	pipe2.c \
+ 	ppoll.c \
+diff --git a/libc/sysdeps/linux/common/module.c b/libc/sysdeps/linux/common/module.c
+new file mode 100644
+index 0000000..146a43e
+--- /dev/null
++++ b/libc/sysdeps/linux/common/module.c
+@@ -0,0 +1,23 @@
++/*
++ * init_module()/delete_module() for uClibc
++ *
++ * Copyright (C) 2000-2006 Erik Andersen <andersen@uclibc.org>
++ *
++ * Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
++ */
++
++#include <sys/syscall.h>
++
++#ifdef __NR_init_module
++int init_module(void *first, void *second, void *third, void *fourth, void *fifth);
++/* This may have 5 arguments (for old 2.0 kernels) or 2 arguments
++ * (for 2.2 and 2.4 kernels).  Use the greatest common denominator,
++ * and let the kernel cope with whatever it gets.  It's good at that. */
++_syscall5(int, init_module, void *, first, void *, second, void *, third,
++	  void *, fourth, void *, fifth)
++#endif
++
++#ifdef __NR_delete_module
++int delete_module(const char *name, unsigned int flags);
++_syscall2(int, delete_module, const char *, name, unsigned int, flags)
++#endif
+-- 
+2.1.4
+
