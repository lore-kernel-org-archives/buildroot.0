From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 17 Feb 2009 14:04:50 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mtd/mtd-utils
Message-ID: <20090217140450.E917176ABD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-17 14:04:49 +0000 (Tue, 17 Feb 2009)
New Revision: 25353

Log:
mtd-utils: flashcp: handle non-power-of-2 erase size (E.G. for dataflash)

Added:
   trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-all-flashcp-npow2-erase.patch


Changeset:
Added: trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-all-flashcp-npow2-erase.patch
===================================================================
--- trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-all-flashcp-npow2-erase.patch	                        (rev 0)
+++ trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-all-flashcp-npow2-erase.patch	2009-02-17 14:04:49 UTC (rev 25353)
@@ -0,0 +1,23 @@
+flashcp: handle non-power-of-2 erase size (E.G. for dataflash)
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ flashcp.c |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+Index: mtd-utils-1.1.0/flashcp.c
+===================================================================
+--- mtd-utils-1.1.0.orig/flashcp.c	2007-08-03 15:55:51.000000000 +0200
++++ mtd-utils-1.1.0/flashcp.c	2009-02-17 14:02:09.000000000 +0100
+@@ -255,8 +255,9 @@
+ #warning "Check for smaller erase regions"
+ 
+ 	erase.start = 0;
+-	erase.length = filestat.st_size & ~(mtd.erasesize - 1);
+-	if (filestat.st_size % mtd.erasesize) erase.length += mtd.erasesize;
++	erase.length = (filestat.st_size + mtd.erasesize - 1) / mtd.erasesize;
++	erase.length *= mtd.erasesize;
++
+ 	if (flags & FLAG_VERBOSE)
+ 	{
+ 		/* if the user wants verbose output, erase 1 block at a time and show him/her what's going on */
