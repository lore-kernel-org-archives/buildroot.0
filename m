From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 30 Aug 2015 11:30:29 +0300
Subject: [Buildroot] [1/1] linux: avoid multiple dtb append on uImages
In-Reply-To: <1440823702-13736-1-git-send-email-derosier@gmail.com>
References: <1440823702-13736-1-git-send-email-derosier@gmail.com>
Message-ID: <20150830083029.GC17874@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Steve,

On Fri, Aug 28, 2015 at 09:48:22PM -0700, Steve deRosier wrote:
> From: Steve deRosier <steve.derosier@lairdtech.com>
> 
> If using appended dtbs on uImages, a 'make linux-rebuild' will end up just
> adding the new dtb after the previous dtb if all you did was modify the
> device tree without a modification that would regenerate the zImage. This
> results in a surprising effect when you boot your device: your DT changes
> don't take effect because linux just loads the first dtb.
> 
> This patch fixes this little edge case by using an intermediate file for the
> append work if using BR2_LINUX_KERNEL_APPEND_UIMAGE. Otherwise it must
> retain the zImage naming, so the situation is unchanged for the case where
> this flag is not set.

See http://patchwork.ozlabs.org/patch/394002/ (our oldest patchwork entry) for 
a different, arguably simpler, approach.

baruch

> Signed-off-by: Steve deRosier <steve.derosier@lairdtech.com>
> ---
>  linux/linux.mk |   17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 48f9c74..d4252e3 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -245,14 +245,23 @@ endif
>  endif
>  
>  ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
> -# dtbs moved from arch/$ARCH/boot to arch/$ARCH/boot/dts since 3.8-rc1
> +# If we append and create the uImage, we want to be sure not to multiple-append on
> +# rebuilds, so use a temporary intermediate "zImage-dtb" and then append, but if we
> +# don't use the APPENDED_UIMAGE option, we need to be sure it stays named as zImage.
> +IMAGE_PLUS_DTB = zImage
> +ifeq ($(BR2_LINUX_KERNEL_APPENDED_UIMAGE),y)
> +	IMAGE_PLUS_DTB = zImage-dtb
>  define LINUX_APPEND_DTB
> +	cp $(KERNEL_ARCH_PATH)/boot/zImage $(KERNEL_ARCH_PATH)/boot/$(IMAGE_PLUS_DTB);
> +endef
> +endif
> +# dtbs moved from arch/$ARCH/boot to arch/$ARCH/boot/dts since 3.8-rc1
> +LINUX_APPEND_DTB += \
>  	if [ -e $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb ]; then \
>  		cat $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb; \
>  	else \
>  		cat $(KERNEL_ARCH_PATH)/boot/dts/$(KERNEL_DTS_NAME).dtb; \
> -	fi >> $(KERNEL_ARCH_PATH)/boot/zImage
> -endef
> +	fi >> $(KERNEL_ARCH_PATH)/boot/$(IMAGE_PLUS_DTB)
>  ifeq ($(BR2_LINUX_KERNEL_APPENDED_UIMAGE),y)
>  # We need to generate a new u-boot image that takes into
>  # account the extra-size added by the device tree at the end
> @@ -263,7 +272,7 @@ LINUX_APPEND_DTB += $(sep) MKIMAGE_ARGS=`$(MKIMAGE) -l $(LINUX_IMAGE_PATH) |\
>  	sed -n -e 's/Image Name:[ ]*\(.*\)/-n \1/p' -e 's/Load Address:/-a/p' -e 's/Entry Point:/-e/p'`; \
>  	$(MKIMAGE) -A $(MKIMAGE_ARCH) -O linux \
>  	-T kernel -C none $${MKIMAGE_ARGS} \
> -	-d $(KERNEL_ARCH_PATH)/boot/zImage $(LINUX_IMAGE_PATH);
> +	-d $(KERNEL_ARCH_PATH)/boot/$(IMAGE_PLUS_DTB) $(LINUX_IMAGE_PATH);
>  endif
>  endif

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
