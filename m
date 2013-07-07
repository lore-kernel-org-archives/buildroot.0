From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jul 2013 21:37:18 +0200
Subject: [Buildroot] [PATCH 1/3] infra: make possible to run 'make
 *-menuconfig' from a clean output dir
In-Reply-To: <1373222625-9013-1-git-send-email-s.martin49@gmail.com>
References: <1373222625-9013-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20130707213718.516e580a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun,  7 Jul 2013 20:43:43 +0200, Samuel Martin wrote:

>  ifeq ($(BR2_CCACHE),y)
> -BASE_TARGETS += host-ccache
> +BASE_PKGS += host-ccache
>  endif
>  
>  ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
> @@ -361,7 +361,7 @@ include fs/common.mk
>  TARGETS+=target-post-image
>  
>  TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS))
> -TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS) $(BASE_TARGETS))
> +TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS) $(BASE_TARGETS) $(BASE_PKGS))
>  TARGETS_DIRCLEAN:=$(patsubst %,%-dirclean,$(TARGETS))
>  TARGETS_ALL:=$(patsubst %,__real_tgt_%,$(TARGETS))
>  
> @@ -397,6 +397,8 @@ $(BASE_TARGETS): dirs $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
>  $(BUILD_DIR)/buildroot-config/auto.conf: $(BUILDROOT_CONFIG)
>  	$(MAKE) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig
>  
> +BASE_TARGETS += $(BASE_PKGS)
> +

Is this really the correct fix? Currently BASE_TARGETS contains
host-ccache if enabled, and the toolchain-<backend> target. So,
normally, all packages should depend on both, and there should be no
need to introduce a separate $(BASE_PKGS).

>  prepare: $(BUILD_DIR)/buildroot-config/auto.conf
>  
>  toolchain: prepare dirs dependencies $(BASE_TARGETS)
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 668f011..282ce99 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -303,6 +303,9 @@ $(2)_REDISTRIBUTE		?= YES
>  
>  
>  $(2)_DEPENDENCIES ?= $(filter-out $(1),$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
> +ifeq ($(filter $(1),$(BASE_PKGS)),)
> +$(2)_DEPENDENCIES += $(BASE_PKGS)
> +endif

I.e, wouldn't

$(2)_DEPENDENCIES += $(BASE_TARGETS)

work?

Hum, the issue would of course be a recursive dependency on the
Crosstool-NG package, because toolchain-crosstool-ng depends on
crosstool-ng, and crosstool-ng being a package, it would in turn depend
on toolchain-crosstool-ng. Ditto for some other packages like
gcc-{initial,intermediate,final}, binutils and so on. So maybe what I'm
proposing in fact doesn't work, unless such packages are identified
specifically, like <pkg>_TOOLCHAIN_COMPONENT = YES, which would prevent
$(BASE_TARGETS) from being added to the dependencies of such packages.

Hum, now that I think of it, technically speaking, only the target
packages do need to have the dependency on the toolchain, host packages
do not. But both need the dependency on host-ccache.

Ok, the problem is complex, but I would really prefer to see a global
reflexion on how to name all those BASE_TARGETS, BASE_PKGS, TARGETS
variables rather than adding yet another hack into this mess.

Note that I am also currently fiddling in this area, since I have
issues getting 'make source' and 'make external-deps' to work properly
since the conversion of the internal backend to packages.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
