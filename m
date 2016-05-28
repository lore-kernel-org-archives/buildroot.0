From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 May 2016 15:07:55 +0200
Subject: [Buildroot] [PATCH v3] uboot-tools: fix FIT support and make it
 optional
In-Reply-To: <1462736800-9552-2-git-send-email-casantos@datacom.ind.br>
References: <1462535953-4427-1-git-send-email-casantos@datacom.ind.br>
 <1462736800-9552-1-git-send-email-casantos@datacom.ind.br>
 <1462736800-9552-2-git-send-email-casantos@datacom.ind.br>
Message-ID: <20160528150755.78888529@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  8 May 2016 16:46:40 -0300, Carlos Santos wrote:
> Fix several issues regarding the support for Flat Image Trees (FIT).
> 
> - Add a dependence on the dtc utilities because mkimage needs it when
>   FIT is enabled; otherwise mkimage fails like this:
> 
>     $ mkimage -f firmware.its firmware.im
>     sh: dtc: command not found
> 
> - Turn FIT support an independent switch for host and target controlled
>   by BR2_PACKAGE_{HOST_,}UBOOT_TOOLS_FIT_SUPPORT
> 
> - Dettach FIT signature support from mkimage installation by means of a
>   BR2_PACKAGE_{HOST_,}UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT, subordinated to
>   ...TOOLS_FIT_SUPPORT.
> 
> - Improve the descriptions of the knobs to install mkimage, mkenvimage,
>   dumpimage, fw_printenv and fw_setenv.
> 
> - Use $(TARGET_STRIP) to control stripping of the target utilities,
>   otherwise they are always stripped.
> 
> - Add a patch to really allow turning FIT support on/off, which was not
>   possible due to bugs in the code and in the tools Makefile.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

I was about to apply this, but spotted a few minor issues. In addition,
another concern is that this patch is doing many different things.
Those things are related, but could be done in separate patches:

 1/ Pass TARGET_STRIP should be one patch

 2/ Improving the help text of existing options should be one patch

 3/ Improving FIT support for the host variant

 4/ Improving FIT support for the target variant


> +From 1c0040aeed5d4dc17a549ad8a1a1c3e889f74e98 Mon Sep 17 00:00:00 2001
> +From: Carlos Santos <casantos@datacom.ind.br>
> +Date: Sun, 8 May 2016 11:11:39 -0300
> +Subject: [PATCH 4/4] Make FIT support really optional

Please generate the patch with "git format-patch -N" so that there is
no "4/4" in the patch title.

> +Due to some mistakes in the source code, it was not possible to really
> +turn FIT support off. This commit fixes the problem by means of the
> +following changes:
> +
> +- Enclose "bootm_host_load_image" and "bootm_host_load_images" between
> +  checks for CONFIG_FIT_SIGNATURE, in common/bootm.c.
> +
> +- Enclose the declaration of "bootm_host_load_images" between checks for
> +  CONFIG_FIT_SIGNATURE, in common/bootm.h.
> +
> +- Condition the compilation and linking of fit_common.o fit_image.o
> +  image-host.o common/image-fit.o to CONFIG_FIT=y, in tools/Makefile.
> +
> +Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

Has this patch been submitted upstream?

> diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
> index aca310b..eddc39f 100644
> --- a/package/uboot-tools/Config.in
> +++ b/package/uboot-tools/Config.in
> @@ -7,15 +7,22 @@ config BR2_PACKAGE_UBOOT_TOOLS
>  
>  if BR2_PACKAGE_UBOOT_TOOLS
>  
> -config BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE
> -	bool "mkimage"
> +config BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT
> +	bool "Flattened Image Tree (FIT) support"
> +	select BR2_PACKAGE_DTC
> +	select BR2_PACKAGE_DTC_PROGRAMS
>  	help
> -	  The mkimage tool from Das U-Boot bootloader, which allows
> -	  generation of U-Boot images in various formats.
> +	  Enables support for Flattened Image Tree (FIT).
>  
> -if BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE
> +	  This option allows to boot the new uImage structrure,
> +	  Flattened Image Tree.  FIT is formally a FDT, which can include

