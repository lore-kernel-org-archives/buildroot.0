From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 28 Feb 2008 06:38:07 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20080228143807.321DF12C7D9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-02-28 06:38:06 -0800 (Thu, 28 Feb 2008)
New Revision: 21138

Log:
busybox 1.9.1 fixes


Added:
   trunk/buildroot/package/busybox/busybox-1.9.1-lineedit.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.9.1-lineedit.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.9.1-lineedit.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.9.1-lineedit.patch	2008-02-28 14:38:06 UTC (rev 21138)
@@ -0,0 +1,19 @@
+--- busybox-1.9.1/libbb/lineedit.c	Tue Feb 12 17:10:25 2008
++++ busybox-1.9.1-lineedit/libbb/lineedit.c	Mon Feb 18 23:26:54 2008
+@@ -246,7 +246,15 @@
+ 	if (cmdedit_x >= num) {
+ 		cmdedit_x -= num;
+ 		if (num <= 4) {
+-			printf("\b\b\b\b" + (4-num));
++			/* This is longer by 5 bytes on x86.
++			 * Also gets mysteriously
++			 * miscompiled for some ARM users.
++			 * printf(("\b\b\b\b" + 4) - num);
++			 * return;
++			 */
++			do {
++				bb_putchar('\b');
++			} while (--num);
+ 			return;
+ 		}
+ 		printf("\033[%uD", num);
