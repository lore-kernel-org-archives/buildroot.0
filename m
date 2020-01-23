From: Ignacy =?utf-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
Date: Thu, 23 Jan 2020 13:17:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/openssh: improve init script
Message-ID: <20200123121755.vp2n7mx3xxpbrbyz@zenon.in.qult.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current init script for sshd is too simplistic and its use of
killall to terminate the daemon has the annoying downside of killing
every instance of sshd, possibly including the one spawned for the
interactive session in which the script itself is started.  If the
intention was to simply restart the daemon, killing the current
session ultimately kills the script and the daemon is not properly
started again.

Improve the init script in the following ways:

  Use start-stop-daemon to avoid running the daemon more than once and
  to safely send termination signals to the right process.

  Add a proper reload action, by sending the daemon the SIGHUP signal.

  During restart, check that the daemon has properly terminated and if
  not, wait one second before sending it the SIGKILL signal.

Signed-off-by: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>
---
 package/openssh/S50sshd | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
index 22da41d1ca..66cdd5e291 100644
--- a/package/openssh/S50sshd
+++ b/package/openssh/S50sshd
@@ -13,20 +13,29 @@ start() {
 	/usr/bin/ssh-keygen -A
 
 	printf "Starting sshd: "
-	/usr/sbin/sshd
-	touch /var/lock/sshd
-	echo "OK"
+	start-stop-daemon -S -q -x /usr/sbin/sshd -p /run/sshd.pid &&
+	{ touch /var/lock/sshd; echo "OK"; } || echo "FAIL"
 }
 stop() {
 	printf "Stopping sshd: "
-	killall sshd
-	rm -f /var/lock/sshd
-	echo "OK"
+	start-stop-daemon -K -q -x /usr/sbin/sshd -p /run/sshd.pid &&
+	{ rm -f /var/lock/sshd; echo "OK"; } || echo "FAIL"
 }
 restart() {
 	stop
+	# Ensure the daemon has terminated before calling start again.
+	if start-stop-daemon -K -q -x /usr/sbin/sshd -p /run/sshd.pid -t; then
+		sleep 1
+		start-stop-daemon -K -s KILL -q -x /usr/sbin/sshd \
+				  -p /run/sshd.pid
+	fi
 	start
 }
+reload() {
+	printf "Reloading sshd: "
+	start-stop-daemon -K -s HUP -q -x /usr/sbin/sshd -p /run/sshd.pid &&
+	echo "OK" || echo "FAIL"
+}
 
 case "$1" in
   start)
@@ -35,13 +44,15 @@ case "$1" in
   stop)
 	stop
 	;;
-  restart|reload)
+  reload)
+	reload
+	;;
+  restart)
 	restart
 	;;
   *)
-	echo "Usage: $0 {start|stop|restart}"
+	echo "Usage: $0 {start|stop|reload|restart}"
 	exit 1
 esac
 
 exit $?
-
-- 
2.20.1
