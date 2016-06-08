From: Andrew Webster <Awebster@arcx.com>
Date: Wed, 8 Jun 2016 15:29:53 +0000
Subject: [Buildroot] [PATCH v6 3/3] docker-engine: new package
In-Reply-To: <20160607224744.5ed22c32@free-electrons.com>
References: <1464475578-22239-1-git-send-email-christian@paral.in>
 <1464475578-22239-4-git-send-email-christian@paral.in>
 <f27fd228ed034bc499fe1c69ac9a3980@WEBMAIL.arcx.com>
 <20160607215439.76ad85ee@free-electrons.com>
 <CA+h8R2oZypDvm65RVp3fNX1MYCxSWqX95MxLW-q-K25d4tNccg@mail.gmail.com>
 <59dc9de3a6b14bf5be1c61368dc0cbde@WEBMAIL.arcx.com>
 <20160607224744.5ed22c32@free-electrons.com>
Message-ID: <6f608608c76e4ebd82e22c93ea6add8d@WEBMAIL.arcx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here is a patch with the init file I used.  I copied the contrib/init/sysvinit-debian/docker file and modified it slightly.

In start), the stdout/stderr of start-stop-daemon is logged to $DOCKER_LOGFILE.  I suspect that the intention was to actually log the stdout/stderr of docker, not start-stop-daemon, but I have left it as it was in the original file.

Author: Andrew Webster <awebster@arcx.com>
Date:   Mon Jun 6 14:53:08 2016 -0400

    docker-engine: switch sysv init to custom file
    
    The packaged redhat init file is not suitable for buildroot.
    This adds a customized version for buildroot.

    Signed-off-by: Andrew Webster <awebster@arcx.com>

diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index b7407b2..17e4516 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -86,10 +86,10 @@ define DOCKER_ENGINE_INSTALL_INIT_SYSTEMD
 endef
 
 define DOCKER_ENGINE_INSTALL_INIT_SYSV
-    $(INSTALL) -D -m 755 $(@D)/contrib/init/sysvinit-redhat/docker \
+    $(INSTALL) -D -m 755 package/docker-engine/docker.init \
         $(TARGET_DIR)/etc/init.d/S61docker
-    $(INSTALL) -D -m 644 $(@D)/contrib/init/sysvinit-redhat/docker.sysconfig \
-        $(TARGET_DIR)/etc/sysconfig/docker.sysconfig
+    $(INSTALL) -D -m 644 $(@D)/contrib/init/sysvinit-debian/docker.default \
+        $(TARGET_DIR)/etc/default/docker
 endef
 
 define DOCKER_ENGINE_USERS
diff --git a/package/docker-engine/docker.init b/package/docker-engine/docker.init
new file mode 100755
index 0000000..9efa925
--- /dev/null
+++ b/package/docker-engine/docker.init
@@ -0,0 +1,111 @@
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
+DOCKER=/usr/bin/$BASE
+# This is the pid file managed by docker itself
+DOCKER_PIDFILE=/var/run/$BASE.pid
+# This is the pid file created/managed by start-stop-daemon
+DOCKER_SSD_PIDFILE=/var/run/$BASE-ssd.pid
+DOCKER_LOGFILE=/var/log/$BASE.log
+DOCKER_OPTS=
+DOCKER_DESC="Docker"
+
+if [ -f /etc/default/$BASE ]; then
+    . /etc/default/$BASE
+fi
+
+# Check docker is present
+if [ ! -x $DOCKER ]; then
+    echo "$DOCKER not present or not executable"
+    exit 1
+fi
+
+cgroupfs_mount() {
+    # see also https://github.com/tianon/cgroupfs-mount/blob/master/cgroupfs-mount
+    if grep -v '^#' /etc/fstab | grep -q cgroup \
+        || [ ! -e /proc/cgroups ] \
+        || [ ! -d /sys/fs/cgroup ]; then
+        return
+    fi
+    if ! mountpoint -q /sys/fs/cgroup; then
+        mount -t tmpfs -o uid=0,gid=0,mode=0755 cgroup /sys/fs/cgroup
+    fi
+    (
+        cd /sys/fs/cgroup
+        for sys in $(awk '!/^#/ { if ($4 == 1) print $1 }' /proc/cgroups); do
+            mkdir -p $sys
+            if ! mountpoint -q $sys; then
+                if ! mount -n -t cgroup -o $sys cgroup $sys; then
+                    rmdir $sys || true
+                fi
+            fi
+        done
+    )
+}
+
+case "$1" in
+    start)
+        cgroupfs_mount
+
+        ulimit -n 1048576
+        if [ "$BASH" ]; then
+            ulimit -u 1048576
+        else
+            ulimit -p 1048576
+        fi
+
+        echo "Starting $DOCKER_DESC: $BASE"
+        start-stop-daemon --start --background \
+            --exec "$DOCKER" \
+            --pidfile "$DOCKER_SSD_PIDFILE" \
+            --make-pidfile \
+            -- \
+                daemon -p "$DOCKER_PIDFILE" \
+                $DOCKER_OPTS \
+                    >> "$DOCKER_LOGFILE" 2>&1
+        echo $?
+        ;;
+
+    stop)
+        echo "Stopping $DOCKER_DESC: $BASE"
+        start-stop-daemon --stop --pidfile "$DOCKER_SSD_PIDFILE" --retry 10
+        echo $?
+        ;;
+
+    restart)
+        docker_pid=`cat "$DOCKER_SSD_PIDFILE" 2>/dev/null`
+        [ -n "$docker_pid" ] \
+            && ps -p $docker_pid > /dev/null 2>&1 \
+            && $0 stop
+        $0 start
+        ;;
+
+    force-reload)
+        $0 restart
+        ;;
+
+    *)
+        echo "Usage: service docker {start|stop|restart}"
+        exit 1
+        ;;
+esac
