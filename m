From: Andreas Ehmanns <universeII@gmx.de>
Date: Fri, 26 Feb 2016 12:16:13 +0100
Subject: [Buildroot] [PATCH 1/2] Package nfs-utils: Added check for OK/FAIL
Message-ID: <1456485374-5356-1-git-send-email-universeII@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed unconditional 'done' output when starting
and stopping the daemons. Instead check return value
of daemon and print out OK or FAIL.

Signed-off-by: Andreas Ehmanns <universeII@gmx.de>
---
 package/nfs-utils/S60nfs | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/nfs-utils/S60nfs b/package/nfs-utils/S60nfs
index 5639b8f..0b78c9b 100755
--- a/package/nfs-utils/S60nfs
+++ b/package/nfs-utils/S60nfs
@@ -25,20 +25,20 @@ start() {
 	# Start daemons.
 	printf "Starting NFS statd: "
 	rpc.statd
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
 	touch /var/lock/subsys/nfslock
-	echo "done"
-
+	
 	printf "Starting NFS services: "
 	/usr/sbin/exportfs -r
-	echo "done"
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
 
 	printf "Starting NFS daemon: "
 	rpc.nfsd ${NR_THREADS}
-	echo "done"
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
 
 	printf "Starting NFS mountd: "
 	rpc.mountd
-	echo "done"
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
 	touch /var/lock/subsys/nfs
 }
 
@@ -46,21 +46,21 @@ stop() {
 	# Stop daemons.
 	printf "Shutting down NFS mountd: "
 	killall -q rpc.mountd
-	echo "done"
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
 
 	printf "Shutting down NFS daemon: "
 	kill -9 `pidof nfsd` 2>/dev/null
-	echo "done"
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
 
 	printf "Shutting down NFS services: "
 	/usr/sbin/exportfs -au
 	rm -f /var/lock/subsys/nfs
 	killall -q rpc.statd
-	echo "done"
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
 
 	printf "Stopping NFS statd: "
 	killall -q rpc.statd
-	echo "done"
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
 	rm -f /var/lock/subsys/nfslock
 }
 
-- 
2.1.4
