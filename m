From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 May 2014 00:05:36 +0200
Subject: [Buildroot] [PATCH] infra/pkg-virtual: validate only one
 provider provides an implementation
In-Reply-To: <1400017670-2708-1-git-send-email-yann.morin.1998@free.fr>
References: <20140513180945.GC3507@free.fr>
 <1400017670-2708-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140514000536.10ad4931@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 13 May 2014 23:47:50 +0200, Yann E. MORIN wrote:

> +# Providers shall call this function with all the FEATURES they provide
> +# 	$(eval $(call virt-provides,FEATURE[ FEATURE ...]))
> +# where FEATURE has a corresponding BR2_PACKAGE_HAS_FEATURE
> +define virt-provides
> +$(foreach p,$(1),\
> +ifneq ($$(BR2_PACKAGE_PROVIDES_$(p)),$(pkgname))$(sep)\
> +$$(error $(pkgname is trying to override $$(BR2_PACKAGE_PROVIDES_$(p)) to provide $(p)))$(sep)\
> +endif$(sep))
> +endef
>  
>  ################################################################################
>  # inner-virtual-package -- defines the dependency rules of the virtual
> diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
> index f6e4443..86125f2 100644
> --- a/package/rpi-userland/rpi-userland.mk
> +++ b/package/rpi-userland/rpi-userland.mk
> @@ -16,4 +16,7 @@ define RPI_USERLAND_POST_TARGET_CLEANUP
>  endef
>  RPI_USERLAND_POST_INSTALL_TARGET_HOOKS += RPI_USERLAND_POST_TARGET_CLEANUP
>  
> +# rpi-userland is a provider for those features:
> +$(eval $(call virt-provides,LIBEGL LIBGLES OPENVG OPENMAX))
> +
>  $(eval $(cmake-package))

Just thinking out loud: isn't it possible to instead check if
<pkg>_DEPENDENCIES for each virtual package contains only one word?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
