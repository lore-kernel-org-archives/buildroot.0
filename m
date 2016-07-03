From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 Jul 2016 16:04:34 +0200
Subject: [Buildroot] [git commit] Package nfs-utils: Added check for OK/FAIL
Message-ID: <20160703140503.5FA5582117@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e122862c2419baea9bd60627f9211ee768ac3f55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed unconditional 'done' output when starting
and stopping the daemons. Instead check return value
of daemon and print out OK or FAIL.

Signed-off-by: Andreas Ehmanns <universeII@gmx.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nfs-utils/S60nfs | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/nfs-utils/S60nfs b/package/nfs-utils/S60nfs
index 5639b8f..7a49c79 100755
--- a/package/nfs-utils/S60nfs
+++ b/package/nfs-utils/S60nfs
@@ -25,20 +25,20 @@ start() {
 	# Start daemons.
 	printf "Starting NFS statd: "
 	rpc.statd
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
 	touch /var/lock/subsys/nfslock
-	echo "done"
 
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
 
