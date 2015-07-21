From: Martin Bark <martin@barkynet.com>
Date: Tue, 21 Jul 2015 14:02:53 +0100
Subject: [Buildroot] [PATCH 4/5] package/redis: Add systemV init script
In-Reply-To: <1437483774-30291-1-git-send-email-martin@barkynet.com>
References: <1437483774-30291-1-git-send-email-martin@barkynet.com>
Message-ID: <1437483774-30291-4-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

start-stop-daemon is used to start redis-server as user redis in the
background.  Once redis-server is running we use redis-cli to shutdown
cleanly.

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/redis/S50redis | 38 ++++++++++++++++++++++++++++++++++++++
 package/redis/redis.mk |  5 +++++
 2 files changed, 43 insertions(+)
 create mode 100644 package/redis/S50redis

diff --git a/package/redis/S50redis b/package/redis/S50redis
new file mode 100644
index 0000000..450b368
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
+	su - redis -c '/usr/bin/redis-cli shutdown'
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
index aa985b6..fdc4bf5 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -31,4 +31,9 @@ define REDIS_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/etc/redis.conf
 endef
 
+define REDIS_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/redis/S50redis \
+		$(TARGET_DIR)/etc/init.d/S50redis
+endef
+
 $(eval $(generic-package))
-- 
2.1.4
