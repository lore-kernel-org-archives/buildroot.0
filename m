From: unixmania at gmail.com <unixmania@gmail.com>
Date: Wed, 23 Oct 2019 15:05:12 -0300
Subject: [Buildroot] [PATCH] package/acpid: refactor init script
Message-ID: <20191023180512.21400-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Adapt the format to the current template, used in other init scripts.

Move the one socond delay in restart to stop, giving acpid time to send
dying gasp to syslog.

Users willing to add start arguments can set the ACPID_ARGS variable in
/etc/default/acpid instead of rewriting the init script.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/acpid/S02acpid | 65 +++++++++++++++++++++++++++++++-----------
 1 file changed, 48 insertions(+), 17 deletions(-)

diff --git a/package/acpid/S02acpid b/package/acpid/S02acpid
index e8d3661674..9017d508ff 100644
--- a/package/acpid/S02acpid
+++ b/package/acpid/S02acpid
@@ -1,22 +1,53 @@
 #!/bin/sh
 
-case "$1" in
-	start)
-		printf "Starting acpid: "
-		start-stop-daemon -S -q -m -b -p /var/run/acpid.pid --exec /usr/sbin/acpid -- -n
-		[ $? = 0 ] && echo "OK" || echo "FAIL"
-		;;
-	stop)
-		printf "Stopping acpid: "
-		start-stop-daemon -K -q -p /var/run/acpid.pid
-		[ $? = 0 ] && echo "OK" || echo "FAIL"
-		;;
-	restart)
-		"$0" stop
+DAEMON="acpid"
+EXEC="/usr/sbin/$DAEMON"
+PIDFILE="/var/run/$DAEMON.pid"
+
+ACPID_ARGS=""
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -p "$PIDFILE" -x "$EXEC" \
+		-- -n $ACPID_ARGS
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+stop() {
+	printf 'Stopping %s: ' "$DAEMON"
+	start-stop-daemon -K -q -p "$PIDFILE" -x "$EXEC"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		# Give acpid time to send dying gasp to syslog
 		sleep 1
-		"$0" start
-		;;
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+	start|stop|restart)
+		"$1";;
+	reload)
+		restart;;
 	*)
-		echo "Usage: $0 {start|stop|restart}"
-		;;
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
 esac
-- 
2.18.1
