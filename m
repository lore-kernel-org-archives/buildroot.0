From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 14 Feb 2007 05:28:58 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070214132858.DDB0B48568@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-14 05:28:58 -0800 (Wed, 14 Feb 2007)
New Revision: 17886

Log:
- sched_{s,g}etaffinity depends on the respective syscalls.
  Noticed while trying to use ancient 2.4.31 kernel-headers from some bug-report


Added:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-conditional-sched_affinity.patch


Changeset:
Added: trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-conditional-sched_affinity.patch
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-conditional-sched_affinity.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-conditional-sched_affinity.patch	2007-02-14 13:28:58 UTC (rev 17886)
@@ -0,0 +1,55 @@
+Index: uClibc/libc/sysdeps/linux/common/sched_getaffinity.c
+===================================================================
+--- uClibc/libc/sysdeps/linux/common/sched_getaffinity.c	(revision 17880)
++++ uClibc/libc/sysdeps/linux/common/sched_getaffinity.c	(working copy)
+@@ -29,6 +29,7 @@
+ #include <sys/param.h>
+ #include <sys/types.h>
+ 
++#ifdef __NR_sched_getaffinity
+ libc_hidden_proto(memset)
+ 
+ #define __NR___syscall_sched_getaffinity __NR_sched_getaffinity
+@@ -48,5 +49,15 @@
+ 	}
+ 	return res;
+ }
++#else
++/*
++int sched_getaffinity(pid_t pid, size_t cpusetsize, cpu_set_t *cpuset)
++{
++	__set_errno(ENOSYS);
++	return -1;
++}
++*/
+ #endif
+ #endif
++
++#endif
+Index: uClibc/libc/sysdeps/linux/common/sched_setaffinity.c
+===================================================================
+--- uClibc/libc/sysdeps/linux/common/sched_setaffinity.c	(revision 17880)
++++ uClibc/libc/sysdeps/linux/common/sched_setaffinity.c	(working copy)
+@@ -31,6 +31,7 @@
+ #include <sys/types.h>
+ #include <alloca.h>
+ 
++#ifdef __NR_sched_setaffinity
+ libc_hidden_proto(getpid)
+ 
+ #define __NR___syscall_sched_setaffinity __NR_sched_setaffinity
+@@ -74,5 +75,14 @@
+ 
+ 	return INLINE_SYSCALL (sched_setaffinity, 3, pid, cpusetsize, cpuset);
+ }
++#else
++/*
++int sched_setaffinity(pid_t pid, size_t cpusetsize, const cpu_set_t *cpuset)
++{
++	__set_errno(ENOSYS);
++	return -1;
++}
++*/
+ #endif
+ #endif
++#endif
