From: =?UTF-8?q?Andr=C3=A9=20Erdmann?= <dywi@mailerd.de>
Date: Sun, 26 Oct 2014 18:41:43 +0100
Subject: [Buildroot] [PATCH 1/4] sysv init scripts: fix == bashism
Message-ID: <1414345306-27184-1-git-send-email-dywi@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

test a == b is not available in e.g. dash.

Command(s) used for editing:

  q=\[\"\'\]
  operand="${q}?[$]?[a-zA-Z0-9_\?]+${q}?"  ## doesn't detect ${VAR}
  test_expr="(\[\s+${operand}\s+)==(\s+${operand}\s+\])"

  find . -type f -name '[SK][0-9][0-9]*' | \
     xargs sed -r -e "s@${test_expr}@\1=\2 at g" -i

Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
---
 package/acpid/S02acpid                   |  4 ++--
 package/bind/S81named                    |  4 ++--
 package/dhcp/S80dhcp-relay               |  4 ++--
 package/dhcp/S80dhcp-server              |  4 ++--
 package/dnsmasq/S80dnsmasq               |  4 ++--
 package/dropbear/S50dropbear             |  4 ++--
 package/haveged/S21haveged               |  4 ++--
 package/inadyn/S70inadyn                 |  4 ++--
 package/openntpd/S49ntp                  |  4 ++--
 package/samba4/S91smb                    | 10 +++++-----
 package/shairport-sync/S99shairport-sync |  4 ++--
 package/xbmc/S50xbmc                     |  4 ++--
 12 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/package/acpid/S02acpid b/package/acpid/S02acpid
index c2221fc..0840305 100755
--- a/package/acpid/S02acpid
+++ b/package/acpid/S02acpid
@@ -4,12 +4,12 @@ case "$1" in
 	start)
 		echo -n "Starting acpid: "
 		start-stop-daemon -S -q -m -b -p /var/run/acpid.pid --exec /usr/sbin/acpid -- -n
-		[ $? == 0 ] && echo "OK" || echo "FAIL"
+		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
 	stop)
 		echo -n "Stopping acpid: "
 		start-stop-daemon -K -q -p /var/run/acpid.pid
-		[ $? == 0 ] && echo "OK" || echo "FAIL"
+		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
 	restart)
 		"$0" stop
diff --git a/package/bind/S81named b/package/bind/S81named
index 4010886..4581eb3 100644
--- a/package/bind/S81named
+++ b/package/bind/S81named
@@ -16,12 +16,12 @@ case "$1" in
 		fi
 		echo -n "Starting domain name daemon: "
 		start-stop-daemon -S -x $DAEMON -- -c $CONFIG -u named
-		[ $? == 0 ] && echo "OK" || echo "FAIL"
+		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
 	stop)
 		echo -n "Stopping domain name daemon: "
 		rndc stop || start-stop-daemon -K -x $DAEMON
-		[ $? == 0 ] && echo "OK" || echo "FAIL"
+		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
 	restart)
 		$0 stop || true
diff --git a/package/dhcp/S80dhcp-relay b/package/dhcp/S80dhcp-relay
index 2a632ef..9faa13d 100755
--- a/package/dhcp/S80dhcp-relay
+++ b/package/dhcp/S80dhcp-relay
@@ -30,12 +30,12 @@ case "$1" in
 	start)
 		echo -n "Starting DHCP relay: "
 		start-stop-daemon -S -x /usr/sbin/dhcrelay -- -q $OPTIONS $IFCMD $SERVERS
-		[ $? == 0 ] && echo "OK" || echo "FAIL"
+		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
 	stop)
 		echo -n "Stopping DHCP relay: "
 		start-stop-daemon -K -x /usr/sbin/dhcrelay
-		[ $? == 0 ] && echo "OK" || echo "FAIL"
+		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
 	restart | force-reload)
 		$0 stop
