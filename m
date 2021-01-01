From: John Doe <anonymous683854643863@outlook.com>
Date: Fri, 1 Jan 2021 20:31:04 +0000
Subject: [Buildroot] [PATCH] package/openssh: fix initscript killing
 subprocesses
Message-ID: <VI1PR0402MB3373751FEE15D3FC11A1D5E6A7D50@VI1PR0402MB3373.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The initscript currently calls `killall sshd` when stopping the service, which
kills all active SSH sessions. Rewritten to use start-stop-daemon with PIDfile.

Signed-off-by: John Johnson <anonymous683854643863@outlook.com>
---
 package/openssh/S50sshd | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
index 22da41d1ca..77a82308ca 100644
--- a/package/openssh/S50sshd
+++ b/package/openssh/S50sshd
@@ -3,6 +3,9 @@
 # sshd        Starts sshd.
 #
 
+DAEMON="sshd"
+PIDFILE="/var/run/$DAEMON.pid"
+
 # Make sure the ssh-keygen progam exists
 [ -f /usr/bin/ssh-keygen ] || exit 0
 
@@ -13,15 +16,27 @@ start() {
 	/usr/bin/ssh-keygen -A
 
 	printf "Starting sshd: "
-	/usr/sbin/sshd
-	touch /var/lock/sshd
-	echo "OK"
+	start-stop-daemon -S -q -p "$PIDFILE" -x "/usr/sbin/sshd"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		touch /var/lock/sshd
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
 }
 stop() {
 	printf "Stopping sshd: "
-	killall sshd
-	rm -f /var/lock/sshd
-	echo "OK"
+	start-stop-daemon -K -q -p "$PIDFILE"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		rm -f /var/lock/sshd
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
 }
 restart() {
 	stop
-- 
2.29.2
