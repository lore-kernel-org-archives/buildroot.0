From: Javier Viguera <javier.viguera@digi.com>
Date: Wed, 6 Nov 2013 11:00:56 +0100
Subject: [Buildroot] [PATCH] busybox: minor fixes to S01logging bootscript
Message-ID: <1383732056-39746-1-git-send-email-javier.viguera@digi.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* The PID file is not created unless the '-m' option is passed to
  start-stop-daemon.

* Remove the mark '-m 0' option as it's not supported by busybox's
  syslogd.

* Syslogd and Klogd forks to background by default giving as a result
  that the pid stored in the PID file is not correct. Let the
  background job be done by 'start-stop-daemon' by passing '-n'
  (foreground) to the daemons and '-b' to start-stop-daemon. This
  way the pid stored in the PID files is correct.

Signed-off-by: Javier Viguera <javier.viguera@digi.com>
---
 package/busybox/S01logging | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/busybox/S01logging b/package/busybox/S01logging
index 37a2c11..b7af2a7 100644
--- a/package/busybox/S01logging
+++ b/package/busybox/S01logging
@@ -6,8 +6,8 @@
 case "$1" in
   start)
 	echo -n "Starting logging: "
-	start-stop-daemon -S -q -p /var/run/syslogd.pid --exec /sbin/syslogd -- -m 0
-	start-stop-daemon -S -q -p /var/run/klogd.pid --exec /sbin/klogd
+	start-stop-daemon -b -S -q -m -p /var/run/syslogd.pid --exec /sbin/syslogd -- -n
+	start-stop-daemon -b -S -q -m -p /var/run/klogd.pid --exec /sbin/klogd -- -n
 	echo "OK"
 	;;
   stop)
