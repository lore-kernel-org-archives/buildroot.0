From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 20 Jan 2009 20:06:37 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mtd/mtd-utils
Message-ID: <20090120200637.BBC04770AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-20 20:06:36 +0000 (Tue, 20 Jan 2009)
New Revision: 24925

Log:
mtd/mtd-utils: mkfs.jffs2: fix device_table handling

Added:
   trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-all-mkfs.jffs2-device_table-fix.patch


Changeset:
Added: trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-all-mkfs.jffs2-device_table-fix.patch
===================================================================
--- trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-all-mkfs.jffs2-device_table-fix.patch	                        (rev 0)
+++ trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-all-mkfs.jffs2-device_table-fix.patch	2009-01-20 20:06:36 UTC (rev 24925)
@@ -0,0 +1,23 @@
+mkfs.jffs2.c: fix device_table handling
+
+find_filesystem_entry would ignore device_table entries for existing elements
+if the device type / permissions weren't exactly the same, effectively
+rendering device_table useless.
+---
+ mkfs.jffs2.c |    3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+Index: mtd-utils-1.1.0/mkfs.jffs2.c
+===================================================================
+--- mtd-utils-1.1.0.orig/mkfs.jffs2.c
++++ mtd-utils-1.1.0/mkfs.jffs2.c
+@@ -246,8 +246,7 @@
+ 		e = dir->files;
+ 	}
+ 	while (e) {
+-		/* Only bother to do the expensive strcmp on matching file types */
+-		if (type == (e->sb.st_mode & S_IFMT)) {
++		if (1) {
+ 			if (S_ISDIR(e->sb.st_mode)) {
+ 				int len = strlen(e->fullname);
+ 
