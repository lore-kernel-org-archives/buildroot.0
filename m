From: Christian Stewart <christian@paral.in>
Date: Tue,  5 Jul 2016 15:58:18 -0700
Subject: [Buildroot] [PATCH v8 1/1] docker-engine: new package
Message-ID: <1467759498-3523-1-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Docker is a platform to build, ship, and run applications in portable
containers.

Signed-off-by: Andrew Webster <awebster@arcx.com>
Signed-off-by: Christian Stewart <christian@paral.in>

---

Changes since v1:
 - use call github to build source URL
Changes since v3:
 - fix help indentation in Config.in
 - use HOST_GO_TARGET_ENV as a base for build env vars
 - cleanup build commands
 - cleanup GOPATH and vendor directory setup
 - Remove selections for graph drivers. Docker will gracefully degrade
   at runtime to the best available graphdriver. It is unnecessary to
   disable these at build time, or to pull in any other dependencies
   like aufs-util or btrfs tools. The daemon will use whatever is
   available at runtime.
Changes since v4:
 - remove commit hash from version scheme
Changes since v5:
 - re-introduce graphdriver selections
 - these selections are required for btrfs and devicemapper
 - there are buildtime dependencies on headers.
 - bump to v1.12.0-rc3
 - remove hack/vendor.sh call, it is unnecessary, dependencies are
   pre-vendored into the source tree.
Changes since v6:
 - remove build-time dependency on docker-containerd and runc
 - install dockerd only if daemon is enabled
 - move all daemon dependencies into daemon selection
 - only install sysv, users, etc if daemon is enabled
 - add a proper sysv init file
 - remove DOCKER_OPTS in init file
 - remove test for $BASH as bash is never used for init
 - use hash for documentation link in sysv init file
 - remove unnecessary path change in sysv init file
 - remove exit on error line in sysv init file
 - remove init info comment from sysv init file
Changes since v7:
 - remove "-static" cgo flag which fixes build of btrfs and other
   additional filesystem drivers.
 - build + run test with alternate filesystem drivers.
---
 package/Config.in                        |   1 +
 package/docker-engine/Config.in          |  69 ++++++++++++++++++
 package/docker-engine/docker-engine.hash |   2 +
 package/docker-engine/docker-engine.mk   | 119 +++++++++++++++++++++++++++++++
 package/docker-engine/docker.init        |  89 +++++++++++++++++++++++
 5 files changed, 280 insertions(+)
 create mode 100644 package/docker-engine/Config.in
 create mode 100644 package/docker-engine/docker-engine.hash
 create mode 100644 package/docker-engine/docker-engine.mk
 create mode 100644 package/docker-engine/docker.init

diff --git a/package/Config.in b/package/Config.in
index 15271a2..3b82d49 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1643,6 +1643,7 @@ menu "System tools"
 	source "package/dcron/Config.in"
 	source "package/debianutils/Config.in"
 	source "package/docker-containerd/Config.in"
+	source "package/docker-engine/Config.in"
 	source "package/cgroupfs-mount/Config.in"
 	source "package/dsp-tools/Config.in"
 	source "package/efibootmgr/Config.in"
diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
new file mode 100644
index 0000000..82cd251
--- /dev/null
+++ b/package/docker-engine/Config.in
@@ -0,0 +1,69 @@
+config BR2_PACKAGE_DOCKER_ENGINE
+	bool "docker-engine"
+	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Docker is a platform to build, ship,
+	  and run applications as lightweight containers.
+
+	  https://github.com/docker/docker
+
+if BR2_PACKAGE_DOCKER_ENGINE
+
+config BR2_PACKAGE_DOCKER_ENGINE_DAEMON
+	bool "docker daemon"
+	depends on BR2_USE_MMU # docker-containerd
+	depends on BR2_USE_WCHAR # docker-containerd
+	select BR2_PACKAGE_DOCKER_CONTAINERD # docker-containerd: runtime dependency
+	select BR2_PACKAGE_RUNC # docker-containerd: runtime dependency
+	select BR2_PACKAGE_UTIL_LINUX # docker-containerd: runtime dependency
+	select BR2_PACKAGE_UTIL_LINUX_BINARIES # docker-containerd: runtime dependency
+	select BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT # docker-containerd: runtime dependency
+	select BR2_PACKAGE_UTIL_LINUX_MOUNTPOINT # docker-containerd: runtime dependency
+	select BR2_PACKAGE_UTIL_LINUX_MOUNT # docker-containerd: runtime dependency
+	select BR2_PACKAGE_SQLITE # docker-engine: runtime dependency
+	default y
+	help
+	  Build the Docker system daemon.
+	  If not selected, will build client only.
+
+config BR2_PACKAGE_DOCKER_ENGINE_EXPERIMENTAL
+	bool "build experimental features"
+
+if BR2_PACKAGE_DOCKER_ENGINE_DAEMON
+
+config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS
+	bool "btrfs filesystem driver"
+	depends on BR2_USE_WCHAR # btrfs-progs
+	depends on BR2_USE_MMU # btrfs-progs
+	depends on BR2_TOOLCHAIN_HAS_THREADS # btrfs-progs
+	select BR2_PACKAGE_BTRFS_PROGS
+	help
+	  Build the btrfs filesystem driver for Docker.
+
+config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_DEVICEMAPPER
+	bool "devicemapper filesystem driver"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
+	depends on BR2_USE_MMU # lvm2
+	depends on !BR2_STATIC_LIBS # lvm2
+	select BR2_PACKAGE_LVM2
+	select BR2_PACKAGE_LVM2_APP_LIBRARY
+	help
+	  Build the devicemapper filesystem driver for Docker.
+
+config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_VFS
+	bool "vfs filesystem driver"
+	depends on BR2_USE_WCHAR # gvfs
+	depends on BR2_USE_MMU # gvfs
+	depends on BR2_TOOLCHAIN_HAS_THREADS # gvfs
+	select BR2_PACKAGE_GVFS
+	help
+	  Build the vfs filesystem driver for Docker.
+
+endif
+
+endif
+
+comment "docker-engine needs a toolchain w/ threads"
+	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
new file mode 100644
index 0000000..ac90ee6
--- /dev/null
+++ b/package/docker-engine/docker-engine.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 3f030c4f084ed518efeb00f21f3fdfb25252dd9c153b1d42da953e59bb41c582  docker-engine-v1.12.0-rc3.tar.gz
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
new file mode 100644
index 0000000..c6468fb
--- /dev/null
+++ b/package/docker-engine/docker-engine.mk
@@ -0,0 +1,119 @@
+################################################################################
+#
+# docker-engine
+#
+################################################################################
+
+DOCKER_ENGINE_VERSION = v1.12.0-rc3
+DOCKER_ENGINE_SITE = $(call github,docker,docker,$(DOCKER_ENGINE_VERSION))
+
+DOCKER_ENGINE_LICENSE = Apache-2.0
+DOCKER_ENGINE_LICENSE_FILES = LICENSE
+
+DOCKER_ENGINE_DEPENDENCIES = host-go
+
+DOCKER_ENGINE_GOPATH = "$(@D)/vendor"
+DOCKER_ENGINE_MAKE_ENV = $(HOST_GO_TARGET_ENV) \
+	CGO_ENABLED=1 \
+	CGO_NO_EMULATION=1 \
+	GOBIN="$(@D)/bin" \
+	GOPATH="$(DOCKER_ENGINE_GOPATH)" \
+	CPATH=$$CPATH:$(TARGET_DIR)/usr/include/ \
+	LIBRARY_PATH=$$LIBRARY_PATH:$(TARGET_DIR)/usr/lib/
+
+DOCKER_ENGINE_GLDFLAGS = \
+	-X main.GitCommit=$(DOCKER_ENGINE_VERSION) \
+	-X main.Version=$(DOCKER_ENGINE_VERSION)
+
+DOCKER_ENGINE_BUILD_TAGS = cgo exclude_graphdriver_zfs autogen
+
+ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
+DOCKER_ENGINE_BUILD_TAGS += seccomp
+DOCKER_ENGINE_DEPENDENCIES += libseccomp
+endif
+
+ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DAEMON),y)
+DOCKER_ENGINE_BUILD_TAGS += daemon
+endif
+
+ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_EXPERIMENTAL),y)
+DOCKER_ENGINE_BUILD_TAGS += experimental
+endif
+
+ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS),y)
+DOCKER_ENGINE_DEPENDENCIES += btrfs-progs
+else
+DOCKER_ENGINE_BUILD_TAGS += exclude_graphdriver_btrfs
+endif
+
+ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_DEVICEMAPPER),y)
+DOCKER_ENGINE_DEPENDENCIES += lvm2
+else
+DOCKER_ENGINE_BUILD_TAGS += exclude_graphdriver_devicemapper
+endif
+
+ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_VFS),y)
+DOCKER_ENGINE_DEPENDENCIES += gvfs
+else
+DOCKER_ENGINE_BUILD_TAGS += exclude_graphdriver_vfs
+endif
+
+define DOCKER_ENGINE_CONFIGURE_CMDS
+	ln -fs $(@D) $(DOCKER_ENGINE_GOPATH)/src/github.com/docker/docker
+	cd $(@D) && \
+		GITCOMMIT="unknown" BUILDTIME="$$(date)" VERSION="$(DOCKER_ENGINE_VERSION)" \
+		bash ./hack/make/.go-autogen
+endef
+
+define DOCKER_ENGINE_BUILD_CLIENT_CMDS
+	cd $(@D); $(DOCKER_ENGINE_MAKE_ENV) $(HOST_DIR)/usr/bin/go build -v -o $(@D)/bin/docker -tags "$(DOCKER_ENGINE_BUILD_TAGS)" -ldflags "$(DOCKER_ENGINE_GLDFLAGS)" ./cmd/docker
+endef
+
+define DOCKER_ENGINE_INSTALL_TARGET_CLIENT_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/docker $(TARGET_DIR)/usr/bin/docker
+endef
+
+ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DAEMON),y)
+
+define DOCKER_ENGINE_BUILD_DAEMON_CMDS
+	cd $(@D); $(DOCKER_ENGINE_MAKE_ENV) $(HOST_DIR)/usr/bin/go build -v -o $(@D)/bin/dockerd -tags "$(DOCKER_ENGINE_BUILD_TAGS)" -ldflags "$(DOCKER_ENGINE_GLDFLAGS)" ./cmd/dockerd
+endef
+
+define DOCKER_ENGINE_INSTALL_TARGET_DAEMON_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/dockerd $(TARGET_DIR)/usr/bin/dockerd
+endef
+
+define DOCKER_ENGINE_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 $(@D)/contrib/init/systemd/docker.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/docker.service
+	$(INSTALL) -D -m 0644 $(@D)/contrib/init/systemd/docker.socket \
+		$(TARGET_DIR)/usr/lib/systemd/system/docker.socket
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/
+	ln -fs ../../../../usr/lib/systemd/system/docker.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/docker.service
+endef
+
+define DOCKER_ENGINE_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/docker-engine/docker.init \
+		$(TARGET_DIR)/etc/init.d/S61docker
+	$(INSTALL) -D -m 644 $(@D)/contrib/init/sysvinit-debian/docker.default \
+		$(TARGET_DIR)/etc/default/docker
+endef
+
+define DOCKER_ENGINE_USERS
+	- - docker -1 * - - - Docker Application Container Framework
+endef
+
+endif
+
+define DOCKER_ENGINE_BUILD_CMDS
+	$(DOCKER_ENGINE_BUILD_CLIENT_CMDS)
+	$(DOCKER_ENGINE_BUILD_DAEMON_CMDS)
+endef
+
+define DOCKER_ENGINE_INSTALL_TARGET_CMDS
+	$(DOCKER_ENGINE_INSTALL_TARGET_CLIENT_CMDS)
+	$(DOCKER_ENGINE_INSTALL_TARGET_DAEMON_CMDS)
+endef
+
+$(eval $(generic-package))
diff --git a/package/docker-engine/docker.init b/package/docker-engine/docker.init
new file mode 100644
index 0000000..99c38b7
--- /dev/null
+++ b/package/docker-engine/docker.init
@@ -0,0 +1,89 @@
+#!/bin/sh
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
+       # see also https://github.com/tianon/cgroupfs-mount/blob/951c38ee8d802330454bdede20d85ec1c0f8d312/cgroupfs-mount
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
+               ulimit -p 1048576
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
+                       && [ -d /proc/$docker_pid ] \
+                       && $0 stop \
+                       && sleep 1
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
