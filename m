From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Fri,  2 Oct 2020 09:47:21 +0300
Subject: [Buildroot] [PATCH 1/1] package/openvpn: Use start-stop-daemon to
 perform start/stop actions
Message-ID: <20201002064721.1641311-1-fido_max@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using 'start-stop-daemon' prevents multiple instances creation by '/etc/init.d/S60openvpnv start'.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/openvpn/S60openvpn | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/openvpn/S60openvpn b/package/openvpn/S60openvpn
index bc1ab01c1a..63530a6f13 100644
--- a/package/openvpn/S60openvpn
+++ b/package/openvpn/S60openvpn
@@ -11,13 +11,14 @@ CONFIG_DIR=/etc/openvpn
 test -d $CONFIG_DIR || exit 0
 
 start_vpn () {
-    /usr/sbin/openvpn --daemon --writepid /var/run/openvpn.$NAME.pid \
-            --config $CONFIG_DIR/$NAME.conf --cd $CONFIG_DIR || printf " FAILED->"
-    printf " $NAME"
+    printf " $NAME "
+    start-stop-daemon -S -p /var/run/openvpn.$NAME.pid -x /usr/sbin/openvpn -- --daemon --writepid /var/run/openvpn.$NAME.pid \
+            --config $CONFIG_DIR/$NAME.conf --cd $CONFIG_DIR
+    [ $? = 0 ] && echo "OK" || echo "FAIL"
 }
 stop_vpn () {
-   kill `cat $PIDFILE` || true
-  rm $PIDFILE
+    printf " $NAME "
+    start-stop-daemon -K -p /var/run/openvpn.$NAME.pid -x /usr/sbin/openvpn
 }
 
 case "$1" in
@@ -48,7 +49,6 @@ stop)
       NAME=`echo $PIDFILE | cut -c18-`
       NAME=${NAME%%.pid}
       stop_vpn
-      printf " $NAME"
     done
   else
     if test -e /var/run/openvpn.$2.pid ; then
@@ -56,7 +56,6 @@ stop)
       NAME=`echo $PIDFILE | cut -c18-`
       NAME=${NAME%%.pid}
       stop_vpn
-      printf " $NAME"
     else
       printf " No such VPN: $2"
     fi
-- 
2.27.0
