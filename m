From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 15:29:21 +0200
Subject: [Buildroot] [PATCH v9 2/2] docker-engine: new package
In-Reply-To: <1469220779-31430-2-git-send-email-christian@paral.in>
References: <1469220779-31430-1-git-send-email-christian@paral.in>
 <1469220779-31430-2-git-send-email-christian@paral.in>
Message-ID: <20160724152921.0601232e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 22 Jul 2016 13:52:59 -0700, Christian Stewart wrote:

> diff --git a/package/Config.in b/package/Config.in
> index 6a84f9f..c871e63 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1667,6 +1667,8 @@ menu "System tools"
>  	source "package/dcron/Config.in"
>  	source "package/debianutils/Config.in"
>  	source "package/docker-containerd/Config.in"
> +	source "package/docker-engine/Config.in"
> +	source "package/cgroupfs-mount/Config.in"

cgroupfs-mount ?

>  	source "package/dsp-tools/Config.in"
>  	source "package/efibootmgr/Config.in"
>  	source "package/efivar/Config.in"
> diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
> new file mode 100644
> index 0000000..82cd251
> --- /dev/null
> +++ b/package/docker-engine/Config.in
> @@ -0,0 +1,69 @@
> +config BR2_PACKAGE_DOCKER_ENGINE
> +	bool "docker-engine"
> +	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	help
> +	  Docker is a platform to build, ship,
> +	  and run applications as lightweight containers.
> +
> +	  https://github.com/docker/docker
> +
> +if BR2_PACKAGE_DOCKER_ENGINE
> +
> +config BR2_PACKAGE_DOCKER_ENGINE_DAEMON
> +	bool "docker daemon"
> +	depends on BR2_USE_MMU # docker-containerd
> +	depends on BR2_USE_WCHAR # docker-containerd
> +	select BR2_PACKAGE_DOCKER_CONTAINERD # docker-containerd: runtime dependency

The comment should just be "# runtime dependency"

> +	select BR2_PACKAGE_RUNC # docker-containerd: runtime dependency
> +	select BR2_PACKAGE_UTIL_LINUX # docker-containerd: runtime dependency
> +	select BR2_PACKAGE_UTIL_LINUX_BINARIES # docker-containerd: runtime dependency
> +	select BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT # docker-containerd: runtime dependency
> +	select BR2_PACKAGE_UTIL_LINUX_MOUNTPOINT # docker-containerd: runtime dependency
> +	select BR2_PACKAGE_UTIL_LINUX_MOUNT # docker-containerd: runtime dependency

None of these lines are needed. All those packages are already selected
by docker-containerd.

> +	select BR2_PACKAGE_SQLITE # docker-engine: runtime dependency

The comment should just be "# runtime dependency"

> diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
> new file mode 100644
> index 0000000..1de09f8
> --- /dev/null
> +++ b/package/docker-engine/docker-engine.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256 bc256d2a348efbf236eab991254c925fa1917dd1e29cb40586f1696f4e24852e  docker-engine-v1.12.0-rc4.tar.gz
> diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
> new file mode 100644
> index 0000000..9b0977d
> --- /dev/null
> +++ b/package/docker-engine/docker-engine.mk
> @@ -0,0 +1,119 @@
> +################################################################################
> +#
> +# docker-engine
> +#
> +################################################################################
> +
> +DOCKER_ENGINE_VERSION = v1.12.0-rc4
> +DOCKER_ENGINE_SITE = $(call github,docker,docker,$(DOCKER_ENGINE_VERSION))
> +
> +DOCKER_ENGINE_LICENSE = Apache-2.0
> +DOCKER_ENGINE_LICENSE_FILES = LICENSE
> +
> +DOCKER_ENGINE_DEPENDENCIES = host-go
> +
> +DOCKER_ENGINE_GOPATH = "$(@D)/vendor"
> +DOCKER_ENGINE_MAKE_ENV = $(HOST_GO_TARGET_ENV) \
> +	CGO_ENABLED=1 \

If you use CGO, then docker needs to also depend on
BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS, see docker-containerd.

> +	CGO_NO_EMULATION=1 \
> +	GOBIN="$(@D)/bin" \
> +	GOPATH="$(DOCKER_ENGINE_GOPATH)" \
> +	CPATH=$$CPATH:$(TARGET_DIR)/usr/include/ \

What is this CPATH ? Indeed there is usually nothing in
TARGET_DIR/usr/include.

> +	LIBRARY_PATH=$$LIBRARY_PATH:$(TARGET_DIR)/usr/lib/
> +
> +DOCKER_ENGINE_GLDFLAGS = \
> +	-X main.GitCommit=$(DOCKER_ENGINE_VERSION) \
> +	-X main.Version=$(DOCKER_ENGINE_VERSION)
> +
> +DOCKER_ENGINE_BUILD_TAGS = cgo exclude_graphdriver_zfs autogen
> +
> +ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
> +DOCKER_ENGINE_BUILD_TAGS += seccomp
> +DOCKER_ENGINE_DEPENDENCIES += libseccomp
> +endif

