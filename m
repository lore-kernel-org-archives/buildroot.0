From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Jan 2019 08:33:09 +0100
Subject: [Buildroot] [git commit] package/docker-engine: add sysv init script
Message-ID: <20190131073225.6715781513@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30f23f9980efa612aae5cecc3d4221b912248095
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Acked-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-engine/S60dockerd       | 38 ++++++++++++++++++++++++++++++++++
 package/docker-engine/docker-engine.mk |  5 +++++
 2 files changed, 43 insertions(+)

diff --git a/package/docker-engine/S60dockerd b/package/docker-engine/S60dockerd
new file mode 100755
index 0000000000..def8bea149
--- /dev/null
+++ b/package/docker-engine/S60dockerd
@@ -0,0 +1,38 @@
+#!/bin/sh
+
+NAME=dockerd
+DAEMON=/usr/bin/$NAME
+PIDFILE=/var/run/$NAME.pid
+DAEMON_ARGS=""
+
+[ -r /etc/default/$NAME ] && . /etc/default/$NAME $1
+
+do_start() {
+        echo -n "Starting $NAME: "
+        start-stop-daemon --start --quiet --background --make-pidfile \
+		--pidfile $PIDFILE --exec $DAEMON -- $DAEMON_ARGS \
+                && echo "OK" || echo "FAIL"
+}
+
+do_stop() {
+        echo -n "Stopping $NAME: "
+        start-stop-daemon --stop --quiet --pidfile $PIDFILE \
+                && echo "OK" || echo "FAIL"
+}
+
+case "$1" in
+        start)
+                do_start
+                ;;
+        stop)
+                do_stop
+                ;;
+        restart)
+                do_stop
+                sleep 1
+                do_start
+                ;;
+	*)
+                echo "Usage: $0 {start|stop|restart}"
+                exit 1
+esac
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index f19c1d995c..aae44ab6df 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -73,6 +73,11 @@ define DOCKER_ENGINE_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/docker.service
 endef
 
+define DOCKER_ENGINE_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/docker-engine/S60dockerd \
+		$(TARGET_DIR)/etc/init.d/S60dockerd
+endef
+
 define DOCKER_ENGINE_USERS
 	- - docker -1 * - - - Docker Application Container Framework
 endef
