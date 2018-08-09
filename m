From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Aug 2018 23:09:57 +0200
Subject: [Buildroot] [PATCH 1/2] boot: aml-s905x-cc-fip: new package for
 Libre Computer AML-S905X-CC boot firmwares
In-Reply-To: <1533545408-11248-2-git-send-email-narmstrong@baylibre.com>
References: <1533545408-11248-1-git-send-email-narmstrong@baylibre.com>
 <1533545408-11248-2-git-send-email-narmstrong@baylibre.com>
Message-ID: <20180809230957.44fac041@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this new proposal. However, I still have some concerns about
it :-/

On Mon,  6 Aug 2018 08:50:07 +0000, Neil Armstrong wrote:

> diff --git a/boot/Config.in b/boot/Config.in
> index 3687c41..a0d897f 100644
> --- a/boot/Config.in
> +++ b/boot/Config.in
> @@ -4,6 +4,7 @@ source "boot/afboot-stm32/Config.in"
>  source "boot/at91bootstrap/Config.in"
>  source "boot/at91bootstrap3/Config.in"
>  source "boot/at91dataflashboot/Config.in"
> +source "boot/aml-s905x-cc-fip/Config.in"

Alphabetic ordering is not good.

> +	  Amlogic FIP boot firmwares for AML-S905X-CC

Is this package specific to a board ? to a SoC ?

> diff --git a/boot/aml-s905x-cc-fip/aml-s905x-cc-fip.mk b/boot/aml-s905x-cc-fip/aml-s905x-cc-fip.mk
> new file mode 100644
> index 0000000..7aa6af9
> --- /dev/null
> +++ b/boot/aml-s905x-cc-fip/aml-s905x-cc-fip.mk
> @@ -0,0 +1,26 @@
> +################################################################################
> +#
> +# aml-s905x-cc-fip
> +#
> +################################################################################
> +
> +AML_S905X_CC_FIP_VERSION = 20170606
> +AML_S905X_CC_FIP_SOURCE = libretech-cc_fip_$(AML_S905X_CC_FIP_VERSION).tar.gz
> +AML_S905X_CC_FIP_SITE = https://github.com/BayLibre/u-boot/releases/download/v2017.11-libretech-cc
> +AML_S905X_CC_FIP_LICENSE = Amlogic

"Amlogic" is not a license. We need a proper license, that at least
gives the right to redistribute those binaries. Without a license,
nobody is allowed to redistribute those binaries, making them pretty
useless.

> +define AML_S905X_CC_FIP_INSTALL_IMAGES_CMDS
> +	$(INSTALL) -D -m 0644 $(@D)/gxl/bl2.bin $(BINARIES_DIR)/fip/bl2.bin
> +	$(INSTALL) -D -m 0644 $(@D)/gxl/acs.bin $(BINARIES_DIR)/fip/acs.bin
> +	$(INSTALL) -D -m 0644 $(@D)/gxl/bl21.bin $(BINARIES_DIR)/fip/bl21.bin
> +	$(INSTALL) -D -m 0644 $(@D)/gxl/bl30.bin $(BINARIES_DIR)/fip/bl30.bin
> +	$(INSTALL) -D -m 0644 $(@D)/gxl/bl301.bin $(BINARIES_DIR)/fip/bl301.bin
> +	$(INSTALL) -D -m 0644 $(@D)/gxl/bl31.img $(BINARIES_DIR)/fip/bl31.img
> +	$(INSTALL) -D -m 0755 $(@D)/gxl/aml_encrypt_gxl $(BINARIES_DIR)/fip/aml_encrypt_gxl
> +	$(INSTALL) -D -m 0755 $(@D)/blx_fix.sh $(BINARIES_DIR)/fip/blx_fix.sh
> +	$(INSTALL) -D -m 0644 $(@D)/acs_tool.pyc $(BINARIES_DIR)/fip/acs_tool.pyc

These last three files are host programs, they should be installed to
$(HOST_DIR).

However:

 - aml_encrypt_gxl is a prebuilt binary for x86-64. This means this
   package should depend on host arch being x86-64:

   depends on BR2_HOSTARCH = "x86_64"

   You really don't have the source code for this tool ? It would be
   much easier.

 - acs_tool.pyc is byte-compiled. You also don't have the source code
   here ? I'm not sure how much Python bytecode is compatible between
   Python versions. The bytecode you have has been built with Python
   2.7. Does it work with Python 2.6 ? Python 3.x ?

Also, perhaps we should do like arm-trusted-firmware: make this package
depend on u-boot, and then include all the complicated firmware
generation logic inside aml-s905x-cc instead of having it in a
post-image script.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
