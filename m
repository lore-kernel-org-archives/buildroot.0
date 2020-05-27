From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 27 May 2020 09:11:13 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/syrepo: fix SysV init script
Message-ID: <20200527071113.15121-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current script (S51sysrepo-plugind) is not able to stop the daemon.

Possible options to fix the problem:

A) By adding the "-m -p $PIDFILE" option to start the pid file will be
   created but it will not contain the correct PID used by the daemon.
   This is obviously because the daemon forks.
B) By not starting the daemon in background (sysrepo-plugind -d) and
   let do it by start-stop-daemon with "-b" option. But then the log
   messages of the daemon will not longer ends in the syslog but to stderr.
C) Start the daemon without a pidfile and stop the daemon with the
   "-x" option.

The only valid option is C to fix that.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
changes v1 -> v2:
	Add a proper commit message.

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
