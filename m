From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jun 2018 15:28:19 +0200
Subject: [Buildroot] [BUILDROOT][PATCHv2 1/3] balena: new package
In-Reply-To: <651f579d-07ad-afc4-4515-0061016dfc02@savronik.com.tr>
References: <651f579d-07ad-afc4-4515-0061016dfc02@savronik.com.tr>
Message-ID: <20180605152819.6950ef99@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Refik,

On Tue, 5 Jun 2018 16:16:17 +0300, Refik Tuzakl? wrote:
>  From 65b90eefab3fd936b5eec0e3004e5ec370c7d3b9 Mon Sep 17 00:00:00 2001
> From: Refik Tuzakli <refik.tuzakli@savronik.com.tr>
> Date: Tue, 5 Jun 2018 15:58:39 +0300
> Subject: [PATCHv2 1/3] balena new package v2
> 
> 
> This patch adds balena; Moby-based Container Engine for Embedded, IoT, 
> and Edge uses.
> 
> Signed-off-by: Refik Tuzakli <refik.tuzakli@savronik.com.tr>

Thanks for this new iteration. Unfortunately, it is now sent with
Thunderbird, so it is still badly line wrapped.

> diff --git a/package/balena/Config.in b/package/balena/Config.in
> new file mode 100644
> index 0000000..1323cf2
> --- /dev/null
> +++ b/package/balena/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_BALENA
> +??? bool "balena"
> +??? depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
> +??? depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
> +??? depends on BR2_TOOLCHAIN_HAS_THREADS
> +??? depends on BR2_INIT_SYSTEMD
> +??? depends on BR2_TOOLCHAIN_HAS_THREADS
> +??? depends on BR2_USE_MMU # needs fork()
> +??? depends on !BR2_STATIC_LIBS # It fails to build statically

You need a Kconfig comment for the thread and static library
dependencies. Look at what other packages are doing for this.

> +BALENA_VERSION = 17.06-resin
> +BALENA_COMMIT = 73136d1985f28a34705f537e90636cf208734048
> +BALENA_SITE = $(call github,resin-os,balena,$(BALENA_VERSION))
> +
> +BALENA_LICENSE = Apache-2.0
> +BALENA_LICENSE_FILES = LICENSE
> +
> +BALENA_DEPENDENCIES = host-pkgconf systemd lvm2
> +
> +BALENA_GOPATH = $(@D)/_gopath

I still believe this is not needed.

> +
> +BALENA_CONFIGURE_ENV = GOPATH=${BALENA_GOPATH} \
> +??? $(TARGET_MAKE_ENV) \
> +??? $(HOST_GO_TARGET_ENV) \
> +??? DOCKER_GITCOMMIT=${BALENA_COMMIT} \
> +??? DOCKER_BUILDTAGS='exclude_graphdriver_btrfs exclude_graphdirver_zfs 
> exclude_graphdriver_devicemapper'

Ditto, this is not needed.

> +BALENA_MAKE_ENV = GOPATH=$(BALENA_GOPATH)

Same.

> +BALENA_LDFLAGS += -extldflags '-static'

Same.

All this stuff is done by the golang-package infrastructure. I suggest
that you read package/pkg-golang.mk so that you can get a feeling of
what the golang-package infrastructure already does for you.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
