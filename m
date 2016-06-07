From: Andrew Webster <Awebster@arcx.com>
Date: Tue, 7 Jun 2016 19:43:53 +0000
Subject: [Buildroot] [PATCH v6 3/3] docker-engine: new package
In-Reply-To: <1464475578-22239-4-git-send-email-christian@paral.in>
References: <1464475578-22239-1-git-send-email-christian@paral.in>
 <1464475578-22239-4-git-send-email-christian@paral.in>
Message-ID: <f27fd228ed034bc499fe1c69ac9a3980@WEBMAIL.arcx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian,

Nice work.  This opens some interesting possibilities.  

See comments below.

> -----Original Message-----
> From: buildroot [mailto:buildroot-bounces at busybox.net] On Behalf Of
> Christian Stewart
> Sent: Saturday, May 28, 2016 6:46 PM

> diff --git a/package/docker-engine/Config.in b/package/docker-
> engine/Config.in new file mode 100644 index 0000000..bbf56b1
> --- /dev/null
> +++ b/package/docker-engine/Config.in
> @@ -0,0 +1,69 @@
> +config BR2_PACKAGE_DOCKER_ENGINE
> +	bool "docker-engine"
> +	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_MMU # util-linux
> +	depends on BR2_USE_WCHAR # util-linux
> +	select BR2_PACKAGE_DOCKER_CONTAINERD
> +	select BR2_PACKAGE_RUNC
> +	select BR2_PACKAGE_SQLITE
> +	select BR2_PACKAGE_UTIL_LINUX
> +	select BR2_PACKAGE_UTIL_LINUX_BINARIES
> +	select BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT
> +	select BR2_PACKAGE_UTIL_LINUX_MOUNTPOINT
> +	select BR2_PACKAGE_UTIL_LINUX_MOUNT

Does it makes sense to also add selects for BR2_PACKAGE_IPTABLES and BR2_PACKAGE_CA_CERTIFICATES here?  They are not build dependencies, but run-time dependencies.  It may be possible to do some things without the certificates, but I think iptables is always required.

On a similar topic, docker expects a bunch of cgroup mounts to exist somewhere on the system.  Is this something that should be left up to the rootfs author (in which case maybe the help could be extended to explain this), or should the docker-engine recipe attempt to modify fstab somehow?  I'm not sure if there is a way to actually do that though.

> +	help
> +	  Docker is a platform to build, ship,
> +	  and run applications as lightweight containers.
> +
> +	  https://github.com/docker/docker
> +
> +comment "docker-engine needs a toolchain w/ threads"
> +	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS

This comment should probably be moved to the top so that the items in the below "if" are organized as children of DOCKER_ENGINE in the config GUI's.

> +
> +if BR2_PACKAGE_DOCKER_ENGINE
> +
> +config BR2_PACKAGE_DOCKER_ENGINE_DAEMON
> +	bool "docker daemon"
> +	default y
> +	help
> +	  Build the Docker system daemon.
> +	  If not selected, will build client only.
> +
> +config BR2_PACKAGE_DOCKER_ENGINE_EXPERIMENTAL
> +	bool "build experimental features"
> +
> +if BR2_PACKAGE_DOCKER_ENGINE_DAEMON
> +
> +config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS
> +	bool "btrfs filesystem driver"
> +	depends on BR2_USE_WCHAR # btrfs-progs
> +	depends on BR2_USE_MMU # btrfs-progs
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # btrfs-progs
> +	select BR2_PACKAGE_BTRFS_PROGS
> +	help
> +	  Build the btrfs filesystem driver for Docker.
> +
> +config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_DEVICEMAPPER
> +	bool "devicemapper filesystem driver"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
> +	depends on BR2_USE_MMU # lvm2
> +	depends on !BR2_STATIC_LIBS # lvm2
> +	select BR2_PACKAGE_LVM2
> +	select BR2_PACKAGE_LVM2_APP_LIBRARY
> +	help
> +	  Build the devicemapper filesystem driver for Docker.
> +
> +config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_VFS
> +	bool "vfs filesystem driver"
> +	depends on BR2_USE_WCHAR # gvfs
> +	depends on BR2_USE_MMU # gvfs
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # gvfs
> +	select BR2_PACKAGE_GVFS
> +	help
> +	  Build the vfs filesystem driver for Docker.
> +
> +endif
> +
> +endif

