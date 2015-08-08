From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:11 -0000
Subject: [Buildroot] [git commit branch/next] package/redis: Add systemV
	init script
Message-ID: <20150808105640.E6E367FFCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b386fda5cb95f3a0ef1161f3ec55f632550ad34c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

start-stop-daemon is used to start redis-server as user redis in the
background.  Once redis-server is running we use redis-cli to shutdown
cleanly.

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/redis/S50redis |   38 ++++++++++++++++++++++++++++++++++++++
 package/redis/redis.mk |    5 +++++
 2 files changed, 43 insertions(+), 0 deletions(-)

diff --git a/package/redis/S50redis b/package/redis/S50redis
new file mode 100644
index 0000000..c5751d7
--- /dev/null
+++ b/package/redis/S50redis
@@ -0,0 +1,38 @@
+#!/bin/sh
+#
+# start redis
+#
+
+start() {
+	echo -n "Starting redis: "
+	umask 077
+	start-stop-daemon -S -q -c redis:redis -b \
+		--exec /usr/bin/redis-server -- /etc/redis.conf
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+stop() {
+	echo -n "Stopping redis: "
+	/usr/bin/redis-cli shutdown
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+	start)
+		start
+		;;
+	stop)
+		stop
+		;;
+	restart|reload)
+		restart
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+		exit 1
+esac
+
+exit $?
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 04c2d6a..8537fb2 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -30,4 +30,9 @@ define REDIS_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/etc/redis.conf
 endef
 
+define REDIS_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/redis/S50redis \
+		$(TARGET_DIR)/etc/init.d/S50redis
+endef
+
 $(eval $(generic-package))
