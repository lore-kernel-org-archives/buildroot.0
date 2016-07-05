From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 5 Jul 2016 09:55:03 +0200
Subject: [Buildroot] [PATCH v7 2/3] docker-containerd: new package
In-Reply-To: <1467671433-18113-2-git-send-email-christian@paral.in>
References: <1467671433-18113-1-git-send-email-christian@paral.in>
 <1467671433-18113-2-git-send-email-christian@paral.in>
Message-ID: <1a2c3bd0-3e4c-15ad-07fd-e5014dbddf11@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Christian,

Le 05/07/2016 ? 00:30, Christian Stewart a ?crit :
> docker-containerd is a daemon and API for controlling and managing runC
> containers.
> 
> https://containerd.tools/
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain


> 
> ---
> 
> Changes since v3:
>  - Don't depend on runc at compile-time
>  - Add threading dependency
>  - Use HOST_GO_TARGET_ENV, partially
>  - Cleanup compile commands
>  - Include patch to fix arm64 compilation
> Changes since v4:
>  - Bump to v0.2.2
>  - update hash for 0.2.2
>  - fix docker-runc simlink
>  - use CONTAINERD_VERSION for GitCommit const
>  - add go arch supports to config.in comment
>  - did runtime tests
>  - added signed-off-by to the patch series
> Changes since v5:
>  - containerd-shim aliased to docker-containerd-shim
>  - bumped to 1b3a8154 (commit pin required)
>  - patches removed (included in bump)
> Changes since v6:
>  - added note about runtime dependency
>  - add required dependencies on util-linux, mmu, wchar
> 
> ---
> ---
>  package/Config.in                                |  1 +
>  package/docker-containerd/Config.in              | 20 +++++++++++
>  package/docker-containerd/docker-containerd.hash |  2 ++
>  package/docker-containerd/docker-containerd.mk   | 45 ++++++++++++++++++++++++
>  4 files changed, 68 insertions(+)
>  create mode 100644 package/docker-containerd/Config.in
>  create mode 100644 package/docker-containerd/docker-containerd.hash
>  create mode 100644 package/docker-containerd/docker-containerd.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 078436e..01c0811 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1636,6 +1636,7 @@ menu "System tools"
>  	source "package/cpuload/Config.in"
>  	source "package/dcron/Config.in"
>  	source "package/debianutils/Config.in"
> +	source "package/docker-containerd/Config.in"
>  	source "package/cgroupfs-mount/Config.in"
>  	source "package/dsp-tools/Config.in"
>  	source "package/efibootmgr/Config.in"
> diff --git a/package/docker-containerd/Config.in b/package/docker-containerd/Config.in
> new file mode 100644
> index 0000000..b2f2983
> --- /dev/null
> +++ b/package/docker-containerd/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_DOCKER_CONTAINERD
> +	bool "docker-containerd"
> +	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_MMU # util-linux
> +	depends on BR2_USE_WCHAR # util-linux
> +	select BR2_PACKAGE_RUNC # runc: runtime dependency
> +	select BR2_PACKAGE_UTIL_LINUX # util-linux: runtime dependency
> +	select BR2_PACKAGE_UTIL_LINUX_BINARIES # util-linux: runtime dependency
> +	select BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT # util-linux: runtime dependency
> +	select BR2_PACKAGE_UTIL_LINUX_MOUNTPOINT # util-linux: runtime dependency
> +	select BR2_PACKAGE_UTIL_LINUX_MOUNT # util-linux: runtime dependency
> +	help
> +	  containerd is a daemon to control runC.
> +
> +	  https://github.com/docker/containerd
> +
> +comment "docker-containerd needs a toolchain w/ threads"
> +	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/docker-containerd/docker-containerd.hash b/package/docker-containerd/docker-containerd.hash
> new file mode 100644
> index 0000000..a4a427d
> --- /dev/null
> +++ b/package/docker-containerd/docker-containerd.hash
> @@ -0,0 +1,2 @@
> +# Computed locally
> +sha256 bdfa54c94f3de901a7983dc0bc924dd2268e9a5f5fe920d27bfdafad60958522  docker-containerd-1b3a81545ca79456086dc2aa424357be98b962ee.tar.gz
> diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
> new file mode 100644
> index 0000000..f0000e6
> --- /dev/null
> +++ b/package/docker-containerd/docker-containerd.mk
> @@ -0,0 +1,45 @@
> +################################################################################
> +#
> +# docker-containerd
> +#
> +################################################################################
> +
> +DOCKER_CONTAINERD_VERSION = 1b3a81545ca79456086dc2aa424357be98b962ee
> +DOCKER_CONTAINERD_SITE = $(call github,docker,containerd,$(DOCKER_CONTAINERD_VERSION))
> +
> +DOCKER_CONTAINERD_LICENSE = Apache-2.0
> +DOCKER_CONTAINERD_LICENSE_FILES = LICENSE.code
> +
> +DOCKER_CONTAINERD_DEPENDENCIES = host-go
> +
> +DOCKER_CONTAINERD_GOPATH = "$(@D)/vendor"
> +DOCKER_CONTAINERD_MAKE_ENV = $(HOST_GO_TARGET_ENV) \
> +	CGO_ENABLED=1 \
> +	GOBIN="$(@D)/bin" \
> +	GOPATH="$(DOCKER_CONTAINERD_GOPATH)"
> +
> +DOCKER_CONTAINERD_GLDFLAGS = \
> +	-X github.com/docker/containerd.GitCommit=$(DOCKER_CONTAINERD_VERSION) \
> +	-extldflags '-static'
> +
> +define DOCKER_CONTAINERD_CONFIGURE_CMDS
> +	mkdir -p $(DOCKER_CONTAINERD_GOPATH)/src/github.com/docker
> +	ln -s $(@D) $(DOCKER_CONTAINERD_GOPATH)/src/github.com/docker/containerd
> +	mkdir -p $(DOCKER_CONTAINERD_GOPATH)/src/github.com/opencontainers
> +	ln -s $(RUNC_SRCDIR) $(DOCKER_CONTAINERD_GOPATH)/src/github.com/opencontainers/runc
> +endef
> +
> +define DOCKER_CONTAINERD_BUILD_CMDS
> +	cd $(@D); $(DOCKER_CONTAINERD_MAKE_ENV) $(HOST_DIR)/usr/bin/go build -v -o $(@D)/bin/ctr -ldflags "$(DOCKER_CONTAINERD_GLDFLAGS)" ./ctr
> +	cd $(@D); $(DOCKER_CONTAINERD_MAKE_ENV) $(HOST_DIR)/usr/bin/go build -v -o $(@D)/bin/containerd -ldflags "$(DOCKER_CONTAINERD_GLDFLAGS)" ./containerd
> +	cd $(@D); $(DOCKER_CONTAINERD_MAKE_ENV) $(HOST_DIR)/usr/bin/go build -v -o $(@D)/bin/containerd-shim -ldflags "$(DOCKER_CONTAINERD_GLDFLAGS)" ./containerd-shim
> +endef
> +
> +define DOCKER_CONTAINERD_INSTALL_TARGET_CMDS
> +	ln -fs runc $(TARGET_DIR)/usr/bin/docker-runc
> +	$(INSTALL) -D -m 0755 $(@D)/bin/containerd $(TARGET_DIR)/usr/bin/docker-containerd
> +	$(INSTALL) -D -m 0755 $(@D)/bin/containerd-shim $(TARGET_DIR)/usr/bin/containerd-shim
> +	ln -fs containerd-shim $(TARGET_DIR)/usr/bin/docker-containerd-shim
> +endef
> +
> +$(eval $(generic-package))
> 
