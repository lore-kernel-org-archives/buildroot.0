From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 16 Jul 2018 06:38:28 +0300
Subject: [Buildroot] [PATCH v4 2/3] docker-containerd: bump to v1.1.1
In-Reply-To: <20180715224340.30282-2-christian@paral.in>
References: <20180715224340.30282-1-christian@paral.in>
 <20180715224340.30282-2-christian@paral.in>
Message-ID: <20180716033828.vx2ojaqcfricwsbx@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Christian,

On Sun, Jul 15, 2018 at 03:43:39PM -0700, Christian Stewart wrote: 
> diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
> index 09e89f1aba..85dd6e1f71 100644
> --- a/package/docker-containerd/docker-containerd.mk
> +++ b/package/docker-containerd/docker-containerd.mk
> @@ -4,8 +4,9 @@
>  #
>  ################################################################################
>  
> -DOCKER_CONTAINERD_VERSION = 9048e5e50717ea4497b757314bad98ea3763c145
> -DOCKER_CONTAINERD_SITE = $(call github,docker,containerd,$(DOCKER_CONTAINERD_VERSION))
> +DOCKER_CONTAINERD_VERSION = v1.1.1
> +DOCKER_CONTAINERD_COMMIT = d64c661f1d51c48782c9cec8fda7604785f93587

Where is this being used?

> +DOCKER_CONTAINERD_SITE = $(call github,containerd,containerd,$(DOCKER_CONTAINERD_VERSION))
>  DOCKER_CONTAINERD_LICENSE = Apache-2.0
>  DOCKER_CONTAINERD_LICENSE_FILES = LICENSE.code
>  
> @@ -14,10 +15,21 @@ DOCKER_CONTAINERD_WORKSPACE = vendor
>  DOCKER_CONTAINERD_LDFLAGS = \
>  	-X github.com/docker/containerd.GitCommit=$(DOCKER_CONTAINERD_VERSION)
>  
> -DOCKER_CONTAINERD_BUILD_TARGETS = ctr containerd containerd-shim
> +DOCKER_CONTAINERD_BUILD_TARGETS = cmd/ctr cmd/containerd cmd/containerd-shim
>  
>  DOCKER_CONTAINERD_INSTALL_BINS = containerd containerd-shim
>  
> +ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
> +DOCKER_CONTAINERD_DEPENDENCIES += libseccomp
> +DOCKER_CONTAINERD_TAGS += seccomp
> +endif
> +
> +ifeq ($(BR2_PACKAGE_DOCKER_CONTAINERD_DRIVER_BTRFS),y)
> +DOCKER_CONTAINERD_DEPENDENCIES += btrfs-progs
> +else
> +DOCKER_CONTAINERD_TAGS += no_btrfs
> +endif
> +
>  define DOCKER_CONTAINERD_INSTALL_SYMLINKS
>  	ln -fs runc $(TARGET_DIR)/usr/bin/docker-runc
>  	ln -fs containerd-shim $(TARGET_DIR)/usr/bin/docker-containerd-shim

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
