From: Joel Stanley <joel@jms.id.au>
Date: Wed, 13 Dec 2017 09:59:04 +1030
Subject: [Buildroot] [PATCH] uclibc: Fix system calls on openrisc
Message-ID: <20171212232904.23365-1-joel@jms.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This adds a patch from the master branch that fixes userspace calling
through uclibc when making system calls.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 ...-or1k-syscall-Pass-arguments-on-the-stack.patch | 80 ++++++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 package/uclibc/0001-or1k-syscall-Pass-arguments-on-the-stack.patch

diff --git a/package/uclibc/0001-or1k-syscall-Pass-arguments-on-the-stack.patch b/package/uclibc/0001-or1k-syscall-Pass-arguments-on-the-stack.patch
new file mode 100644
index 000000000000..14ed092bd714
--- /dev/null
+++ b/package/uclibc/0001-or1k-syscall-Pass-arguments-on-the-stack.patch
@@ -0,0 +1,80 @@
+From f764bcffed69d8c62625dc4b6c1a6af21bd6dbc2 Mon Sep 17 00:00:00 2001
+From: Joel Stanley <joel@jms.id.au>
+Date: Wed, 6 Dec 2017 12:26:21 +1030
+Subject: [PATCH] or1k: syscall: Pass arguments on the stack
+
+Busybox internally calls syscall(2).
+
+ - in unistd.h defined something like
+   int syscall(nr, ....)
+
+ - in syscall.c (common) implemented as
+   int syscall(nr, arg1, arg3, arg3, arg4, arg5, arg6)
+
+This will not work, busybox thinks syscall should have varargs calling
+conventions.  But it doesnt in the uclibc implementation so no args go through.
+
+Most architectures this will work.  But on openrisc varargs are all sent on the
+stack.  Regular args are passed in registers.
+
+Commit message and idea from Stafford Horne <shorne@gmail.com>.
+
+Signed-off-by: Joel Stanley <joel@jms.id.au>
+---
+ libc/sysdeps/linux/or1k/Makefile.arch |  2 +-
+ libc/sysdeps/linux/or1k/syscall.c     | 32 ++++++++++++++++++++++++++++++++
+ 2 files changed, 33 insertions(+), 1 deletion(-)
+ create mode 100644 libc/sysdeps/linux/or1k/syscall.c
+
+diff --git a/libc/sysdeps/linux/or1k/Makefile.arch b/libc/sysdeps/linux/or1k/Makefile.arch
+index f6758fa63fa3..191eebafde9d 100644
+--- a/libc/sysdeps/linux/or1k/Makefile.arch
++++ b/libc/sysdeps/linux/or1k/Makefile.arch
+@@ -5,5 +5,5 @@
+ # Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
+ #
+ 
+-CSRC-y := __syscall_error.c __init_brk.c brk.c sbrk.c clone.c
++CSRC-y := __syscall_error.c __init_brk.c brk.c sbrk.c clone.c syscall.c
+ SSRC-y := __longjmp.S setjmp.S or1k_clone.S
+diff --git a/libc/sysdeps/linux/or1k/syscall.c b/libc/sysdeps/linux/or1k/syscall.c
+new file mode 100644
+index 000000000000..2f4356737cf8
+--- /dev/null
++++ b/libc/sysdeps/linux/or1k/syscall.c
+@@ -0,0 +1,32 @@
++/*
++ *  Copyright (C) 2017 Joel Stanley <joel@jms.id.au>
++ *  Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
++ */
++
++#include <stdarg.h>
++#include <sys/syscall.h>
++#include <unistd.h>
++
++long int syscall (long num, ...)
++{
++	unsigned long arg1 = 0;
++	unsigned long arg2 = 0;
++	unsigned long arg3 = 0;
++	unsigned long arg4 = 0;
++	unsigned long arg5 = 0;
++	unsigned long arg6 = 0;
++	va_list arg;
++
++	va_start (arg, num);
++	arg1 = va_arg (arg, unsigned long);
++	arg2 = va_arg (arg, unsigned long);
++	arg3 = va_arg (arg, unsigned long);
++	arg4 = va_arg (arg, unsigned long);
++	arg5 = va_arg (arg, unsigned long);
++	arg6 = va_arg (arg, unsigned long);
++	va_end (arg);
++
++        __asm__ volatile ( "" ::: "memory" );
++
++	return INLINE_SYSCALL_NCS(num, 6, arg1, arg2, arg3, arg4, arg5, arg6);
++}
+-- 
+2.14.1
+
-- 
2.14.1
