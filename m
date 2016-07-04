From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 4 Jul 2016 22:13:20 +0200
Subject: [Buildroot] [PATCH v6 2/5] docker-containerd: new package
In-Reply-To: <1467660382-6317-2-git-send-email-christian@paral.in>
References: <1467660382-6317-1-git-send-email-christian@paral.in>
 <1467660382-6317-2-git-send-email-christian@paral.in>
Message-ID: <3b168205-edc7-5479-d4a3-d4ac8497be8f@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Christian,

Le 04/07/2016 ? 21:26, Christian Stewart a ?crit :
> docker-containerd is a daemon and API for controlling and managing runC
> containers.
> 
> https://containerd.tools/
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
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
> 
> ---
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/Config.in                                |  1 +
>  package/docker-containerd/Config.in              | 13 +++++++
>  package/docker-containerd/docker-containerd.hash |  2 ++
>  package/docker-containerd/docker-containerd.mk   | 45 ++++++++++++++++++++++++
>  4 files changed, 61 insertions(+)
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
> index 0000000..e76a6a2
> --- /dev/null
> +++ b/package/docker-containerd/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_DOCKER_CONTAINERD
> +	bool "docker-containerd"
> +	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_RUNC

Missing comment about the runtime dependency.

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

Why this "docker-" prefix is required ? (sorry I don't know much docker)

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain


> +endef
> +
> +$(eval $(generic-package))
> 
