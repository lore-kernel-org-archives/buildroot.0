From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Wed, 19 Jun 2019 18:42:57 +0200
Subject: [Buildroot] [PATCH 3/3] package/busybox: run mdev in daemon mode
In-Reply-To: <20190619164257.183607-1-titouan.christophe@railnova.eu>
References: <20190619164257.183607-1-titouan.christophe@railnova.eu>
Message-ID: <20190619164257.183607-4-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Enable the mdev daemon mode in Busybox default config
- Update the S10mdev init script to use the daemon mode

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
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
-- 
2.21.0
