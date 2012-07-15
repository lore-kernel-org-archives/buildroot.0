From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 15 Jul 2012 14:34:26 +0200
Subject: [Buildroot] [PATCH 1/4] Rework support for the device tree
In-Reply-To: <1341309676-18681-2-git-send-email-maxime.ripard@free-electrons.com>
References: <1341309676-18681-1-git-send-email-maxime.ripard@free-electrons.com>
 <1341309676-18681-2-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <5002B8D2.6050401@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/03/12 12:01, Maxime Ripard wrote:
> Signed-off-by: Maxime Ripard<maxime.ripard@free-electrons.com>
> ---
>   linux/Config.in |   46 +++++++++++++++++++++++++++++++++++++++-------
>   linux/linux.mk  |   38 +++++++++++++++++++++++---------------
>   2 files changed, 62 insertions(+), 22 deletions(-)
>
> diff --git a/linux/Config.in b/linux/Config.in
> index 4562b1b..6f704b0 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -124,14 +124,46 @@ config BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE
>   	help
>   	  Path to the kernel configuration file
>
> +config BR2_LINUX_KERNEL_DTS_SUPPORT
> +	bool "Device tree support"
> +	help
> +	  Compile a device tree source into a device tree blob.
> +	  Select the dts file to compile in the options below.
> +
> +if BR2_LINUX_KERNEL_DTS_SUPPORT

  Maybe it's better to remove this option, and instead just
detect if BR2_LINUX_KERNEL_DTS_FILE is defined.  Or would
that make things more confusing?


[snip]
> +ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)
> +define LINUX_BUILD_DTB
> +	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(KERNEL_DTS_NAME).dtb
> +endef
> +endif
> +
>   # Compilation. We make sure the kernel gets rebuilt when the
>   # configuration has changed.
>   define LINUX_BUILD_CMDS
> +	$(if $(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),
> +		mkdir $(KERNEL_ARCH_PATH)/boot/dts

  Should be mkdir -p

> +		cp $(BR2_LINUX_KERNEL_CUSTOM_DTS_FILE) $(KERNEL_ARCH_PATH)/boot/dts/)
>   	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_IMAGE_NAME)
>   	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then 	\
>   		$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ;	\
>   	fi
> +	$(LINUX_BUILD_DTB)
>   endef
>
>
> @@ -183,12 +184,19 @@ define LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET
>   endef
>   endif
>
> +ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)
> +define LINUX_INSTALL_DTB
> +	cp $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb $(BINARIES_DIR)/
> +endef

  I would move this definition to the same place as LINUX_BUILD_DTB.

  Regards,
  Arnout

> +endif
> +
>   define LINUX_INSTALL_IMAGES_CMDS
>   	cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
>   endef
>
>   define LINUX_INSTALL_TARGET_CMDS
>   	$(LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET)
> +	$(LINUX_INSTALL_DTB)
>   	# Install modules and remove symbolic links pointing to build
>   	# directories, not relevant on the target
>   	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then 	\

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
