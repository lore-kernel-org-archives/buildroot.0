From: Carlos Santos <casantos@datacom.com.br>
Date: Wed,  6 Jun 2018 22:36:41 -0300
Subject: [Buildroot] [PATCH] netplug: prevent starting multiple instances of
 netplugd
Message-ID: <20180607013641.22701-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Executing "/etc/init.d/S29netplug start" multiple times resulted in
multiple instances of netplugd.

Pass "-p /var/run/netplug.pid" to netplugd, so it creates the PID file
that start-stop-daemon needs to know that netplugd is already running.
Also use the pid file to stop netplugd, instead of the daemon name.

Fixes https://bugs.busybox.net/show_bug.cgi?id=10661

Reported-by: Joachim Krueger <mail2k@web.de>
Signed-off-by: Carlos Santos <casantos@datacom.com.br>
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
-- 
2.17.0