Please, only one space after "." (fix globally).

> +	  images of various types (kernel, FDT blob, ramdisk, etc.)
> +	  in a single blob.  To boot this new uImage structure,
> +	  pass the address of the blob to the "bootm" command.
>  
> -config BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT

So essentially, this option gets renamed from
BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT to
BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT. You therefore need to
add BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT to the
Config.in.legacy file.

> +if BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT
> +
> +config BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT
>  	bool "FIT signature verification support"
>  	select BR2_PACKAGE_OPENSSL
>  	help
> @@ -38,25 +45,39 @@ config BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT
>  
>  endif
>  
> +config BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE
> +	bool "mkimage"
> +	help
> +	  Install the mkimage tool on the target system
> +
> +	  The mkimage tool from Das U-Boot bootloader, which allows
> +	  generation of U-Boot images in various formats.
> +
>  config BR2_PACKAGE_UBOOT_TOOLS_MKENVIMAGE
>  	bool "mkenvimage"
>  	help
> +	  Install the mkenvimage tool on the target system
> +
>  	  The mkenvimage tool from Das U-Boot bootloader, which allows
>  	  generation of a valid binary environment image from a text file
>  	  describing the key=value pairs of the environment.
>  
> +config BR2_PACKAGE_UBOOT_TOOLS_DUMPIMAGE
> +	bool "dumpimage"
> +	help
> +	  Install the dumpimage tool on the target system
> +
> +	  The dumpimage tool from Das U-Boot bootloader, which allows
> +	  extraction of data from U-Boot images.

It's not clear why this option is moved around. Any reason for this?

> +
>  config BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV
>  	bool "fw_printenv"
>  	default y
>  	help
> -	  The fw_printenv / fw_setenv tools from Das U-Boot
> +	  Install the fw_printenv / fw_setenv tools on the target system
> +
> +	  The fw_printenv and fw_setenv tools from Das U-Boot
>  	  bootloader, which allows access to the U-Boot environment
>  	  from Linux.
>  
> -config BR2_PACKAGE_UBOOT_TOOLS_DUMPIMAGE
> -	bool "dumpimage"
> -	help
> -	  The dumpimage tool from Das U-Boot bootloader, which allows
> -	  extraction of data from U-Boot images.
> -
>  endif
> diff --git a/package/uboot-tools/Config.in.host b/package/uboot-tools/Config.in.host
> index b5a42d9..292cc21 100644
> --- a/package/uboot-tools/Config.in.host
> +++ b/package/uboot-tools/Config.in.host
> @@ -7,6 +7,20 @@ config BR2_PACKAGE_HOST_UBOOT_TOOLS
>  
>  if BR2_PACKAGE_HOST_UBOOT_TOOLS
>  
> +config BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT
> +	bool "Flattened Image Tree (FIT) support"
> +	select BR2_PACKAGE_HOST_DTC
> +	help
> +	  Enables support for Flattened Image Tree (FIT).
> +
> +	  This option allows to boot the new uImage structrure,
> +	  Flattened Image Tree.  FIT is formally a FDT, which can include
> +	  images of various types (kernel, FDT blob, ramdisk, etc.)
> +	  in a single blob.  To boot this new uImage structure,
> +	  pass the address of the blob to the "bootm" command.
> +
> +if BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT
> +
>  config BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT
>  	bool "FIT signature verification support"
>  	help
> @@ -24,3 +38,5 @@ config BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT
>  	  be verified in this way.
>  
>  endif
> +
> +endif
> diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
> index d1ebd6f..a21cda5 100644
> --- a/package/uboot-tools/uboot-tools.mk
> +++ b/package/uboot-tools/uboot-tools.mk
> @@ -16,18 +16,30 @@ define UBOOT_TOOLS_CONFIGURE_CMDS
>  	touch $(@D)/include/config/auto.conf
>  endef
>  
> +ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),y)
> +UBOOT_TOOLS_CONFIG_FIT = CONFIG_FIT=$(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT)

