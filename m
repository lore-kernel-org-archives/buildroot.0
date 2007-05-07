From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sun,  6 May 2007 20:59:04 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/nfs-utils
Message-ID: <20070507035904.DC5CE4809D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-05-06 20:59:04 -0700 (Sun, 06 May 2007)
New Revision: 18572

Log:
Fix script so that 'restart' actually works.


Modified:
   trunk/buildroot/package/nfs-utils/init-nfs


Changeset:
Modified: trunk/buildroot/package/nfs-utils/init-nfs
===================================================================
--- trunk/buildroot/package/nfs-utils/init-nfs	2007-05-07 03:58:30 UTC (rev 18571)
+++ trunk/buildroot/package/nfs-utils/init-nfs	2007-05-07 03:59:04 UTC (rev 18572)
@@ -21,9 +21,7 @@
 touch /var/lib/nfs/state
 touch /var/lib/nfs/xtab
 
-# See how we were called.
-case "$1" in
-  start)
+start() {
 	# Start daemons.
 	echo -n "Starting NFS statd: "
 	rpc.statd
@@ -43,8 +41,9 @@
 	rpc.mountd
 	echo "done"
 	touch /var/lock/subsys/nfs
-	;;
-  stop)
+}
+
+stop() {
 	# Stop daemons.
 	echo -n "Shutting down NFS mountd: "
 	killall -q rpc.mountd
@@ -64,7 +63,16 @@
 	killall -q rpc.statd
 	echo "done"
 	rm -f /var/lock/subsys/nfslock
+}
+
+# See how we were called.
+case "$1" in
+  start)
+	start
 	;;
+  stop)
+	stop
+	;;
   restart)
 	stop
 	start
