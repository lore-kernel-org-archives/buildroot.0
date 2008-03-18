From: hamish at uclibc.org <hamish@uclibc.org>
Date: Mon, 17 Mar 2008 17:20:24 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: dropbear l2tp
	lighttpd mdnsresponder net etc...
Message-ID: <20080318002024.F08F412C605@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-03-17 17:20:24 -0700 (Mon, 17 Mar 2008)
New Revision: 21374

Log:
Don't use long options to start-stop-daemon as they may be disabled in the busybox configuration


Modified:
   trunk/buildroot/package/dropbear/dropbear-init.patch
   trunk/buildroot/package/l2tp/l2tpd
   trunk/buildroot/package/lighttpd/rc.lighttpd
   trunk/buildroot/package/mdnsresponder/rc.mdnsresponder
   trunk/buildroot/package/netplug/S29netplug
   trunk/buildroot/package/sysklogd/S25syslog


Changeset:
Modified: trunk/buildroot/package/dropbear/dropbear-init.patch
===================================================================
--- trunk/buildroot/package/dropbear/dropbear-init.patch	2008-03-18 00:11:46 UTC (rev 21373)
+++ trunk/buildroot/package/dropbear/dropbear-init.patch	2008-03-18 00:20:24 UTC (rev 21374)
@@ -27,12 +27,12 @@
 +
 +start() {
 + 	echo -n "Starting dropbear sshd: "
-+	start-stop-daemon --start --quiet --pidfile /var/run/dropbear.pid --exec /usr/sbin/dropbear
++	start-stop-daemon -S -q -p /var/run/dropbear.pid --exec /usr/sbin/dropbear
 +	echo "OK"
 +}
 +stop() {
 +	echo -n "Stopping sshd: "
-+	start-stop-daemon --stop --quiet --pidfile /var/run/dropbear.pid
++	start-stop-daemon -K -q -p /var/run/dropbear.pid
 +	echo "OK"
 +}
 +restart() {

Modified: trunk/buildroot/package/l2tp/l2tpd
===================================================================
--- trunk/buildroot/package/l2tp/l2tpd	2008-03-18 00:11:46 UTC (rev 21373)
+++ trunk/buildroot/package/l2tp/l2tpd	2008-03-18 00:20:24 UTC (rev 21374)
@@ -8,15 +8,15 @@
 
 case "$1" in
   start)
-    start-stop-daemon --start  --pidfile $PIDFILE --exec $DAEMON -- -D &
+    start-stop-daemon -S  -p $PIDFILE -x $DAEMON -- -D &
     ;;
   stop)
-    start-stop-daemon --stop  --pidfile $PIDFILE --exec $DAEMON
+    start-stop-daemon -K  -p $PIDFILE -x $DAEMON
     ;;
   restart|force-reload)
-    start-stop-daemon --stop  --pidfile $PIDFILE --exec $DAEMON 
+    start-stop-daemon -K  -p $PIDFILE -x $DAEMON 
     sleep 1
-    start-stop-daemon --start  --pidfile $PIDFILE --exec $DAEMON
+    start-stop-daemon -S  -p $PIDFILE -x $DAEMON
     ;;
   *)
     echo "Usage: /etc/init.d/l2tdp {start|stop|restart|force-reload}"

