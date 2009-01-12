From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 12 Jan 2009 09:36:58 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20090112093658.5928F766E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-12 09:36:57 +0000 (Mon, 12 Jan 2009)
New Revision: 24789

Log:
busybox: 1.13.2 mdev fix

Added:
   trunk/buildroot/package/busybox/busybox-1.13.2-mdev.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.13.2-mdev.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.2-mdev.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.13.2-mdev.patch	2009-01-12 09:36:57 UTC (rev 24789)
@@ -0,0 +1,39 @@
+--- busybox-1.13.2/testsuite/mdev.tests	Sun Nov  9 18:28:19 2008
++++ busybox-1.13.2-mdev/testsuite/mdev.tests	Mon Jan 12 08:59:15 2009
+@@ -111,6 +111,22 @@
+ 
+ # continuing to use directory structure from prev test
+ rm -rf mdev.testdir/dev/*
++echo "sda 0:0 644 =block/ @echo @echo TEST" >mdev.testdir/etc/mdev.conf
++testing "mdev move and command" \
++	"env - PATH=$PATH ACTION=add DEVPATH=/block/sda chroot mdev.testdir /mdev 2>&1;
++	ls -lnR mdev.testdir/dev | $FILTER_LS2" \
++"\
++ at echo TEST
++mdev.testdir/dev:
++drwxr-xr-x 2 0 0 block
++
++mdev.testdir/dev/block:
++brw-r--r-- 1 0 0 sda
++" \
++	"" ""
++
++# continuing to use directory structure from prev test
++rm -rf mdev.testdir/dev/*
+ echo "@8,0 :1 644" >mdev.testdir/etc/mdev.conf
+ testing "mdev #maj,min and no explicit uid" \
+ 	"env - PATH=$PATH ACTION=add DEVPATH=/block/sda chroot mdev.testdir /mdev 2>&1;
+--- busybox-1.13.2/util-linux/mdev.c	Sun Nov  9 18:28:22 2008
++++ busybox-1.13.2-mdev/util-linux/mdev.c	Mon Jan 12 08:59:15 2009
+@@ -179,8 +179,9 @@
+ 			unsigned i, n;
+ #endif
+ 			char *a = val;
+-			s = strchr(val, ' ');
+-			val = (s && s[1]) ? s+1 : NULL;
++			s = strchrnul(val, ' ');
++			val = (s[0] && s[1]) ? s+1 : NULL;
++			s[0] = '\0';
+ #if ENABLE_FEATURE_MDEV_RENAME_REGEXP
+ 			/* substitute %1..9 with off[1..9], if any */
+ 			n = 0;
