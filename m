From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Apr 2018 07:34:53 +0200
Subject: [Buildroot] [git commit] openvpn: don't test if the binary exists
 in the init script
Message-ID: <20180416053718.BA45A88325@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59520e54fe2849ace596b10354152a380d3c7507
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Replace the DAEMON variable, which was used only once, by the full path
of the binary file.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
