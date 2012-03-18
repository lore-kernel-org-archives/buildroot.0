From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 18 Mar 2012 15:16:21 +0100
Subject: [Buildroot] [PATCH 1/3 v3] uboot: Add support for U-Boot SPL
In-Reply-To: <1331592072-32327-2-git-send-email-n-dechesne@ti.com>
References: <1331592072-32327-1-git-send-email-n-dechesne@ti.com>
 <1331592072-32327-2-git-send-email-n-dechesne@ti.com>
Message-ID: <201203181516.21974.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 12 March 2012 23:41:10 Nicolas Dechesne wrote:
> SPL is a first stage bootloader. On pandaboard it supercedes x-loader,
> and should now be used.
> 
> This patch ensures that either SPL or xloader can be selected
> 
> Signed-off-by: Nicolas Dechesne <n-dechesne@ti.com>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  boot/uboot/Config.in |    9 +++++++++
>  boot/uboot/uboot.mk  |    2 ++
>  2 files changed, 11 insertions(+), 0 deletions(-)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index c8db9fb..95187f9 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -137,4 +137,13 @@ config BR2_TARGET_UBOOT_ETH1ADDR
>  
>  endif # BR2_TARGET_UBOOT_NETWORK
>  
> +config BR2_TARGET_UBOOT_SPL
> +	bool "U-Boot SPL support"
> +	depends on !BR2_TARGET_XLOADER
> +	help
> +	  Enable the U-Boot SPL support. SPL is a first stage
> +	  bootloader loaded into internal memory in charge of 
> +	  enabling and configuring the external memory (DDR), 
> +	  and load the u-boot program into DDR.
> +
>  endif # BR2_TARGET_UBOOT
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index db9de8d..41745c9 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -88,6 +88,8 @@ endef
>  
>  define UBOOT_INSTALL_IMAGES_CMDS
>  	cp -dpf $(@D)/$(UBOOT_BIN) $(BINARIES_DIR)/
> +	$(if $(BR2_TARGET_UBOOT_SPL),
> +		cp -dpf $(@D)/MLO $(BINARIES_DIR)/)

 I didn't realize before, but it's only on OMAP that the SPL is called
MLO.  Its normal name is u-boot-spl.bin.

 I'm not sure how this could be solved.  The simplest way would be
something like (untested, as usual):

ifeq ($(BR2_TARGET_UBOOT_SPL),y)
define UBOOT_INSTALL_IMAGES_SPL
	if [ -e $(@D)/MLO ]; then \
		cp -dpf $(@D)/MLO $(BINARIES_DIR)/; \
	else \
		cp -dpf $(@D)/u-boot-spl.bin  $(BINARIES_DIR)/; \
	fi
endef
endif


 The alternative would be to make a separate config entry for MLO and 
other SPLs.  Which does make some kind of sense, I guess.


 Regards,
 Arnout


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
