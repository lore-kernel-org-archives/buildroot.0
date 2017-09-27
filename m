From: Carlos Santos <casantos@datacom.ind.br>
Date: Tue, 26 Sep 2017 23:16:09 -0300
Subject: [Buildroot] [PATCH v2]] radvd: improve startup script
In-Reply-To: <7d0f3151-bce7-8512-bae1-2c0d44717faf@mind.be>
References: <7d0f3151-bce7-8512-bae1-2c0d44717faf@mind.be>
Message-ID: <1506478569-8657-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Print an error message if /usr/sbin/radvd is missing.

Print an error message if the kernel does not support IPv6 forwarding,
which is required by radvd.

Ignore any start/stop/restart option if /etc/radvd.conf does not exist.
The previous script printed an error message in this case but is valid
to install radvd without a configuration file. The daemon may be started
later by another service with a configuration created at run-time.

This is a copy/paste/edit/fix of package/dnsmasq/S80dnsmasq.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
Changes v1->v2
- Print error message is /usr/sbin/radvd is missing
- Print error message if /proc/sys/net/ipv6/conf/all/forwarding is
  missing (kernel does not support IPv6 forwarding)
- Echo "1" to /proc/sys/net/ipv6/conf/all/forwarding upon start
---
 package/radvd/S50radvd | 46 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 33 insertions(+), 13 deletions(-)

diff --git a/package/radvd/S50radvd b/package/radvd/S50radvd
index 9f1407c..cc73f29 100755
--- a/package/radvd/S50radvd
+++ b/package/radvd/S50radvd
@@ -1,18 +1,38 @@
 #!/bin/sh
 
-RADVD=/usr/sbin/radvd
-
-echo "1" > /proc/sys/net/ipv6/conf/all/forwarding
-
-printf "Starting radvd: "
-if [ ! -x "${RADVD}" ]; then
-	echo "missing"
+[ -x /usr/sbin/radvd ] || {
+	echo "Error: /usr/sbin/radvd is missing."
 	exit 1
-fi
+}
 
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
+[ -f /etc/radvd.conf ] || {
+	exit 0
+}
+
+case "$1" in
+	start)
+		printf "Starting radvd: "
+		echo "1" > /proc/sys/net/ipv6/conf/all/forwarding
+		start-stop-daemon -S -x /usr/sbin/radvd
+		[ $? = 0 ] && echo "OK" || echo "FAIL"
+		;;
+	stop)
+		printf "Stopping radvd: "
+		start-stop-daemon -K -q -x /usr/sbin/radvd
+		[ $? = 0 ] && echo "OK" || echo "FAIL"
+		;;
+	restart|reload)
+		$0 stop
+		$0 start
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+		exit 1
+esac
+
+exit 0
-- 
2.7.5
