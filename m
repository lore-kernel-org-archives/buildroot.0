From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 16 Jul 2018 06:40:59 +0300
Subject: [Buildroot] [PATCH v4 3/3] docker-engine: split into
 docker-{cli, engine}, bump v2018.06-ce-rc3
In-Reply-To: <20180715224340.30282-3-christian@paral.in>
References: <20180715224340.30282-1-christian@paral.in>
 <20180715224340.30282-3-christian@paral.in>
Message-ID: <20180716034058.wju3oo324cg2tiyz@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Christian,

On Sun, Jul 15, 2018 at 03:43:40PM -0700, Christian Stewart wrote: 
> diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
> index ba84b4cf0a..1add82471d 100644
> --- a/package/docker-engine/docker-engine.mk
> +++ b/package/docker-engine/docker-engine.mk
> @@ -4,25 +4,21 @@
>  #
>  ################################################################################
>  
> -DOCKER_ENGINE_VERSION = v17.05.0-ce
> -DOCKER_ENGINE_COMMIT = 89658bed64c2a8fe05a978e5b87dbec409d57a0f

You remove it here ...

> -DOCKER_ENGINE_SITE = $(call github,docker,docker,$(DOCKER_ENGINE_VERSION))
> +DOCKER_ENGINE_VERSION = v18.06.0-ce-rc3
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
>  DOCKER_ENGINE_DEPENDENCIES += systemd
> -endif
> -
> -ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DAEMON),y)
> -DOCKER_ENGINE_TAGS += daemon
> -DOCKER_ENGINE_BUILD_TARGETS += cmd/dockerd
> +DOCKER_ENGINE_TAGS += systemd journald
>  endif
>  
>  ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_EXPERIMENTAL),y)
> @@ -67,6 +59,7 @@ define DOCKER_ENGINE_RUN_AUTOGEN
>  	cd $(@D) && \
>  		GITCOMMIT="$$(echo $(DOCKER_ENGINE_COMMIT) | head -c7)" \

.. but still used it here.

>  		BUILDTIME="$$(date)" \
> +		IAMSTATIC="true" \
>  		VERSION="$(patsubst v%,%,$(DOCKER_ENGINE_VERSION))" \
>  		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" $(TARGET_MAKE_ENV) \
>  		bash ./hack/make/.go-autogen
> @@ -74,8 +67,6 @@ endef
>  
>  DOCKER_ENGINE_POST_CONFIGURE_HOOKS += DOCKER_ENGINE_RUN_AUTOGEN
>  
> -ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DAEMON),y)
> -
>  define DOCKER_ENGINE_INSTALL_INIT_SYSTEMD
>  	$(INSTALL) -D -m 0644 $(@D)/contrib/init/systemd/docker.service \
>  		$(TARGET_DIR)/usr/lib/systemd/system/docker.service
> @@ -90,6 +81,4 @@ define DOCKER_ENGINE_USERS
>  	- - docker -1 * - - - Docker Application Container Framework
>  endef
>  
> -endif
> -
>  $(eval $(golang-package))

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
