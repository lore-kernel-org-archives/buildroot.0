From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 12 Dec 2014 08:44:26 +0100
Subject: [Buildroot] [git commit] rpi-userland: use start() / stop() in init
	script like elsewhere
Message-ID: <20141212074528.2A8A9801F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c9345dee4fb6620516529c4e562477df795eb748
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Other init scripts in Buildroot use start()/stop() instead of
do_start()/do_stop(), so change it here as well for consistency.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-userland/S94vcfiled |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/rpi-userland/S94vcfiled b/package/rpi-userland/S94vcfiled
index 9a3e523..a70e0ae 100755
--- a/package/rpi-userland/S94vcfiled
+++ b/package/rpi-userland/S94vcfiled
@@ -10,14 +10,14 @@ PIDFILE="/var/run/$NAME.pid"
 # Read configuration variable file if it is present
 [ -r "$CFGFILE" ] && . "$CFGFILE"
 
-do_start()
+start()
 {
 	echo -n "Starting $DESC: "
 	start-stop-daemon -S -q -p "$PIDFILE" -x "$DAEMON" -- $DAEMON_ARGS &&
 			echo "done" || echo "failed"
 }
 
-do_stop()
+stop()
 {
 	echo -n "Stopping $DESC: "
 	if start-stop-daemon -K -q -R TERM/30/KILL/5 -p "$PIDFILE" -n "$NAME"; then
@@ -31,14 +31,14 @@ do_stop()
 
 case "$1" in
 	start)
-		do_start
+		start
 		;;
 	stop)
-		do_stop
+		stop
 		;;
 	restart|reload)
-		do_stop
-		do_start
+		stop
+		start
 		;;
 	*)
 		echo "Usage: $0 {start|stop|restart|reload}" >&2