Perhaps add (see below how I'm using this) :

DOCKER_ENGINE_BUILD_TARGETS = docker

> +
> +ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DAEMON),y)
> +DOCKER_ENGINE_BUILD_TAGS += daemon

Add:

DOCKER_ENGINE_BUILD_TARGETS += dockerd

> +endif
> +
> +ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_EXPERIMENTAL),y)
> +DOCKER_ENGINE_BUILD_TAGS += experimental
> +endif
> +
> +ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS),y)
> +DOCKER_ENGINE_DEPENDENCIES += btrfs-progs
> +else
> +DOCKER_ENGINE_BUILD_TAGS += exclude_graphdriver_btrfs
> +endif
> +
> +ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_DEVICEMAPPER),y)
> +DOCKER_ENGINE_DEPENDENCIES += lvm2
> +else
> +DOCKER_ENGINE_BUILD_TAGS += exclude_graphdriver_devicemapper
> +endif
> +
> +ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_VFS),y)
> +DOCKER_ENGINE_DEPENDENCIES += gvfs
> +else
> +DOCKER_ENGINE_BUILD_TAGS += exclude_graphdriver_vfs
> +endif
> +
> +define DOCKER_ENGINE_CONFIGURE_CMDS
> +	ln -fs $(@D) $(DOCKER_ENGINE_GOPATH)/src/github.com/docker/docker
> +	cd $(@D) && \
> +		GITCOMMIT="unknown" BUILDTIME="$$(date)" VERSION="$(DOCKER_ENGINE_VERSION)" \
> +		bash ./hack/make/.go-autogen
> +endef
> +
> +define DOCKER_ENGINE_BUILD_CLIENT_CMDS
> +	cd $(@D); $(DOCKER_ENGINE_MAKE_ENV) $(HOST_DIR)/usr/bin/go build -v -o $(@D)/bin/docker -tags "$(DOCKER_ENGINE_BUILD_TAGS)" -ldflags "$(DOCKER_ENGINE_GLDFLAGS)" ./cmd/docker
> +endef
> +
> +define DOCKER_ENGINE_INSTALL_TARGET_CLIENT_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/bin/docker $(TARGET_DIR)/usr/bin/docker
> +endef
> +
> +ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DAEMON),y)
> +
> +define DOCKER_ENGINE_BUILD_DAEMON_CMDS
> +	cd $(@D); $(DOCKER_ENGINE_MAKE_ENV) $(HOST_DIR)/usr/bin/go build -v -o $(@D)/bin/dockerd -tags "$(DOCKER_ENGINE_BUILD_TAGS)" -ldflags "$(DOCKER_ENGINE_GLDFLAGS)" ./cmd/dockerd
> +endef
> +
> +define DOCKER_ENGINE_INSTALL_TARGET_DAEMON_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/bin/dockerd $(TARGET_DIR)/usr/bin/dockerd
> +endef

Those four variables can be removed (see below why).

> +
> +define DOCKER_ENGINE_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -D -m 0644 $(@D)/contrib/init/systemd/docker.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/docker.service
> +	$(INSTALL) -D -m 0644 $(@D)/contrib/init/systemd/docker.socket \
> +		$(TARGET_DIR)/usr/lib/systemd/system/docker.socket
> +	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/
> +	ln -fs ../../../../usr/lib/systemd/system/docker.service \
> +		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/docker.service
> +endef
> +
> +define DOCKER_ENGINE_INSTALL_INIT_SYSV
> +	$(INSTALL) -D -m 755 package/docker-engine/docker.init \
> +		$(TARGET_DIR)/etc/init.d/S61docker
> +	$(INSTALL) -D -m 644 $(@D)/contrib/init/sysvinit-debian/docker.default \
> +		$(TARGET_DIR)/etc/default/docker
> +endef
> +
> +define DOCKER_ENGINE_USERS
> +	- - docker -1 * - - - Docker Application Container Framework
> +endef
> +
> +endif
> +
> +define DOCKER_ENGINE_BUILD_CMDS
> +	$(DOCKER_ENGINE_BUILD_CLIENT_CMDS)
> +	$(DOCKER_ENGINE_BUILD_DAEMON_CMDS)

Use:

	$(foreach target,$(DOCKER_ENGINE_BUILD_TARGETS), \
		cd $(@D); $(DOCKER_ENGINE_MAKE_ENV) \
			$(HOST_DIR)/usr/bin/go build -v \
				-o $(@D)/bin/$(target) \
				-tags "$(DOCKER_ENGINE_BUILD_TAGS)" \
				-ldflags "$(DOCKER_ENGINE_GLDFLAGS)" \
				./cmd/$(target)
	)

> +endef
> +
> +define DOCKER_ENGINE_INSTALL_TARGET_CMDS
> +	$(DOCKER_ENGINE_INSTALL_TARGET_CLIENT_CMDS)
> +	$(DOCKER_ENGINE_INSTALL_TARGET_DAEMON_CMDS)

