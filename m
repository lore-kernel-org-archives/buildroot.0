From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 20 Apr 2020 11:57:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/syrepo: fix SysV init script
Message-ID: <20200420095738.16104-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The sysrepo-plugind does not support to be controlled via the PID by the
start-stop-daemon. This is because sysrepo-plugind does a fork.
Thus the daemon is running with another PID known by start-stop-daemon.

Now use the '-x' option of start-stop-daemon to stop.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/sysrepo/S51sysrepo-plugind | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/sysrepo/S51sysrepo-plugind b/package/sysrepo/S51sysrepo-plugind
index 74b68396bf..9e15da59f9 100644
--- a/package/sysrepo/S51sysrepo-plugind
+++ b/package/sysrepo/S51sysrepo-plugind
@@ -1,7 +1,6 @@
 #!/bin/sh
 
 DAEMON="sysrepo-plugind"
-PIDFILE="/var/run/$DAEMON.pid"
 
 SYSREPO_PLUGIND_ARGS=""
 
@@ -23,7 +22,7 @@ start() {
 
 stop() {
 	printf 'Stopping %s: ' "$DAEMON"
-	start-stop-daemon -K -q -p $PIDFILE
+	start-stop-daemon -K -q -x "/usr/bin/$DAEMON"
 	status=$?
 	if [ "$status" -eq 0 ]; then
 		echo "OK"
-- 
2.20.1
