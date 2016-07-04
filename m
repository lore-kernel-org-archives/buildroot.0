From: Christian Stewart <christian@paral.in>
Date: Mon,  4 Jul 2016 12:26:21 -0700
Subject: [Buildroot] [PATCH v6 4/5] package/docker-engine: proper sysv init
	file
In-Reply-To: <1467660382-6317-1-git-send-email-christian@paral.in>
References: <1467660382-6317-1-git-send-email-christian@paral.in>
Message-ID: <1467660382-6317-4-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Andrew Webster <awebster@arcx.com>

The packaged redhat init file is not suitable for buildroot.
This adds a customized version for buildroot.

Acked-by: Christian Stewart <christian@paral.in>
Signed-off-by: Andrew Webster <awebster@arcx.com>
Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-engine/docker-engine.mk |   6 +-
 package/docker-engine/docker.init      | 112 +++++++++++++++++++++++++++++++++
 2 files changed, 115 insertions(+), 3 deletions(-)
 create mode 100644 package/docker-engine/docker.init

diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 501afbc..4cb896c 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -103,10 +103,10 @@ define DOCKER_ENGINE_INSTALL_INIT_SYSTEMD
 endef
 
 define DOCKER_ENGINE_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 755 $(@D)/contrib/init/sysvinit-redhat/docker \
+	$(INSTALL) -D -m 755 package/docker-engine/docker.init \
 		$(TARGET_DIR)/etc/init.d/S61docker
-	$(INSTALL) -D -m 644 $(@D)/contrib/init/sysvinit-redhat/docker.sysconfig \
-		$(TARGET_DIR)/etc/sysconfig/docker.sysconfig
+	$(INSTALL) -D -m 644 $(@D)/contrib/init/sysvinit-debian/docker.default \
+		$(TARGET_DIR)/etc/default/docker
 endef
 
 define DOCKER_ENGINE_USERS
diff --git a/package/docker-engine/docker.init b/package/docker-engine/docker.init
new file mode 100644
index 0000000..a751551
--- /dev/null
+++ b/package/docker-engine/docker.init
@@ -0,0 +1,112 @@
+#!/bin/sh
+set -e
+
+### BEGIN INIT INFO
+# Provides:           docker
+# Required-Start:     $syslog $remote_fs
+# Required-Stop:      $syslog $remote_fs
+# Should-Start:       cgroupfs-mount cgroup-lite
+# Should-Stop:        cgroupfs-mount cgroup-lite
+# Default-Start:      2 3 4 5
+# Default-Stop:       0 1 6
+# Short-Description:  Create lightweight, portable, self-sufficient containers.
+# Description:
+#  Docker is an open-source project to easily create lightweight, portable,
+#  self-sufficient containers from any application. The same container that a
+#  developer builds and tests on a laptop can run at scale, in production, on
+#  VMs, bare metal, OpenStack clusters, public clouds and more.
+### END INIT INFO
+
+export PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin
+
+BASE=docker
+
+# modify these in /etc/default/$BASE (/etc/default/docker)
+DOCKERD=/usr/bin/dockerd
+# This is the pid file managed by docker itself
+DOCKER_PIDFILE=/var/run/$BASE.pid
+# This is the pid file created/managed by start-stop-daemon
+DOCKER_SSD_PIDFILE=/var/run/$BASE-ssd.pid
+DOCKER_LOGFILE=/var/log/$BASE.log
+DOCKER_OPTS=
+DOCKER_DESC="Docker"
+
+if [ -f /etc/default/$BASE ]; then
+       . /etc/default/$BASE
+fi
+
+# Check docker is present
+if [ ! -x $DOCKERD ]; then
+       echo "$DOCKERD not present or not executable"
+       exit 1
+fi
+
+cgroupfs_mount() {
+       # see also https://github.com/tianon/cgroupfs-mount/blob/master/cgroupfs-mount
+       if grep -v '^#' /etc/fstab | grep -q cgroup \
+               || [ ! -e /proc/cgroups ] \
+               || [ ! -d /sys/fs/cgroup ]; then
+               return
+       fi
+       if ! mountpoint -q /sys/fs/cgroup; then
+               mount -t tmpfs -o uid=0,gid=0,mode=0755 cgroup /sys/fs/cgroup
+       fi
+       (
+               cd /sys/fs/cgroup
+               for sys in $(awk '!/^#/ { if ($4 == 1) print $1 }' /proc/cgroups); do
+                       mkdir -p $sys
+                       if ! mountpoint -q $sys; then
+                               if ! mount -n -t cgroup -o $sys cgroup $sys; then
+                                       rmdir $sys || true
+                               fi
+                       fi
+               done
+       )
+}
+
+case "$1" in
+       start)
+               cgroupfs_mount
+
+               ulimit -n 1048576
+               if [ "$BASH" ]; then
+                       ulimit -u 1048576
+               else
+                       ulimit -p 1048576
+               fi
+
+               echo "Starting $DOCKER_DESC: $BASE"
+               start-stop-daemon --start --background \
+                       --exec "$DOCKERD" \
+                       --pidfile "$DOCKER_SSD_PIDFILE" \
+                       --make-pidfile \
+                       -- \
+                               -p "$DOCKER_PIDFILE" \
+                               $DOCKER_OPTS \
+                                       >> "$DOCKER_LOGFILE" 2>&1
+               echo $?
+               ;;
+
+       stop)
+               echo "Stopping $DOCKER_DESC: $BASE"
+               start-stop-daemon --stop --pidfile "$DOCKER_SSD_PIDFILE" --retry 10
+               echo $?
+               ;;
+
+       restart)
+               docker_pid=`cat "$DOCKER_SSD_PIDFILE" 2>/dev/null`
+               [ -n "$docker_pid" ] \
+                       && ps -p $docker_pid > /dev/null 2>&1 \
+                       && $0 stop
+               $0 start
+               ;;
+
+       force-reload)
+               $0 restart
+               ;;
+
+       *)
+               echo "Usage: service docker {start|stop|restart}"
+               exit 1
+               ;;
+esac
-- 
2.7.3
