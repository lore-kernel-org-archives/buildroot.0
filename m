From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 15 Apr 2018 23:29:35 -0300
Subject: [Buildroot] [PATCH 17/26] openvpn: don't test if the binary exists
 in the init script
In-Reply-To: <20180416022944.13644-1-casantos@datacom.ind.br>
References: <20180416022944.13644-1-casantos@datacom.ind.br>
Message-ID: <20180416022944.13644-18-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Replace the DAEMON variable, which was used only once, by the full path
of the binary file.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/openvpn/S60openvpn | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/openvpn/S60openvpn b/package/openvpn/S60openvpn
index de82a5095e..bc1ab01c1a 100755
--- a/package/openvpn/S60openvpn
+++ b/package/openvpn/S60openvpn
@@ -7,13 +7,11 @@
 
 test $DEBIAN_SCRIPT_DEBUG && set -v -x
 
-DAEMON=/usr/sbin/openvpn
 CONFIG_DIR=/etc/openvpn
-test -x $DAEMON || exit 0
 test -d $CONFIG_DIR || exit 0
 
 start_vpn () {
-    $DAEMON --daemon --writepid /var/run/openvpn.$NAME.pid \
+    /usr/sbin/openvpn --daemon --writepid /var/run/openvpn.$NAME.pid \
             --config $CONFIG_DIR/$NAME.conf --cd $CONFIG_DIR || printf " FAILED->"
     printf " $NAME"
 }
@@ -79,8 +77,6 @@ reload|force-reload)
       printf "(restarted)"
     else
       kill -HUP `cat $PIDFILE` || true
-#    start-stop-daemon --stop --signal HUP --quiet --oknodo \
-#      --exec $DAEMON --pidfile $PIDFILE
     printf " $NAME"
     fi
   done
-- 
2.14.3
