From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 21 Jan 2007 06:36:25 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/makedevs
Message-ID: <20070121143625.01B7548594@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-21 06:36:25 -0800 (Sun, 21 Jan 2007)
New Revision: 17434

Log:
- use makedev to get device number, else it gives wrong major/minor numbers to devices files on systems which use big device numbers.
  Closes #919


Modified:
   trunk/buildroot/target/makedevs/makedevs.c


Changeset:
Modified: trunk/buildroot/target/makedevs/makedevs.c
===================================================================
--- trunk/buildroot/target/makedevs/makedevs.c	2007-01-21 12:58:51 UTC (rev 17433)
+++ trunk/buildroot/target/makedevs/makedevs.c	2007-01-21 14:36:25 UTC (rev 17434)
@@ -490,7 +490,7 @@
 				full_name_inc = xmalloc(strlen(full_name) + 4);
 				for (i = start; i < count; i++) {
 					sprintf(full_name_inc, "%s%d", full_name, i);
-					rdev = (major << 8) + minor + (i * increment - start);
+					rdev = makedev(major, minor + (i * increment - start));
 					if (mknod(full_name_inc, mode, rdev) == -1) {
 						bb_perror_msg("line %d: Couldnt create node %s", linenum, full_name_inc);
 						ret = EXIT_FAILURE;
@@ -506,7 +506,7 @@
 				}
 				free(full_name_inc);
 			} else {
-				rdev = (major << 8) + minor;
+				rdev = makedev(major, minor);
 				if (mknod(full_name, mode, rdev) == -1) {
 					bb_perror_msg("line %d: Couldnt create node %s", linenum, full_name);
 					ret = EXIT_FAILURE;
