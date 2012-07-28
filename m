From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 28 Jul 2012 16:49:34 +0200
Subject: [Buildroot] [PATCH 4/6] Add support for appended device tree
 blobs for arm
In-Reply-To: <1342528042-10038-5-git-send-email-maxime.ripard@free-electrons.com>
References: <1342528042-10038-1-git-send-email-maxime.ripard@free-electrons.com>
 <1342528042-10038-5-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <5013FBFE.5030702@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/17/12 14:27, Maxime Ripard wrote:
[snip]
> @@ -198,6 +200,13 @@ config BR2_LINUX_KERNEL_UIMAGE
>   	depends on BR2_arm || BR2_armeb || BR2_bfin || BR2_powerpc || BR2_avr32 || BR2_sh || BR2_sh64
>   	select BR2_LINUX_KERNEL_UBOOT_IMAGE
>
> +config BR2_LINUX_KERNEL_APPENDED_UIMAGE
> +	bool "uImage with appended DT"
> +	depends on BR2_arm || BR2_armeb
> +	select BR2_LINUX_KERNEL_DTS_SUPPORT

  Given that this option will automatically select DTS support,
I'd prefer to see the DTS menu options later, so after the image
names.  Otherwise, when you select this in menuconfig (and DTS
was not selected yet), it will suddenly move down because of the
new options that appear.  So this actually affects patch 2/6.


> +	select BR2_LINUX_KERNEL_APPENDED_DTB
> +	select BR2_LINUX_KERNEL_UBOOT_IMAGE
> +
>   config BR2_LINUX_KERNEL_BZIMAGE
>   	bool "bzImage"
>   	depends on BR2_i386 || BR2_x86_64
[snip]
> @@ -66,10 +73,14 @@ LINUX_IMAGE_NAME=vmImage
>   else
>   LINUX_IMAGE_NAME=uImage
>   endif
> +else ifeq ($(BR2_LINUX_KERNEL_APPENDED_UIMAGE),y)
> +LINUX_IMAGE_NAME=uImage
>   else ifeq ($(BR2_LINUX_KERNEL_BZIMAGE),y)
>   LINUX_IMAGE_NAME=bzImage
>   else ifeq ($(BR2_LINUX_KERNEL_ZIMAGE),y)
>   LINUX_IMAGE_NAME=zImage
> +else ifeq ($(BR2_LINUX_KERNEL_APPENDED_ZIMAGE),y)
> +LINUX_IMAGE_NAME=zImage
>   else ifeq ($(BR2_LINUX_KERNEL_VMLINUX_BIN),y)
>   LINUX_IMAGE_NAME=vmlinux.bin
>   else ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)

  I think this whole blob should move to Config.in, like we
do it for many other strings...  But that's of course unrelated
to this patch.

[snip]
> +ifeq ($(BR2_LINUX_KERNEL_APPENDED_UIMAGE),y)
> +define LINUX_APPEND_DTB
> +	cat $(KERNEL_ARCH_PATH)/boot/zImage $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb>  $(KERNEL_ARCH_PATH)/boot/zImage_dtb
> +	mv $(KERNEL_ARCH_PATH)/boot/zImage_dtb $(KERNEL_ARCH_PATH)/boot/zImage
> +	# We need to generate a new u-boot image that takes into
> +	# account the extra-size added by the device tree at the end
> +	# of the image. To do so, we first need to retrieve both load
> +	# address and entry point for the kernel from the already
> +	# generate uboot image before using mkimage -l.
> +	LOAD=`$(MKIMAGE) -l $(LINUX_IMAGE_PATH) | sed -n 's/Load Address: \([0-9]*\)/\1/p'`; \
> +	ENTRY=`$(MKIMAGE) -l $(LINUX_IMAGE_PATH) | sed -n 's/Entry Point: \([0-9]*\)/\1/p'`; \
> +	$(MKIMAGE) -A $(KERNEL_ARCH) -O linux -T kernel -C none -a $${LOAD} -e $${ENTRY} -n 'Linux Buildroot' \
> +		-d $(KERNEL_ARCH_PATH)/boot/zImage $(KERNEL_ARCH_PATH)/boot/$(LINUX_IMAGE_NAME)

  MKIMAGE isn't defined anywhere, so I wonder how it can work for you...
But anyway, with the amendment you posted later this shouldn't be an issue
anymore.

> +endef
> +else ifeq ($(BR2_LINUX_KERNEL_APPENDED_ZIMAGE),y)
> +define LINUX_APPEND_DTB
> +	cat $(KERNEL_ARCH_PATH)/boot/zImage $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb>  $(KERNEL_ARCH_PATH)/boot/zImage_dtb
> +	mv $(KERNEL_ARCH_PATH)/boot/zImage_dtb $(KERNEL_ARCH_PATH)/boot/zImage
> +endef
> +endif

  Does this work?

ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
define LINUX_APPEND_DTB
	cat ...
ifeq ($(BR2_LINUX_KERNEL_APPENDED_UIMAGE),y)
	$(MAKE) ... uImage
endif
endef
endif

(I'm not sure if you can still use an ifeq inside a define.)


  Regards,
  Arnout

[snip]

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
