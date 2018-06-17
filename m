From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 17:24:51 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] netplug: prevent starting
 multiple instances of netplugd
Message-ID: <20180617155626.5434D81070@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7774ca1cb2d6d62e35115d7329daf864a9c7826b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Executing "/etc/init.d/S29netplug start" multiple times resulted in
multiple instances of netplugd.

Pass "-p /var/run/netplug.pid" to netplugd, so it creates the PID file
that start-stop-daemon needs to know that netplugd is already running.
Also use the pid file to stop netplugd, instead of the daemon name.

Fixes https://bugs.busybox.net/show_bug.cgi?id=10661

Reported-by: Joachim Krueger <mail2k@web.de>
Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3c6a5bdd3ed94f97afe2db9123d7117f85f654ce)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netplug/S29netplug | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/netplug/S29netplug b/package/netplug/S29netplug
index 04cac9f07c..66459061b3 100755
--- a/package/netplug/S29netplug
+++ b/package/netplug/S29netplug
@@ -41,7 +41,7 @@ case "$1" in
   start)
 	# Start daemon.
 	printf "Starting network plug daemon: "
-	start-stop-daemon -S -q -p /var/run/netplugd.pid -x /sbin/netplugd ${NETPLUGDARGS}
+	start-stop-daemon -S -q -x /sbin/netplugd -- -p /var/run/netplugd.pid ${NETPLUGDARGS}
 	RETVAL=$?
 	echo
 	[ $RETVAL -eq 0 ] && touch /var/lock/subsys/netplugd
@@ -49,7 +49,7 @@ case "$1" in
   stop)
 	# Stop daemon.
 	printf "Shutting down network plug daemon: "
-	start-stop-daemon -K -n netplugd
+	start-stop-daemon -K -q -p /var/run/netplugd.pid
 	RETVAL=$?
 	echo
 	[ $RETVAL -eq 0 ] && rm -f /var/lock/subsys/netplugd
