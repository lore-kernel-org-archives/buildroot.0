From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 20:51:38 +0200
Subject: [Buildroot] [PATCH v2 1/3] docker-containerd: bump to version
 1.0.1
In-Reply-To: <20180311221741.11346-1-charles.hardin@storagecraft.com>
References: <20180311221741.11346-1-charles.hardin@storagecraft.com>
Message-ID: <20180331205138.6568882d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Charles,

On Sun, 11 Mar 2018 15:17:39 -0700, charles.hardin at storagecraft.com
wrote:

> -DOCKER_CONTAINERD_VERSION = 9048e5e50717ea4497b757314bad98ea3763c145
> -DOCKER_CONTAINERD_SITE = $(call github,docker,containerd,$(DOCKER_CONTAINERD_VERSION))
> +DOCKER_CONTAINERD_VERSION = v1.0.1
> +DOCKET_CONTAINERD_COMMIT = 9b55aab90508bd389d7654c4baf173a981477d55

Do we still need the DOCKET_CONTAINERD_COMMIT variable ?

> +DOCKER_CONTAINERD_SITE = $(call github,containerd,containerd,$(DOCKER_CONTAINERD_VERSION))
>  DOCKER_CONTAINERD_LICENSE = Apache-2.0
>  DOCKER_CONTAINERD_LICENSE_FILES = LICENSE.code
>  
> @@ -18,15 +19,25 @@ DOCKER_CONTAINERD_MAKE_ENV = $(HOST_GO_TARGET_ENV) \
>  	GOPATH="$(DOCKER_CONTAINERD_GOPATH)"
>  
>  DOCKER_CONTAINERD_GLDFLAGS = \
> -	-X github.com/docker/containerd.GitCommit=$(DOCKER_CONTAINERD_VERSION)
> +	-X github.com/containerd/containerd.GitCommit=$(DOCKER_CONTAINERD_VERSION)
> +
> +DOCKER_CONTAINERD_BUILD_TAGS =
> +
> +# XXX - Reusing the "docker-engine" config for now

What does that mean ?

> +ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS),y)
> +DOCKER_CONTAINERD_DEPENDENCIES += btrfs-progs
> +else
> +DOCKER_CONTAINERD_BUILD_TAGS = no_btrfs
> +endif
> +
>  
>  ifeq ($(BR2_STATIC_LIBS),y)
>  DOCKER_CONTAINERD_GLDFLAGS += -extldflags '-static'
>  endif
>  
>  define DOCKER_CONTAINERD_CONFIGURE_CMDS
> -	mkdir -p $(DOCKER_CONTAINERD_GOPATH)/src/github.com/docker
> -	ln -s $(@D) $(DOCKER_CONTAINERD_GOPATH)/src/github.com/docker/containerd
> +	mkdir -p $(DOCKER_CONTAINERD_GOPATH)/src/github.com/containerd
> +	ln -s $(@D) $(DOCKER_CONTAINERD_GOPATH)/src/github.com/containerd/containerd
>  	mkdir -p $(DOCKER_CONTAINERD_GOPATH)/src/github.com/opencontainers
>  	ln -s $(RUNC_SRCDIR) $(DOCKER_CONTAINERD_GOPATH)/src/github.com/opencontainers/runc
>  endef
> @@ -34,7 +45,9 @@ endef
>  define DOCKER_CONTAINERD_BUILD_CMDS
>  	$(foreach d,ctr containerd containerd-shim,\
>  		cd $(@D); $(DOCKER_CONTAINERD_MAKE_ENV) $(HOST_DIR)/bin/go build \
> -			-v -o $(@D)/bin/$(d) -ldflags "$(DOCKER_CONTAINERD_GLDFLAGS)" ./$(d)$(sep))
> +			-tags "$(DOCKER_CONTAINERD_BUILD_TAGS)" \
> +			-v -o $(@D)/bin/$(d) -ldflags "$(DOCKER_CONTAINERD_GLDFLAGS)" \
> +			github.com/containerd/containerd/cmd/$(d)$(sep))
>  endef

All of this no longer applies really well on the current
docker-containerd, which has been converted to the golang-package
infrastructure.

Could you respin your patch series, rebased on master, where
docker-containerd, docker-engine and runc have been converted to the
golang-package infrastructure ?

Thanks a lot!

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
