From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 08:56:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: bump to version
 2015.01
In-Reply-To: <1423839579-10086-1-git-send-email-joerg.krause@embedded.rocks>
References: <1423839579-10086-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150214085640.7c622a16@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Fri, 13 Feb 2015 15:59:39 +0100, J?rg Krause wrote:
> Bump to version 2015.01:
>   * Enable optional support for FIT Signature Verification
>   * Remove patch 0002-nostrip, it's upstream
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Thanks, it looks better now that things are optional.


> +This indirectly pulls in a build-dependency on libssl-dev used for FIT
> +image support, and possibly GPL/OpenSSL licensing incompatibility
> +issues.

Maybe this is worth mentioning in the Config.in help text, at least of
the target u-boot tools option.

> diff --git a/package/uboot-tools/Config.in.host b/package/uboot-tools/Config.in.host
> index 7a844e9..7388332 100644
> --- a/package/uboot-tools/Config.in.host
> +++ b/package/uboot-tools/Config.in.host
> @@ -4,3 +4,21 @@ config BR2_PACKAGE_HOST_UBOOT_TOOLS
>  	  Companion tools for Das U-Boot bootloader.
>  
>  	  http://www.denx.de/wiki/U-Boot/WebHome
> +
> +if BR2_PACKAGE_HOST_UBOOT_TOOLS
> +config BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT
> +	bool "FIT signature verification support"
> +	select BR2_PACKAGE_OPENSSL

No: doesn't make sense. Why would a host package select the target
OpenSSL package?

> +ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT),y)
> +UBOOT_TOOLS_DEPENDENCIES = openssl
> +FIT_SIGNATURE_SUPPORT=y

This variable name is not good. Remember that the namespace of
variables is global, so all variables in a package should be prefixed
by the package name. I.e, please use:

UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT=y. But one may wonder why this
variable is necessary in the first place. What about simply doing:

	CONFIG_FIT_SIGNATURE=$(BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT)

in the BUILD_CMDS ?

> +ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),y)
> +HOST_UBOOT_TOOLS_DEPENDENCIES = openssl

No. openssl is the target openssl. You need to build host-openssl here.

> +FIT_SIGNATURE_SUPPORT=y

Same comment as before.

> +endif
> +
> +define HOST_UBOOT_TOOLS_CONFIGURE_CMDS
> +	mkdir -p $(@D)/include/config
> +	touch $(@D)/include/config/auto.conf
> +endef
> +
>  define HOST_UBOOT_TOOLS_BUILD_CMDS
>  	$(MAKE1) -C $(@D) 			\
> +		-e CONFIG_FIT_SIGNATURE=$(FIT_SIGNATURE_SUPPORT) \

Why do you need -e here and not for the target variant? I believe this
is probably not needed.

Thanks for working on this!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
