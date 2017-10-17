From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Oct 2017 10:29:31 +0200
Subject: [Buildroot] [git commit branch/2017.08.x] nginx (S50nginx): Fix
	stop, reload, restart. Add force-reload.
Message-ID: <20171017090325.9FA8381190@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4bb2bd9ae1d9b9fd788bb1c5059da37137195159
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

Fix package/nginx/S50nginx:

* On stop, use start-stop-daemon -R 1 to wait for the nginx processes
  to actually stop.  This fixes a race condition with restart, where
  nginx fails to restart because start is called too early
  w.r.t. stop.  (This only works with Debian's start-stop-daemon,
  however BusyBox's start-stop-daemon does not fail when given -R; it
  just ignores the argument silently).

* Implement reload with an actual reload instead of a restart.

* Add force-reload.

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 23094a0df9fc287f1c83fe2561a076d80c213015)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nginx/S50nginx | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/package/nginx/S50nginx b/package/nginx/S50nginx
index b2f8b80..a854c65 100755
--- a/package/nginx/S50nginx
+++ b/package/nginx/S50nginx
@@ -3,23 +3,31 @@
 # Start/stop nginx
 #
 
+NGINX=/usr/sbin/nginx
 PIDFILE=/var/run/nginx.pid
 
 case "$1" in
   start)
 	echo "Starting nginx..."
 	mkdir -p /var/log/nginx /var/tmp/nginx
-	start-stop-daemon -S -x /usr/sbin/nginx -p $PIDFILE
+	start-stop-daemon -S -x "$NGINX" -p "$PIDFILE"
 	;;
   stop)
-	printf "Stopping nginx..."
-	start-stop-daemon -K -o -p $PIDFILE
+	echo "Stopping nginx..."
+	# Use -R 1 to wait for nginx to actually stop.  Useful so
+	# restart has no race condition.  Note that BusyBox knows
+	# about -R but ignores it silently.
+	start-stop-daemon -K -x "$NGINX" -p "$PIDFILE" -R 1 -o
 	;;
-  restart|reload)
+  reload|force-reload)
+	echo "Reloading nginx configuration..."
+	"$NGINX" -s reload
+	;;
+  restart)
 	"$0" stop
 	"$0" start
 	;;
   *)
-	echo "Usage: $0 {start|stop|restart}"
+	echo "Usage: $0 {start|stop|restart|reload|force-reload}"
 	exit 1
 esac
