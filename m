From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 8 Oct 2018 19:33:17 +0200
Subject: [Buildroot] [PATCH] u-boot: add option to generate env image
 from default env
In-Reply-To: <20181002053526.11374-1-Denis.Osterland@diehl.com>
References: <20181002053526.11374-1-Denis.Osterland@diehl.com>
Message-ID: <16db145d-edf3-787d-bb3c-3a50c340eb1c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Denis,

 I have a few very small comments about this patch.

On 2/10/18 07:38, Denis OSTERLAND wrote:
> From: Denis Osterland <Denis.Osterland@diehl.com>
> 
> This patch adds support to extract compiled in default env
> via u-boots get_default_envs script and generate env image from it.
> 
> Signed-off-by: Denis Osterland <Denis.Osterland@diehl.com>
> ---
>  boot/uboot/Config.in | 15 +++++++++++++++
>  boot/uboot/uboot.mk  |  6 +++++-
>  2 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 9e40c11fa1..a2e9c3866a 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -468,8 +468,23 @@ menuconfig BR2_TARGET_UBOOT_ENVIMAGE
>  
>  if BR2_TARGET_UBOOT_ENVIMAGE
>  
> +choice
> +	prompt "source"

 It's not immediately obvious that this is the source of the envimage, so better
"Source for environment".

> +
> +config BR2_TARGET_UBOOT_ENVIMAGE_TEXTFILE

 I would call this BR2_TARGET_UBOOT_ENVIMAGE_CUSTOM to be consistent with the
other uses of custom config files. However, see below.

> +	bool "text file"

 Here as well: "custom".

> +
> +config BR2_TARGET_UBOOT_ENVIMAGE_BUIILTIN

 and here _DEFAULT

> +	bool "compiled in"

 and "default".

> +	help
> +	  Use the default env from u-boot image.
> +	  requires >= v2018.03
> +
> +endchoice # source
> +
>  config BR2_TARGET_UBOOT_ENVIMAGE_SOURCE
>  	string "Source files for environment"
> +	depends on BR2_TARGET_UBOOT_ENVIMAGE_TEXTFILE

 However, I think it would be simpler to just allow this option to be empty. In
other words, remove the choice, and add something like the following at the end
of the help text:

	  For U-Boot >= v2018.03, it is possible to leave this empty. In that
	  case, the default environment for the target configuration will be
	  used.

 This is just an idea, if you don't like it, feel free to keep the current solution.


>  	help
>  	  Text files describing the environment. Files should have
>  	  lines of the form var=value, one per line. Blank lines and
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index c5abc125f3..ae9e38c8c2 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -263,7 +263,9 @@ endef
>  
>  ifneq ($(BR2_TARGET_UBOOT_ENVIMAGE),)
>  define UBOOT_GENERATE_ENV_IMAGE
> -	cat $(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)) \
> +	$(if $(BR2_TARGET_UBOOT_ENVIMAGE_BUIILTIN), \

 With the choice removed, this test could be:

	$(if $(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)),

but then it is better to factor it out in a separate variable, e.g.
UBOOT_GENERATE_ENV_FILE, that is protected by an ifdef.

> +	CROSS_COMPILE="$(TARGET_CROSS)" $(@D)/scripts/get_default_envs.sh $(@D), \
> +	cat $(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE))) \
>  		>$(@D)/buildroot-env.txt
>  	$(HOST_DIR)/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
>  		$(if $(BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT),-r) \
> @@ -376,9 +378,11 @@ endef
>  
>  ifeq ($(BR2_TARGET_UBOOT_ENVIMAGE),y)
>  ifeq ($(BR_BUILDING),y)
> +ifeq ($(BR2_TARGET_UBOOT_ENVIMAGE_TEXTFILE),y)
>  ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)),)
>  $(error Please define a source file for Uboot environment (BR2_TARGET_UBOOT_ENVIMAGE_SOURCE setting))
>  endif
> +endif

 With the choice removed, this entire condition+error would just be removed.

 Regards,
 Arnout

>  ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SIZE)),)
>  $(error Please provide Uboot environment size (BR2_TARGET_UBOOT_ENVIMAGE_SIZE setting))
>  endif
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
