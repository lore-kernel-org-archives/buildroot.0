From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Jan 2018 22:24:45 +0100
Subject: [Buildroot] [git commit] uclibc: update to 1.0.28
Message-ID: <20180122213642.41F2983E77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc7f8d12a2af7efd3a1c89053b481d9ea25cc476
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar patch included upstream.
Mostly bugfixes and NPTL support for m68k was added.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-or1k-syscall-Pass-arguments-on-the-stack.patch | 80 ----------------------
 package/uclibc/uclibc.hash                         |  2 +-
 package/uclibc/uclibc.mk                           |  2 +-
 3 files changed, 2 insertions(+), 82 deletions(-)

diff --git a/package/uclibc/0001-or1k-syscall-Pass-arguments-on-the-stack.patch b/package/uclibc/0001-or1k-syscall-Pass-arguments-on-the-stack.patch
deleted file mode 100644
index 14ed092..0000000
--- a/package/uclibc/0001-or1k-syscall-Pass-arguments-on-the-stack.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From f764bcffed69d8c62625dc4b6c1a6af21bd6dbc2 Mon Sep 17 00:00:00 2001
-From: Joel Stanley <joel@jms.id.au>
-Date: Wed, 6 Dec 2017 12:26:21 +1030
-Subject: [PATCH] or1k: syscall: Pass arguments on the stack
-
-Busybox internally calls syscall(2).
-
- - in unistd.h defined something like
-   int syscall(nr, ....)
-
- - in syscall.c (common) implemented as
-   int syscall(nr, arg1, arg3, arg3, arg4, arg5, arg6)
-
-This will not work, busybox thinks syscall should have varargs calling
-conventions.  But it doesnt in the uclibc implementation so no args go through.
-
-Most architectures this will work.  But on openrisc varargs are all sent on the
-stack.  Regular args are passed in registers.
-
-Commit message and idea from Stafford Horne <shorne@gmail.com>.
-
-Signed-off-by: Joel Stanley <joel@jms.id.au>
----
- libc/sysdeps/linux/or1k/Makefile.arch |  2 +-
- libc/sysdeps/linux/or1k/syscall.c     | 32 ++++++++++++++++++++++++++++++++
- 2 files changed, 33 insertions(+), 1 deletion(-)
- create mode 100644 libc/sysdeps/linux/or1k/syscall.c
-
-diff --git a/libc/sysdeps/linux/or1k/Makefile.arch b/libc/sysdeps/linux/or1k/Makefile.arch
-index f6758fa63fa3..191eebafde9d 100644
---- a/libc/sysdeps/linux/or1k/Makefile.arch
-+++ b/libc/sysdeps/linux/or1k/Makefile.arch
-@@ -5,5 +5,5 @@
- # Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
- #
- 
--CSRC-y := __syscall_error.c __init_brk.c brk.c sbrk.c clone.c
-+CSRC-y := __syscall_error.c __init_brk.c brk.c sbrk.c clone.c syscall.c
- SSRC-y := __longjmp.S setjmp.S or1k_clone.S
-diff --git a/libc/sysdeps/linux/or1k/syscall.c b/libc/sysdeps/linux/or1k/syscall.c
-new file mode 100644
-index 000000000000..2f4356737cf8
---- /dev/null
-+++ b/libc/sysdeps/linux/or1k/syscall.c
-@@ -0,0 +1,32 @@
-+/*
-+ *  Copyright (C) 2017 Joel Stanley <joel@jms.id.au>
-+ *  Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
-+ */
-+
-+#include <stdarg.h>
-+#include <sys/syscall.h>
-+#include <unistd.h>
-+
-+long int syscall (long num, ...)
-+{
-+	unsigned long arg1 = 0;
-+	unsigned long arg2 = 0;
-+	unsigned long arg3 = 0;
-+	unsigned long arg4 = 0;
-+	unsigned long arg5 = 0;
-+	unsigned long arg6 = 0;
-+	va_list arg;
-+
-+	va_start (arg, num);
-+	arg1 = va_arg (arg, unsigned long);
-+	arg2 = va_arg (arg, unsigned long);
-+	arg3 = va_arg (arg, unsigned long);
-+	arg4 = va_arg (arg, unsigned long);
-+	arg5 = va_arg (arg, unsigned long);
-+	arg6 = va_arg (arg, unsigned long);
-+	va_end (arg);
-+
-+        __asm__ volatile ( "" ::: "memory" );
-+
-+	return INLINE_SYSCALL_NCS(num, 6, arg1, arg2, arg3, arg4, arg5, arg6);
-+}
--- 
-2.14.1
-
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index df25a7e..0a15683 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,2 +1,2 @@
 # From https://uclibc-ng.org/
-sha256  9452b0e92f76db19d8ff30b2d6d10a80e1ed01e4c504a36fef34cfc9de490b24        uClibc-ng-1.0.27.tar.xz
+sha256  a1504ddc34a29cc9bfd1f5a7419c4b63bb510d9e2faed81618d1b596ceb0a5a9        uClibc-ng-1.0.28.tar.xz
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 1741421..c5b0c6b 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.27
+UCLIBC_VERSION = 1.0.28
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = http://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