Modified: trunk/buildroot/package/lighttpd/rc.lighttpd
===================================================================
--- trunk/buildroot/package/lighttpd/rc.lighttpd	2008-03-18 00:11:46 UTC (rev 21373)
+++ trunk/buildroot/package/lighttpd/rc.lighttpd	2008-03-18 00:20:24 UTC (rev 21374)
@@ -7,12 +7,12 @@
 
 start() {
  	echo -n "Starting lighttpd: "
-	start-stop-daemon --start --quiet --make-pidfile --pidfile /var/run/lighttpd.pid -b --exec /usr/sbin/lighttpd -- -f /etc/lighttpd/lighttpd.conf -D
+	start-stop-daemon -S -q -m -p /var/run/lighttpd.pid -b -x /usr/sbin/lighttpd -- -f /etc/lighttpd/lighttpd.conf -D
 	echo "OK"
 }
 stop() {
 	echo -n "Stopping lighttpd: "
-	start-stop-daemon --stop --quiet --pidfile /var/run/lighttpd.pid
+	start-stop-daemon -K -q -p /var/run/lighttpd.pid
 	echo "OK"
 }
 restart() {

Modified: trunk/buildroot/package/mdnsresponder/rc.mdnsresponder
===================================================================
--- trunk/buildroot/package/mdnsresponder/rc.mdnsresponder	2008-03-18 00:11:46 UTC (rev 21373)
+++ trunk/buildroot/package/mdnsresponder/rc.mdnsresponder	2008-03-18 00:20:24 UTC (rev 21374)
@@ -7,8 +7,8 @@
 
 start() {
  	echo -n "Starting mdnsd: "
-	start-stop-daemon --start --quiet --pidfile /var/run/mdnsd.pid \
-                --exec /usr/sbin/mdnsd
+	start-stop-daemon -S -q -p /var/run/mdnsd.pid \
+                -x /usr/sbin/mdnsd
 	if [ "$?" != "0" ] ; then
 		echo "FAIL"
 		return 1
@@ -16,8 +16,8 @@
 	echo "OK"
 
 	echo -n "Starting mDNSResponderPosix: "
-	start-stop-daemon --start --quiet --pidfile /var/run/mDNSResponderPosix.pid \
-                --exec /usr/sbin/mDNSResponderPosix \
+	start-stop-daemon -S -q -p /var/run/mDNSResponderPosix.pid \
+                -x /usr/sbin/mDNSResponderPosix \
                 -- -b -f /etc/mDNSResponderPosix.conf -P /var/run/mDNSResponderPosix.pid
 	if [ "$?" != "0" ] ; then
 		echo "FAIL"
@@ -27,7 +27,7 @@
 }
 stop() {
 	echo -n "Stopping mDNSResponderPosix: "
-	start-stop-daemon --stop --quiet --pidfile /var/run/mDNSResponderPosix.pid
+	start-stop-daemon -K -q -p /var/run/mDNSResponderPosix.pid
 	if [ "$?" != "0" ] ; then
 		echo "FAIL"
 		return 1
@@ -35,7 +35,7 @@
 	echo "OK"
 
 	echo -n "Stopping mdnsd: "
-	start-stop-daemon --stop --quiet --pidfile /var/run/mdnsd.pid
+	start-stop-daemon -K -q -p /var/run/mdnsd.pid
 	if [ "$?" != "0" ] ; then
 		echo "FAIL"
 		return 1

Modified: trunk/buildroot/package/netplug/S29netplug
===================================================================
--- trunk/buildroot/package/netplug/S29netplug	2008-03-18 00:11:46 UTC (rev 21373)
+++ trunk/buildroot/package/netplug/S29netplug	2008-03-18 00:20:24 UTC (rev 21374)
@@ -40,7 +40,7 @@
   start)
 	# Start daemon.
 	echo -n $"Starting network plug daemon: "
-	start-stop-daemon --start --quiet --pidfile /var/run/netplugd.pid --exec /sbin/netplugd ${NETPLUGDARGS}
+	start-stop-daemon -S -q -p /var/run/netplugd.pid -x /sbin/netplugd ${NETPLUGDARGS}
 	RETVAL=$?
 	echo
 	[ $RETVAL -eq 0 ] && touch /var/lock/subsys/netplugd
@@ -48,7 +48,7 @@
   stop)
 	# Stop daemon.
 	echo -n $"Shutting down network plug daemon: "
-	start-stop-daemon --stop --name netplugd
+	start-stop-daemon -K -n netplugd
 	RETVAL=$?
 	echo
 	[ $RETVAL -eq 0 ] && rm -f /var/lock/subsys/netplugd

Modified: trunk/buildroot/package/sysklogd/S25syslog
===================================================================
--- trunk/buildroot/package/sysklogd/S25syslog	2008-03-18 00:11:46 UTC (rev 21373)
+++ trunk/buildroot/package/sysklogd/S25syslog	2008-03-18 00:20:24 UTC (rev 21374)
@@ -9,20 +9,20 @@
 
 start() {
  	echo -n "Starting syslogd: "
-	start-stop-daemon --start --quiet --pidfile /var/run/syslog.pid --exec /sbin/syslogd -- -m 0
+	start-stop-daemon -S -q -p /var/run/syslog.pid -x /sbin/syslogd -- -m 0
 	echo "OK"
 
 	echo -n "Starting klogd: "
-	start-stop-daemon --start --quiet --pidfile /var/run/klogd.pid --exec /sbin/klogd
+	start-stop-daemon -S -q -p /var/run/klogd.pid -x /sbin/klogd
 	echo "OK"
 }
 stop() {
 	echo -n "Stopping klogd: "
-	start-stop-daemon --stop --name klogd
+	start-stop-daemon -K -n klogd
 	echo "OK"
 
 	echo -n "Stopping syslogd: "
-	start-stop-daemon --stop --name syslogd
+	start-stop-daemon -K -n syslogd
 	echo "OK"
 }
 restart() {
