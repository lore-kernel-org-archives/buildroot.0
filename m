From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 10 Dec 2008 05:46:20 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20081210134620.4F72D3C7E8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-10 05:46:19 -0800 (Wed, 10 Dec 2008)
New Revision: 24359

Log:
busybox: additional 1.13.1 fixes

Added:
   trunk/buildroot/package/busybox/busybox-1.13.1-init.patch
   trunk/buildroot/package/busybox/busybox-1.13.1-printf.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.13.1-init.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.1-init.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.13.1-init.patch	2008-12-10 13:46:19 UTC (rev 24359)
@@ -0,0 +1,28 @@
+--- busybox-1.13.1/init/init.c	Sat Nov 29 07:48:56 2008
++++ busybox-1.13.1-init/init/init.c	Tue Dec  9 22:17:43 2008
+@@ -118,18 +118,18 @@
+ 
+ 	msg[0] = '\r';
+ 	va_start(arguments, fmt);
+-	l = vsnprintf(msg + 1, sizeof(msg) - 2, fmt, arguments);
+-	if (l > sizeof(msg) - 2)
+-		l = sizeof(msg) - 2;
++	l = 1 + vsnprintf(msg + 1, sizeof(msg) - 2, fmt, arguments);
++	if (l > sizeof(msg) - 1)
++		l = sizeof(msg) - 1;
+ 	msg[l] = '\0';
+ 	va_end(arguments);
+ 
+ 	if (ENABLE_FEATURE_INIT_SYSLOG) {
+-		/* Log the message to syslogd */
+ 		if (where & L_LOG) {
+-			/* don't print out "\r" */
+-			openlog(applet_name, 0, LOG_DAEMON);
+-			syslog(LOG_INFO, "init: %s", msg + 1);
++			/* Log the message to syslogd */
++			openlog("init", 0, LOG_DAEMON);
++			/* don't print "\r" */
++			syslog(LOG_INFO, "%s", msg + 1);
+ 			closelog();
+ 		}
+ 		msg[l++] = '\n';

Added: trunk/buildroot/package/busybox/busybox-1.13.1-printf.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.1-printf.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.13.1-printf.patch	2008-12-10 13:46:19 UTC (rev 24359)
@@ -0,0 +1,19 @@
+--- busybox-1.13.1/coreutils/printf.c	Sun Nov  9 18:28:07 2008
++++ busybox-1.13.1-printf/coreutils/printf.c	Wed Dec 10 12:50:55 2008
+@@ -359,8 +359,15 @@
+ 	 * We will mimic coreutils. */
+ 	if (argv[1] && argv[1][0] == '-' && argv[1][1] == '-' && !argv[1][2])
+ 		argv++;
+-	if (!argv[1])
++	if (!argv[1]) {
++		if (ENABLE_ASH_BUILTIN_PRINTF
++		 && applet_name[0] != 'p'
++		) {
++			bb_error_msg("usage: printf FORMAT [ARGUMENT...]");
++			return 2; /* bash compat */
++		}
+ 		bb_show_usage();
++	}
+ 
+ 	format = argv[1];
+ 	argv2 = argv + 2;
