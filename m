From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 12 Feb 2014 20:03:51 +0100
Subject: [Buildroot] [PATCH V4 2/2] i.MX: Update versions to match
 latest Freescale release
In-Reply-To: <1381287931-7070-3-git-send-email-eric.nelson@boundarydevices.com>
References: <1381287931-7070-1-git-send-email-eric.nelson@boundarydevices.com>
 <1381287931-7070-3-git-send-email-eric.nelson@boundarydevices.com>
Message-ID: <20140212190351.GD17804@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric, All,

A (hopefully!) better review this time...

On 2013-10-08 20:05 -0700, Eric Nelson spake thusly:
> Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
[--SNIP--]
> diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
> index 8e979ee..e799fd2 100644
> --- a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
> +++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
> @@ -4,7 +4,11 @@
>  #
>  ################################################################################
>  
> -GPU_VIV_BIN_MX6Q_VERSION = $(FREESCALE_IMX_VERSION)
> +ifeq ($(BR2_ARM_EABIHF),y)
> +GPU_VIV_BIN_MX6Q_VERSION = $(FREESCALE_IMX_VERSION)-hfp
> +else
> +GPU_VIV_BIN_MX6Q_VERSION = $(FREESCALE_IMX_VERSION)-sfp
> +endif
>  GPU_VIV_BIN_MX6Q_SITE    = $(FREESCALE_IMX_SITE)
>  GPU_VIV_BIN_MX6Q_SOURCE  = gpu-viv-bin-mx6q-$(GPU_VIV_BIN_MX6Q_VERSION).bin

I think we should make the source conditional on BR2_ARM_EABIHF, not the
version:

    GPU_VIV_BIN_MX6Q_VERSION = $(FREESCALE_IMX_VERSION)
    ifeq ($(BR2_ARM_EABIHF),y)
    GPU_VIV_BIN_MX6Q_SOURCE  = gpu-viv-bin-mx6q-$(GPU_VIV_BIN_MX6Q_VERSION)-hfp.bin
    else
    GPU_VIV_BIN_MX6Q_SOURCE  = gpu-viv-bin-mx6q-$(GPU_VIV_BIN_MX6Q_VERSION)-sfp.bin
    endif

> diff --git a/package/freescale-imx/imx-lib/imx-lib.mk b/package/freescale-imx/imx-lib/imx-lib.mk
> index e1a68ef..2edfc06 100644
> --- a/package/freescale-imx/imx-lib/imx-lib.mk
> +++ b/package/freescale-imx/imx-lib/imx-lib.mk
> @@ -6,8 +6,9 @@
>  
>  IMX_LIB_VERSION = $(FREESCALE_IMX_VERSION)
>  IMX_LIB_SITE    = $(FREESCALE_IMX_SITE)
> -IMX_LIB_LICENSE = LGPLv2.1+
> -# No license file included
> +IMX_LIB_LICENSE = IMX_LIB_LICENSE = Freescale Semiconductor Software License Agreement (vpu), LGPLv2.1+ (the rest)

Double IMX_LIB_LICENSE there.

This is a rather long license name. What about:

    IMX_LIB_LICENSE = Freescale License (vpu), LGPLv2.1+ (the rest)

> +IMX_LIB_LICENSE_FILES = EULA
> +IMX_LIB_SOURCE = imx-lib-$(IMX_LIB_VERSION).bin
>  
>  IMX_LIB_INSTALL_STAGING = YES
>  
> @@ -25,6 +26,23 @@ IMX_LIB_MAKE_ENV = \
>  	PLATFORM=$(BR2_PACKAGE_IMX_LIB_PLATFORM) \
>  	INCLUDE="$(IMX_LIB_INCLUDE)"
>  
> +# The archive is a shell-self-extractor of a bzipped tar. It happens
> +# to extract in the correct directory (imx-lib-x.y.z)
> +# The --force makes sure it doesn't fail if the source dir already exists.
> +# The --auto-accept skips the license check - not needed for us
> +# because we have legal-info
> +# Since there's a EULA in the bin file, extract it to imx-lib-x.y.z/EULA
> +#
> +define IMX_LIB_EXTRACT_CMDS
> +	awk 'BEGIN      { start=0; } \
> +	     /^EOEULA/  { start = 0; } \
> +	                { if (start) print; } \
> +	     /<<EOEULA/ { start=1; }'\
> +	    $(DL_DIR)/$(IMX_LIB_SOURCE) > $(@D)/EULA
> +	cd $(BUILD_DIR); \
> +	sh $(DL_DIR)/$(IMX_LIB_SOURCE) --force --auto-accept
> +endef

    $ make imx-lib-extract
    [...]
    Unpacking file mkdir: cannot create directory ?imx-lib-3.5.7-1.0.0?:
    File exists

