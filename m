From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 20:59:46 +0200
Subject: [Buildroot] [git commit] dcron: provide init script
Message-ID: <20140717190005.BF7EF9D26B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=994e9fa72e80f8d618393619fefd68f65821144f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dcron doesn't create a pid file, so we run it in foreground but make
start-stop-daemon create the pidfile and move the daemon to background.

Give it a number greater than exim's init script, so job output email
can be sent.

[Thomas: as suggested by Yann E. Morin, use DCRON_INSTALL_INIT_SYSV.]

Signed-off-by: Alvaro G. M <alvaro.gamez@hazent.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dcron/S90dcron |   22 ++++++++++++++++++++++
 package/dcron/dcron.mk |    4 ++++
 2 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/package/dcron/S90dcron b/package/dcron/S90dcron
new file mode 100644
index 0000000..c2925fd
--- /dev/null
+++ b/package/dcron/S90dcron
@@ -0,0 +1,22 @@
+#!/bin/sh
+
+case "$1" in
+	start)
+		echo -n "Starting cron ... "
+		start-stop-daemon -S -q -m -b -p /var/run/dcron.pid --exec /usr/sbin/crond -- -f
+		echo "done."
+		;;
+	stop)
+		echo -n "Stopping cron ..."
+		start-stop-daemon -K -q -p /var/run/dcron.pid
+		echo "done."
+		;;
+	restart)
+		$0 stop
+		sleep 1
+		$0 start
+		;;
+	*)
+		echo "usage: $0 {start|stop|restart}"
+		;;
+esac
diff --git a/package/dcron/dcron.mk b/package/dcron/dcron.mk
index 5174e38..8892b96 100644
--- a/package/dcron/dcron.mk
+++ b/package/dcron/dcron.mk
@@ -29,4 +29,8 @@ define DCRON_INSTALL_TARGET_CMDS
 	        $(TARGET_DIR)/etc/cron.monthly $(TARGET_DIR)/etc/cron.weekly
 endef
 
+define DCRON_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/dcron/S90dcron $(TARGET_DIR)/etc/init.d/S90dcron
+endef
+
 $(eval $(generic-package))
