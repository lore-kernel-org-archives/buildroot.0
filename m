From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 May 2016 15:25:39 +0200
Subject: [Buildroot] [PATCH v2 1/1] uboot-tools: add missing dependency
 on host-dtc for the host package
In-Reply-To: <1462535953-4427-1-git-send-email-casantos@datacom.ind.br>
References: <1462372709-24828-1-git-send-email-casantos@datacom.ind.br>
 <1462535953-4427-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <20160506152539.121b536c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  6 May 2016 08:59:13 -0300, Carlos Santos wrote:
> The mkimage utility needs dtc when support for Flat Image Trees (FIT)
> is enabled. If dtc is not available mkimage may fail. Example:
> 
>     $ mkimage -f firmware.its firmware.im
>     sh: dtc: command not found
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

Thanks for this new version. Unfortunately, this patch is incorrect, as
it badly mixes things for the target version of uboot-tools with things
for the host version of uboot-tools.

> -if BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE

Please keep this "if BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE" rather than using
a depends on.

> +config BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SUPPORT

This option affects the *target* version of uboot-tools.

> +	bool "Flat Image Trees (FIT) support"
> +	depends on BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE
> +	select BR2_PACKAGE_HOST_DTC

So selecting host-dtc here doesn't make any sense (unless you need
host-dtc to *build* uboot-tools for the target, but my understand is
that what you need is dtc on the target!).

> +	help
> +	  Enables support for FIT Signature Verification.
> +
> +	  This option allows to boot the new uImage structrure,
> +	  Flattened Image Tree.  FIT is formally a FDT, which can include
> +	  images of various types (kernel, FDT blob, ramdisk, etc.)
> +	  in a single blob.  To boot this new uImage structure,
> +	  pass the address of the blob to the "bootm" command.
>  
>  config BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT
>  	bool "FIT signature verification support"
> +	depends on BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SUPPORT
>  	select BR2_PACKAGE_OPENSSL
>  	help
>  	  Enables support for FIT Signature Verification.
> @@ -36,8 +48,6 @@ config BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT
>  	  libcrypto, and possibly GPL/OpenSSL licensing
>  	  incompatibility issues.
>  
> -endif
> -
>  config BR2_PACKAGE_UBOOT_TOOLS_MKENVIMAGE
>  	bool "mkenvimage"
>  	help
> diff --git a/package/uboot-tools/Config.in.host b/package/uboot-tools/Config.in.host
> index b5a42d9..5c44eaf 100644
> --- a/package/uboot-tools/Config.in.host
> +++ b/package/uboot-tools/Config.in.host
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_HOST_UBOOT_TOOLS
>  	bool "host u-boot tools"
> +	select BR2_PACKAGE_HOST_DTC

So this has not changed since v1, and was specifically the problem that
we discussed.

>  	help
>  	  Companion tools for Das U-Boot bootloader.
>  
> diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
> index f47b3db..9bb2b54 100644
> --- a/package/uboot-tools/uboot-tools.mk
> +++ b/package/uboot-tools/uboot-tools.mk
> @@ -65,6 +65,10 @@ define UBOOT_TOOLS_INSTALL_TARGET_CMDS
>  	$(UBOOT_TOOLS_INSTALL_DUMPIMAGE)
>  endef
>  
> +ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),y)
> +HOST_UBOOT_TOOLS_DEPENDENCIES += host-dtc

Option BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT does not exist, so this
piece of code is useless.

> +endif
> +
>  ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),y)
>  HOST_UBOOT_TOOLS_DEPENDENCIES += host-openssl
>  endif
> @@ -76,6 +80,7 @@ endef
>  
>  define HOST_UBOOT_TOOLS_BUILD_CMDS
>  	$(MAKE1) -C $(@D) 			\
> +		CONFIG_FIT=$(BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SUPPORT) \

And here you're using a target option
(BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SUPPORT) to configure the build of
the host version of uboot-tools.

Note that there is already something wrong in the package:

define HOST_UBOOT_TOOLS_BUILD_CMDS
        $(MAKE1) -C $(@D)                       \
                CONFIG_FIT_SIGNATURE=$(BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT) \

should be:

define HOST_UBOOT_TOOLS_BUILD_CMDS
        $(MAKE1) -C $(@D)                       \
                CONFIG_FIT_SIGNATURE=$(BR2_PACKAGE_HOST_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT) \

What you want to do is:

 *) One patch that fixes the existing bug in uboot-tools.mk that I
    mentioned.

 *) One patch that adds an option
    BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT, which will 1/ add host-dtc
    to HOST_UBOOT_TOOLS_DEPENDENCIES and 2/ pass
    CONFIG_FIT=$(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT) in
    HOST_UBOOT_TOOLS_BUILD_CMDS. This will solve the problem for the
    host version of uboot-tools.

 *) One patch that adds an option BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT,
    which will 1/ add dtc to UBOOT_TOOLS_DEPENDENCIES and 2/ pass
    CONFIG_FIT=$(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT)  in
    UBOOT_TOOLS_BUILD_CMDS. This will solve the problem for the target
    version of uboot-tools.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
