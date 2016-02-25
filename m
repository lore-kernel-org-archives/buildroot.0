From: Andreas Ehmanns <universeII@gmx.de>
Date: Thu, 25 Feb 2016 22:24:44 +0100
Subject: [Buildroot] [PATCH 4/4] Package netsnmp: Added OK/FAIL output
In-Reply-To: <1456435484-4723-1-git-send-email-universeII@gmx.de>
References: <1456435484-4723-1-git-send-email-universeII@gmx.de>
Message-ID: <1456435484-4723-4-git-send-email-universeII@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reworked output of start(), stop() and reload() functions.
Return values of start-stop-daemon are now checked and
a OK or FAIL message is printed out.

Signed-off-by: Andreas Ehmanns <universeII@gmx.de>
---
 package/netsnmp/S59snmpd | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/package/netsnmp/S59snmpd b/package/netsnmp/S59snmpd
index 2d076e0..94773db 100755
--- a/package/netsnmp/S59snmpd
+++ b/package/netsnmp/S59snmpd
@@ -38,39 +38,45 @@ if [ "$SNMPDCOMPAT" = "yes" ]; then
 fi
 
 start() {
-    printf "Starting network management services:"
     if [ "$SNMPDRUN" = "yes" -a -f /etc/snmp/snmpd.conf ]; then
+        printf "Starting SNMP daemon: "
         start-stop-daemon -q -S -x /usr/sbin/snmpd -- $SNMPDOPTS
-        printf " snmpd"
+        [ $? = 0 ] && echo "OK" || echo "FAIL"
     fi
+
     if [ "$TRAPDRUN" = "yes" -a -f /etc/snmp/snmptrapd.conf ]; then
+        printf "Starting SNMP trap daemon: "
         start-stop-daemon -q -S -x /usr/sbin/snmptrapd -- $TRAPDOPTS
-        printf " snmptrapd"
+        [ $? = 0 ] && echo "OK" || echo "FAIL"
     fi
-    echo "."
 }
 
 stop() {
-    printf "Stopping network management services:"
-    start-stop-daemon -q -K $ssd_oknodo -x /usr/sbin/snmpd
-    printf " snmpd"
-    start-stop-daemon -q -K $ssd_oknodo -x /usr/sbin/snmptrapd
-    printf " snmptrapd"
-    echo "."
+    if [ "$SNMPDRUN" = "yes" -a -f /etc/snmp/snmpd.conf ]; then
+        printf "Stopping SNMP daemon: "
+        start-stop-daemon -q -K $ssd_oknodo -x /usr/sbin/snmpd
+        [ $? = 0 ] && echo "OK" || echo "FAIL"
+    fi
+
+    if [ "$TRAPDRUN" = "yes" -a -f /etc/snmp/snmptrapd.conf ]; then
+        printf "Stopping SNMP trap daemon: "
+        start-stop-daemon -q -K $ssd_oknodo -x /usr/sbin/snmptrapd
+        [ $? = 0 ] && echo "OK" || echo "FAIL"
+    fi
 }
 
 reload() {
-    printf "Reloading network management services:"
     if [ "$SNMPDRUN" = "yes" -a -f /etc/snmp/snmpd.conf ]; then
+        printf "Reloading SNMP daemon: "
         start-stop-daemon -q -K -s 1 -p /var/run/snmpd.pid -x /usr/sbin/snmpd
-        printf " snmpd"
+       [ $? = 0 ] && echo "OK" || echo "FAIL" 
     fi
 
     if [ "$TRAPDRUN" = "yes" -a -f /etc/snmp/snmptrapd.conf ]; then
+        printf "Reloading SNMP trap daemon: "
         start-stop-daemon -q -K -s 1 -p /var/run/snmptrapd.pid -x /usr/sbin/snmptrapd
-        printf " snmptrapd"
+        [ $? = 0 ] && echo "OK" || echo "FAIL"
     fi
-    echo "."
 }
 
 case "$1" in
@@ -92,6 +98,7 @@ case "$1" in
     reload|force-reload)
         reload
         ;;
+
     *)
         echo "Usage: $0 {start|stop|restart|reload|force-reload}"
         exit 1
-- 
2.1.4
