From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Thu, 30 May 2019 22:29:45 +0200
Subject: [Buildroot] [PATCH v2] boot/uboot: add initial environment
 support
In-Reply-To: <20190527192342.23406-1-michael@walle.cc>
References: <20190527192342.23406-1-michael@walle.cc>
Message-ID: <79073dd4-ee7c-587b-6b19-dbf73dfc931c@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 27/05/2019 ? 21:23, Michael Walle a ?crit?:
> Since v2019.07 U-Boot supports extracting the compiled-in environment.
> As a first step, add support to the environment generation in buildroot.
> In the future, the text file may also be copied into the target
> filesystem, where it will be used by the uboot-tools.

In fact, u-boot-initial-env file can also be used
by SWUpdate [1] and libubootenv [2] now ;).

>
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>
> changes since v1:
>   - rename _INITIAL to _BUILTIN
>   - add help texts
>   - make commit message little bit more clearer, hopefully ;)
>
>   boot/uboot/Config.in | 24 ++++++++++++++++++++++++
>   boot/uboot/uboot.mk  | 17 ++++++++++++++++-
>   2 files changed, 40 insertions(+), 1 deletion(-)
>
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 33b7e67ff7..45bbf88b6f 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -488,7 +488,30 @@ menuconfig BR2_TARGET_UBOOT_ENVIMAGE
>   	  The environment image will be called uboot-env.bin.
>   
>   if BR2_TARGET_UBOOT_ENVIMAGE
> +choice
> +	prompt "Environment image source"
> +	default BR2_TARGET_UBOOT_ENVIMAGE_CUSTOM
> +
> +config BR2_TARGET_UBOOT_ENVIMAGE_BUILTIN
> +	bool "Using uboot's built-in environment file"
> +	help
> +	  Select this option if you want to build the image from
> +	  u-boot's built-in environment. The content will be the
> +	  same as the default environment of the u-boot binary.
> +
> +	  This feature requires commit
> +	  bdaa73a5b3923257add182b4ab8058dbfa33421b from upstream
> +	  U-Boot, available from versions 2019.07 or later.
> +
> +config BR2_TARGET_UBOOT_ENVIMAGE_CUSTOM
> +	bool "Using a custom environment file"
> +	help
> +	  Select this option if you want to specify your own
> +	  custom environment file.
> +
> +endchoice
>   
> +if BR2_TARGET_UBOOT_ENVIMAGE_CUSTOM
>   config BR2_TARGET_UBOOT_ENVIMAGE_SOURCE
>   	string "Source files for environment"
>   	help
> @@ -497,6 +520,7 @@ config BR2_TARGET_UBOOT_ENVIMAGE_SOURCE
>   	  lines starting with a # are ignored.
>   
>   	  Multiple source files are concatenated in the order listed.
> +endif # BR2_TARGET_UBOOT_ENVIMAGE_CUSTOM
>   
>   config BR2_TARGET_UBOOT_ENVIMAGE_SIZE
>   	string "Size of environment"
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index ae09c37d84..0da1f37cbd 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -271,9 +271,22 @@ define UBOOT_BUILD_OMAP_IFT
>   endef
>   
>   ifneq ($(BR2_TARGET_UBOOT_ENVIMAGE),)
> -define UBOOT_GENERATE_ENV_IMAGE
> +ifeq ($(BR2_TARGET_UBOOT_ENVIMAGE_CUSTOM),y)
> +define UBOOT_CREATE_ENV_SOURCE
>   	cat $(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)) \
>   		>$(@D)/buildroot-env.txt
> +endef
> +endif
> +
> +ifeq ($(BR2_TARGET_UBOOT_ENVIMAGE_BUILTIN),y)
> +UBOOT_MAKE_TARGET += u-boot-initial-env
> +define UBOOT_CREATE_ENV_SOURCE
> +	cp -dpf $(@D)/u-boot-initial-env $(@D)/buildroot-env.txt
> +endef
> +endif
> +
> +define UBOOT_GENERATE_ENV_IMAGE
> +	$(UBOOT_CREATE_ENV_SOURCE)
>   	$(HOST_DIR)/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
>   		$(if $(BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT),-r) \
>   		$(if $(filter "BIG",$(BR2_ENDIAN)),-b) \
> @@ -385,9 +398,11 @@ endef
>   
>   ifeq ($(BR2_TARGET_UBOOT_ENVIMAGE),y)
>   ifeq ($(BR_BUILDING),y)
> +ifeq ($(BR2_TARGET_UBOOT_ENVIMAGE_CUSTOM),y)
>   ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)),)
>   $(error Please define a source file for Uboot environment (BR2_TARGET_UBOOT_ENVIMAGE_SOURCE setting))
>   endif
> +endif
>   ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SIZE)),)
>   $(error Please provide Uboot environment size (BR2_TARGET_UBOOT_ENVIMAGE_SIZE setting))
>   endif

Otherwise, tested on NXP WaRP7 with BR2_TARGET_UBOOT_ENVIMAGE_BUILTIN 
config option.
Setup : U-Boot master and libubootenv package (buildroot -next).

Tested-by: Pierre-Jean Texier <pjtexier@koncepto.io>


[1] - 
https://github.com/sbabic/swupdate/blob/fa06a75f3d8b3a58fedf4d5d036c526062c74386/bootloader/uboot.c#L130
[2] - 
https://github.com/sbabic/libubootenv/blob/master/src/fw_printenv.c#L125

-- 
Best regards,
Pierre-Jean Texier
