From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  4 Feb 2007 10:21:58 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/strace
Message-ID: <20070204182158.19B1048656@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-04 10:21:58 -0800 (Sun, 04 Feb 2007)
New Revision: 17767

Log:
- account for some more possibly unavailable syscalls


Modified:
   trunk/buildroot/package/strace/strace-undef-syscall.patch


Changeset:
Modified: trunk/buildroot/package/strace/strace-undef-syscall.patch
===================================================================
--- trunk/buildroot/package/strace/strace-undef-syscall.patch	2007-02-04 17:24:53 UTC (rev 17766)
+++ trunk/buildroot/package/strace/strace-undef-syscall.patch	2007-02-04 18:21:58 UTC (rev 17767)
@@ -13,3 +13,50 @@
  	{ 4,	0,	printargs,		"lookup_dcookie"}, /* 253 */
  	{ 1,	0,	sys_epoll_create,	"epoll_create"	}, /* 254 */
  	{ 4,	0,	sys_epoll_ctl,		"epoll_ctl"	}, /* 255 */
+--- strace-4.5.15.orig/linux/syscallent.h	2007-02-04 19:03:48.000000000 +0100
++++ strace-4.5.15/linux/syscallent.h	2007-02-04 19:11:04.000000000 +0100
+@@ -130,7 +130,10 @@
+ 	{ 2,	TF,	sys_statfs,		"statfs"	}, /* 99 */
+ 	{ 2,	TD,	sys_fstatfs,		"fstatfs"	}, /* 100 */
+ 	{ 3,	0,	sys_ioperm,		"ioperm"	}, /* 101 */
+-	{ 2,	TD,	sys_socketcall,		"socketcall", SYS_socketcall }, /* 102 */
++	{ 2,	TD,	sys_socketcall,		"socketcall",
++#ifdef __NR_socketcall
++	SYS_socketcall }, /* 102 */
++#endif
+ 	{ 3,	0,	sys_syslog,		"syslog"	}, /* 103 */
+ 	{ 3,	0,	sys_setitimer,		"setitimer"	}, /* 104 */
+ 	{ 2,	0,	sys_getitimer,		"getitimer"	}, /* 105 */
+@@ -145,7 +148,10 @@
+ 	{ 4,	TP,	sys_wait4,		"wait4", SYS_wait4 }, /* 114 */
+ 	{ 1,	0,	sys_swapoff,		"swapoff"	}, /* 115 */
+ 	{ 1,	0,	sys_sysinfo,		"sysinfo"	}, /* 116 */
+-	{ 6,	0,	sys_ipc,		"ipc", SYS_ipc }, /* 117 */
++	{ 6,	0,	sys_ipc,		"ipc",
++#ifdef __NR_ipc
++	SYS_ipc }, /* 117 */
++#endif
+ 	{ 1,	TD,	sys_fsync,		"fsync"		}, /* 118 */
+ 	{ 1,	TS,	sys_sigreturn,		"sigreturn"	}, /* 119 */
+ 	{ 5,	TP,	sys_clone,		"clone", SYS_clone }, /* 120 */
+--- strace-4.5.15.orig/syscall.c	2007-02-04 19:03:48.000000000 +0100
++++ strace-4.5.15/syscall.c	2007-02-04 19:07:26.000000000 +0100
+@@ -2404,14 +2404,18 @@
+ 	switch (known_scno(tcp)) {
+ #ifdef LINUX
+ #if !defined (ALPHA) && !defined(SPARC) && !defined(SPARC64) && !defined(MIPS) && !defined(HPPA)
++#ifdef __NR_socketcall
+ 	case SYS_socketcall:
+ 		decode_subcall(tcp, SYS_socket_subcall,
+ 			SYS_socket_nsubcalls, deref_style);
+ 		break;
++#endif
++#ifdef __NR_ipc
+ 	case SYS_ipc:
+ 		decode_subcall(tcp, SYS_ipc_subcall,
+ 			SYS_ipc_nsubcalls, shift_style);
+ 		break;
++#endif
+ #endif /* !ALPHA && !MIPS && !SPARC && !SPARC64 && !HPPA */
+ #if defined (SPARC) || defined (SPARC64)
+ 	case SYS_socketcall:
