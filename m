From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 7 Jun 2021 16:09:34 +0200
Subject: [Buildroot] [PATCH/RFC 01/28] boot/arm-trusted-firmware: option
 to disable stack protection
In-Reply-To: <20210531212748.2378872-2-geomatsi@gmail.com>
References: <20210531212748.2378872-1-geomatsi@gmail.com>
 <20210531212748.2378872-2-geomatsi@gmail.com>
Message-ID: <CAEyMn7bawNC19ZsrfQa0GdJq8+BRQo539Ncp92TBYx4AVYMTTg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sergey,

Am Mo., 31. Mai 2021 um 23:28 Uhr schrieb Sergey Matyukevich
<geomatsi@gmail.com>:
>
> Default value for ATF build flag  ENABLE_STACK_PROTECTOR is "none".
> Buildroot sets appropriate ENABLE_STACK_PROTECTOR build flag value
> based on the enabled BR2_SSP_* options. For any values other than
> "none", ATF platform specific hook 'plat_get_stack_protector_canary'
> should be implemented. However this hook is not implemented by all
> the platforms supported by ATF. For instance, allwinner does not
> provide such a hook.
>
> Add new option BR2_TARGET_ARM_TRUSTED_FIRMWARE_DISABLE_SSP to disable
> GCC stack protecton when selected ATF platform does not provide
> support for this feature.

I tested this patch to build a defconfig with buildroot toolchain that
has SSP enabled. By using the
BR2_TARGET_ARM_TRUSTED_FIRMWARE_DISABLE_SSP option I was able to build
ATF v2.5 for a imx8m platform without the described error
(plat_get_stack_protector_cannary).

When you update your patch series I can add a tested-by.

> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
>  boot/arm-trusted-firmware/Config.in               | 7 +++++++
>  boot/arm-trusted-firmware/arm-trusted-firmware.mk | 4 ++++
>  2 files changed, 11 insertions(+)
>
> diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
> index c06294040e..9b851845b9 100644
> --- a/boot/arm-trusted-firmware/Config.in
> +++ b/boot/arm-trusted-firmware/Config.in
> @@ -175,4 +175,11 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN
>           Select this option if your ATF board configuration requires
>           an ARM32 bare metal toolchain to be available.
>
> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_DISABLE_SSP
> +       bool "Disable stack protection"
> +       help
> +         Select this option to explicitly disable stack protection checks in GCC.
> +         Such checks need to be disabled if ATF platform port does not implement
> +         plat_get_stack_protector_canary() hook.
> +
>  endif
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> index 0597cecf71..3fb65a01b3 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -100,6 +100,9 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += MV_DDR_PATH=$(MV_DDR_MARVELL_DIR)
>  ARM_TRUSTED_FIRMWARE_DEPENDENCIES += mv-ddr-marvell
>  endif
>
> +ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_DISABLE_SSP),y)
> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=none
> +else
>  ifeq ($(BR2_SSP_REGULAR),y)
>  ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=default
>  else ifeq ($(BR2_SSP_STRONG),y)
> @@ -107,6 +110,7 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=strong
>  else ifeq ($(BR2_SSP_ALL),y)
>  ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ENABLE_STACK_PROTECTOR=all
>  endif
> +endif
>
>  ARM_TRUSTED_FIRMWARE_MAKE_TARGETS = all
>

Thank you,
Heiko
