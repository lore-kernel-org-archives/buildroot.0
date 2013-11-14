From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 14 Nov 2013 09:12:00 -0300
Subject: [Buildroot] [PATCH] dhcp: adjust initscripts and misc details
Message-ID: <1384431120-28205-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Revamp initscripts see bug #3601
* Trim whitespace
* Check for installed binary (dhcp-relay)
* Check for installed config (dhcp-server)
* Check for proper variable setup from the script (both)
* Add "FAIL" message when startup fails (blind OK isn't accurate)
* Add start/stop messages to dhcp-relay

Switch bool to "dhcp (ISC)" to keep in line with package sorting.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dhcp/Config.in      |  2 +-
 package/dhcp/S80dhcp-relay  | 27 ++++++++++++---------------
 package/dhcp/S80dhcp-server | 21 +++++++--------------
 3 files changed, 20 insertions(+), 30 deletions(-)

diff --git a/package/dhcp/Config.in b/package/dhcp/Config.in
index e341485..7944ede 100644
--- a/package/dhcp/Config.in
+++ b/package/dhcp/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_DHCP
-	bool "isc dhcp"
+	bool "dhcp (ISC)"
 	# fork()
 	depends on BR2_USE_MMU
 	help
diff --git a/package/dhcp/S80dhcp-relay b/package/dhcp/S80dhcp-relay
index c870ea7..2a632ef 100755
--- a/package/dhcp/S80dhcp-relay
+++ b/package/dhcp/S80dhcp-relay
@@ -3,7 +3,6 @@
 # $Id: dhcp3-relay,v 1.1 2004/04/16 15:41:08 ml Exp $
 #
 
-
 # What servers should the DHCP relay forward requests to?
 # e.g: SERVERS="192.168.0.1"
 SERVERS=""
@@ -14,31 +13,29 @@ INTERFACES=""
 # Additional options that are passed to the DHCP relay daemon?
 OPTIONS=""
 
-
-
-
-# It is not safe to start if we don't have a default configuration...
-echo "/etc/init.d/dhcp-relay not yet configured! - Aborting..."
-exit 1;
-
-
+# Sanity checks
+test -f /usr/sbin/dhcrelay || exit 0
+test -n "$INTERFACES" || exit 0
+test -n "$SERVERS" || exit 0
 
 # Build command line for interfaces (will be passed to dhrelay below.)
 IFCMD=""
-if test "$INTERFACES" != ""; then
-	for I in $INTERFACES; do
-		IFCMD=${IFCMD}"-i "${I}" "
-	done
-fi
+for I in $INTERFACES; do
+	IFCMD=${IFCMD}"-i "${I}" "
+done
 
 DHCRELAYPID=/var/run/dhcrelay.pid
 
 case "$1" in
 	start)
+		echo -n "Starting DHCP relay: "
 		start-stop-daemon -S -x /usr/sbin/dhcrelay -- -q $OPTIONS $IFCMD $SERVERS
+		[ $? == 0 ] && echo "OK" || echo "FAIL"
 		;;
 	stop)
+		echo -n "Stopping DHCP relay: "
 		start-stop-daemon -K -x /usr/sbin/dhcrelay
+		[ $? == 0 ] && echo "OK" || echo "FAIL"
 		;;
 	restart | force-reload)
 		$0 stop
@@ -47,7 +44,7 @@ case "$1" in
 		;;
 	*)
 		echo "Usage: /etc/init.d/dhcp-relay {start|stop|restart|force-reload}"
-		exit 1 
+		exit 1
 esac
 
 exit 0
diff --git a/package/dhcp/S80dhcp-server b/package/dhcp/S80dhcp-server
index 7c7f893..98bd3cc 100755
--- a/package/dhcp/S80dhcp-server
+++ b/package/dhcp/S80dhcp-server
@@ -3,34 +3,27 @@
 # $Id: dhcp3-server.init.d,v 1.4 2003/07/13 19:12:41 mdz Exp $
 #
 
-
-
 # On what interfaces should the DHCP server (dhcpd) serve DHCP requests?
 #       Separate multiple interfaces with spaces, e.g. "eth0 eth1".
 INTERFACES=""
 
-
-# It is not safe to start if we don't have a default configuration...
-echo "/etc/init.d/dhcp-server not yet configured! - Aborting..."
-exit 1;
-
-
-
+# Sanity checks
 test -f /usr/sbin/dhcpd || exit 0
-
+test -f /etc/dhcpd.conf || exit 0
+test -n "$INTERFACES" || exit 0
 
 case "$1" in
 	start)
 		echo -n "Starting DHCP server: "
 		test -d /var/lib/dhcp/ || mkdir -p /var/lib/dhcp/
-		test -f /var/lib/dhcp/dhcpd.leases || touch /var/lib/dhcp/dhcpd.leases	
+		test -f /var/lib/dhcp/dhcpd.leases || touch /var/lib/dhcp/dhcpd.leases
 		start-stop-daemon -S -x /usr/sbin/dhcpd -- -q $INTERFACES
-		echo "."
+		[ $? == 0 ] && echo "OK" || echo "FAIL"
 		;;
 	stop)
 		echo -n "Stopping DHCP server: dhcpd3"
 		start-stop-daemon -K -x /usr/sbin/dhcpd
-		echo "."
+		[ $? == 0 ] && echo "OK" || echo "FAIL"
 		;;
 	restart | force-reload)
 		$0 stop
@@ -42,7 +35,7 @@ case "$1" in
 		;;
 	*)
 		echo "Usage: /etc/init.d/dhcp-server {start|stop|restart|force-reload}"
-		exit 1 
+		exit 1
 esac
 
 exit 0
-- 
1.8.3.2
