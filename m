From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 5 Apr 2016 00:16:29 +0200
Subject: [Buildroot] [PATCH v4 1/7] barebox: support multi-image-build
	image selection
In-Reply-To: <1458513351-6556-2-git-send-email-pieter@boesman.nl>
References: <1458513351-6556-1-git-send-email-pieter@boesman.nl>
 <1458513351-6556-2-git-send-email-pieter@boesman.nl>
Message-ID: <5702E7BD.8070707@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/20/16 23:35, Pieter Smith wrote:
> Support selection of the built image filename in a multi-image barebox build.
> This makes it possible to specify which image to pick in a in a multi-image
> barebox config such as the am335x_defconfig.
>
> The specified image can either be located in the barebox build directory or the
> barebox build images directory.
>
> For compatibility with contemporary barbox builds, a sane default has been
> chosen. For barebox versions older than 2012.10, the user will have to specify
> 'barebox.bin'.
>
> Signed-off-by: Pieter Smith <pieter@boesman.nl>
> ---
>   boot/barebox/Config.in  | 9 +++++++++
>   boot/barebox/barebox.mk | 9 ++++++---
>   2 files changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
> index bbe6ae2..4f6872c 100644
> --- a/boot/barebox/Config.in
> +++ b/boot/barebox/Config.in
> @@ -97,6 +97,15 @@ config BR2_TARGET_BAREBOX_CONFIG_FRAGMENT_FILES
>   	  A space-separated list of configuration fragment files,
>   	  that will be merged to the main Barebox configuration file.
>
> +config BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE
> +	string "Built image filename"

  I think the 'built' part is redundant. For example, the kernel just has 
BR2_LINUX_KERNEL_IMAGE_NAME with prompt "Kernel image name", so I'd go for 
BR2_TARGET_BAREBOX_IMAGE_NAME and "Barebox image name".

> +	default "barebox-flash-image"
> +	help
> +	  Name of the built barebox image filename in the barebox build or
> +	  build images directory.
> +
> +	  Set to barebox.bin for barebox versions older than 2012.10.

  With Thomas's suggestion, the help text could become

	  The filename of the built barebox image. For current barebox, this is
	  usually barebox-flash-image; for barebox versions older than 2012.10,
	  it is barebox.bin. Leave empty to try these two options. This option
	  only needs to be set for multi-image barebox configs.

	  This file will be copied to the images directory as 'barebox.bin'.

> +
>   config BR2_TARGET_BAREBOX_BAREBOXENV
>   	bool "bareboxenv tool in target"
>   	help
> diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
> index 7715daf..2a3b724 100644
> --- a/boot/barebox/barebox.mk
> +++ b/boot/barebox/barebox.mk
> @@ -92,10 +92,10 @@ define BAREBOX_BUILD_CMDS
>   endef
>
>   define BAREBOX_INSTALL_IMAGES_CMDS
> -	if test -h $(@D)/barebox-flash-image ; then \
> -		cp -L $(@D)/barebox-flash-image $(BINARIES_DIR)/barebox.bin ; \
> +	if test -e $(@D)/$(call qstrip,$(BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE)); then \
> +		cp -L $(@D)/$(call qstrip,$(BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE)) $(BINARIES_DIR)/barebox.bin ; \
>   	else \
> -		cp $(@D)/barebox.bin $(BINARIES_DIR);\
> +		cp $(@D)/images/$(call qstrip,$(BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE)) $(BINARIES_DIR)/barebox.bin ; \
>   	fi
>   	$(BAREBOX_INSTALL_CUSTOM_ENV)
>   endef
> @@ -115,6 +115,9 @@ ifeq ($(BR2_TARGET_BAREBOX)$(BR_BUILDING),yy)
>   ifeq ($(or $(BAREBOX_KCONFIG_FILE),$(call qstrip,$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))),)
>   $(error No Barebox config. Check your BR2_TARGET_BAREBOX_BOARD_DEFCONFIG or BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE settings)
>   endif
> +ifndef BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE
> +$(error No barebox built image filename specified. Check your BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE setting)
> +endif

  With Thomas's suggestion, this check should be removed.

  Regards,
  Arnout

>   endif
>
>   $(eval $(kconfig-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
