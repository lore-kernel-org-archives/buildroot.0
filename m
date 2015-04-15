From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Wed, 15 Apr 2015 17:39:05 +0200
Subject: [Buildroot] [PATCH 1/3] ejabberd: start the daemon as ejabberd user
Message-ID: <1429112347-17009-1-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ejabberd.mk creates an ejabberd user but the init script was starting
the xmpp server as root user. This patch fixes it by invoking
ejabberctl from a "su ejabberd -c" command.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/ejabberd/S50ejabberd | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

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
-- 
2.1.0
