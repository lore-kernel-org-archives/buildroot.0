From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 May 2019 22:52:11 +0200
Subject: [Buildroot] [PATCH V2 4/9] package/binutils: Add C-SKY support
In-Reply-To: <1557305915-11247-4-git-send-email-guoren@kernel.org>
References: <1557305915-11247-1-git-send-email-guoren@kernel.org>
 <1557305915-11247-4-git-send-email-guoren@kernel.org>
Message-ID: <20190526225211.439a62d0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  8 May 2019 16:58:30 +0800
guoren at kernel.org wrote:

> +if !BR2_csky
>  choice
>  	prompt "Binutils Version"
>  	default BR2_BINUTILS_VERSION_2_31_X if !BR2_arc
> @@ -32,6 +33,7 @@ config BR2_BINUTILS_VERSION
>  	default "2.30"		if BR2_BINUTILS_VERSION_2_30_X
>  	default "2.31.1"	if BR2_BINUTILS_VERSION_2_31_X
>  	default "2.32"		if BR2_BINUTILS_VERSION_2_32_X
> +endif

Let's do it like we do for the ARC architecture: add an option, and the
proper depends on. I.e:

choice
        prompt "Binutils Version"
        default BR2_BINUTILS_VERSION_ARC if BR2_arc
	default BR2_BINUTILS_VERSION_CSKY if BR2_csky
        default BR2_BINUTILS_VERSION_2_31_X
        help
          Select the version of binutils you wish to use.

config BR2_BINUTILS_VERSION_2_30_X
        bool "binutils 2.30"
	depends on !BR2_csky

config BR2_BINUTILS_VERSION_2_31_X
        bool "binutils 2.31.1"
	depends on !BR2_csky

config BR2_BINUTILS_VERSION_2_32_X
        bool "binutils 2.32"
	depends on !BR2_csky

config BR2_BINUTILS_VERSION_ARC
        bool "binutils arc (2.31)"
        depends on BR2_arc

config BR2_BINUTILS_VERSION_CSKY
        bool "binutils csky (2.32)"
        depends on BR2_csky

endchoice

config BR2_BINUTILS_VERSION
        string
	default "c66d8bbcebfddf713b2b436e1b135e6b125a55a5" if BR2_BINUTILS_VERSION_CSKY
        default "arc-2019.03-rc1"       if BR2_BINUTILS_VERSION_ARC
        default "2.30"          if BR2_BINUTILS_VERSION_2_30_X
        default "2.31.1"        if BR2_BINUTILS_VERSION_2_31_X
        default "2.32"          if BR2_BINUTILS_VERSION_2_32_X


> diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
> index c70ba13..cebfd06 100644
> --- a/package/binutils/binutils.mk
> +++ b/package/binutils/binutils.mk
> @@ -20,6 +20,14 @@ BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,
>  BINUTILS_SOURCE = binutils-gdb-$(BINUTILS_VERSION).tar.gz
>  BINUTILS_FROM_GIT = y
>  endif
> +
> +ifeq ($(BR2_csky),y)
> +BINUTILS_VERSION = c66d8bbcebfddf713b2b436e1b135e6b125a55a5
> +BINUTILS_SITE = $(call github,c-sky,binutils-gdb,$(BINUTILS_VERSION))
> +BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz
> +BINUTILS_FROM_GIT = y
> +endif

Same here, please follow the same logic as the one used for ARC, for
consistency, i.e:

# Version is set when using buildroot toolchain.
# If not, we do like other packages
BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
ifeq ($(BINUTILS_VERSION),)
ifeq ($(BR2_arc),y)
BINUTILS_VERSION = arc-2019.03-rc1
else ifeq ($(BR2_csky),y)
BINUTILS_VERSION = c66d8bbcebfddf713b2b436e1b135e6b125a55a5
else
BINUTILS_VERSION = 2.31.1
endif
endif # BINUTILS_VERSION

ifeq ($(BINUTILS_VERSION),arc-2019.03-rc1)
BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(BINUTILS_VERSION))
BINUTILS_SOURCE = binutils-gdb-$(BINUTILS_VERSION).tar.gz
BINUTILS_FROM_GIT = y
else ifeq ($(BINUTILS_VERSION),c66d8bbcebfddf713b2b436e1b135e6b125a55a5)
BINUTILS_SITE = $(call github,c-sky,binutils-gdb,$(BINUTILS_VERSION))
BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz
BINUTILS_FROM_GIT = y
endif

What we're doing for ARC is made not the best, but being consistent in
how different architectures do it is much more important.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
