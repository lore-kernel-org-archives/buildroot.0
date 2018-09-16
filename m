From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Sep 2018 21:50:53 +0200
Subject: [Buildroot] [PATCH v5 3/3] docker-engine: split docker-{cli,
 engine}, bump to v18.06.1-ce
In-Reply-To: <20180913052225.26676-3-christian@paral.in>
References: <20180913052225.26676-1-christian@paral.in>
 <20180913052225.26676-3-christian@paral.in>
Message-ID: <20180916215053.294361f8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christian,

On Wed, 12 Sep 2018 22:22:25 -0700, Christian Stewart wrote:
> Docker upstream has split the Docker daemon and CLI into separate codebases:
> 
>  - github.com/docker/engine: daemon, "dockerd" binary
>  - github.com/docker/cli: "docker" command line interface, selected by engine
> 
> This commit splits the docker-engine package into docker-engine and docker-cli.
> Conveniently, the Docker project has begun maintaining two separate
> release-tagged repositories for the CLI and daemon as of v18.06-ce-rc1. Previous
> versions were tagged in a common "docker-ce" repository which makes compilation
> awkward for Buildroot, especially due to some limitations in the new Go package
> infrastructure.
> 
> Legacy flags are added to ease the transition:
> 
>  - BR2_PACKAGE_DOCKER_ENGINE_STATIC_CLIENT=y -> BR2_PACKAGE_DOCKER_CLI_STATIC
>  - docker-engine selects docker-cli

Why is docker-engine selecting docker-cli ? Aren't there possible use
cases where you would want the daemon, but not the command line
interface ?


>  ###############################################################################
>  comment "Legacy options removed in 2018.05"

Really, removed in 2018.05 ?

> +config BR2_PACKAGE_DOCKER_ENGINE_STATIC_CLIENT
> +	bool "docker-engine static client option renamed"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_DOCKER_CLI_STATIC
> +	help
> +	  For consistency reasons, the option
> +	  BR2_PACKAGE_DOCKER_ENGINE_STATIC_CLIENT has been renamed to
> +	  BR2_PACKAGE_DOCKER_CLI_STATIC

It's not for "consistency" reasons, it's because docker-cli
functionality has been split into a separate package.


> -DOCKER_ENGINE_VERSION = v17.05.0-ce
> -DOCKER_ENGINE_COMMIT = 89658bed64c2a8fe05a978e5b87dbec409d57a0f
> -DOCKER_ENGINE_SITE = $(call github,docker,docker,$(DOCKER_ENGINE_VERSION))
> +DOCKER_ENGINE_VERSION = v18.06.1-ce
> +DOCKER_ENGINE_SITE = $(call github,docker,engine,$(DOCKER_ENGINE_VERSION))
>  
>  DOCKER_ENGINE_LICENSE = Apache-2.0
>  DOCKER_ENGINE_LICENSE_FILES = LICENSE
>  
>  DOCKER_ENGINE_DEPENDENCIES = host-go host-pkgconf
> +DOCKER_ENGINE_SRC_SUBDIR = github.com/docker/docker
>  
>  DOCKER_ENGINE_LDFLAGS = \
>  	-X main.GitCommit=$(DOCKER_ENGINE_VERSION) \
>  	-X main.Version=$(DOCKER_ENGINE_VERSION)
>  
> -ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_STATIC_CLIENT),y)
> -DOCKER_ENGINE_LDFLAGS += -extldflags '-static'
> -endif
> -
>  DOCKER_ENGINE_TAGS = cgo exclude_graphdriver_zfs autogen
> -DOCKER_ENGINE_BUILD_TARGETS = cmd/docker
> +DOCKER_ENGINE_BUILD_TARGETS = cmd/dockerd
>  
>  ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
>  DOCKER_ENGINE_TAGS += seccomp
> @@ -32,11 +28,7 @@ endif
>  ifeq ($(BR2_INIT_SYSTEMD),y)
>  DOCKER_ENGINE_TAGS += journald

So we have journald in ENGINE_TAGS

>  DOCKER_ENGINE_DEPENDENCIES += systemd
> -endif
> -
> -ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DAEMON),y)
> -DOCKER_ENGINE_TAGS += daemon
> -DOCKER_ENGINE_BUILD_TARGETS += cmd/dockerd
> +DOCKER_ENGINE_TAGS += systemd journald

And we're adding it again ?

>  endif
>  
>  ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_EXPERIMENTAL),y)
> @@ -65,8 +57,8 @@ DOCKER_ENGINE_INSTALL_BINS = $(notdir $(DOCKER_ENGINE_BUILD_TARGETS))
>  
>  define DOCKER_ENGINE_RUN_AUTOGEN
>  	cd $(@D) && \
> -		GITCOMMIT="$$(echo $(DOCKER_ENGINE_COMMIT) | head -c7)" \
>  		BUILDTIME="$$(date)" \
> +		IAMSTATIC="true" \

Huh ?

>  		VERSION="$(patsubst v%,%,$(DOCKER_ENGINE_VERSION))" \
>  		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" $(TARGET_MAKE_ENV) \
>  		bash ./hack/make/.go-autogen
> @@ -74,7 +66,12 @@ endef
>  
>  DOCKER_ENGINE_POST_CONFIGURE_HOOKS += DOCKER_ENGINE_RUN_AUTOGEN
>  
> -ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DAEMON),y)
> +define DOCKER_ENGINE_LINK_CONTAINERD
> +	ln -fs containerd \
> +		$(TARGET_DIR)/usr/bin/docker-containerd
> +endef

Why are you doing this ? It's already done by the docker-containerd
package.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
