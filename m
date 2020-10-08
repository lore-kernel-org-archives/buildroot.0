From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Oct 2020 23:24:44 +0200
Subject: [Buildroot] [git commit] package/openvpn: use start-stop-daemon to
 perform start/stop actions
Message-ID: <20201008211358.0664A881B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8e68597a78218d3d9c5cc53b8da0ddfe21f34d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Using 'start-stop-daemon' prevents multiple instances creation by
'/etc/init.d/S60openvpn start'.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openvpn/S60openvpn | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/openvpn/S60openvpn b/package/openvpn/S60openvpn
index bc1ab01c1a..f097cf11ec 100644
--- a/package/openvpn/S60openvpn
+++ b/package/openvpn/S60openvpn
@@ -11,13 +11,15 @@ CONFIG_DIR=/etc/openvpn
 test -d $CONFIG_DIR || exit 0
 
 start_vpn () {
-    /usr/sbin/openvpn --daemon --writepid /var/run/openvpn.$NAME.pid \
-            --config $CONFIG_DIR/$NAME.conf --cd $CONFIG_DIR || printf " FAILED->"
-    printf " $NAME"
+    printf " $NAME "
+    start-stop-daemon -S -p /var/run/openvpn.$NAME.pid -x /usr/sbin/openvpn -- \
+	      --daemon --writepid /var/run/openvpn.$NAME.pid \
+	      --config $CONFIG_DIR/$NAME.conf --cd $CONFIG_DIR
+    [ $? = 0 ] && echo "OK" || echo "FAIL"
 }
 stop_vpn () {
-   kill `cat $PIDFILE` || true
-  rm $PIDFILE
+    printf " $NAME "
+    start-stop-daemon -K -p /var/run/openvpn.$NAME.pid -x /usr/sbin/openvpn
 }
 
 case "$1" in
@@ -48,7 +50,6 @@ stop)
       NAME=`echo $PIDFILE | cut -c18-`
       NAME=${NAME%%.pid}
       stop_vpn
-      printf " $NAME"
     done
   else
     if test -e /var/run/openvpn.$2.pid ; then
@@ -56,7 +57,6 @@ stop)
       NAME=`echo $PIDFILE | cut -c18-`
       NAME=${NAME%%.pid}
       stop_vpn
-      printf " $NAME"
     else
       printf " No such VPN: $2"
     fi
