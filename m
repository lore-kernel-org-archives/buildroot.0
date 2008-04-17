From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Thu, 17 Apr 2008 06:47:29 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sfdisk
Message-ID: <20080417134729.7A6E93C46D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-04-17 06:47:29 -0700 (Thu, 17 Apr 2008)
New Revision: 21758

Log:
* Added FIX for rindex/index, will patch util-linux aswell and submit upstream


Added:
   trunk/buildroot/package/sfdisk/sfdisk.010.index-rindex-fix-2.patch


Changeset:
Added: trunk/buildroot/package/sfdisk/sfdisk.010.index-rindex-fix-2.patch
===================================================================
--- trunk/buildroot/package/sfdisk/sfdisk.010.index-rindex-fix-2.patch	                        (rev 0)
+++ trunk/buildroot/package/sfdisk/sfdisk.010.index-rindex-fix-2.patch	2008-04-17 13:47:29 UTC (rev 21758)
@@ -0,0 +1,45 @@
+diff -ru sfdisk_vanilla/sfdisk.c sfdisk_index-rindex-fix/sfdisk.c
+--- sfdisk_vanilla/sfdisk.c	2004-01-13 13:03:11.000000000 +0000
++++ sfdisk_index-rindex-fix/sfdisk.c	2008-04-17 13:44:40.000000000 +0000
+@@ -40,7 +40,7 @@
+ #include <unistd.h>		/* read, write */
+ #include <fcntl.h>		/* O_RDWR */
+ #include <errno.h>		/* ERANGE */
+-#include <string.h>		/* index() */
++#include <string.h>		/* strchr, strrchr */
+ #include <ctype.h>
+ #include <getopt.h>
+ #include <sys/ioctl.h>
+@@ -1672,12 +1672,12 @@
+ 	eof = 1;
+ 	return RD_EOF;
+     }
+-    if (!(lp = index(lp, '\n')))
++    if (!(lp = strchr(lp, '\n')))
+       fatal(_("long or incomplete input line - quitting\n"));
+     *lp = 0;
+ 
+     /* remove comments, if any */
+-    if ((lp = index(line+2, '#')) != 0)
++    if ((lp = strchr(line+2, '#')) != 0)
+       *lp = 0;
+ 
+     /* recognize a few commands - to be expanded */
+@@ -1687,7 +1687,7 @@
+     }
+ 
+     /* dump style? - then bad input is fatal */
+-    if ((ip = index(line+2, ':')) != 0) {
++    if ((ip = strchr(line+2, ':')) != 0) {
+ 	struct dumpfld *d;
+ 
+       nxtfld:
+@@ -2436,7 +2436,7 @@
+ 
+     if (argc < 1)
+       fatal(_("no command?\n"));
+-    if ((progn = rindex(argv[0], '/')) == NULL)
++    if ((progn = strrchr(argv[0], '/')) == NULL)
+       progn = argv[0];
+     else
+       progn++;
