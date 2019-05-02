From: unixmania at gmail.com <unixmania@gmail.com>
Date: Wed,  1 May 2019 23:01:52 -0300
Subject: [Buildroot] [PATCH v4] package/radvd: improve startup script
Message-ID: <20190502020152.32632-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

- Add start, stop and restart/reload options, following the logic used
  in other init scripts (e.g. S01syslogd).

- Do nothing if /etc/radvd.conf does not exist instead of printing an
  error message. It is valid to install radvd without a configuration
  file. The daemon may be started later by another service with a
  configuration created at run-time.

- Print an error message if the kernel does not support IPv6 forwarding,
  which is required by radvd.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
Changes v3->v4
- Changed SOB, since I don't work for DATACOM anymore.
- Use the same template of other init scripts.

Changes v2->v3
- Don't test if the binary is executable. It's unlikely to happen
  because Buildroot installs both radvd and its init script as part of
  the same package. But if it ever happens for some reason, the error
  message from start-stop-daemon should be pretty clear (Thomas
  Petazzoni).
- Move start and stop to functions and rewrite the error handling code
  to improve its readability.
- Add a one second sleep between stop and start, in restart, as made in
  several other scripts.

Changes v1->v2
- Print error message is /usr/sbin/radvd is missing
- Print error message if /proc/sys/net/ipv6/conf/all/forwarding is
  missing (kernel does not support IPv6 forwarding)
- Echo "1" to /proc/sys/net/ipv6/conf/all/forwarding upon start
---
 package/radvd/S50radvd | 65 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 53 insertions(+), 12 deletions(-)

diff --git a/package/radvd/S50radvd b/package/radvd/S50radvd
index 9f1407c95a..f73ce24ed5 100644
--- a/package/radvd/S50radvd
+++ b/package/radvd/S50radvd
@@ -1,18 +1,59 @@
 #!/bin/sh
 
-RADVD=/usr/sbin/radvd
+DAEMON="radvd"
+PIDFILE="/var/run/$DAEMON.pid"
 
-echo "1" > /proc/sys/net/ipv6/conf/all/forwarding
+RADVD_ARGS="-m syslog"
 
-printf "Starting radvd: "
-if [ ! -x "${RADVD}" ]; then
-	echo "missing"
-	exit 1
-fi
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+[ -f /etc/radvd.conf ] || exit 0
 
-if ${RADVD} ; then
-	echo "done"
-else
-	echo "failed"
+[ -f /proc/sys/net/ipv6/conf/all/forwarding ] || {
+	echo "Error: radvd requires IPv6 forwarding support."
 	exit 1
-fi
+}
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	echo "1" > /proc/sys/net/ipv6/conf/all/forwarding
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
+		-- $RADVD_ARGS
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
+	start-stop-daemon -K -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+restart() {
+	stop
+	sleep 1
+	start
+}
+
+case "$1" in
+	start|stop)
+		"$1";;
+	restart|reload)
+		restart;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
-- 
2.20.1
