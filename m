From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 26 Mar 2015 22:54:11 +0100
Subject: [Buildroot] [PATCH 4/5 v2] linux: simplify adding new extensions
In-Reply-To: <e6cc457e3c17aab4a7b800bd82b4a755557235bf.1426342904.git.yann.morin.1998@free.fr>
References: <cover.1426342904.git.yann.morin.1998@free.fr>
 <e6cc457e3c17aab4a7b800bd82b4a755557235bf.1426342904.git.yann.morin.1998@free.fr>
Message-ID: <55148003.2000506@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

Le 14/03/2015 15:25, Yann E. MORIN a ?crit :
> Curently, all three linux extensions follow the same layout:
>   - test if the extension is enabled
>   - add itself to linux' patch-dependencies
>   - declare a macro, added as the pre-patch hook
> 
> Except for the macro, all can be commonalised.
> 
> Add a simple infrastructure for that:
>   - extensions declare themselves in the list of extensions
>   - extensions define their macro
>   - the infra adds them to the patch-dependencies and pre-patch
>     hooks as appropriate
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  linux/linux.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index b1aca41..2917857 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -333,6 +333,13 @@ endef
>  # included here *must* be in the same directory!
>  include $(sort $(wildcard linux/linux-ext-*.mk))
>  
> +LINUX_PATCH_DEPENDENCIES += $(foreach ext,$(LINUX_EXTENSIONS),\
> +	$(if $(BR2_LINUX_KERNEL_EXT_$(call UPPERCASE,$(ext))),$(ext)))
> +
> +LINUX_PRE_PATCH_HOOKS += $(foreach ext,$(LINUX_EXTENSIONS),\
> +	$(if $(BR2_LINUX_KERNEL_EXT_$(call UPPERCASE,$(ext))),\
> +		$(call UPPERCASE,$(ext))_PREPARE_KERNEL))
> +
>  $(eval $(kconfig-package))
>  
>  # Support for rebuilding the kernel after the cpio archive has
> 

    Reviewed-by: Romain Naour <romain.naour@openwide.fr>

Tested with Xenomai extensions and obviously the patch 5/5 applied :)

    Tested-by: Romain Naour <romain.naour@openwide.fr>

Best regards,
Romain