diff --git a/package/dhcp/S80dhcp-server b/package/dhcp/S80dhcp-server
index 5280c31..fb99f9a 100755
--- a/package/dhcp/S80dhcp-server
+++ b/package/dhcp/S80dhcp-server
@@ -18,12 +18,12 @@ case "$1" in
 		test -d /var/lib/dhcp/ || mkdir -p /var/lib/dhcp/
 		test -f /var/lib/dhcp/dhcpd.leases || touch /var/lib/dhcp/dhcpd.leases
 		start-stop-daemon -S -x /usr/sbin/dhcpd -- -q $INTERFACES
-		[ $? == 0 ] && echo "OK" || echo "FAIL"
+		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
 	stop)
 		echo -n "Stopping DHCP server: dhcpd3"
 		start-stop-daemon -K -x /usr/sbin/dhcpd
-		[ $? == 0 ] && echo "OK" || echo "FAIL"
+		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
 	restart | force-reload)
 		$0 stop
diff --git a/package/dnsmasq/S80dnsmasq b/package/dnsmasq/S80dnsmasq
index 2ff0206..587751e 100755
--- a/package/dnsmasq/S80dnsmasq
+++ b/package/dnsmasq/S80dnsmasq
@@ -7,12 +7,12 @@ case "$1" in
 	start)
 		echo -n "Starting dnsmasq: "
 		start-stop-daemon -S -x /usr/sbin/dnsmasq
-		[ $? == 0 ] && echo "OK" || echo "FAIL"
+		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
 	stop)
 		echo -n "Stopping dnsmasq: "
 		start-stop-daemon -K -q -x /usr/sbin/dnsmasq
-		[ $? == 0 ] && echo "OK" || echo "FAIL"
+		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
 	restart|reload)
 		$0 stop
diff --git a/package/dropbear/S50dropbear b/package/dropbear/S50dropbear
index f36165a..2694931 100644
--- a/package/dropbear/S50dropbear
+++ b/package/dropbear/S50dropbear
@@ -13,12 +13,12 @@ start() {
 	umask 077
 	start-stop-daemon -S -q -p /var/run/dropbear.pid \
 		--exec /usr/sbin/dropbear -- $DROPBEAR_ARGS
-	[ $? == 0 ] && echo "OK" || echo "FAIL"
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
 }
 stop() {
 	echo -n "Stopping dropbear sshd: "
 	start-stop-daemon -K -q -p /var/run/dropbear.pid
-	[ $? == 0 ] && echo "OK" || echo "FAIL"
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
 }
 restart() {
 	stop
diff --git a/package/haveged/S21haveged b/package/haveged/S21haveged
index f17cd29..1918b27 100755
--- a/package/haveged/S21haveged
+++ b/package/haveged/S21haveged
@@ -6,12 +6,12 @@ case "$1" in
 	start)
 		echo -n "Starting haveged: "
 		start-stop-daemon -S -x /usr/sbin/haveged -- -w 1024 -r 0
-		[ $? == 0 ] && echo "OK" || echo "FAIL"
+		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
 	stop)
 		echo -n "Stopping haveged: "
 		start-stop-daemon -K -x /usr/sbin/haveged
-		[ $? == 0 ] && echo "OK" || echo "FAIL"
+		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
 	restart|reload)
 		$0 stop
diff --git a/package/inadyn/S70inadyn b/package/inadyn/S70inadyn
index b5d7eed..9f2cbf7 100644
--- a/package/inadyn/S70inadyn
+++ b/package/inadyn/S70inadyn
@@ -16,12 +16,12 @@ case "$1" in
 	start)
 		echo "Starting inadyn: "
 		start-stop-daemon -S -x /usr/bin/inadyn
-		[ $? == 0 ] && echo "OK" || echo "FAIL"
+		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
 	stop)
 		echo  "Stopping inadyn: "
 		start-stop-daemon -q -K -x /usr/bin/inadyn
