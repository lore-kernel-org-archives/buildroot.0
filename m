From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 11:11:07 +0200
Subject: [Buildroot] [git commit] ejabberd: start the daemon as ejabberd user
Message-ID: <20150419091150.E1EC98044B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0972c9c10b3aa9466528fb5a0f30f37545b2c876
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ejabberd.mk creates an ejabberd user but the init script was starting
the xmpp server as root user. This patch fixes it by invoking
ejabberctl from a "su ejabberd -c" command.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ejabberd/S50ejabberd |   28 ++++++++++++++++++++--------
 1 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/package/ejabberd/S50ejabberd b/package/ejabberd/S50ejabberd
index 2656307..925a072 100644
--- a/package/ejabberd/S50ejabberd
+++ b/package/ejabberd/S50ejabberd
@@ -7,29 +7,41 @@ USER=ejabberd
 RUNDIR=/var/run/ejabberd
 
 mkrundir() {
-    install -d -o $USER -g $USER $RUNDIR
+    install -d -o "$USER" -g "$USER" "$RUNDIR"
+}
+
+# Run ejabberdctl as user $USER.
+ctl() {
+    su $USER -c "ejabberdctl $*"
 }
 
 case "$1" in
     start)
-	mkrundir
-        echo "Starting ejabberd..."
-        ejabberdctl start
+        mkrundir || exit 1
+        echo -n "Starting ejabberd... "
+        ctl start
         ;;
     stop)
         echo -n "Stopping ejabberd... "
-        ejabberdctl stop > /dev/null
-        if [ $? -eq 3 ] || ejabberdctl stopped; then
+        ctl stop > /dev/null
+        if [ $? -eq 3 ] || ctl stopped; then
             echo "OK"
         else
             echo "failed"
         fi
         ;;
-    restart|reload)
+    status)
+        ctl status
+        ;;
+    restart|force-reload)
         "$0" stop
         "$0" start
         ;;
+    live)
+        mkrundir || exit 1
+        ctl live
+        ;;
     *)
-        echo "Usage: $0 {start|stop|restart}"
+        echo "Usage: $0 {start|stop|status|restart|force-reload|live}"
         exit 1
 esac
