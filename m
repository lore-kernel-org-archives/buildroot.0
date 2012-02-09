From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 10 Feb 2012 00:58:01 +0100
Subject: [Buildroot] [PATCH 1/2] Add support for U-Boot SPL
In-Reply-To: <1328402147-21404-2-git-send-email-n-dechesne@ti.com>
References: <1328402147-21404-1-git-send-email-n-dechesne@ti.com>
 <1328402147-21404-2-git-send-email-n-dechesne@ti.com>
Message-ID: <201202100058.02053.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 05 February 2012 01:35:46 Nicolas Dechesne wrote:
> SPL is a first stage bootloader. On pandaboard it supercedes x-loader,
> and should now be used.
> 
> - this patch ensures that either SPL or xloader can be selected
> - SPL will load 'u-boot.img' instead of 'u-boot.bin, so the name
>   is updated accordingly

 It doesn't work well, but unfortunately I don't know how to solve it.
MLO and u-boot.img are only created for the omap configs, and only in
u-boot 2011.12 or later.  Depending on omap in the Config.in is almost
impossible, and also depending on 2011.12 is difficult because it could
be a custom git instead.

 I think the only solution is to add a check in the .mk file if MLO and
u-boot.img indeed exist, and fall back to the default instead if not.

 What is also missing is that the choice between the different image types
should depend on !BR2_TARGET_UBOOT_SPL.

 Regards,
 Arnout

> 
> Signed-off-by: Nicolas Dechesne <n-dechesne@ti.com>
> ---
>  boot/uboot/Config.in |    6 ++++++
>  boot/uboot/uboot.mk  |    4 ++++
>  2 files changed, 10 insertions(+), 0 deletions(-)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index c8db9fb..1b94803 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -137,4 +137,10 @@ config BR2_TARGET_UBOOT_ETH1ADDR
>  
>  endif # BR2_TARGET_UBOOT_NETWORK
>  
> +config BR2_TARGET_UBOOT_SPL
> +	bool "U-Boot SPL suport"
> +	depends on !BR2_TARGET_XLOADER
> +	help
> +	  Enable the U-Boot SPL support
> +
>  endif # BR2_TARGET_UBOOT
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index db9de8d..b327f4b 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -29,6 +29,8 @@ else ifeq ($(BR2_TARGET_UBOOT_FORMAT_LDR),y)
>  UBOOT_BIN          = u-boot.ldr
>  else ifeq ($(BR2_TARGET_UBOOT_FORMAT_NAND_BIN),y)
>  UBOOT_BIN          = u-boot-nand.bin
> +else ifeq ($(BR2_TARGET_UBOOT_SPL),y)
> +UBOOT_BIN          = u-boot.img
>  else
>  UBOOT_BIN          = u-boot.bin
>  endif
> @@ -88,6 +90,8 @@ endef
>  
>  define UBOOT_INSTALL_IMAGES_CMDS
>  	cp -dpf $(@D)/$(UBOOT_BIN) $(BINARIES_DIR)/
> +	$(if $(BR2_TARGET_UBOOT_SPL),
> +		cp -dpf $(@D)/MLO $(BINARIES_DIR)/)
>  endef
>  
>  $(eval $(call GENTARGETS))
> 

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