> diff --git a/package/docker-engine/docker-engine.mk b/package/docker-
> engine/docker-engine.mk
> new file mode 100644
> index 0000000..b7407b2
> --- /dev/null
> +++ b/package/docker-engine/docker-engine.mk
> @@ -0,0 +1,99 @@
> +#########################################################
> ##############
> +#########
> +#
> +# docker-engine
> +#
> +#########################################################
> ##############
> +#########
> +
> +DOCKER_ENGINE_VERSION = v1.11.1
> +DOCKER_ENGINE_SITE = $(call
> +github,docker,docker,$(DOCKER_ENGINE_VERSION))
> +
> +DOCKER_ENGINE_LICENSE = Apache-2.0
> +DOCKER_ENGINE_LICENSE_FILES = LICENSE
> +
> +DOCKER_ENGINE_DEPENDENCIES = host-go docker-containerd
> +
> +DOCKER_ENGINE_GOPATH = "$(@D)/vendor"
> +DOCKER_ENGINE_MAKE_ENV = $(HOST_GO_TARGET_ENV) \
> +	CGO_ENABLED=1 \
> +	CGO_NO_EMULATION=1 \
> +	GOBIN="$(@D)/bin" \
> +	GOPATH="$(DOCKER_ENGINE_GOPATH)"
> +
> +DOCKER_ENGINE_GLDFLAGS = \
> +	-X main.GitCommit=$(DOCKER_ENGINE_VERSION) \
> +	-X main.Version=$(DOCKER_ENGINE_VERSION) \
> +	-extldflags '-static'
> +
> +DOCKER_ENGINE_BUILD_TAGS = cgo exclude_graphdriver_zfs
> +
> +ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
> +DOCKER_ENGINE_BUILD_TAGS += seccomp
> +DOCKER_ENGINE_DEPENDENCIES += libseccomp endif
> +
> +ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DAEMON),y)
> +DOCKER_ENGINE_BUILD_TAGS += daemon
> +endif
> +
> +ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_EXPERIMENTAL),y)
> +DOCKER_ENGINE_BUILD_TAGS += experimental endif
> +
> +ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS),y)
> +DOCKER_ENGINE_DEPENDENCIES += btrfs-progs else
> DOCKER_ENGINE_BUILD_TAGS
> ++= exclude_graphdriver_btrfs endif
> +
> +ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_DEVICEMAPPER),y)
> +DOCKER_ENGINE_DEPENDENCIES += lvm2
> +else
> +DOCKER_ENGINE_BUILD_TAGS += exclude_graphdriver_devicemapper
> endif
> +
> +ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_VFS),y)
> +DOCKER_ENGINE_DEPENDENCIES += gvfs
> +else
> +DOCKER_ENGINE_BUILD_TAGS += exclude_graphdriver_vfs endif
> +
> +define DOCKER_ENGINE_CONFIGURE_CMDS
> +	$(SED) '/^clean$$/d' $(@D)/hack/vendor.sh
> +	cd $(@D) && bash ./hack/vendor.sh
> +	mkdir -p $(DOCKER_ENGINE_GOPATH)/src/github.com/docker
> +	ln -fs $(@D)
> $(DOCKER_ENGINE_GOPATH)/src/github.com/docker/docker
> +	ln -fs $(DOCKER_CONTAINERD_SRCDIR)
> $(DOCKER_ENGINE_GOPATH)/src/github.com/docker/containerd
> +	mkdir -p
> $(DOCKER_ENGINE_GOPATH)/src/github.com/opencontainers
> +	ln -fs $(RUNC_SRCDIR)
> +$(DOCKER_ENGINE_GOPATH)/src/github.com/opencontainers/runc
> +endef
> +
> +define DOCKER_ENGINE_BUILD_CMDS
> +	cd $(@D); $(DOCKER_ENGINE_MAKE_ENV) $(HOST_DIR)/usr/bin/go
> build -v -o
> +$(@D)/bin/docker -tags "$(DOCKER_ENGINE_BUILD_TAGS)" -ldflags
> +"$(DOCKER_ENGINE_GLDFLAGS)" ./docker endef
> +
> +define DOCKER_ENGINE_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/bin/docker
> $(TARGET_DIR)/usr/bin/docker
> +endef
> +
> +define DOCKER_ENGINE_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -D -m 0644 $(@D)/contrib/init/systemd/docker.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/docker.service
> +	$(INSTALL) -D -m 0644 $(@D)/contrib/init/systemd/docker.socket \
> +		$(TARGET_DIR)/usr/lib/systemd/system/docker.socket
> +	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-
> user.target.wants/
> +	ln -fs ../../../../usr/lib/systemd/system/docker.service \
> +
> +$(TARGET_DIR)/etc/systemd/system/multi-
> user.target.wants/docker.service
> +endef
> +
> +define DOCKER_ENGINE_INSTALL_INIT_SYSV
> +	$(INSTALL) -D -m 755 $(@D)/contrib/init/sysvinit-redhat/docker \
> +		$(TARGET_DIR)/etc/init.d/S61docker

This init file didn't work for me.  I'm not sure if it can work on a buildroot filesystem, are you using systemd instead?
I removed most of the checks to get it working (actually, I think I started editing the Ubuntu version).  Maybe a custom init script is required?  I can show you my hack if you like.

> +	$(INSTALL) -D -m 644 $(@D)/contrib/init/sysvinit-
> redhat/docker.sysconfig \
> +		$(TARGET_DIR)/etc/sysconfig/docker.sysconfig
> +endef
> +
> +define DOCKER_ENGINE_USERS
> +	- - docker -1 * - - - Docker Application Container Framework endef
> +
> +$(eval $(generic-package)) 

Andrew
