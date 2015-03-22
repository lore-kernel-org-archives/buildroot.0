From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 22 Mar 2015 14:02:29 +0100
Subject: [Buildroot] [PATCH 1/2] boot/uboot: add support for i.MX28 SD
 format
In-Reply-To: <1426701961-2619-1-git-send-email-vincent.stehle@freescale.com>
References: <1426701961-2619-1-git-send-email-vincent.stehle@freescale.com>
Message-ID: <550EBD65.80102@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/03/15 19:06, Vincent Stehl? wrote:
> Allow to generate u-boot.sd, Freescale i.MX28 SB format with a header for
> booting from an SD card.
> 
> U-boot includes an mxsboot tool to generate this format, starting from
> v2011.12.
> 
> See u-boot doc/README.mxs.
> 
> Signed-off-by: Vincent Stehl? <vincent.stehle@freescale.com>
> ---
>  boot/uboot/Config.in | 12 ++++++++++++
>  boot/uboot/uboot.mk  |  5 +++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 03e6acc..cea993a 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -117,6 +117,18 @@ config BR2_TARGET_UBOOT_FORMAT_SB
>  	depends on BR2_arm
>  	bool "u-boot.sb"
>  
> +config BR2_TARGET_UBOOT_FORMAT_SD
> +	depends on BR2_arm
> +	bool "u-boot.sd"
> +	help
> +	  This is Freescale i.MX28 SB format, with a header for booting from an

 Lines should wrap at 72 columns.

> +	  SD card.
> +
> +	  U-boot includes an mxsboot tool to generate this format, starting
> +	  from v2011.12.

 U-Boot doesn't use v in its version specifiers.

> +
> +	  See doc/README.mxs.

 Before 2013.07, it was called README.mx28_common

 Before 2014.01, you needed elftosb to generate the BootStream image.
Unfortunately we can't automatically add that dependency because we can't detect
the U-Boot version. So, add this dependency unconditionally like is done for the
SB format.

> +
>  config BR2_TARGET_UBOOT_FORMAT_CUSTOM
>  	bool "Custom (specify below)"
>  	help
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index a9ba054..8fad5b4 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -49,6 +49,9 @@ else ifeq ($(BR2_TARGET_UBOOT_FORMAT_SB),y)
>  UBOOT_BIN = u-boot.sb
>  UBOOT_MAKE_TARGET = $(UBOOT_BIN)
>  UBOOT_DEPENDENCIES += host-elftosb
> +else ifeq ($(BR2_TARGET_UBOOT_FORMAT_SD),y)
> +UBOOT_BIN = u-boot.sd
> +UBOOT_MAKE_TARGET = u-boot.sb

 Since sb and sd are visually so similar, I think it's worthwhile to add a small
comment here to say which is which. E.g.

# BootStream (.sb) file is built by U-Boot, we convert it to SD file

 I'll send an updated series with these changes.

 Regards,
 Arnout

>  else ifeq ($(BR2_TARGET_UBOOT_FORMAT_CUSTOM),y)
>  UBOOT_BIN = $(call qstrip,$(BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME))
>  else
> @@ -116,6 +119,8 @@ define UBOOT_BUILD_CMDS
>  	$(TARGET_CONFIGURE_OPTS) 	\
>  		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) 		\
>  		$(UBOOT_MAKE_TARGET)
> +	$(if $(BR2_TARGET_UBOOT_FORMAT_SD),
> +		$(@D)/tools/mxsboot sd $(@D)/u-boot.sb $(@D)/u-boot.sd)
>  endef
>  
>  define UBOOT_BUILD_OMAP_IFT
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
