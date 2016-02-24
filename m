From: Andreas Ehmanns <universeII@gmx.de>
Date: Wed, 24 Feb 2016 18:31:21 +0100
Subject: [Buildroot] [PATCH 1/1] Added OK/FAIL output to SNMP init script.
Message-ID: <1456335081-4834-1-git-send-email-universeII@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andreas Ehmanns <universeII@gmx.de>
---
 package/netsnmp/S59snmpd | 98 +++++++++++++++++++++++++++---------------------
 1 file changed, 56 insertions(+), 42 deletions(-)

diff --git a/package/netsnmp/S59snmpd b/package/netsnmp/S59snmpd
index 4eea512..94773db 100755
--- a/package/netsnmp/S59snmpd
+++ b/package/netsnmp/S59snmpd
@@ -1,4 +1,4 @@
-#! /bin/sh -e
+#! /bin/sh
 ### BEGIN INIT INFO
 # Provides:           snmpd snmptrapd
 # Required-Start:     $network $local_fs
@@ -11,7 +11,6 @@
 #
 # Author:    Jochen Friedrich <jochen@scram.de>
 #
-set -e
 
 export PATH=/sbin:/usr/sbin:/bin:/usr/bin
 
@@ -38,56 +37,71 @@ if [ "$SNMPDCOMPAT" = "yes" ]; then
   ln -sf /var/agentx/master /var/run/agentx
 fi
 
-case "$1" in
-  start)
-    printf "Starting network management services:"
+start() {
     if [ "$SNMPDRUN" = "yes" -a -f /etc/snmp/snmpd.conf ]; then
-      start-stop-daemon -q -S -x /usr/sbin/snmpd -- $SNMPDOPTS
-      printf " snmpd"
+        printf "Starting SNMP daemon: "
+        start-stop-daemon -q -S -x /usr/sbin/snmpd -- $SNMPDOPTS
+        [ $? = 0 ] && echo "OK" || echo "FAIL"
     fi
+
     if [ "$TRAPDRUN" = "yes" -a -f /etc/snmp/snmptrapd.conf ]; then
-      start-stop-daemon -q -S -x /usr/sbin/snmptrapd -- $TRAPDOPTS
-      printf " snmptrapd"
+        printf "Starting SNMP trap daemon: "
+        start-stop-daemon -q -S -x /usr/sbin/snmptrapd -- $TRAPDOPTS
+        [ $? = 0 ] && echo "OK" || echo "FAIL"
     fi
-    echo "."
-    ;;
-  stop)
-    printf "Stopping network management services:"
-    start-stop-daemon -q -K $ssd_oknodo -x /usr/sbin/snmpd
-    printf " snmpd"
-    start-stop-daemon -q -K $ssd_oknodo -x /usr/sbin/snmptrapd
-    printf " snmptrapd"
-    echo "."
-    ;;
-  restart)
-    printf "Restarting network management services:"
-    start-stop-daemon -q -K $ssd_oknodo -x /usr/sbin/snmpd
-    start-stop-daemon -q -K $ssd_oknodo -x /usr/sbin/snmptrapd
-    # Allow the daemons time to exit completely.
-    sleep 2
+}
+
+stop() {
     if [ "$SNMPDRUN" = "yes" -a -f /etc/snmp/snmpd.conf ]; then
-      start-stop-daemon -q -S -x /usr/sbin/snmpd -- $SNMPDOPTS
-      printf " snmpd"
+        printf "Stopping SNMP daemon: "
+        start-stop-daemon -q -K $ssd_oknodo -x /usr/sbin/snmpd
+        [ $? = 0 ] && echo "OK" || echo "FAIL"
     fi
+
     if [ "$TRAPDRUN" = "yes" -a -f /etc/snmp/snmptrapd.conf ]; then
-      # Allow snmpd time to start up.
-      sleep 1
-      start-stop-daemon -q -S -x /usr/sbin/snmptrapd -- $TRAPDOPTS
-      printf " snmptrapd"
+        printf "Stopping SNMP trap daemon: "
+        start-stop-daemon -q -K $ssd_oknodo -x /usr/sbin/snmptrapd
+        [ $? = 0 ] && echo "OK" || echo "FAIL"
     fi
-    echo "."
-    ;;
-  reload|force-reload)
-    printf "Reloading network management services:"
+}
+
+reload() {
     if [ "$SNMPDRUN" = "yes" -a -f /etc/snmp/snmpd.conf ]; then
-      start-stop-daemon -q -K -s 1 -p /var/run/snmpd.pid -x /usr/sbin/snmpd
-      printf " snmpd"
+        printf "Reloading SNMP daemon: "
+        start-stop-daemon -q -K -s 1 -p /var/run/snmpd.pid -x /usr/sbin/snmpd
+       [ $? = 0 ] && echo "OK" || echo "FAIL" 
+    fi
+
+    if [ "$TRAPDRUN" = "yes" -a -f /etc/snmp/snmptrapd.conf ]; then
+        printf "Reloading SNMP trap daemon: "
+        start-stop-daemon -q -K -s 1 -p /var/run/snmptrapd.pid -x /usr/sbin/snmptrapd
+        [ $? = 0 ] && echo "OK" || echo "FAIL"
     fi
-    echo "."
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
+
+    *)
+        echo "Usage: $0 {start|stop|restart|reload|force-reload}"
+        exit 1
 esac
 
 exit 0
-- 
2.1.4
