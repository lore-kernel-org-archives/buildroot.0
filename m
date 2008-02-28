From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Wed, 27 Feb 2008 18:19:38 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/netplug
Message-ID: <20080228021938.E380C120154@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2008-02-27 18:19:38 -0800 (Wed, 27 Feb 2008)
New Revision: 21131

Log:
Remove old patch and fix the type properly.


Added:
   trunk/buildroot/package/netplug/netplug-socklen-type.patch

Removed:
   trunk/buildroot/package/netplug/netplug-getsockname-cast.patch


Changeset:
Deleted: trunk/buildroot/package/netplug/netplug-getsockname-cast.patch
===================================================================
--- trunk/buildroot/package/netplug/netplug-getsockname-cast.patch	2008-02-28 02:13:42 UTC (rev 21130)
+++ trunk/buildroot/package/netplug/netplug-getsockname-cast.patch	2008-02-28 02:19:38 UTC (rev 21131)
@@ -1,12 +0,0 @@
-diff -ur netplug-1.2.9/netlink.c netplug-1.2.9-patched/netlink.c
---- netplug-1.2.9/netlink.c	2005-01-07 23:57:09.000000000 -0600
-+++ netplug-1.2.9-patched/netlink.c	2008-02-27 17:59:48.373864047 -0600
-@@ -286,7 +286,7 @@
- 
-     int addr_len = sizeof(addr);
- 
--    if (getsockname(fd, (struct sockaddr *) &addr, &addr_len) == -1) {
-+    if (getsockname(fd, (struct sockaddr *) &addr, (socklen_t *) &addr_len) == -1) {
-         do_log(LOG_ERR, "Could not get socket details: %m");
-         exit(1);
-     }

Added: trunk/buildroot/package/netplug/netplug-socklen-type.patch
===================================================================
--- trunk/buildroot/package/netplug/netplug-socklen-type.patch	                        (rev 0)
+++ trunk/buildroot/package/netplug/netplug-socklen-type.patch	2008-02-28 02:19:38 UTC (rev 21131)
@@ -0,0 +1,12 @@
+diff -ur netplug-1.2.9/netlink.c netplug-1.2.9-patched/netlink.c
+--- netplug-1.2.9/netlink.c	2005-01-07 23:57:09.000000000 -0600
++++ netplug-1.2.9-patched/netlink.c	2008-02-27 20:18:09.855767996 -0600
+@@ -284,7 +284,7 @@
+         exit(1);
+     }
+ 
+-    int addr_len = sizeof(addr);
++    socklen_t addr_len = sizeof(addr);
+ 
+     if (getsockname(fd, (struct sockaddr *) &addr, &addr_len) == -1) {
+         do_log(LOG_ERR, "Could not get socket details: %m");
