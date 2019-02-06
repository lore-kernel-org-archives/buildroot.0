From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 16:45:24 +0100
Subject: [Buildroot] [PATCH v2] boot/arm-trusted-firmware: add option to
 choose custom version
In-Reply-To: <20190206135858.6707-1-michal.lyszczek@bofc.pl>
References: <20190206135858.6707-1-michal.lyszczek@bofc.pl>
Message-ID: <20190206164524.2cabb13c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  6 Feb 2019 14:58:58 +0100
Micha? ?yszczek <michal.lyszczek@bofc.pl> wrote:

> Allow user to choose specific, stable version from official ATF
> repository
> 
> Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>

Thanks, applied, with one minor change (see below).

> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> index 23f493653d..9bac1319d7 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -13,13 +13,17 @@ ifeq ($(ARM_TRUSTED_FIRMWARE_VERSION),custom)
>  ARM_TRUSTED_FIRMWARE_TARBALL = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION))
>  ARM_TRUSTED_FIRMWARE_SITE = $(patsubst %/,%,$(dir $(ARM_TRUSTED_FIRMWARE_TARBALL)))
>  ARM_TRUSTED_FIRMWARE_SOURCE = $(notdir $(ARM_TRUSTED_FIRMWARE_TARBALL))
> -BR_NO_CHECK_HASH_FOR += $(ARM_TRUSTED_FIRMWARE_SOURCE)
>  else ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT),y)
>  ARM_TRUSTED_FIRMWARE_SITE = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL))
>  ARM_TRUSTED_FIRMWARE_SITE_METHOD = git
> -BR_NO_CHECK_HASH_FOR += $(ARM_TRUSTED_FIRMWARE_SOURCE)
>  else
> +# Handle stable official ATF versions
>  ARM_TRUSTED_FIRMWARE_SITE = $(call github,ARM-software,arm-trusted-firmware,$(ARM_TRUSTED_FIRMWARE_VERSION))
> +ARM_TRUSTED_FIRMWARE_SOURCE = arm-trusted-firmware-$(ARM_TRUSTED_FIRMWARE_VERSION).tar.gz

Adding this line is not needed: it's the default value for this
variable.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
