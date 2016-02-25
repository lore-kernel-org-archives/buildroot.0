From: Andreas Ehmanns <universeII@gmx.de>
Date: Thu, 25 Feb 2016 22:24:41 +0100
Subject: [Buildroot] [PATCH 1/4] Package netsnmp: Created start(), stop(),
	reload().
Message-ID: <1456435484-4723-1-git-send-email-universeII@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changed init script to get rid of double code.
Start, stop and reload code has been put into
separate functions and 'restart' will just call
stop() and start() with a delay in between.

Signed-off-by: Andreas Ehmanns <universeII@gmx.de>
---
 package/netsnmp/S59snmpd | 71 +++++++++++++++++++++++++-----------------------
 1 file changed, 37 insertions(+), 34 deletions(-)

diff --git a/package/netsnmp/S59snmpd b/package/netsnmp/S59snmpd
index 4eea512..cfda625 100755
--- a/package/netsnmp/S59snmpd
+++ b/package/netsnmp/S59snmpd
@@ -38,56 +38,59 @@ if [ "$SNMPDCOMPAT" = "yes" ]; then
   ln -sf /var/agentx/master /var/run/agentx
 fi
 
-case "$1" in
-  start)
+start() {
     printf "Starting network management services:"
     if [ "$SNMPDRUN" = "yes" -a -f /etc/snmp/snmpd.conf ]; then
-      start-stop-daemon -q -S -x /usr/sbin/snmpd -- $SNMPDOPTS
-      printf " snmpd"
+        start-stop-daemon -q -S -x /usr/sbin/snmpd -- $SNMPDOPTS
+        printf " snmpd"
     fi
     if [ "$TRAPDRUN" = "yes" -a -f /etc/snmp/snmptrapd.conf ]; then
-      start-stop-daemon -q -S -x /usr/sbin/snmptrapd -- $TRAPDOPTS
-      printf " snmptrapd"
+        start-stop-daemon -q -S -x /usr/sbin/snmptrapd -- $TRAPDOPTS
+        printf " snmptrapd"
     fi
     echo "."
-    ;;
-  stop)
+}
+
+stop() {
     printf "Stopping network management services:"
     start-stop-daemon -q -K $ssd_oknodo -x /usr/sbin/snmpd
     printf " snmpd"
     start-stop-daemon -q -K $ssd_oknodo -x /usr/sbin/snmptrapd
     printf " snmptrapd"
     echo "."
-    ;;
-  restart)
-    printf "Restarting network management services:"
-    start-stop-daemon -q -K $ssd_oknodo -x /usr/sbin/snmpd
-    start-stop-daemon -q -K $ssd_oknodo -x /usr/sbin/snmptrapd
-    # Allow the daemons time to exit completely.
-    sleep 2
-    if [ "$SNMPDRUN" = "yes" -a -f /etc/snmp/snmpd.conf ]; then
-      start-stop-daemon -q -S -x /usr/sbin/snmpd -- $SNMPDOPTS
-      printf " snmpd"
-    fi
-    if [ "$TRAPDRUN" = "yes" -a -f /etc/snmp/snmptrapd.conf ]; then
-      # Allow snmpd time to start up.
-      sleep 1
-      start-stop-daemon -q -S -x /usr/sbin/snmptrapd -- $TRAPDOPTS
-      printf " snmptrapd"
-    fi
-    echo "."
-    ;;
-  reload|force-reload)
+}
+
+reload() {
     printf "Reloading network management services:"
     if [ "$SNMPDRUN" = "yes" -a -f /etc/snmp/snmpd.conf ]; then
-      start-stop-daemon -q -K -s 1 -p /var/run/snmpd.pid -x /usr/sbin/snmpd
-      printf " snmpd"
+        start-stop-daemon -q -K -s 1 -p /var/run/snmpd.pid -x /usr/sbin/snmpd
+        printf " snmpd"
     fi
     echo "."
-    ;;
-  *)
-    echo "Usage: /etc/init.d/snmpd {start|stop|restart|reload|force-reload}"
-    exit 1
+}
+
+case "$1" in
+    start)
+        start
+        ;;
+
+    stop)
+        stop
+        ;;
+
+    restart)
+        stop
+        # Allow the daemons time to exit completely.
+        sleep 2
+        start
+        ;;
+
+    reload|force-reload)
+        reload
+        ;;
+    *)
+        echo "Usage: $0 {start|stop|restart|reload|force-reload}"
+        exit 1
 esac
 
 exit 0
-- 
2.1.4
