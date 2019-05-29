From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Wed, 29 May 2019 16:25:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/busybox: update S10mdev
Message-ID: <20190529142528.256795-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Avoid race conditions in mdev invocations
* use the uevent daemon if possible
* fallback to hotplug (as before) and initialize /dev/mdev.seq
* otherwise print an error message and do nothing else

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 package/busybox/S10mdev | 66 +++++++++++++++++++++++++++++++++++------
 1 file changed, 57 insertions(+), 9 deletions(-)

diff --git a/package/busybox/S10mdev b/package/busybox/S10mdev
index 7075b77016..f1a836da32 100644
--- a/package/busybox/S10mdev
+++ b/package/busybox/S10mdev
@@ -1,20 +1,68 @@
 #!/bin/sh
 #
-# Start mdev....
+# Start mdev, using the uevent daemon whereas possible
 #
 
-case "$1" in
-  start)
-	echo "Starting mdev..."
-	echo /sbin/mdev >/proc/sys/kernel/hotplug
+DAEMON="uevent"
+PIDFILE="/var/run/$DAEMON.pid"
+
+has_uevent_and_netlink() {
+	[ -f /proc/net/netlink ] && [ -x /sbin/uevent ]
+}
+
+has_hotplug() {
+	[ -w /proc/sys/kernel/hotplug ]
+}
+
+
+start() {
+	if has_uevent_and_netlink; then
+		echo -n "Starting mdev within uevent... "
+		start-stop-daemon -S -b -m -p $PIDFILE -x /sbin/uevent -- /sbin/mdev
+		[ $? -eq 0 ] && echo "OK" || echo "FAIL"
+	elif has_hotplug; then
+		echo "Installing mdev as hotplug helper"
+		# Initialize the seq counter to prevent plug/unplug races
+		touch /dev/mdev.seq
+		echo /sbin/mdev > /proc/sys/kernel/hotplug
+	else
+		echo "ERROR: neither netlink+uevent nor hotplug are available"
+		echo "       Unable to start mdev !"
+		exit 1
+	fi
+
+	# Run boot time /sys scan
 	/sbin/mdev -s
+
 	# coldplug modules
 	find /sys/ -name modalias -print0 | xargs -0 sort -u | tr '\n' '\0' | \
 	    xargs -0 modprobe -abq
-	;;
-  stop)
-	;;
-  restart|reload)
+}
+
+stop() {
+	if has_uevent_and_netlink; then
+		echo -n "Stopping mdev within uevent... "
+		start-stop-daemon -K -p $PIDFILE
+		[ $? -eq 0 ] && echo "OK" || echo "FAIL"
+	elif has_hotplug; then
+		echo "Uninstalling mdev from hotplug helper"
+		echo > /proc/sys/kernel/hotplug
+	else
+		echo "ERROR: neither netlink+uevent nor hotplug are available"
+		echo "       Unable to stop mdev !"
+		exit 1
+	fi
+}
+
+restart() {
+	stop
+	start
+}
+
+
+case "$1" in
+  start|stop|restart)
+	$1
 	;;
   *)
 	echo "Usage: $0 {start|stop|restart}"
-- 
2.21.0
