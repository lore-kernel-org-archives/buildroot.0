From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Mar 2016 23:07:31 +0100
Subject: [Buildroot] [git commit] busybox: Make S01logging source a default
	file
Message-ID: <20160309220856.DA06F7F8D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc2ded05bd588f29f8094db8f593e56f52f13299
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The default syslog parameters are to keep only 200-400 KiB of logs,
which is very few if there is a spammy daemon on the system, or a daemon
that fails and then spams errors that hides the original problem.

Make S01logging source a /etc/default/logging file where these
parameters can be overridden.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/S01logging | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/busybox/S01logging b/package/busybox/S01logging
index a72c69d..4632a4c 100644
--- a/package/busybox/S01logging
+++ b/package/busybox/S01logging
@@ -3,10 +3,14 @@
 # Start logging
 #
 
+SYSLOGD_ARGS=-n
+KLOGD_ARGS=-n
+[ -r /etc/default/logging ] && . /etc/default/logging
+
 start() {
 	printf "Starting logging: "
-	start-stop-daemon -b -S -q -m -p /var/run/syslogd.pid --exec /sbin/syslogd -- -n
-	start-stop-daemon -b -S -q -m -p /var/run/klogd.pid --exec /sbin/klogd -- -n
+	start-stop-daemon -b -S -q -m -p /var/run/syslogd.pid --exec /sbin/syslogd -- $SYSLOGD_ARGS
+	start-stop-daemon -b -S -q -m -p /var/run/klogd.pid --exec /sbin/klogd -- $KLOGD_ARGS
 	echo "OK"
 }
 
