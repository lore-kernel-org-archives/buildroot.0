From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue, 5 Jul 2016 13:26:01 +0200
Subject: [Buildroot] [PATCH] uboot: install multiple spl images
In-Reply-To: <1467717445-29708-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467717445-29708-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <CAGduivwQTnmQ6bYxoP9q8vKBG-eOSmUbYd13_rjo9SSr4t_LxA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

The SoB lines are mangled, don't know what happened there. Anyway this
can be fixed when it's merged.

On Tue, Jul 5, 2016 at 1:17 PM, Maxime Hadjinlian
<maxime.hadjinlian@gmail.com> wrote:
> From: Jason Abele <jason@nextthing.co>
>
> For some platforms, there are multiple generated spl images.  Extend
> BR2_TARGET_UBOOT_SPL_NAME to allow these multiple images to be installed
> after uboot build completes.
>
> For example, the NextThingCo C.H.I.P. uses two binaries from uboot,
> spl/sunxi-spl.bin and spl/sunxi-spl-with-ecc.bin.
>
> Signed-off-by: Jason Abele <jason@nextthing.co>
> [Maxime:
>  - Add foreach loop for general case and mkpimage
>  - Use firstword for zynq case]
> Signe-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  boot/uboot/Config.in |  2 +-
>  boot/uboot/uboot.mk  | 17 ++++++++++++-----
>  2 files changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 9ffbb51..a468548 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -313,7 +313,7 @@ config BR2_TARGET_UBOOT_SPL_NAME
>         default "spl/u-boot-spl.bin"
>         depends on BR2_TARGET_UBOOT_SPL
>         help
> -         This is the name of the SPL binary, generated during
> +         A space-separated list of SPL binaries, generated during
>           u-boot build. For most platform it is spl/u-boot-spl.bin
>           but not always. It is MLO on OMAP for example.
>
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index a2274ee..8ac035b 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -170,7 +170,10 @@ define UBOOT_INSTALL_IMAGES_CMDS
>         $(if $(BR2_TARGET_UBOOT_FORMAT_NAND),
>                 cp -dpf $(@D)/$(UBOOT_MAKE_TARGET) $(BINARIES_DIR))
>         $(if $(BR2_TARGET_UBOOT_SPL),
> -               cp -dpf $(@D)/$(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME)) $(BINARIES_DIR)/)
> +               $(foreach f,$(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME)), \
> +                       cp -dpf $(@D)/$(f) $(BINARIES_DIR)/
> +               )
> +       )
>         $(if $(BR2_TARGET_UBOOT_ENVIMAGE),
>                 cat $(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)) | \
>                         $(HOST_DIR)/usr/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
> @@ -198,8 +201,9 @@ endif
>
>  ifeq ($(BR2_TARGET_UBOOT_ZYNQ_IMAGE),y)
>  define UBOOT_GENERATE_ZYNQ_IMAGE
> -       $(HOST_DIR)/usr/bin/python2 $(HOST_DIR)/usr/bin/zynq-boot-bin.py \
> -               -u $(@D)/$(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME))     \
> +       $(HOST_DIR)/usr/bin/python2 \
> +               $(HOST_DIR)/usr/bin/zynq-boot-bin.py \
> +               -u $(@D)/$(firstword $(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME)) \
>                 -o $(BINARIES_DIR)/BOOT.BIN
>  endef
>  UBOOT_DEPENDENCIES += host-zynq-boot-bin
> @@ -208,8 +212,11 @@ endif
>
>  ifeq ($(BR2_TARGET_UBOOT_ALTERA_SOCFPGA_IMAGE_CRC),y)
>  define UBOOT_CRC_ALTERA_SOCFPGA_IMAGE
> -       $(HOST_DIR)/usr/bin/mkpimage -o $(BINARIES_DIR)/$(notdir $(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME))).crc \
> -               $(@D)/$(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME))
> +       $(foreach f,$(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME)), \
> +               $(HOST_DIR)/usr/bin/mkpimage \
> +                       -o $(BINARIES_DIR)/$(notdir $(call qstrip,$(f))).crc \
> +                       $(@D)/$(call qstrip,$(f))
> +       )
>  endef
>  UBOOT_DEPENDENCIES += host-mkpimage
>  UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_CRC_ALTERA_SOCFPGA_IMAGE
> --
> 2.8.1
>
