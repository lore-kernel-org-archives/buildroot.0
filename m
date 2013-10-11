From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Oct 2013 23:18:48 +0200
Subject: [Buildroot] [PATCH] uboot: support -r option for mkenvimage
In-Reply-To: <1381478269-29943-1-git-send-email-spdawson@gmail.com>
References: <1381478269-29943-1-git-send-email-spdawson@gmail.com>
Message-ID: <52586B38.6010306@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/10/13 09:57, spdawson at gmail.com wrote:
> From: Simon Dawson <spdawson@gmail.com>
>
> Some boards are configured in u-boot to store multiple redundant copies of
> the environment image in flash. For these boards, it is required to pass the -r
> flag, when generating a boot environment image using mkenvimage.
>
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> ---
>   boot/uboot/Config.in | 5 +++++
>   boot/uboot/uboot.mk  | 1 +
>   2 files changed, 6 insertions(+)
>
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 998cda2..d33e8e1 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -242,6 +242,11 @@ config BR2_TARGET_UBOOT_ENVIMAGE_SIZE
>   	  Size of envronment, can be prefixed with 0x for hexadecimal
>   	  values.
>
> +config BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT
> +	bool "Redundant environment"

  "Redundant environment" sounds as if it's... redundant :-)

  How about "Environment has two copies"?

> +	help
> +	  The environment has multiple copies in flash.

  It's always two :-)


  Regards,
  Arnout

> +
>   endif # BR2_TARGET_UBOOT_ENVIMAGE
>
>   endif # BR2_TARGET_UBOOT
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index dc8e26f..330c177 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -117,6 +117,7 @@ define UBOOT_INSTALL_IMAGES_CMDS
>   		cp -dpf $(@D)/$(BR2_TARGET_UBOOT_SPL_NAME) $(BINARIES_DIR)/)
>   	$(if $(BR2_TARGET_UBOOT_ENVIMAGE),
>   		$(HOST_DIR)/usr/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
> +		$(if $(BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT),-r) \
>   		-o $(BINARIES_DIR)/uboot-env.bin $(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE))
>   endef
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
