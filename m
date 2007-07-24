From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 24 Jul 2007 10:59:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/strace
Message-ID: <20070724175916.A2C60A4624@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-24 10:59:15 -0700 (Tue, 24 Jul 2007)
New Revision: 19254

Log:
- fix brackets if socketcall or ipc are not available (Yann E. MORIN)


Modified:
   trunk/buildroot/package/strace/strace-undef-syscall.patch


Changeset:
Modified: trunk/buildroot/package/strace/strace-undef-syscall.patch
===================================================================
--- trunk/buildroot/package/strace/strace-undef-syscall.patch	2007-07-24 17:48:58 UTC (rev 19253)
+++ trunk/buildroot/package/strace/strace-undef-syscall.patch	2007-07-24 17:59:15 UTC (rev 19254)
@@ -15,27 +15,29 @@
  	{ 4,	0,	sys_epoll_ctl,		"epoll_ctl"	}, /* 255 */
 --- strace-4.5.15.orig/linux/syscallent.h	2007-02-04 19:03:48.000000000 +0100
 +++ strace-4.5.15/linux/syscallent.h	2007-02-04 19:11:04.000000000 +0100
-@@ -130,7 +130,10 @@
+@@ -130,7 +130,11 @@
  	{ 2,	TF,	sys_statfs,		"statfs"	}, /* 99 */
  	{ 2,	TD,	sys_fstatfs,		"fstatfs"	}, /* 100 */
  	{ 3,	0,	sys_ioperm,		"ioperm"	}, /* 101 */
 -	{ 2,	TD,	sys_socketcall,		"socketcall", SYS_socketcall }, /* 102 */
-+	{ 2,	TD,	sys_socketcall,		"socketcall",
++	{ 2,	TD,	sys_socketcall,		"socketcall"
 +#ifdef __NR_socketcall
-+	SYS_socketcall }, /* 102 */
++	    , SYS_socketcall
 +#endif
++								}, /* 102 */
  	{ 3,	0,	sys_syslog,		"syslog"	}, /* 103 */
  	{ 3,	0,	sys_setitimer,		"setitimer"	}, /* 104 */
  	{ 2,	0,	sys_getitimer,		"getitimer"	}, /* 105 */
-@@ -145,7 +148,10 @@
+@@ -145,7 +149,11 @@
  	{ 4,	TP,	sys_wait4,		"wait4", SYS_wait4 }, /* 114 */
  	{ 1,	0,	sys_swapoff,		"swapoff"	}, /* 115 */
  	{ 1,	0,	sys_sysinfo,		"sysinfo"	}, /* 116 */
 -	{ 6,	0,	sys_ipc,		"ipc", SYS_ipc }, /* 117 */
-+	{ 6,	0,	sys_ipc,		"ipc",
++	{ 6,	0,	sys_ipc,		"ipc"
 +#ifdef __NR_ipc
-+	SYS_ipc }, /* 117 */
++	    , SYS_ipc
 +#endif
++								}, /* 117 */
  	{ 1,	TD,	sys_fsync,		"fsync"		}, /* 118 */
  	{ 1,	TS,	sys_sigreturn,		"sigreturn"	}, /* 119 */
  	{ 5,	TP,	sys_clone,		"clone", SYS_clone }, /* 120 */
