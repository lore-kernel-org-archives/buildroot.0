From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Oct 2017 17:51:02 +0200
Subject: [Buildroot] [git commit] package/nginx/S50nginx: Do not assume
	start-stop-daemon knows -R.
Message-ID: <20171010155054.13D1080FF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=99b8044a6714e925c504c0e3fc46f3730e0fe572
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

start-stop-daemon fails on -R when not compiled with
CONFIG_FEATURE_START_STOP_DAEMON_FANCY.  Thus, do not rely on -R
during stop to avoid a race condition during restart.

Use a sleep 1 during restart instead, as suggested by Peter Korsgaard
in <87bmluk4bm.fsf@dell.be.48ers.dk>.

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nginx/S50nginx | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/nginx/S50nginx b/package/nginx/S50nginx
index a854c65..964652b 100755
--- a/package/nginx/S50nginx
+++ b/package/nginx/S50nginx
@@ -14,10 +14,7 @@ case "$1" in
 	;;
   stop)
 	echo "Stopping nginx..."
-	# Use -R 1 to wait for nginx to actually stop.  Useful so
-	# restart has no race condition.  Note that BusyBox knows
-	# about -R but ignores it silently.
-	start-stop-daemon -K -x "$NGINX" -p "$PIDFILE" -R 1 -o
+	start-stop-daemon -K -x "$NGINX" -p "$PIDFILE" -o
 	;;
   reload|force-reload)
 	echo "Reloading nginx configuration..."
@@ -25,6 +22,7 @@ case "$1" in
 	;;
   restart)
 	"$0" stop
+	sleep 1 # Prevent race condition: ensure nginx stops before start.
 	"$0" start
 	;;
   *)
