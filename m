From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 27 Mar 2017 14:12:05 +0200
Subject: [Buildroot] [PATCH] Add out-of-source U-Boot device tree support
In-Reply-To: <1490595146-5638-1-git-send-email-james@balean.com.au>
References: <1490595146-5638-1-git-send-email-james@balean.com.au>
Message-ID: <07d14184-7b9c-dd29-569c-db46aa765118@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27-03-17 08:12, James Balean wrote:
> Similaly to Linux, this patch adds the ability to copy in and build
> out-of-source device tree sources during a U-Boot build.
> 
> Signed-off-by: James Balean <james@balean.com.au>
> ---
>  boot/uboot/Config.in | 7 +++++++
>  boot/uboot/uboot.mk  | 3 +++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index c33861b..b60541e 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -407,4 +407,11 @@ config BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT
>  
>  endif # BR2_TARGET_UBOOT_ENVIMAGE
>  
> +config BR2_TARGET_UBOOT_CUSTOM_DTS_PATH
> +	string "Device Tree Source file paths"

 Would it make sense to add
	default BR2_LINUX_KERNEL_CUSTOM_DTS_PATH if BR2_LINUX_KERNEL_USE_CUSTOM_DTS
?

 Perhaps also
	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
(AFAIK it's not possible to link in a DTB in the legacy build system.)

> +	help
> +		Path to the device tree source files. You can
> +		provide a list of dts paths to copy,
> +		separated by spaces.

 Indentation should be 1 tab + 2 spaces, and wrap at 72 columns (where tab
counts as 8, so 62 significant characters).

 Perhaps you can add

	  To use this device tree source file, the U-Boot configuration
	  file must refer to it.


 Regards,
 Arnout

> +
>  endif # BR2_TARGET_UBOOT
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 1e22eaa..6104b7d 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -195,6 +195,9 @@ endef
>  endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
>  
>  define UBOOT_BUILD_CMDS
> +	$(if $(BR2_TARGET_UBOOT_CUSTOM_DTS_PATH),
> +		cp -f $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_DTS_PATH)) $(@D)/arch/$(UBOOT_ARCH)/dts/
> +	)
>  	$(TARGET_CONFIGURE_OPTS) 	\
>  		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) 		\
>  		$(UBOOT_MAKE_TARGET)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
