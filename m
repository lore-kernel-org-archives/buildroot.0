From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 12 Dec 2014 08:44:34 +0100
Subject: [Buildroot] [git commit] upmpdcli: use start() / stop() in init
	script like elsewhere
Message-ID: <20141212074528.46C7E7F9D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4e561eda373d1725a65018c325e1d9e6d34ca8cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Other init scripts in Buildroot use start()/stop() instead of
do_start()/do_stop(), so change it here as well for consistency

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/upmpdcli/S99upmpdcli |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/upmpdcli/S99upmpdcli b/package/upmpdcli/S99upmpdcli
index 314ea32..07b10a6 100644
--- a/package/upmpdcli/S99upmpdcli
+++ b/package/upmpdcli/S99upmpdcli
@@ -9,14 +9,14 @@ DAEMON_ARGS="-D -c $CONFFILE"
 # Sanity checks
 test -f $DAEMON || exit 0
 
-do_start() {
+start() {
         echo -n "Starting $NAME: "
         start-stop-daemon --start --quiet --background --exec $DAEMON \
                 -- $DAEMON_ARGS \
                 && echo "OK" || echo "FAIL"
 }
 
-do_stop() {
+stop() {
         echo -n "Stopping $NAME: "
         start-stop-daemon --stop --quiet --pidfile $PIDFILE \
                 && echo "OK" || echo "FAIL"
@@ -24,15 +24,15 @@ do_stop() {
 
 case "$1" in
         start)
-                do_start
+                start
                 ;;
         stop)
-                do_stop
+                stop
                 ;;
         restart)
-                do_stop
+                stop
                 sleep 1
-                do_start
+                start
                 ;;
         *)
                 echo "Usage: $0 {start|stop|restart}"
