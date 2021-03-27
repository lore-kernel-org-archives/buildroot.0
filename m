From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat, 27 Mar 2021 23:33:46 +0100
Subject: [Buildroot] [PATCH] boot/uboot: fix uboot build failure with
 UBOOT_CUSTOM_DTS_PATH on uboot version >= 2020.x
In-Reply-To: <20210209201303.195093-1-giulio.benetti@benettiengineering.com>
References: <20210209201303.195093-1-giulio.benetti@benettiengineering.com>
Message-ID: <ad1b10c3-b36f-78fe-624d-4f1bb6068944@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

On 2/9/21 9:13 PM, Giulio Benetti wrote:
> Starting from version 2020.x uboot can't build .dts files not listed in
> dts/Makefile leading to a build failure when trying to pass a .dts file to
> UBOOT_CUSTOM_DTS_PATH. So let's prepend that file(s) to dts/Makefile if
> UBOOT_CUSTOM_DTS_PATH is used.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   boot/uboot/uboot.mk | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 2478a2a1e9..a5ad101d68 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -303,6 +303,11 @@ endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
>   UBOOT_CUSTOM_DTS_PATH = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_DTS_PATH))
>   
>   define UBOOT_BUILD_CMDS
> +	$(if $(UBOOT_CUSTOM_DTS_PATH),
> +		$(Q)$(SED) \
> +		'1s;^;dtb-y += $(subst .dts,.dtb,$(call notdir,$(UBOOT_CUSTOM_DTS_PATH)))\n;' \
> +		$(@D)/arch/$(UBOOT_ARCH)/dts/Makefile
> +	)
>   	$(if $(UBOOT_CUSTOM_DTS_PATH),
>   		cp -f $(UBOOT_CUSTOM_DTS_PATH) $(@D)/arch/$(UBOOT_ARCH)/dts/
>   	)
> 

Any new about this patch? It's essential to build an external u-boot dts 
after u-boot 2020.x

Kind regards
-- 
Giulio Benetti
Benetti Engineering sas
