From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Date: Mon,  9 Oct 2017 11:50:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/nginx/S50nginx: Do not assume
	start-stop-daemon knows -R.
In-Reply-To: <87bmluk4bm.fsf@dell.be.48ers.dk>
References: <87bmluk4bm.fsf@dell.be.48ers.dk>
Message-ID: <20171009095049.22290-1-thomas.claveirole@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

start-stop-daemon fails on -R when not compiled with
CONFIG_FEATURE_START_STOP_DAEMON_FANCY.  Thus, do not rely on -R
during stop to avoid a race condition during restart.

Use a sleep 1 during restart instead, as suggested by Peter Korsgaard
in <87bmluk4bm.fsf@dell.be.48ers.dk>.

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
---
 package/nginx/S50nginx | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/nginx/S50nginx b/package/nginx/S50nginx
index a854c651d1..964652b922 100755
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
-- 
2.14.2
