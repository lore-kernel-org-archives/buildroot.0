From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun,  7 Dec 2008 13:22:49 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20081207212249.4038D3C6ED@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-07 13:22:48 -0800 (Sun, 07 Dec 2008)
New Revision: 24302

Log:
busybox: 1.13.1 crond fix

Added:
   trunk/buildroot/package/busybox/busybox-1.13.1-crond.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.13.1-crond.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.1-crond.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.13.1-crond.patch	2008-12-07 21:22:48 UTC (rev 24302)
@@ -0,0 +1,20 @@
+--- busybox-1.13.1/miscutils/crond.c	Sun Nov  9 18:28:17 2008
++++ busybox-1.13.1-crond/miscutils/crond.c	Thu Dec  4 14:56:10 2008
+@@ -779,6 +779,8 @@
+ 			xmove_fd(mailFd, mail_filename ? 1 : 0);
+ 			dup2(1, 2);
+ 		}
++		/* crond 3.0pl1-100 puts tasks in separate process groups */
++		bb_setpgrp();
+ 		execlp(prog, prog, cmd, arg, NULL);
+ 		crondlog(ERR20 "can't exec, user %s cmd %s %s %s", user, prog, cmd, arg);
+ 		if (mail_filename) {
+@@ -914,6 +916,8 @@
+ 		if (DebugOpt) {
+ 			crondlog(LVL5 "child running %s", DEFAULT_SHELL);
+ 		}
++		/* crond 3.0pl1-100 puts tasks in separate process groups */
++		bb_setpgrp();
+ 		execl(DEFAULT_SHELL, DEFAULT_SHELL, "-c", line->cl_Shell, NULL);
+ 		crondlog(ERR20 "can't exec, user %s cmd %s %s %s", user,
+ 				 DEFAULT_SHELL, "-c", line->cl_Shell);
