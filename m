From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 14:47:02 +0200
Subject: [Buildroot] [git commit] netsnmp: adjust init script by creating
	start(), stop(), reload()
Message-ID: <20160701124731.2ECC580335@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=291f3f948dbf3fdcbbd1f9d6fb00d1bac0bd92c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change the init script to get rid of double code. Start, stop and reload
code has been put into separate functions and 'restart' will just call
stop() and start() with a delay in between.

Signed-off-by: Andreas Ehmanns <universeII@gmx.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
