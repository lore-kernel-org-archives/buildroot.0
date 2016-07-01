From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 14:53:11 +0200
Subject: [Buildroot] [git commit] netsnmp: add OK/FAIL output in init script
Message-ID: <20160701125326.E1521818D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45136f30973f2767a9db6293f081024140f086d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit reworks the output of the start(), stop() and reload()
functions. The return values of start-stop-daemon are now checked and a
OK or FAIL message is printed out.

Signed-off-by: Andreas Ehmanns <universeII@gmx.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netsnmp/S59snmpd | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/package/netsnmp/S59snmpd b/package/netsnmp/S59snmpd
index 2d076e0..4ff844e 100755
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
+        [ $? = 0 ] && echo "OK" || echo "FAIL"
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
