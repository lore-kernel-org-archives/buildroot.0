From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon, 25 Sep 2017 06:57:55 -0300
Subject: [Buildroot] [PATCH] radvd: improve startup script
Message-ID: <1506333475-4759-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The previous script caused a failure if /etc/radvd.conf did not exist.

This is a simple copy/paste/edit of package/dnsmasq/S80dnsmasq.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/radvd/S50radvd | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/package/radvd/S50radvd b/package/radvd/S50radvd
index 9f1407c..dcc2af6 100755
--- a/package/radvd/S50radvd
+++ b/package/radvd/S50radvd
@@ -1,18 +1,26 @@
 #!/bin/sh
 
-RADVD=/usr/sbin/radvd
+[ -x /usr/sbin/radvd ] || exit 0
+[ -f /etc/radvd.conf ] || exit 0
 
-echo "1" > /proc/sys/net/ipv6/conf/all/forwarding
+case "$1" in
+	start)
+		printf "Starting radvd: "
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
 
-printf "Starting radvd: "
-if [ ! -x "${RADVD}" ]; then
-	echo "missing"
-	exit 1
-fi
-
-if ${RADVD} ; then
-	echo "done"
-else
-	echo "failed"
-	exit 1
-fi
+exit 0
-- 
2.7.5
