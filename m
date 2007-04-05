From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  5 Apr 2007 00:04:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070405070432.F2ECD485DA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-04-05 00:04:31 -0700 (Thu, 05 Apr 2007)
New Revision: 18330

Log:
busybox 1.5.0 patches

Added:
   trunk/buildroot/package/busybox/busybox-1.5.0-hdparm.patch
   trunk/buildroot/package/busybox/busybox-1.5.0-ps.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.5.0-hdparm.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.5.0-hdparm.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.5.0-hdparm.patch	2007-04-05 07:04:31 UTC (rev 18330)
@@ -0,0 +1,14 @@
+--- busybox-1.5.0/miscutils/hdparm.c	Thu Mar 22 22:21:34 2007
++++ busybox-1.5.0-hdparm/miscutils/hdparm.c	Sat Mar 31 12:23:07 2007
+@@ -1569,9 +1569,9 @@
+ 	if (set_mult) {
+ 		print_flag(get_mult, "multcount", mult);
+ #ifdef HDIO_DRIVE_CMD
+-		bb_ioctl(fd, HDIO_SET_MULTCOUNT, &mult, "HDIO_SET_MULTCOUNT");
++		bb_ioctl(fd, HDIO_SET_MULTCOUNT, (void *)mult, "HDIO_SET_MULTCOUNT");
+ #else
+-		force_operation |= (!bb_ioctl(fd, HDIO_SET_MULTCOUNT, &mult, "HDIO_SET_MULTCOUNT"));
++		force_operation |= (!bb_ioctl(fd, HDIO_SET_MULTCOUNT, (void *)mult, "HDIO_SET_MULTCOUNT"));
+ #endif
+ 	}
+ 	if (set_readonly) {

Added: trunk/buildroot/package/busybox/busybox-1.5.0-ps.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.5.0-ps.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.5.0-ps.patch	2007-04-05 07:04:31 UTC (rev 18330)
@@ -0,0 +1,13 @@
+--- busybox-1.5.0/procps/ps.c	Thu Mar 22 22:21:37 2007
++++ busybox-1.5.0-ps/procps/ps.c	Wed Mar 28 23:57:34 2007
+@@ -262,7 +262,9 @@
+ 		parse_o(default_o);
+ 	post_process();
+ 
+-	terminal_width = INT_MAX;
++	/* Was INT_MAX, but some libc's go belly up with printf("%.*s")
++	 * and such large widths */
++	terminal_width = 30000;
+ 	if (isatty(1)) {
+ 		get_terminal_width_height(1, &terminal_width, NULL);
+ 		terminal_width--;
