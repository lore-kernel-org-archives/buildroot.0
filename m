From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Dec 2015 15:04:54 +0100
Subject: [Buildroot] [git commit] package/dhcp: fix SysV init scripts output
	text
Message-ID: <20151224140513.6A0FA82705@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c11a296dfabb52d32158158782c4da023042763a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix various messages displayed by these scripts:
 - make start-stop-daemon quiet in order to avoid extra messages like
   "stopped /usr/sbin/dhcpd (pid 174)" being output between the command
   description and its result,
 - fix the script names in the usage strings.

Signed-off-by: Beno??t Th??baudeau <benoit@wsystem.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dhcp/S80dhcp-relay  | 6 +++---
 package/dhcp/S80dhcp-server | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/dhcp/S80dhcp-relay b/package/dhcp/S80dhcp-relay
index 0f383e6..6493eda 100755
--- a/package/dhcp/S80dhcp-relay
+++ b/package/dhcp/S80dhcp-relay
@@ -33,12 +33,12 @@ DHCRELAYPID=/var/run/dhcrelay.pid
 case "$1" in
 	start)
 		printf "Starting DHCP relay: "
-		start-stop-daemon -S -x /usr/sbin/dhcrelay -- -q $OPTIONS $IFCMD $SERVERS
+		start-stop-daemon -S -q -x /usr/sbin/dhcrelay -- -q $OPTIONS $IFCMD $SERVERS
 		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
 	stop)
 		printf "Stopping DHCP relay: "
-		start-stop-daemon -K -x /usr/sbin/dhcrelay
+		start-stop-daemon -K -q -x /usr/sbin/dhcrelay
 		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
 	restart | force-reload)
@@ -47,7 +47,7 @@ case "$1" in
 		$0 start
 		;;
 	*)
-		echo "Usage: /etc/init.d/dhcp-relay {start|stop|restart|force-reload}"
+		echo "Usage: $0 {start|stop|restart|force-reload}"
 		exit 1
 esac
 
diff --git a/package/dhcp/S80dhcp-server b/package/dhcp/S80dhcp-server
index 9d59636..f4e2209 100755
--- a/package/dhcp/S80dhcp-server
+++ b/package/dhcp/S80dhcp-server
@@ -26,12 +26,12 @@ case "$1" in
 		printf "Starting DHCP server: "
 		test -d /var/lib/dhcp/ || mkdir -p /var/lib/dhcp/
 		test -f /var/lib/dhcp/dhcpd.leases || touch /var/lib/dhcp/dhcpd.leases
-		start-stop-daemon -S -x ${DAEMON} -- -q $OPTIONS $INTERFACES
+		start-stop-daemon -S -q -x ${DAEMON} -- -q $OPTIONS $INTERFACES
 		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
 	stop)
 		printf "Stopping DHCP server: "
-		start-stop-daemon -K -x ${DAEMON}
+		start-stop-daemon -K -q -x ${DAEMON}
 		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
 	restart | force-reload)
@@ -43,7 +43,7 @@ case "$1" in
 		fi
 		;;
 	*)
-		echo "Usage: /etc/init.d/dhcp-server {start|stop|restart|force-reload}"
+		echo "Usage: $0 {start|stop|restart|force-reload}"
 		exit 1
 esac
 