This is only a warning, but still: maybe extract the EULA _after_
unpacking the archive?

> diff --git a/package/libfslparser/libfslparser.mk b/package/libfslparser/libfslparser.mk
> index 3aab3a7..d49c95c 100644
> --- a/package/libfslparser/libfslparser.mk
> +++ b/package/libfslparser/libfslparser.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBFSLPARSER_VERSION = 3.0.1
> +LIBFSLPARSER_VERSION = $(FREESCALE_IMX_VERSION)
>  LIBFSLPARSER_SITE = $(FREESCALE_IMX_SITE)
>  LIBFSLPARSER_SOURCE = libfslparser-$(LIBFSLPARSER_VERSION).bin
>  LIBFSLPARSER_LICENSE = Freescale Semiconductor Software License Agreement
> @@ -36,4 +36,9 @@ endef
>  # The Makefile installs several versions of the libraries, but we only
>  # need one of them, depending on the platform.
>  
> +#
> +# without AUTORECONF, configure fails to find install-sh.
> +#

No need for leading/trailing comment lines, just the line with the
actual comment.

> diff --git a/package/libfslvpuwrap/libfslvpuwrap.mk b/package/libfslvpuwrap/libfslvpuwrap.mk
> index 346a20a..e93d761 100644
> --- a/package/libfslvpuwrap/libfslvpuwrap.mk
> +++ b/package/libfslvpuwrap/libfslvpuwrap.mk
> @@ -4,14 +4,32 @@
>  #
>  ################################################################################
>  
> -LIBFSLVPUWRAP_VERSION = 1.0.17
> +LIBFSLVPUWRAP_VERSION = $(FREESCALE_IMX_VERSION)
>  LIBFSLVPUWRAP_SITE = $(FREESCALE_IMX_SITE)
> +LIBFSLVPUWRAP_SOURCE = libfslvpuwrap-$(LIBFSLVPUWRAP_VERSION).bin
>  LIBFSLVPUWRAP_LICENSE = Freescale Semiconductor Software License Agreement
> -LIBFSLVPUWRAP_LICENSE_FILES = EULA.txt
> +LIBFSLVPUWRAP_LICENSE_FILES = EULA EULA.txt

A comment that both EULA are not the same would be nice:

    # The contents of those two EULA are not the same:
    LIBFSLVPUWRAP_LICENSE_FILES = EULA EULA.txt

>  LIBFSLVPUWRAP_REDISTRIBUTE = NO
>  
>  LIBFSLVPUWRAP_INSTALL_STAGING = YES
>  
>  LIBFSLVPUWRAP_DEPENDENCIES += imx-lib
>  
> +# The archive is a shell-self-extractor of a bzipped tar. It happens
> +# to extract in the correct directory (libfslvpuwrap-x.y.z)
> +# The --force makes sure it doesn't fail if the source dir already exists.
> +# The --auto-accept skips the license check - not needed for us
> +# because we have legal-info
> +# Since the EULA in the bin file differs from the one in the tar file,
> +# extract the one from the bin file as well.
> +define LIBFSLVPUWRAP_EXTRACT_CMDS
> +	awk 'BEGIN      { start=0; } \
> +	     /^EOEULA/  { start = 0; } \
> +	                { if (start) print; } \
> +	     /<<EOEULA/ { start=1; }'\
> +	    $(DL_DIR)/$(LIBFSLVPUWRAP_SOURCE) > $(@D)/EULA
> +	cd $(BUILD_DIR); \
> +	sh $(DL_DIR)/$(LIBFSLVPUWRAP_SOURCE) --force --auto-accept
> +endef

Ditto the mkdir warning.
Ditto extract EULA after unpacking the archive.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
