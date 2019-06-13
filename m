From: Frank Sigalas <frasigal@gmail.com>
Date: Thu, 13 Jun 2019 23:47:09 +0300
Subject: [Buildroot] [PATCH 1/1] package/docker-engine: add disable
 pivot_root option
Message-ID: <1560458829-20187-1-git-send-email-frasigal@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sets the environment variable DOCKER_RAMDISK before starting dockerd.

Signed-off-by: Frank Sigalas <frasigal@gmail.com>
---
 package/docker-engine/Config.in          |  5 +++++
 package/docker-engine/S60dockerd-ramdisk | 38 ++++++++++++++++++++++++++++++++
 package/docker-engine/docker-engine.mk   |  8 ++++++-
 3 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 package/docker-engine/S60dockerd-ramdisk

diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 1fd229f..5405b3d 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -48,6 +48,11 @@ config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_VFS
 	help
 	  Build the vfs filesystem driver for Docker.
 
+config BR2_PACKAGE_DOCKER_ENGINE_RAMDISK
+	bool "disable pivot_root"
+	help
+	  Disable pivot_root to run docker in ramdisk.
+
 endif
 
 comment "docker-engine needs a glibc or musl toolchain w/ threads"
diff --git a/package/docker-engine/S60dockerd-ramdisk b/package/docker-engine/S60dockerd-ramdisk
new file mode 100644
index 0000000..a1092b6
--- /dev/null
+++ b/package/docker-engine/S60dockerd-ramdisk
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
+		--pidfile $PIDFILE --exec /usr/bin/env DOCKER_RAMDISK=1 $DAEMON -- $DAEMON_ARGS \
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
index 50d4129..d4608fb 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -51,6 +51,12 @@ else
 DOCKER_ENGINE_TAGS += exclude_graphdriver_vfs
 endif
 
+ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_RAMDISK),y)
+DOCKER_ENGINE_INIT_SCRIPT = S60dockerd-ramdisk
+else
+DOCKER_ENGINE_INIT_SCRIPT = S60dockerd
+endif
+
 DOCKER_ENGINE_INSTALL_BINS = $(notdir $(DOCKER_ENGINE_BUILD_TARGETS))
 
 define DOCKER_ENGINE_RUN_AUTOGEN
@@ -74,7 +80,7 @@ define DOCKER_ENGINE_INSTALL_INIT_SYSTEMD
 endef
 
 define DOCKER_ENGINE_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 755 package/docker-engine/S60dockerd \
+	$(INSTALL) -D -m 755 package/docker-engine/$(DOCKER_ENGINE_INIT_SCRIPT) \
 		$(TARGET_DIR)/etc/init.d/S60dockerd
 endef
 
-- 
2.7.4
