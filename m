From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 16:08:14 +0200
Subject: [Buildroot] [git commit] package/busybox: run mdev in daemon mode
Message-ID: <20190620141700.709D382833@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=733ea6bb4bec6e9ff9ffd8f7444527f91c72033e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Enable the mdev daemon mode in Busybox default config
- Update the S10mdev init script to use the daemon mode

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/busybox/S10mdev        | 27 +++++++++++++++++++++------
 package/busybox/busybox.config |  1 +
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/package/busybox/S10mdev b/package/busybox/S10mdev
index efef4290ba..3c6f47c18c 100644
--- a/package/busybox/S10mdev
+++ b/package/busybox/S10mdev
@@ -1,13 +1,17 @@
 #!/bin/sh
 #
-# Start mdev....
+# Run the mdev daemon
 #
 
+DAEMON="mdev"
+PIDFILE="/var/run/$DAEMON.pid"
+
 
 start() {
-	echo "Starting mdev..."
-	echo /sbin/mdev >/proc/sys/kernel/hotplug
-	/sbin/mdev -s
+	echo -n "Starting $DAEMON... "
+	start-stop-daemon -S -b -m -p $PIDFILE -x /sbin/mdev -- -df
+	[ $? -eq 0 ] && echo "OK" || echo "ERROR"
+
 	# coldplug modules
 	find /sys/ -name modalias -print0 | \
 		xargs -0 sort -u | \
@@ -15,12 +19,23 @@ start() {
 		xargs -0 modprobe -abq
 }
 
+stop() {
+	echo -n "Stopping $DAEMON... "
+	start-stop-daemon -K -p $PIDFILE
+	[ $? -eq 0 ] && echo "OK" || echo "ERROR"
+}
+
+restart() {
+	stop
+	start
+}
+
 case "$1" in
-  start)
+  start|stop|restart)
 	"$1"
 	;;
   *)
-	echo "Usage: $0 start"
+	echo "Usage: $0 {start|stop|restart}"
 	exit 1
 esac
 
diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index 1d9560d655..c28718a725 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -628,6 +628,7 @@ CONFIG_FEATURE_MDEV_RENAME=y
 # CONFIG_FEATURE_MDEV_RENAME_REGEXP is not set
 CONFIG_FEATURE_MDEV_EXEC=y
 # CONFIG_FEATURE_MDEV_LOAD_FIRMWARE is not set
+CONFIG_FEATURE_MDEV_DAEMON=y
 CONFIG_MESG=y
 CONFIG_FEATURE_MESG_ENABLE_ONLY_GROUP=y
 CONFIG_MKE2FS=y
