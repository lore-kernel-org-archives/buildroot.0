From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Sep 2013 17:43:36 +0200
Subject: [Buildroot] [PATCH 1/1] u-boot: allow to pass a custom
 configuration file
In-Reply-To: <1379589006-28682-1-git-send-email-eric.jarrige@armadeus.org>
References: <1379589006-28682-1-git-send-email-eric.jarrige@armadeus.org>
Message-ID: <20130919174336.537e265e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Jarrige,

On Thu, 19 Sep 2013 13:10:06 +0200, Eric Jarrige wrote:

>  choice
> +	prompt "U-Boot configuration"
> +	default BR2_TARGET_UBOOT_USE_DEFCONFIG
> +
> +config BR2_TARGET_UBOOT_USE_DEFCONFIG
> +	bool "Using default configuration"

I don't think using the word 'defconfig' for U-Boot is appropriate,
since 'defconfig' really refers to a kconfig terminology and U-Boot,
sadly, doesn't use kconfig.

>  define UBOOT_CONFIGURE_CMDS
> +	$(if $(BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG),
> +		cp -pf $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE)) \
> +			$(@D)/include/configs/$(UBOOT_BOARD_NAME).h)
>  	$(TARGET_CONFIGURE_OPTS) $(UBOOT_CONFIGURE_OPTS) 	\
>  		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS)		\
>  		$(UBOOT_BOARD_NAME)_config

I am a bit hesitant on the overall feature. The fact that a
include/configs/<something>.h file is really a configuration file is
pretty fuzzy in U-Boot, especially since now boards are supposed to
also be listed in the main boards.cfg file.

Therefore, I'm tempted to say that users who need to do that should
instead use patches against U-Boot (to add their own board, including
the include/configs/<something>.h file).

But on this one, I believe I can be convinced if there are good
arguments :)

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
