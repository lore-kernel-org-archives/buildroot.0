From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Dec 2020 14:00:50 +0100
Subject: [Buildroot] [PATCH v3 07/11] boot/arm-trusted-firmware: add
 EDK2 as BL33 option
In-Reply-To: <20201218202646.1060123-8-hi@senzilla.io>
References: <20201218202646.1060123-1-hi@senzilla.io>
 <20201218202646.1060123-8-hi@senzilla.io>
Message-ID: <20201230130050.GO1680670@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dick, All,

On 2020-12-18 20:27 +0000, Dick Olsson via buildroot spake thusly:
> ARM Trusted Firmware (ATF) has the ability to load EDK2 UEFI when
> dropping into EL2. This is done via a new configuration option that
> build the BL33 payload with EDK2 images that will run in the EL2
> context.
> 
> Signed-off-by: Dick Olsson <hi@senzilla.io>
[--SNIP--]
> diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
> index c06294040e..a28a699e35 100644
> --- a/boot/arm-trusted-firmware/Config.in
> +++ b/boot/arm-trusted-firmware/Config.in
[--SNIP--]
> @@ -115,6 +115,19 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE
>  
>  endchoice
>  
> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33

Ah, this is the patch you introduce BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33.
Not sure how I missed it while reviewing your patch 4 earlier...

Caffeine has now kicked in fully, I hope. Brain, engage! ;-]

> +	bool "Use EDK2 as BL33"
> +	depends on BR2_TARGET_EDK2
> +	help
> +	  This option allows to embed EDK2 as the BL33 part of
> +	  the ARM Trusted Firmware. It ensures that the EDK2 package
> +	  gets built before ATF, and that the appropriate BL33
> +	  variable pointing to the EDK2 is passed when building ATF.
> +
> +	  Do not choose this option if you intend to build ATF and EDK2
> +	  for the 'qemu_sbsa' platform. In this case, due to the EDK2
> +	  build system, the dependency between ATF and EDK is reversed.
> +
>  config BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33
>  	bool "Use U-Boot as BL33"
>  	depends on BR2_TARGET_UBOOT
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> index a3553e36cf..51a5877ba1 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -79,6 +79,14 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += AARCH32_SP=optee
>  endif
>  endif # BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE
>  
> +ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33),y)
> +ARM_TRUSTED_FIRMWARE_DEPENDENCIES += edk2
> +# Since the flash device name vary between platforms, we use the variable
> +# provided by the EDK2 package for this. Using this variable here is OK
> +# as it will expand after all dependencies are resolved, inside _BUILD_CMDS.
> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(BINARIES_DIR)/$(EDK2_EL2_NAME).fd

If you follow my sggestion in the review of patch 4, this would become:

    ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(BINARIES_DIR)/$(call qstrip,$(BR2_PACKAGE_EDK2_EL2_NAME))

Even though I was the one that previously replied that what you did was
OK, I still prefer that we do not rely on it when it can be avoided with
simple code, and defining the EL2 name in Kconfig is simpler, I think.

Regards,
Yann E. MORIN.

> +endif
> +
>  ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33),y)
>  ARM_TRUSTED_FIRMWARE_UBOOT_BIN = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE))
>  ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(BINARIES_DIR)/$(ARM_TRUSTED_FIRMWARE_UBOOT_BIN)
> -- 
> 2.25.1
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
