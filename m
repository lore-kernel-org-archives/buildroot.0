From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 May 2016 21:29:58 +0200
Subject: [Buildroot] [PATCH v3 2/3] docker-containerd: new package
In-Reply-To: <1464219082-3818-3-git-send-email-christian@paral.in>
References: <1464219082-3818-1-git-send-email-christian@paral.in>
 <1464219082-3818-3-git-send-email-christian@paral.in>
Message-ID: <20160526212958.36eeac5e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 25 May 2016 16:31:21 -0700, Christian Stewart wrote:
> docker-containerd is a daemon and API for controlling and managing runC
> containers.
> 
> Note: fixes for arm64 (armv8) will be included in the next Docker
> release. A temporary cherry-pick of relevant arm64 fixes is available:
> 
> Commit f51d17f7 from https://github.com/paralin/buildroot.git

Well, then either include the required patch, or disable the build on
arm64 for now.

> diff --git a/package/docker-containerd/Config.in b/package/docker-containerd/Config.in
> new file mode 100644
> index 0000000..6b3760d
> --- /dev/null
> +++ b/package/docker-containerd/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_DOCKER_CONTAINERD
> +	bool "docker-containerd"
> +	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS

Thread dependency or not?

> +	select BR2_PACKAGE_RUNC
> +	help
> +    containerd is a daemon to control runC.

Identation: one tab + two spaces.

> diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
> new file mode 100644
> index 0000000..9225143
> --- /dev/null
> +++ b/package/docker-containerd/docker-containerd.mk
> @@ -0,0 +1,48 @@
> +################################################################################
> +#
> +# docker-containerd
> +#
> +################################################################################
> +
> +DOCKER_CONTAINERD_VERSION = v0.2.1
> +DOCKER_CONTAINERD_VERSION_COMMIT = ca47f7e76a93e9b3768ed084d62318e85bd9f4b2

Same question: why?

> +DOCKER_CONTAINERD_SITE = $(call github,docker,containerd,$(DOCKER_CONTAINERD_VERSION))
> +
> +DOCKER_CONTAINERD_LICENSE = Apache-2.0
> +DOCKER_CONTAINERD_LICENSE_FILES = LICENSE.code
> +
> +DOCKER_CONTAINERD_DEPENDENCIES = host-go runc

So runc is really a build-time dependency?

> +
> +DOCKER_CONTAINERD_MAKE_ENV = \
> +	GOBIN="$(@D)/bin" \
> +	GOPATH="$(@D)/vendor" \
> +	GOARCH=$(GO_GOARCH) \
> +	CGO_ENABLED=1

Usage of HOST_GO_TARGET_ENV ?

> +
> +DOCKER_CONTAINERD_GLDFLAGS = \
> +	-X github.com/docker/containerd.GitCommit=$(DOCKER_CONTAINERD_VERSION_COMMIT) \

Why does it need this information?

> +	-extldflags '-static'
> +
> +define DOCKER_CONTAINERD_CONFIGURE_CMDS
> +	# Put sources at prescribed GOPATH location.
> +	export $(DOCKER_CONTAINERD_MAKE_ENV) && \

Why this export ?

> +		mkdir -p $$GOPATH/src/github.com/docker && \
> +		ln -s $(@D) $$GOPATH/src/github.com/docker/containerd && \
> +		mkdir -p $$GOPATH/src/github.com/opencontainers && \
> +		ln -s $(RUNC_SRCDIR) $$GOPATH/src/github.com/opencontainers/runc

Same remarks as with the other package:

 *) Why is this needed

 *) No need for the &&, these can be independent commands, one after
    the other.

> +endef
> +
> +define DOCKER_CONTAINERD_BUILD_CMDS
> +	cd $(@D) && export $(DOCKER_CONTAINERD_MAKE_ENV) && \

Why is export needed? Just do:

	$(DOCKER_CONTAINERD_MAKE_ENV) $(HOST_DIR)/usr/bin/go ...

> +		$(HOST_DIR)/usr/bin/go build -v -o $(@D)/bin/ctr -ldflags "$(DOCKER_CONTAINERD_GLDFLAGS)" ./ctr && \
> +		$(HOST_DIR)/usr/bin/go build -v -o $(@D)/bin/containerd -ldflags "$(DOCKER_CONTAINERD_GLDFLAGS)" ./containerd && \
> +		$(HOST_DIR)/usr/bin/go build -v -o $(@D)/bin/containerd-shim -ldflags "$(DOCKER_CONTAINERD_GLDFLAGS)" ./containerd-shim

No need for the &&, make these independent commands.

Is the "cd $(@D)" really needed ? Isn't it possible to do:

$(HOST_DIR)/usr/bin/go build -v -o $(@D)/bin/containerd-shim -ldflags "$(DOCKER_CONTAINERD_GLDFLAGS)" $(@D)/containerd-shim

> +endef
> +
> +define DOCKER_CONTAINERD_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(TARGET_DIR)/usr/bin/runc $(TARGET_DIR)/usr/bin/docker-runc

Why are you doing this? If it really needs to be called docker-runc,
why not just a symbolic link ?

> +	$(INSTALL) -D -m 0755 $(@D)/bin/containerd $(TARGET_DIR)/usr/bin/docker-containerd
> +	$(INSTALL) -D -m 0755 $(@D)/bin/containerd-shim $(TARGET_DIR)/usr/bin/containerd-shim
> +endef
> +
> +$(eval $(generic-package))

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
