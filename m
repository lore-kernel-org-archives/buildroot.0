From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 30 Jun 2018 22:51:13 +0200
Subject: [Buildroot] [PATCH v3 2/4] linux: add custom linux logo
In-Reply-To: <1527628939-7389-3-git-send-email-angelo@amarulasolutions.com>
References: <1527628939-7389-1-git-send-email-angelo@amarulasolutions.com>
 <1527628939-7389-3-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20180630205113.GC23012@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo, All,

On 2018-05-29 23:22 +0200, Angelo Compagnucci spake thusly:
> From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> 
> This patch adds a simple way to change the linux bootup logo.
> The patch was kept purposely simple to support only the use cause
> where a user needs a colour linux boot up logo.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

But I have a small comment though, see below...

> ---
>  linux/Config.in |  8 ++++++++
>  linux/linux.mk  | 15 +++++++++++++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index b1691fe..102bb22 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -184,6 +184,14 @@ config BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES
>  	  A space-separated list of kernel configuration fragment files,
>  	  that will be merged to the main kernel configuration file.
>  
> +config BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH
> +	string "Custom logo file path"
> +	help
> +	  Change the linux boot logo with your own graphics,
> +	  it can be used as an early bootsplash.o

I would add that support for framebuffer be enabled in the kernel
config.

> +	  Custom logo should be in png or jpg and it will be
> +	  converted to the linux kernel format (224 colors only).

I would also state that this replaces the existing logo file.

Regards,
Yann E. MORIN.

>  #
>  # Binary format
>  #
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 6b5f534..6083756 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -226,6 +226,18 @@ define LINUX_TRY_PATCH_TIMECONST
>  endef
>  LINUX_POST_PATCH_HOOKS += LINUX_TRY_PATCH_TIMECONST
>  
> +LINUX_KERNEL_CUSTOM_LOGO_PATH = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH))
> +ifneq ($(LINUX_KERNEL_CUSTOM_LOGO_PATH),)
> +LINUX_DEPENDENCIES += host-imagemagick
> +LINUX_KERNEL_CUSTOM_LOGO = y
> +define LINUX_KERNEL_CUSTOM_LOGO_CONVERT
> +	$(HOST_DIR)/usr/bin/convert $(LINUX_KERNEL_CUSTOM_LOGO_PATH) \
> +		-dither None -colors 224 -compress none \
> +		$(LINUX_DIR)/drivers/video/logo/logo_linux_clut224.ppm
> +endef
> +LINUX_PRE_BUILD_HOOKS += LINUX_KERNEL_CUSTOM_LOGO_CONVERT
> +endif
> +
>  ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
>  LINUX_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
>  else ifeq ($(BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG),y)
> @@ -325,6 +337,9 @@ define LINUX_KCONFIG_FIXUP_CMDS
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_ARM_APPENDED_DTB,$(@D)/.config))
>  	$(if $(BR2_PACKAGE_KERNEL_MODULE_IMX_GPU_VIV),
>  		$(call KCONFIG_DISABLE_OPT,CONFIG_MXC_GPU_VIV,$(@D)/.config))
> +	$(if $(LINUX_KERNEL_CUSTOM_LOGO),
> +		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO,$(@D)/.config)
> +		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO_LINUX_CLUT224,$(@D)/.config))
>  endef
>  
>  ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)
> -- 
> 2.7.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
