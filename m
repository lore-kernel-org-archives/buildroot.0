From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  8 Dec 2008 05:41:59 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/udev
Message-ID: <20081208134159.7D75E3C767@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-08 05:41:59 -0800 (Mon, 08 Dec 2008)
New Revision: 24320

Log:
package/udev: create base device nodes after mounting a new /dev

Currently, udev won't start for me, as we've just mounted a new /dev,
which is completely empty, and udevd requires a /dev/null.

This change manually creates the three base device nodes (zero, null
and console) so that udev can start.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

Modified:
   trunk/buildroot/package/udev/S10udev


Changeset:
Modified: trunk/buildroot/package/udev/S10udev
===================================================================
--- trunk/buildroot/package/udev/S10udev	2008-12-08 13:41:56 UTC (rev 24319)
+++ trunk/buildroot/package/udev/S10udev	2008-12-08 13:41:59 UTC (rev 24320)
@@ -58,6 +58,9 @@
 	exit 1
 
         mkdir $udev_root/pts $udev_root/shm
+        mknod -m 0666 /dev/null c 1 3
+        mknod -m 0666 /dev/zero c 1 5
+        mknod -m 0600 /dev/console c 5 1
 
         # populate /dev (normally)
         echo -n "Populating $udev_root using udev: "
