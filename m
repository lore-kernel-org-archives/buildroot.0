From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 24 Jun 2014 18:01:37 +0200
Subject: [Buildroot] [PATCH] linux target name might be not equal linux
 file name
In-Reply-To: <20140624131825.GA29718@waldemar-brodkorb.de>
References: <20140624131825.GA29718@waldemar-brodkorb.de>
Message-ID: <53A9A0E1.9080707@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/06/14 15:18, Waldemar Brodkorb wrote:
> For example the upcoming qemu-xtensa patch is using this feature,
> where the target is called "zImage", but the resulting kernel name
> is "Image.elf".
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  linux/Config.in |    6 ++++++
>  linux/linux.mk  |   10 ++++++----
>  2 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index ece48a7..0f4337f 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -244,6 +244,12 @@ config BR2_LINUX_KERNEL_IMAGE_TARGET_NAME
>  	  Specify the kernel make target to build the kernel that you
>  	  need.
>  
> +config BR2_LINUX_KERNEL_IMAGE_NAME
> +	string "Kernel image name"
> +	depends on BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM

 This should default to BR2_LINUX_KERNEL_TARGET_NAME.

 However, it's probably better to leave the default to an empty string, and add
default handling in the .mk file.

 That default behaviour should also be described in the help text then.

> +	help
> +	  Specify the kernel filename.
> +
>  config BR2_LINUX_KERNEL_UIMAGE_LOADADDR
>  	string "load address (for 3.7+ multi-platform image)"
>  	depends on BR2_arm || BR2_armeb
> diff --git a/linux/linux.mk b/linux/linux.mk
> index bd3f2ac..1e7d2e2 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -80,8 +80,10 @@ endif
>  KERNEL_DTBS = $(addsuffix .dtb,$(KERNEL_DTS_NAME))
>  
>  ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
> -LINUX_IMAGE_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_TARGET_NAME))
> +LINUX_IMAGE_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_NAME))
> +LINUX_TARGET_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_TARGET_NAME))
>  else
> +LINUX_TARGET_NAME = $(LINUX_IMAGE_NAME)

 Although perfectly valid, it looks a bit strange to define the contents of the
right hand side of the assignment below the assignment statement...

 Anyway, for the default handling it would probably be more convenient to add
the following (untested!) after the BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM condition.

ifeq ($(LINUX_TARGET_NAME),)
LINUX_TARGET_NAME = $(LINUX_IMAGE_NAME)
endif


>  ifeq ($(BR2_LINUX_KERNEL_UIMAGE),y)
>  LINUX_IMAGE_NAME = uImage
>  else ifeq ($(BR2_LINUX_KERNEL_APPENDED_UIMAGE),y)
> @@ -259,7 +261,7 @@ endif
>  define LINUX_BUILD_CMDS
>  	$(if $(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),
>  		cp $(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH) $(KERNEL_ARCH_PATH)/boot/dts/)
> -	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_IMAGE_NAME)
> +	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
>  	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then 	\
>  		$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ;	\
>  	fi
> @@ -331,8 +333,8 @@ endif
>  # been generated in $(BINARIES_DIR)/rootfs.cpio.
>  $(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed $(LINUX_DIR)/.stamp_images_installed $(BINARIES_DIR)/rootfs.cpio
>  	@$(call MESSAGE,"Rebuilding kernel with initramfs")
> -	# Build the kernel.
> -	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_IMAGE_NAME)
> +	# Build the kernel. for custom kernels make target may be unequal to kernel file name

 [minor] I think this comment is a bit out of place here. Also, currently it is
just for custom kernels but that may change in the future.


 Regards,
 Arnout

> +	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
>  	$(LINUX_APPEND_DTB)
>  	# Copy the kernel image to its final destination
>  	cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