-		[ $? == 0 ] && echo "OK" || echo "FAIL"
+		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		rm -f /var/run/inadyn/inadyn.pid
 		;;
 	restart)
diff --git a/package/openntpd/S49ntp b/package/openntpd/S49ntp
index 99e0f68..8bbe795 100755
--- a/package/openntpd/S49ntp
+++ b/package/openntpd/S49ntp
@@ -7,12 +7,12 @@ case "$1" in
 	start)
 		echo -n "Starting openntpd: "
 		start-stop-daemon -S -x /usr/sbin/ntpd
-		[ $? == 0 ] && echo "OK" || echo "FAIL"
+		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
 	stop)
 		echo -n "Stopping openntpd: "
 		start-stop-daemon -K -x /usr/sbin/ntpd
-		[ $? == 0 ] && echo "OK" || echo "FAIL"
+		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
 	restart)
 		"$0" stop
diff --git a/package/samba4/S91smb b/package/samba4/S91smb
index 0cd0057..ce14e19 100644
--- a/package/samba4/S91smb
+++ b/package/samba4/S91smb
@@ -7,21 +7,21 @@ mkdir -p /var/log/samba
 start() {
 	echo -n "Starting SMB services: "
 	smbd -D
-	[ $? == 0 ] && echo "OK" || echo "FAIL"
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
 
 	echo -n "Starting NMB services: "
 	nmbd -D
-	[ $? == 0 ] && echo "OK" || echo "FAIL"
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
 }
 
 stop() {
 	echo -n "Shutting down SMB services: "
 	kill -9 `pidof smbd`
-	[ $? == 0 ] && echo "OK" || echo "FAIL"
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
 
 	echo -n "Shutting down NMB services: "
 	kill -9 `pidof nmbd`
-	[ $? == 0 ] && echo "OK" || echo "FAIL"
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
 }
 
 restart() {
@@ -32,7 +32,7 @@ restart() {
 reload() {
         echo -n "Reloading smb.conf file: "
 	kill -HUP `pidof smbd`
-	[ $? == 0 ] && echo "OK" || echo "FAIL"
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
 }
 
 case "$1" in
diff --git a/package/shairport-sync/S99shairport-sync b/package/shairport-sync/S99shairport-sync
index 8e88c1b..31359fc 100644
--- a/package/shairport-sync/S99shairport-sync
+++ b/package/shairport-sync/S99shairport-sync
@@ -7,12 +7,12 @@ case "$1" in
     start)
 	echo -n "Starting shairport-sync: "
 	start-stop-daemon -S -q -m -b -p /var/run/shairport-sync.pid --exec /usr/bin/shairport-sync -- $OPTIONS
-	[ $? == 0 ] && echo "OK" || echo "FAIL"
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
 	;;
     stop)
 	echo -n "Stopping shairport-sync: "
 	start-stop-daemon -K -q -p /var/run/shairport-sync.pid
-	[ $? == 0 ] && echo "OK" || echo "FAIL"
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
 	;;
     restart)
 	$0 stop
diff --git a/package/xbmc/S50xbmc b/package/xbmc/S50xbmc
index 312452b..80cc017 100755
--- a/package/xbmc/S50xbmc
+++ b/package/xbmc/S50xbmc
@@ -11,12 +11,12 @@ PIDFILE=/var/run/xbmc.pid
 start() {
 	echo -n "Starting XBMC: "
 	start-stop-daemon -S -q -b -m -p $PIDFILE --exec $BIN -- $XBMC $XBMC_ARGS
-	[ $? == 0 ] && echo "OK" || echo "FAIL"
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
 }
 stop() {
 	echo -n "Stopping XBMC: "
 	start-stop-daemon -K -q -p $PIDFILE
-	[ $? == 0 ] && echo "OK" || echo "FAIL"
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
 }
 restart() {
 	stop
-- 
2.1.2
