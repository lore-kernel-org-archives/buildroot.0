From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  5 Dec 2011 10:00:41 -0300
Subject: [Buildroot] [PATCH 1/2] uClibc: add unshare() syscall support
Message-ID: <1323090042-3435-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add unshare() syscall support for uClibc 0.9.31 and 0.9.32 series.
This is required by newer versions of iproute2.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/uClibc/uClibc-0.9.31.1-unshare.patch |   74 +++++++++++++++++++++
 toolchain/uClibc/uClibc-0.9.32-unshare.patch   |   82 ++++++++++++++++++++++++
 2 files changed, 156 insertions(+), 0 deletions(-)
 create mode 100644 toolchain/uClibc/uClibc-0.9.31.1-unshare.patch
 create mode 100644 toolchain/uClibc/uClibc-0.9.32-unshare.patch

diff --git a/toolchain/uClibc/uClibc-0.9.31.1-unshare.patch b/toolchain/uClibc/uClibc-0.9.31.1-unshare.patch
new file mode 100644
index 0000000..ad440d9
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.31.1-unshare.patch
@@ -0,0 +1,74 @@
+Backport of unshare() syscall.
+From uClibc git 19dd090a0f68765db87990ef8eda9bf77bb29581
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+---
+diff -Nura uClibc-0.9.31.1.orig/libc/sysdeps/linux/common/bits/sched.h uClibc-0.9.31.1/libc/sysdeps/linux/common/bits/sched.h
+--- uClibc-0.9.31.1.orig/libc/sysdeps/linux/common/bits/sched.h	2011-06-08 15:58:40.000000000 -0300
++++ uClibc-0.9.31.1/libc/sysdeps/linux/common/bits/sched.h	2011-12-05 08:10:02.491978849 -0300
+@@ -58,7 +58,13 @@
+ 				      force CLONE_PTRACE on this clone.  */
+ # define CLONE_CHILD_SETTID 0x01000000 /* Store TID in userlevel buffer in
+ 					  the child.  */
+-# define CLONE_STOPPED	0x02000000 /* Start in stopped state.  */
++# define CLONE_STOPPED 0x02000000 /* Start in stopped state.  */
++# define CLONE_NEWUTS  0x04000000      /* New utsname group.  */
++# define CLONE_NEWIPC  0x08000000      /* New ipcs.  */
++# define CLONE_NEWUSER 0x10000000      /* New user namespace.  */
++# define CLONE_NEWPID  0x20000000      /* New pid namespace.  */
++# define CLONE_NEWNET  0x40000000      /* New network namespace.  */
++# define CLONE_IO      0x80000000      /* Clone I/O context.  */
+ #endif
+ 
+ /* The official definition.  */
+@@ -74,11 +80,9 @@
+ extern int clone (int (*__fn) (void *__arg), void *__child_stack,
+ 		  int __flags, void *__arg, ...) __THROW;
+ 
+-#if 0
+ /* Unshare the specified resources.  */
+ extern int unshare (int __flags) __THROW;
+ #endif
+-#endif
+ 
+ __END_DECLS
+ 
+diff -Nura uClibc-0.9.31.1.orig/libc/sysdeps/linux/common/Makefile.in uClibc-0.9.31.1/libc/sysdeps/linux/common/Makefile.in
+--- uClibc-0.9.31.1.orig/libc/sysdeps/linux/common/Makefile.in	2011-06-08 15:58:40.000000000 -0300
++++ uClibc-0.9.31.1/libc/sysdeps/linux/common/Makefile.in	2011-12-05 08:23:28.353757602 -0300
+@@ -31,7 +31,8 @@
+ 	remap_file_pages.c sched_getaffinity.c sched_setaffinity.c \
+ 	sendfile64.c sendfile.c setfsgid.c setfsuid.c setresuid.c \
+ 	splice.c vmsplice.c tee.c signalfd.c swapoff.c swapon.c \
+-	sync_file_range.c sysctl.c sysinfo.c timerfd.c uselib.c vhangup.c,$(CSRC))
++	sync_file_range.c sysctl.c sysinfo.c timerfd.c unshare.c uselib.c \
++	vhangup.c,$(CSRC))
+ endif
+ 
+ ifneq ($(UCLIBC_BSD_SPECIFIC),y)
+diff -Nura uClibc-0.9.31.1.orig/libc/sysdeps/linux/common/unshare.c uClibc-0.9.31.1/libc/sysdeps/linux/common/unshare.c
+--- uClibc-0.9.31.1.orig/libc/sysdeps/linux/common/unshare.c	1969-12-31 21:00:00.000000000 -0300
++++ uClibc-0.9.31.1/libc/sysdeps/linux/common/unshare.c	2011-12-05 08:22:45.954453512 -0300
+@@ -0,0 +1,21 @@
++/* vi: set sw=4 ts=4: */
++/*
++ * unshare() for uClibc
++ *
++ * Copyright (C) 2011 Henning Heinold <heinold@inf.fu-berlin.de>
++ *
++ * Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
++ */
++
++#include <sys/syscall.h>
++#include <sched.h>
++
++#if defined __NR_unshare && defined __UCLIBC_LINUX_SPECIFIC__
++_syscall1(int, unshare, int, flags)
++#else
++int unshare(int flags) 
++{   
++    __set_errno(ENOSYS);
++    return -1;
++}
++#endif
diff --git a/toolchain/uClibc/uClibc-0.9.32-unshare.patch b/toolchain/uClibc/uClibc-0.9.32-unshare.patch
new file mode 100644
index 0000000..5820e15
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.32-unshare.patch
@@ -0,0 +1,82 @@
+Backport of unshare() syscall.
+From uClibc git 19dd090a0f68765db87990ef8eda9bf77bb29581
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+---
+diff -Nura uClibc-0.9.32.orig/libc/sysdeps/linux/common/bits/sched.h uClibc-0.9.32/libc/sysdeps/linux/common/bits/sched.h
+--- uClibc-0.9.32.orig/libc/sysdeps/linux/common/bits/sched.h	2011-12-02 23:54:30.571841170 -0300
++++ uClibc-0.9.32/libc/sysdeps/linux/common/bits/sched.h	2011-12-02 23:57:45.874205079 -0300
+@@ -58,7 +58,13 @@
+ 				      force CLONE_PTRACE on this clone.  */
+ # define CLONE_CHILD_SETTID 0x01000000 /* Store TID in userlevel buffer in
+ 					  the child.  */
+-# define CLONE_STOPPED	0x02000000 /* Start in stopped state.  */
++# define CLONE_STOPPED 0x02000000 /* Start in stopped state.  */
++# define CLONE_NEWUTS  0x04000000      /* New utsname group.  */
++# define CLONE_NEWIPC  0x08000000      /* New ipcs.  */
++# define CLONE_NEWUSER 0x10000000      /* New user namespace.  */
++# define CLONE_NEWPID  0x20000000      /* New pid namespace.  */
++# define CLONE_NEWNET  0x40000000      /* New network namespace.  */
++# define CLONE_IO      0x80000000      /* Clone I/O context.  */
+ #endif
+ 
+ /* The official definition.  */
+@@ -74,11 +80,9 @@
+ extern int clone (int (*__fn) (void *__arg), void *__child_stack,
+ 		  int __flags, void *__arg, ...) __THROW;
+ 
+-#if 0
+ /* Unshare the specified resources.  */
+ extern int unshare (int __flags) __THROW;
+ #endif
+-#endif
+ 
+ __END_DECLS
+ 
+diff -Nura uClibc-0.9.32.orig/libc/sysdeps/linux/common/Makefile.in uClibc-0.9.32/libc/sysdeps/linux/common/Makefile.in
+--- uClibc-0.9.32.orig/libc/sysdeps/linux/common/Makefile.in	2011-12-02 23:54:30.577841215 -0300
++++ uClibc-0.9.32/libc/sysdeps/linux/common/Makefile.in	2011-12-02 23:56:08.801527166 -0300
+@@ -24,7 +24,8 @@
+ 	remap_file_pages.c sched_getaffinity.c sched_setaffinity.c \
+ 	sendfile64.c sendfile.c setfsgid.c setfsuid.c setresuid.c \
+ 	splice.c vmsplice.c tee.c signalfd.c swapoff.c swapon.c \
+-	sync_file_range.c sysctl.c sysinfo.c timerfd.c uselib.c vhangup.c
++	sync_file_range.c sysctl.c sysinfo.c timerfd.c unshare.c uselib.c \
++	vhangup.c
+ # NPTL needs these internally: madvise.c
+ CSRC-$(findstring y,$(UCLIBC_LINUX_SPECIFIC)$(UCLIBC_HAS_THREADS_NATIVE)) += madvise.c
+ ifeq ($(UCLIBC_HAS_THREADS_NATIVE),y)
+diff -Nura uClibc-0.9.32.orig/libc/sysdeps/linux/common/stubs.c uClibc-0.9.32/libc/sysdeps/linux/common/stubs.c
+--- uClibc-0.9.32.orig/libc/sysdeps/linux/common/stubs.c	2011-12-02 23:54:30.577841215 -0300
++++ uClibc-0.9.32/libc/sysdeps/linux/common/stubs.c	2011-12-02 23:58:18.803435042 -0300
+@@ -278,6 +278,10 @@
+ make_stub(umount2)
+ #endif
+ 
++#if !defined __NR_unshare && defined __UCLIBC_LINUX_SPECIFIC__
++make_stub(unshare)
++#endif
++
+ #ifndef __NR_utimensat
+ make_stub(futimens)
+ make_stub(utimensat)
+diff -Nura uClibc-0.9.32.orig/libc/sysdeps/linux/common/unshare.c uClibc-0.9.32/libc/sysdeps/linux/common/unshare.c
+--- uClibc-0.9.32.orig/libc/sysdeps/linux/common/unshare.c	1969-12-31 21:00:00.000000000 -0300
++++ uClibc-0.9.32/libc/sysdeps/linux/common/unshare.c	2011-12-02 23:58:42.693601880 -0300
+@@ -0,0 +1,15 @@
++/* vi: set sw=4 ts=4: */
++/*
++ * unshare() for uClibc
++ *
++ * Copyright (C) 2011 Henning Heinold <heinold@inf.fu-berlin.de>
++ *
++ * Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
++ */
++
++#include <sys/syscall.h>
++#include <sched.h>
++
++#if defined __NR_unshare
++_syscall1(int, unshare, int, flags)
++#endif
-- 
1.7.3.4
