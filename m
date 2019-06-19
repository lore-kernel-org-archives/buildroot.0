From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Wed, 19 Jun 2019 18:42:56 +0200
Subject: [Buildroot] [PATCH 2/3] package/busybox: convert S10mdev to the
 canonical init script format
In-Reply-To: <20190619164257.183607-1-titouan.christophe@railnova.eu>
References: <20190619164257.183607-1-titouan.christophe@railnova.eu>
Message-ID: <20190619164257.183607-3-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 package/busybox/S10mdev | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/package/busybox/S10mdev b/package/busybox/S10mdev
index 7075b77016..efef4290ba 100644
--- a/package/busybox/S10mdev
+++ b/package/busybox/S10mdev
@@ -3,21 +3,24 @@
 # Start mdev....
 #
 
-case "$1" in
-  start)
+
+start() {
 	echo "Starting mdev..."
 	echo /sbin/mdev >/proc/sys/kernel/hotplug
 	/sbin/mdev -s
 	# coldplug modules
-	find /sys/ -name modalias -print0 | xargs -0 sort -u | tr '\n' '\0' | \
-	    xargs -0 modprobe -abq
-	;;
-  stop)
-	;;
-  restart|reload)
+	find /sys/ -name modalias -print0 | \
+		xargs -0 sort -u | \
+		tr '\n' '\0' | \
+		xargs -0 modprobe -abq
+}
+
+case "$1" in
+  start)
+	"$1"
 	;;
   *)
-	echo "Usage: $0 {start|stop|restart}"
+	echo "Usage: $0 start"
 	exit 1
 esac
 
-- 
2.21.0
