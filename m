From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 11:26:54 +0100
Subject: [Buildroot] [PATCH v3] configs/atmel: update u-boot-at91 and
 bootstrap to tarballs
In-Reply-To: <d849cb07-7c68-2b63-d44e-4a93c45e3d88@microchip.com>
References: <1575459437-7302-1-git-send-email-eugen.hristev@microchip.com>
 <20191216104701.0f3af055@windsurf.home>
 <d849cb07-7c68-2b63-d44e-4a93c45e3d88@microchip.com>
Message-ID: <20191216112654.41dcdde1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 16 Dec 2019 10:08:55 +0000
<Eugen.Hristev@microchip.com> wrote:

> I can help doing it. Here is a quick work , is it okay? send a patch ? 
> or there is more to do this than simply what I did below:

You certainly also need some changes in the Config.in file. I recommend
testing your changes before sending them :-)

Also, the patch snippet below was line-wrapped by your e-mail client,
so it's not easy to review.

> diff --git a/boot/at91bootstrap3/at91bootstrap3.mk 
> b/boot/at91bootstrap3/at91bootstrap3.mk
> index 685be5b..a491aaf 100644
> --- a/boot/at91bootstrap3/at91bootstrap3.mk
> +++ b/boot/at91bootstrap3/at91bootstrap3.mk
> @@ -6,7 +6,12 @@
> 
>   AT91BOOTSTRAP3_VERSION = $(call 
> qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_VERSION))
> 
> -ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT),y)
> +ifeq ($(AT91BOOTSTRAP_VERSION),custom)

Should be:

ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL),y)

> +# Handle custom AT91Bootstrap tarballs as specified by the configuration
> +AT91BOOTSTRAP_TARBALL = $(call 
> qstrip,$(BR2_TARGET_AT91BOOTSTRAP_CUSTOM_TARBALL_LOCATION))
> +AT91BOOTSTRAP_SITE = $(patsubst %/,%,$(dir $(AT91BOOTSTRAP_TARBALL)))
> +AT91BOOTSTRAP_SOURCE = $(notdir $(AT91BOOTSTRAP_TARBALL))
> +else ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT),y)
>   AT91BOOTSTRAP3_SITE = $(call 
> qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL))
>   AT91BOOTSTRAP3_SITE_METHOD = git
>   BR_NO_CHECK_HASH_FOR += $(AT91BOOTSTRAP3_SOURCE)
> @@ -54,6 +59,15 @@ AT91BOOTSTRAP3_KCONFIG_OPTS = $(AT91BOOTSTRAP3_MAKE_OPTS)
>   # Must be before we call to kconfig-package
>   ifeq ($(BR_BUILDING),y)
> 
> +#
> +# Check custom tarball option
> +#
> +ifeq ($(BR2_TARGET_AT91BOOTSTRAP_CUSTOM_TARBALL),y)
> +ifeq ($(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_CUSTOM_TARBALL_LOCATION)),)
> +$(error No custom AT91Bootstrap tarball specified. Check your 
> BR2_TARGET_AT91BOOTSTRAP_CUSTOM_TARBALL_LOCATION setting)
> +endif # qstrip BR2_TARGET_AT91BOOTSTRAP_CUSTOM_TARBALL_LOCATION
> +endif # BR2_TARGET_AT91BOOTSTAP_CUSTOM_TARBALL

Otherwise, it seems OK.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
