From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Feb 2015 23:19:07 +0100
Subject: [Buildroot] [git commit] busybox: S01logging: implement restart
Message-ID: <20150201221912.72D9280450@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=034520c2c11ef3d913ddeb7a0bf5a928560b51fc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

restart wasn't doing anything, and the expected behaviour is stop/start.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/S01logging |   18 ++++++++++++++----
 1 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/package/busybox/S01logging b/package/busybox/S01logging
index b7af2a7..2909370 100644
--- a/package/busybox/S01logging
+++ b/package/busybox/S01logging
@@ -3,20 +3,30 @@
 # Start logging
 #
 
-case "$1" in
-  start)
+start() {
 	echo -n "Starting logging: "
 	start-stop-daemon -b -S -q -m -p /var/run/syslogd.pid --exec /sbin/syslogd -- -n
 	start-stop-daemon -b -S -q -m -p /var/run/klogd.pid --exec /sbin/klogd -- -n
 	echo "OK"
-	;;
-  stop)
+}
+
+stop() {
 	echo -n "Stopping logging: "
 	start-stop-daemon -K -q -p /var/run/syslogd.pid
 	start-stop-daemon -K -q -p /var/run/klogd.pid
 	echo "OK"
+}
+
+case "$1" in
+  start)
+	start
+	;;
+  stop)
+	stop
 	;;
   restart|reload)
+	stop
+	start
 	;;
   *)
 	echo "Usage: $0 {start|stop|restart}"
