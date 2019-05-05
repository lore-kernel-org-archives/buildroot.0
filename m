From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 May 2019 21:14:48 +0200
Subject: [Buildroot] [git commit] package/radvd: improve startup script
Message-ID: <20190505191231.E906384266@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=711ae58a536a106791c437ed15cb618d6af4eb23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Add start, stop and restart/reload options, following the logic used
  in other init scripts (e.g. S01syslogd).

- Do nothing if /etc/radvd.conf does not exist instead of printing an
  error message. It is valid to install radvd without a configuration
  file. The daemon may be started later by another service with a
  configuration created at run-time.

- Print an error message if the kernel does not support IPv6 forwarding,
  which is required by radvd.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/radvd/S50radvd | 65 ++++++++++++++++++++++++++++++++++++++++----------
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
