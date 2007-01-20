From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 20 Jan 2007 04:57:06 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/strace
Message-ID: <20070120125706.206FD48590@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-20 04:57:04 -0800 (Sat, 20 Jan 2007)
New Revision: 17395

Log:
- add fix for ARM fake syscall from execve. Closes #626


Added:
   trunk/buildroot/package/strace/strace-fix-arm-bad-syscall.patch


Changeset:
Added: trunk/buildroot/package/strace/strace-fix-arm-bad-syscall.patch
===================================================================
--- trunk/buildroot/package/strace/strace-fix-arm-bad-syscall.patch	                        (rev 0)
+++ trunk/buildroot/package/strace/strace-fix-arm-bad-syscall.patch	2007-01-20 12:57:04 UTC (rev 17395)
@@ -0,0 +1,18 @@
+--- strace-4.5.12-orig/syscall.c	2005-06-08 21:45:28.000000000 +0100
++++ strace-4.5.12/syscall.c	2005-10-25 19:26:39.000000000 +0100
+@@ -1013,6 +1013,15 @@ struct tcb *tcp;
+ 		/*
+ 		 * Note: we only deal with only 32-bit CPUs here.
+ 		 */
++
++		if (!(tcp->flags & TCB_INSYSCALL) &&
++		    (tcp->flags & TCB_WAITEXECVE)) {
++			/* caught a fake syscall from the execve's exit */
++			tcp->flags &= ~TCB_WAITEXECVE;
++			return 0;
++		}
++ 
++
+ 		if (regs.ARM_cpsr & 0x20) {
+ 			/*
+ 			 * Get the Thumb-mode system call number