I think we should instead have a UBOOT_TOOLS_MAKE_OPTS, and replace
this with:

	UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT=y

> +UBOOT_TOOLS_DEPENDENCIES += dtc
> +ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),y)
> +UBOOT_TOOLS_CONFIG_FIT_SIGNATURE = CONFIG_FIT_SIGNATURE=$(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT)

	UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT_SIGNATURE=y

> +UBOOT_TOOLS_DEPENDENCIES += openssl host-pkgconf
> +endif # BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT
> +endif # BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT
> +
>  define UBOOT_TOOLS_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) 	\
>  		CROSS_COMPILE="$(TARGET_CROSS)"	\
>  		CFLAGS="$(TARGET_CFLAGS)"	\
>  		LDFLAGS="$(TARGET_LDFLAGS)"	\
> +		STRIP=$(TARGET_STRIP)		\
>  		CROSS_BUILD_TOOLS=y		\
> -		CONFIG_FIT_SIGNATURE=$(BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT) \
> +		$(UBOOT_TOOLS_CONFIG_FIT)	\
> +		$(UBOOT_TOOLS_CONFIG_FIT_SIGNATURE) \

And here:

		$(UBOOT_TOOLS_MAKE_OPTS)

and you can probably move into UBOOT_TOOLS_MAKE_OPTS a few other
variables.

>  		tools-only
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) 	\
>  		CROSS_COMPILE="$(TARGET_CROSS)"	\
>  		CFLAGS="$(TARGET_CFLAGS)"	\
>  		LDFLAGS="$(TARGET_LDFLAGS)"	\
> +		STRIP=$(TARGET_STRIP)		\
>  		env no-dot-config-targets=env
>  endef
>  
> @@ -35,10 +47,7 @@ ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE),y)
>  define UBOOT_TOOLS_INSTALL_MKIMAGE
>  	$(INSTALL) -m 0755 -D $(@D)/tools/mkimage $(TARGET_DIR)/usr/bin/mkimage
>  endef
> -ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT),y)
> -UBOOT_TOOLS_DEPENDENCIES += openssl host-pkgconf
> -endif # BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT
> -endif # BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE
> +endif
>  
>  ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_MKENVIMAGE),y)
>  define UBOOT_TOOLS_INSTALL_MKENVIMAGE
> @@ -74,18 +83,24 @@ define UBOOT_TOOLS_INSTALL_TARGET_CMDS
>  	$(UBOOT_TOOLS_INSTALL_DUMPIMAGE)
>  endef
>  
> -ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),y)
> -HOST_UBOOT_TOOLS_DEPENDENCIES += host-openssl
> -endif
> -
>  define HOST_UBOOT_TOOLS_CONFIGURE_CMDS
>  	mkdir -p $(@D)/include/config
>  	touch $(@D)/include/config/auto.conf
>  endef
>  
> +ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),y)
> +HOST_UBOOT_TOOLS_CONFIG_FIT = CONFIG_FIT=$(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT)
> +HOST_UBOOT_TOOLS_DEPENDENCIES += host-dtc
> +ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),y)
> +HOST_UBOOT_TOOLS_CONFIG_FIT_SIGNATURE = CONFIG_FIT_SIGNATURE=$(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT)
> +HOST_UBOOT_TOOLS_DEPENDENCIES += host-openssl
> +endif # BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT
> +endif # BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT

Ditto here.

> +
>  define HOST_UBOOT_TOOLS_BUILD_CMDS
>  	$(MAKE1) -C $(@D) 			\
> -		CONFIG_FIT_SIGNATURE=$(BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT) \
> +		$(HOST_UBOOT_TOOLS_CONFIG_FIT)	\
> +		$(HOST_UBOOT_TOOLS_CONFIG_FIT_SIGNATURE) \
>  		HOSTCC="$(HOSTCC)"		\
>  		HOSTCFLAGS="$(HOST_CFLAGS)"	\
>  		HOSTLDFLAGS="$(HOST_LDFLAGS)"	\

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
