From: Christopher McCrory <chrismcc@gmail.com>
Date: Thu,  2 Jan 2020 12:37:46 +0000
Subject: [Buildroot] [PATCH 1/1] package/dcron: create directories if needed
 on startup
Message-ID: <20200102123746.2404602-1-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Create the /var/spool/cron/crontabs and /var/spool/cron/cronstamps directories
on startup if they don't exist.  By default /var/spool is a symlink to /tmp so
the contents get deleted on reboot.  If the cronstamps directory does not exist
anything in /etc/cron.hourly/ , etc. will fail to run.

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/dcron/S90dcron      | 105 +++++++++++++++++++++++++++++-------
 package/dcron/dcron.service |   6 +++
 2 files changed, 93 insertions(+), 18 deletions(-)

diff --git a/package/dcron/S90dcron b/package/dcron/S90dcron
index de21d2ca13..f51513d41e 100644
--- a/package/dcron/S90dcron
+++ b/package/dcron/S90dcron
@@ -1,22 +1,91 @@
 #!/bin/sh
 
+# Make sure umask is sane
+umask 022
+
+PATH="/sbin:/usr/sbin:/bin:/usr/bin"
+export PATH
+
+DAEMON_NAME="dcron"
+DAEMON_DESC="dcron"
+DAEMON_BINARY="/usr/sbin/crond"
+DAEMON_BASENAME="crond"
+DAEMON_CONFIG="/etc/cron.d/system"
+DAEMON_ARGS="-- -f"
+DAEMON_PID="/var/run/crond.pid"
+
+[ -r /etc/default/$DAEMON_BASENAME ] && . /etc/default/$DAEMON_BASENAME
+[ -x $DAEMON_BINARY ] || exit 5
+[ -r $DAEMON_CONFIG ] || exit 6
+
+start() {
+  printf "Starting $DAEMON_DESC: "
+  [ -d /var/spool/cron/crontabs   ] || mkdir -vp /var/spool/cron/crontabs
+  [ -d /var/spool/cron/cronstamps ] || mkdir -vp /var/spool/cron/cronstamps
+  start-stop-daemon -S -q -b  -m -p $DAEMON_PID  -x $DAEMON_BINARY $DAEMON_ARGS
+  sleep 2 ; status ; RETVAL=$?
+  if [ $RETVAL -ne 0 ]; then
+    echo "FAIL"
+  else
+    echo "OK"
+  fi
+  return $RETVAL
+}
+
+# -R doesn't work with busybox, but doesn't error out
+stop() {
+  printf "Stopping $DAEMON_DESC: "
+  start-stop-daemon -K -R 59 -x $DAEMON_BINARY
+  RETVAL=$?
+  if [ $RETVAL -ne 0 ]; then
+    echo "FAIL"
+  else
+    echo "OK"
+  fi
+  return $RETVAL
+}
+
+status() {
+  PIDS=`pidof $DAEMON_BASENAME`
+  RETVAL=$?
+  if [ $RETVAL -eq 0 ]; then
+    echo "RUNNING (pid $PIDS)"
+  else
+    echo "NOT OK"
+  fi
+  return $RETVAL
+}
+
 case "$1" in
-	start)
-		printf "Starting cron ... "
-		start-stop-daemon -S -q -m -b -p /var/run/dcron.pid --exec /usr/sbin/crond -- -f
-		echo "done."
-		;;
-	stop)
-		printf "Stopping cron ..."
-		start-stop-daemon -K -q -p /var/run/dcron.pid
-		echo "done."
-		;;
-	restart)
-		$0 stop
-		sleep 1
-		$0 start
-		;;
-	*)
-		echo "usage: $0 {start|stop|restart}"
-		;;
+  start)
+    start
+    ;;
+  stop)
+    stop
+    ;;
+  restart)
+    echo "Restarting $DAEMON_DESC: "
+    stop
+    sleep 1
+    start
+    echo ""
+    ;;
+  try-restart)
+    status
+    if [ $RETVAL -eq 0 ]; then
+      stop
+      sleep 1
+      start
+    fi
+    ;;
+  status)
+    printf "Status of $DAEMON_DESC: "
+    status
+    ;;
+  *)
+    echo "Usage: $0 {start|stop|restart|status|try-restart}" >&2
+    exit 3
+    ;;
 esac
+
+exit 0
diff --git a/package/dcron/dcron.service b/package/dcron/dcron.service
index 924ed72205..19c66b1535 100644
--- a/package/dcron/dcron.service
+++ b/package/dcron/dcron.service
@@ -3,6 +3,12 @@ Description=Task scheduler daemon
 After=syslog.target
 
 [Service]
+# make sure directories exist. use -v so it gets logged
+ExecStartPre=/bin/sh -c '\
+test -d /var/spool/cron/crontabs   || mkdir -pv /var/spool/cron/crontabs  ; \
+test -d /var/spool/cron/cronstamps || mkdir -pv /var/spool/cron/cronstamps; \
+'
+
 ExecStart=/usr/sbin/crond -S
 Type=forking
 
-- 
2.18.1
