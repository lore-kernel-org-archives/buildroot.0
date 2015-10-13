From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit@wsystem.com>
Date: Tue, 13 Oct 2015 11:35:25 +0200
Subject: [Buildroot] [PATCH v2 4/8] package/dhcp: fix SysV init scripts
	output text
In-Reply-To: <1444728929-46246-1-git-send-email-benoit@wsystem.com>
References: <1444728929-46246-1-git-send-email-benoit@wsystem.com>
Message-ID: <1444728929-46246-4-git-send-email-benoit@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix various messages displayed by these scripts:
 - remove extra "dhcpd3" for `S80dhcp-server stop`,
 - make start-stop-daemon quiet in order to avoid extra messages like
   "stopped /usr/sbin/dhcpd (pid 174)" being output between the command
   description and its result,
 - fix the script names in the usage strings.

Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>

---
Changes v1 -> v2:
 - Rebase.
 - Use 'printf' instead of 'echo -n' following
   0f75b2635ee564fbbdb9ea631cf39fa8731d6d6c.
---
 package/dhcp/S80dhcp-relay  | 6 +++---
 package/dhcp/S80dhcp-server | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

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
index 079727b..c56e7c3 100755
--- a/package/dhcp/S80dhcp-server
+++ b/package/dhcp/S80dhcp-server
@@ -23,12 +23,12 @@ case "$1" in
 		printf "Starting DHCP server: "
 		test -d /var/lib/dhcp/ || mkdir -p /var/lib/dhcp/
 		test -f /var/lib/dhcp/dhcpd.leases || touch /var/lib/dhcp/dhcpd.leases
-		start-stop-daemon -S -x /usr/sbin/dhcpd -- -q $OPTIONS $INTERFACES
+		start-stop-daemon -S -q -x /usr/sbin/dhcpd -- -q $OPTIONS $INTERFACES
 		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
 	stop)
-		printf "Stopping DHCP server: dhcpd3"
-		start-stop-daemon -K -x /usr/sbin/dhcpd
+		printf "Stopping DHCP server: "
+		start-stop-daemon -K -q -x /usr/sbin/dhcpd
 		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
 	restart | force-reload)
@@ -40,7 +40,7 @@ case "$1" in
 		fi
 		;;
 	*)
-		echo "Usage: /etc/init.d/dhcp-server {start|stop|restart|force-reload}"
+		echo "Usage: $0 {start|stop|restart|force-reload}"
 		exit 1
 esac
 
-- 
2.1.4
