From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 15 Apr 2018 23:10:37 -0300
Subject: [Buildroot] [PATCH v3] radvd: improve startup script
In-Reply-To: <1506478569-8657-1-git-send-email-casantos@datacom.ind.br>
References: <1506478569-8657-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <20180416021037.13345-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Add start, stop and restart/reload options.

- Do nothing if /etc/radvd.conf does not exist instead of printing an
  error message. It is valid to install radvd without a configuration
  file. The daemon may be started later by another service with a
  configuration created at run-time.

- Print an error message if the kernel does not support IPv6 forwarding,
  which is required by radvd.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
Changes v2->v3
- Don't the test if the binary is executable. It's unlikely to happen
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
 package/radvd/S50radvd | 54 ++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 41 insertions(+), 13 deletions(-)

diff --git a/package/radvd/S50radvd b/package/radvd/S50radvd
index 9f1407c95a..c27ac4302e 100755
--- a/package/radvd/S50radvd
+++ b/package/radvd/S50radvd
@@ -1,18 +1,46 @@
 #!/bin/sh
 
-RADVD=/usr/sbin/radvd
+test -f /etc/radvd.conf || exit 0
 
-echo "1" > /proc/sys/net/ipv6/conf/all/forwarding
-
-printf "Starting radvd: "
-if [ ! -x "${RADVD}" ]; then
-	echo "missing"
+test -f /proc/sys/net/ipv6/conf/all/forwarding || {
+	echo "Error: radvd requires IPv6 forwarding support."
 	exit 1
-fi
+}
 
-if ${RADVD} ; then
-	echo "done"
-else
-	echo "failed"
-	exit 1
-fi
+start() {
+	printf "Starting radvd: "
+	echo "1" > /proc/sys/net/ipv6/conf/all/forwarding
+	start-stop-daemon -S -x /usr/sbin/radvd || {
+		echo "FAIL"
+		exit 1
+	}
+	echo "OK"
+}
+
+stop() {
+	printf "Stopping radvd: "
+	start-stop-daemon -K -q -x /usr/sbin/radvd || {
+		echo "FAIL"
+		exit 1
+	}
+	echo "OK"
+}
+
+case "$1" in
+	start)
+		start
+		;;
+	stop)
+		stop
+		;;
+	restart|reload)
+		stop
+		sleep 1
+		start
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+		exit 1
+esac
+
+exit 0
-- 
2.14.3
