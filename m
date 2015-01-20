From: Richard Genoud <richard.genoud@gmail.com>
Date: Tue, 20 Jan 2015 12:38:35 +0100
Subject: [Buildroot] [PATCH] busybox: S01logging: implement restart
Message-ID: <1421753915-4313-1-git-send-email-richard.genoud@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

restart wasn't doing anything, and the expected behaviour is stop/start.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 package/busybox/S01logging | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/package/busybox/S01logging b/package/busybox/S01logging
index b7af2a7d5dbc..29093707888e 100644
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
-- 
2.0.0
