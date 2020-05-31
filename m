From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 31 May 2020 10:27:01 +0200
Subject: [Buildroot] [git commit] package/sysrepo: fix SysV init script
Message-ID: <20200531081039.5FA1485D87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a14a838eaa88ae683bf8c0cb0ae6cc7e1d10d49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
[yann.morin.1998 at free.fr: introduce EXECUTABLE]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sysrepo/S51sysrepo-plugind | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sysrepo/S51sysrepo-plugind b/package/sysrepo/S51sysrepo-plugind
index 74b68396bf..60ea3ba7a9 100644
--- a/package/sysrepo/S51sysrepo-plugind
+++ b/package/sysrepo/S51sysrepo-plugind
@@ -1,7 +1,7 @@
 #!/bin/sh
 
 DAEMON="sysrepo-plugind"
-PIDFILE="/var/run/$DAEMON.pid"
+EXECUTABLE="/usr/bin/$DAEMON"
 
 SYSREPO_PLUGIND_ARGS=""
 
@@ -10,7 +10,7 @@ SYSREPO_PLUGIND_ARGS=""
 
 start() {
 	printf 'Starting %s: ' "$DAEMON"
-	start-stop-daemon -S -q -x "/usr/bin/$DAEMON" \
+	start-stop-daemon -S -q -x "$EXECUTABLE" \
 		-- $SYSREPO_PLUGIND_ARGS
 	status=$?
 	if [ "$status" -eq 0 ]; then
@@ -23,7 +23,7 @@ start() {
 
 stop() {
 	printf 'Stopping %s: ' "$DAEMON"
-	start-stop-daemon -K -q -p $PIDFILE
+	start-stop-daemon -K -q -x "$EXECUTABLE"
 	status=$?
 	if [ "$status" -eq 0 ]; then
 		echo "OK"
