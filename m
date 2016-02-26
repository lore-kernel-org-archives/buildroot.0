From: Andreas Ehmanns <universeII@gmx.de>
Date: Fri, 26 Feb 2016 12:16:14 +0100
Subject: [Buildroot] [PATCH 2/2] Package nfs-utils: Start/stop daemons
	consistently
In-Reply-To: <1456485374-5356-1-git-send-email-universeII@gmx.de>
References: <1456485374-5356-1-git-send-email-universeII@gmx.de>
Message-ID: <1456485374-5356-2-git-send-email-universeII@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changed init script to start and stop all nfs daemons
in a consistent way. Using the same kill command,
start/stop the daemon, printout OK or FAIL and touch
or deleted necessary files.

Signed-off-by: Andreas Ehmanns <universeII@gmx.de>
---
 package/nfs-utils/S60nfs | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/nfs-utils/S60nfs b/package/nfs-utils/S60nfs
index 0b78c9b..c9368b4 100755
--- a/package/nfs-utils/S60nfs
+++ b/package/nfs-utils/S60nfs
@@ -27,7 +27,7 @@ start() {
 	rpc.statd
 	[ $? = 0 ] && echo "OK" || echo "FAIL"
 	touch /var/lock/subsys/nfslock
-	
+
 	printf "Starting NFS services: "
 	/usr/sbin/exportfs -r
 	[ $? = 0 ] && echo "OK" || echo "FAIL"
@@ -49,18 +49,18 @@ stop() {
 	[ $? = 0 ] && echo "OK" || echo "FAIL"
 
 	printf "Shutting down NFS daemon: "
-	kill -9 `pidof nfsd` 2>/dev/null
+	killall -q -9 nfsd 2>/dev/null
 	[ $? = 0 ] && echo "OK" || echo "FAIL"
 
 	printf "Shutting down NFS services: "
 	/usr/sbin/exportfs -au
-	rm -f /var/lock/subsys/nfs
-	killall -q rpc.statd
 	[ $? = 0 ] && echo "OK" || echo "FAIL"
 
 	printf "Stopping NFS statd: "
 	killall -q rpc.statd
 	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	rm -f /var/lock/subsys/nfs
+	rm -f /var/run/rpc.statd.pid
 	rm -f /var/lock/subsys/nfslock
 }
 
@@ -81,7 +81,7 @@ case "$1" in
 	touch /var/lock/subsys/nfs
 	;;
   *)
-	echo "Usage: nfs {start|stop|reload}"
+	echo "Usage: $0 {start|stop|restart|reload}"
 	exit 1
 esac
 
-- 
2.1.4
