From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 25 Mar 2015 00:22:57 +0100
Subject: [Buildroot] [PATCH 3/5 v2] linux: fix extensions
In-Reply-To: <95ae759e2efb3ef5d0efb1553cd11c4273bd8b63.1426342904.git.yann.morin.1998@free.fr>
References: <cover.1426342904.git.yann.morin.1998@free.fr>
 <95ae759e2efb3ef5d0efb1553cd11c4273bd8b63.1426342904.git.yann.morin.1998@free.fr>
Message-ID: <5511F1D1.4050608@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All

Le 14/03/2015 15:25, Yann E. MORIN a ?crit :
> Since the move to the kconfig-package infra, linux extensions are
> broken.
> 
> In our linux package, extensions are applied as pre-patch hooks.
> 
> Before the kconfig-package infra, we had custom rules for the
> linux-*config targets, which were of the form:
> 
>     linux-menuconfig: linux-configure
>         $(MAKE) -C $(LINUX_DIR) menuconfig
> 
> This caused the linux tree to be fully configured before running the
> configurators, and thus linux dependencies were entirely fullfilled, and
> extensions were properly applied.
> 
> Since we migrated (in dff25ea), the kconfig-package infra introduces a
> (hidden, internal) intermediate step 'kconfig-fixup' and decorelates the
> kconfig-part of the configuration from the actual package-part of the
> configuration:
> 
>     linux-configure -------> kconfig-fixup --> .config --> $(LINUX_CONFIG_FILE)
>                         /
>     linux-menuconfig --'
> 
> As thus, this (very useful!) use-case breaks (starting from a clean
> Buildroot tree):
> 
>     make menuconfig
>         -> enable a kernel and at least one extension
>         -> save and exit
>     make linux-menuconfig
>         -> extensions are not available
> 
> Fix that by using the newly-introduced patch-dependencies, so that
> extensions are available before we try to patch the linux kernel.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> ---

I reproduced the issue with xenomai extension:

$ make O=test/xenomai/ linux-menuconfig
[...]
/home/naourr/git/buildroot/test/xenomai/build/xenomai-2.6.4/scripts/prepare-kernel.sh
--linux=/home/naourr/git/buildroot/test/xenomai/build/linux-3.14.17 --arch=i386
--default --verbose
make:
/home/naourr/git/buildroot/test/xenomai/build/xenomai-2.6.4/scripts/prepare-kernel.sh
: commande introuvable
make: ***
[/home/naourr/git/buildroot/test/xenomai/build/linux-3.14.17/.stamp_patched]
Erreur 127

> diff --git a/linux/linux-ext-xenomai.mk b/linux/linux-ext-xenomai.mk
> index 84d2c17..f6a5ffd 100644
> --- a/linux/linux-ext-xenomai.mk
> +++ b/linux/linux-ext-xenomai.mk
> @@ -6,7 +6,7 @@
>  
>  ifeq ($(BR2_LINUX_KERNEL_EXT_XENOMAI),y)
>  # Add dependency to xenomai (user-space) which provide ksrc part
> -LINUX_DEPENDENCIES += xenomai
> +LINUX_PATCH_DEPENDENCIES += xenomai
>  
The issue is indeed fixed by this patch.

    Reviewed-by: Romain Naour <romain.naour@openwide.fr>
    Tested-by: Romain Naour <romain.naour@openwide.fr>

Best regard,
Romain
