From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Feb 2014 22:58:29 +0100
Subject: [Buildroot] [PATCH v2] uboot-tools: Allow users to use uboot's
 sources
In-Reply-To: <1391385955-13166-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1391385955-13166-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20140203225829.67dae85b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Mon,  3 Feb 2014 01:05:55 +0100, Maxime Hadjinlian wrote:

> diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
> index 7c8f17c..29580dd 100644
> --- a/package/uboot-tools/Config.in
> +++ b/package/uboot-tools/Config.in
> @@ -7,6 +7,24 @@ config BR2_PACKAGE_UBOOT_TOOLS
>  
>  if BR2_PACKAGE_UBOOT_TOOLS
>  
> +if BR2_TARGET_UBOOT
> +
> +choice
> +	prompt "version"
> +	default BR2_PACKAGE_UBOOT_TOOLS_LATEST_VERSION
> +	help
> +	  Select the specific uboot-tools version you want to use
> +
> +config BR2_PACKAGE_UBOOT_TOOLS_LATEST_VERSION
> +	bool "Use latest upstream version"
> +
> +config BR2_PACKAGE_UBOOT_TOOLS_USE_UBOOT_VERSION
> +	bool "Use the same version as the uboot package"

Shouldn't this option only be available if the U-Boot package has been
enabled in the configuration?

> +ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_USE_UBOOT_VERSION),y)
> +# We have to use the BR2_TARGET_UBOOT_VERSION because of the order of inclusion
> +# of the mk files.
> +UBOOT_TOOLS_VERSION = $(call qstrip,$(BR2_TARGET_UBOOT_VERSION))

That's more of a question for Arnout, but does the order of .mk files
inclusion matter since we're using '=' and not ':=' ?

> +UBOOT_TOOLS_SOURCE = $(UBOOT_SOURCE)
> +UBOOT_TOOLS_SITE = $(UBOOT_SITE)
> +ifneq ($(UBOOT_SITE_METHOD),)
> +UBOOT_TOOL_SITE_METHOD = $(UBOOT_SITE_METHOD)
> +endif
> +UBOOT_TOOLS_LICENSE = $(UBOOT_LICENSE)
> +UBOOT_TOOLS_LICENSE_FILES = $(UBOOT_LICENSE_FILES)
> +else
>  UBOOT_TOOLS_VERSION = 2014.01
> -UBOOT_TOOLS_SOURCE  = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
> -UBOOT_TOOLS_SITE    = ftp://ftp.denx.de/pub/u-boot
> +UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
> +UBOOT_TOOLS_SITE = ftp://ftp.denx.de/pub/u-boot
>  UBOOT_TOOLS_LICENSE = GPLv2+
>  UBOOT_TOOLS_LICENSE_FILES = Licenses/gpl-2.0.txt
> +endif
>  
>  define UBOOT_TOOLS_BUILD_CMDS
>  	$(MAKE) -C $(@D) 			\

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
