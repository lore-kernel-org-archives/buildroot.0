From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 19 Nov 2008 22:49:21 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20081120064921.4DA103C80A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-19 22:49:20 -0800 (Wed, 19 Nov 2008)
New Revision: 24103

Log:
busybox: 1.13.0 klogd fix

Added:
   trunk/buildroot/package/busybox/busybox-1.13.0-klogd.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.13.0-klogd.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.0-klogd.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.13.0-klogd.patch	2008-11-20 06:49:20 UTC (rev 24103)
@@ -0,0 +1,29 @@
+--- busybox-1.13.0/sysklogd/klogd.c	Thu Oct 30 08:41:28 2008
++++ busybox-1.13.0-klogd/sysklogd/klogd.c	Thu Nov 20 00:46:00 2008
+@@ -73,9 +73,6 @@
+ 
+ 	syslog(LOG_NOTICE, "klogd started: %s", bb_banner);
+ 
+-	/* Initially null terminate the buffer in case of a very long line */
+-	log_buffer[KLOGD_LOGBUF_SIZE - 1] = '\0';
+-
+ 	while (1) {
+ 		int n;
+ 		int priority;
+@@ -89,6 +86,7 @@
+ 					errno);
+ 			break;
+ 		}
++		log_buffer[used + n] = '\0';
+ 
+ 		/* klogctl buffer parsing modelled after code in dmesg.c */
+ 		start = &log_buffer[0];
+@@ -101,7 +99,7 @@
+ 				/* This line is incomplete... */
+ 				if (start != log_buffer) {
+ 					/* move it to the front of the buffer */
+-					strcpy(log_buffer, start);
++					overlapping_strcpy(log_buffer, start);
+ 					/* don't log it yet */
+ 					used = strlen(log_buffer);
+ 					break;