Use:

	$(foreach target,$(DOCKER_ENGINE_BUILD_TARGETS), \
		$(INSTALL) -D -m 0755 $(@D)/bin/$(target) $(TARGET_DIR)/usr/bin/$(target)
	)

> +++ b/package/docker-engine/docker.init

Should be named S61docker

> @@ -0,0 +1,89 @@
> +#!/bin/sh
> +
> +BASE=docker
> +
> +# modify these in /etc/default/$BASE (/etc/default/docker)
> +DOCKERD=/usr/bin/dockerd
> +# This is the pid file managed by docker itself
> +DOCKER_PIDFILE=/var/run/$BASE.pid
> +# This is the pid file created/managed by start-stop-daemon
> +DOCKER_SSD_PIDFILE=/var/run/$BASE-ssd.pid

Do we really need two pidfiles ? I don't think so. If docker creates
its own pidfile, then start-stop-daemon can use it.

> +DOCKER_LOGFILE=/var/log/$BASE.log
> +DOCKER_DESC="Docker"
> +
> +if [ -f /etc/default/$BASE ]; then
> +       . /etc/default/$BASE
> +fi
> +
> +# Check docker is present
> +if [ ! -x $DOCKERD ]; then
> +       echo "$DOCKERD not present or not executable"
> +       exit 1
> +fi

This check is not needed. If this script is present, docker is
installed. Or more exactly: if dockerd is needed for this script to
work, then this script should only be installed when the docker daemon
is enabled.

> +
> +cgroupfs_mount() {
> +       # see also https://github.com/tianon/cgroupfs-mount/blob/951c38ee8d802330454bdede20d85ec1c0f8d312/cgroupfs-mount
> +       if grep -v '^#' /etc/fstab | grep -q cgroup \
> +               || [ ! -e /proc/cgroups ] \
> +               || [ ! -d /sys/fs/cgroup ]; then
> +               return
> +       fi
> +       if ! mountpoint -q /sys/fs/cgroup; then
> +               mount -t tmpfs -o uid=0,gid=0,mode=0755 cgroup /sys/fs/cgroup
> +       fi
> +       (
> +               cd /sys/fs/cgroup
> +               for sys in $(awk '!/^#/ { if ($4 == 1) print $1 }' /proc/cgroups); do
> +                       mkdir -p $sys
> +                       if ! mountpoint -q $sys; then
> +                               if ! mount -n -t cgroup -o $sys cgroup $sys; then
> +                                       rmdir $sys || true
> +                               fi
> +                       fi
> +               done
> +       )

Isn't this already done by the cgroupfs-mount package ?

> +}
> +
> +case "$1" in
> +       start)
> +               cgroupfs_mount
> +
> +               ulimit -n 1048576
> +               ulimit -p 1048576
> +
> +               echo "Starting $DOCKER_DESC: $BASE"

Use tabs for indentation.

Replace with:

		printf "Starting docker: "

> +               start-stop-daemon --start --background \
> +                       --exec "$DOCKERD" \
> +                       --pidfile "$DOCKER_SSD_PIDFILE" \
> +                       --make-pidfile \

Use the short option, like we do in other init scripts, and get rid of
the start-stop-daemon pid file if docker creates one.

		start-stop-daemon -S -q -b -x $DOCKERD -- -p /var/run/docker.pid $DOCKER_OPTS

> +                       -- \
> +                               -p "$DOCKER_PIDFILE" \
> +                               $DOCKER_OPTS \
> +                                       >> "$DOCKER_LOGFILE" 2>&1

Is this redirect really doing something? When the --background/-b
option of start-stop-daemon is used, I believe it closes the 0/1/2 file
descriptors for the child process. Unless you enable option -C:

       -C, --no-close
              Do  not  close  any file descriptor when forcing the daemon into
              the background (since version 1.16.5).  Used for debugging  pur?
              poses to see the process output, or to redirect file descriptors
              to log the process output.  Only  relevant  when  using  --back?
              ground.

> +               echo $?

Replace with:

		[ $? = 0 ] && echo "OK" || echo "FAIL"

> +               ;;
> +
> +       stop)
> +               echo "Stopping $DOCKER_DESC: $BASE"

		printf "Stopping docker: "

> +               start-stop-daemon --stop --pidfile "$DOCKER_SSD_PIDFILE" --retry 10

		start-stop-daemon -K -q -p /var/run/docker.pid

> +               echo $?

		[ $? = 0 ] && echo "OK" || echo "FAIL"

> +               ;;
> +
> +       restart)
> +               docker_pid=`cat "$DOCKER_SSD_PIDFILE" 2>/dev/null`
> +               [ -n "$docker_pid" ] \
> +                       && [ -d /proc/$docker_pid ] \
> +                       && $0 stop \
> +                       && sleep 1
> +               $0 start

Why? Just:

		$0 stop
		$0 start

> +               ;;
> +
> +       force-reload)
> +               $0 restart
> +               ;;

Not needed.

> +
> +       *)
> +               echo "Usage: service docker {start|stop|restart}"
> +               exit 1
> +               ;;
> +esac

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
