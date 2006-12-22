From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 22 Dec 2006 04:22:15 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/cramfs
Message-ID: <20061222122215.BD7384859A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-22 04:22:15 -0800 (Fri, 22 Dec 2006)
New Revision: 17049

Log:
- patch from AndyI to make it behave on Cygwin. Closes #1127. Thanks!


Added:
   trunk/buildroot/target/cramfs/cramfs-03-cygwin_IO.patch


Changeset:
Added: trunk/buildroot/target/cramfs/cramfs-03-cygwin_IO.patch
===================================================================
--- trunk/buildroot/target/cramfs/cramfs-03-cygwin_IO.patch	2006-12-22 12:11:06 UTC (rev 17048)
+++ trunk/buildroot/target/cramfs/cramfs-03-cygwin_IO.patch	2006-12-22 12:22:15 UTC (rev 17049)
@@ -0,0 +1,13 @@
+--- cramfs-1.1/cramfsck.c.orig	2006-12-22 22:16:59.328125000 +1100
++++ cramfs-1.1/cramfsck.c	2006-12-19 01:02:05.531250000 +1100
+@@ -56,6 +56,10 @@
+ #include "linux/cramfs_fs.h"
+ #include <zlib.h>
+ 
++#ifdef __CYGWIN__
++#define _IO(type,nr)	_IOC(_IOC_NONE,(type),(nr),0)
++#endif /* __CYGWIN__ */
++
+ #define BLKGETSIZE	_IO(0x12,96) /* return device size /512 (long *arg) */
+ 
+ /* Exit codes used by fsck-type programs */
