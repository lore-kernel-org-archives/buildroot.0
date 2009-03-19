From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 19 Mar 2009 08:29:55 +0000 (UTC)
Subject: [Buildroot] svn commit: [25752] trunk/buildroot/package/busybox
Message-ID: <20090319082955.F301E7763E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-19 08:29:55 +0000 (Thu, 19 Mar 2009)
New Revision: 25752

Log:
busybox: 1.13.3 ash fix

Added:
   trunk/buildroot/package/busybox/busybox-1.13.3-ash.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.13.3-ash.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.3-ash.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.13.3-ash.patch	2009-03-19 08:29:55 UTC (rev 25752)
@@ -0,0 +1,43 @@
+--- busybox-1.13.3/shell/ash.c	Thu Feb 26 12:46:55 2009
++++ busybox-1.13.3-ash/shell/ash.c	Thu Mar 19 04:34:01 2009
+@@ -376,7 +376,6 @@
+ onsig(int signo)
+ {
+ 	gotsig[signo - 1] = 1;
+-	pendingsig = signo;
+ 
+ 	if (/* exsig || */ (signo == SIGINT && !trap[SIGINT])) {
+ 		if (!suppressint) {
+@@ -384,6 +383,8 @@
+ 			raise_interrupt(); /* does not return */
+ 		}
+ 		intpending = 1;
++	} else {
++		pendingsig = signo;
+ 	}
+ }
+ 
+@@ -13692,15 +13693,20 @@
+ 	}
+  state3:
+ 	state = 4;
+-	if (minusc)
++	if (minusc) {
++		/* evalstring pushes parsefile stack.
++		 * Ensure we don't falsely claim that 0 (stdin)
++		 * is one of stacked source fds */
++		if (!sflag)
++			g_parsefile->fd = -1;
+ 		evalstring(minusc, 0);
++	}
+ 
+ 	if (sflag || minusc == NULL) {
+ #if ENABLE_FEATURE_EDITING_SAVEHISTORY
+ 		if (iflag) {
+ 			const char *hp = lookupvar("HISTFILE");
+-
+-			if (hp != NULL)
++			if (hp)
+ 				line_input_state->hist_file = hp;
+ 		}
+ #endif
