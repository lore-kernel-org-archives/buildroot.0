From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 13 Jun 2014 18:14:54 +0200
Subject: [Buildroot] [PATCH] freescale-imx: bump version to 3.10.17-1.0.0
In-Reply-To: <1402615435-21137-1-git-send-email-bisson.gary@gmail.com>
References: <1402615435-21137-1-git-send-email-bisson.gary@gmail.com>
Message-ID: <20140613161454.GA3496@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2014-06-12 16:23 -0700, Gary Bisson spake thusly:
> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>

NAK.

With 3.10.17, imx-lib no longer bundles the VPU code, which is now
provided in a separate package, imx-vpu.

See chapter "Version by SoC Hierarchy" from:
    https://freescale.github.io/doc/release-notes/1.6/

So, bumping to 3.10.17 would need adding the imx-vpu package first.

Then, libfslvpuwrap should be made dependent on imx-vpu instead of
imx-lib, obviously. To be noted, the version of libfslvpuwrap will not
be aligned to the other imx components.

Regards,
Yann E. MORIN.

> ---
>  package/freescale-imx/freescale-imx.mk   |  2 +-
>  package/freescale-imx/imx-lib/imx-lib.mk | 24 ++++--------------------
>  2 files changed, 5 insertions(+), 21 deletions(-)
> 
> diff --git a/package/freescale-imx/freescale-imx.mk b/package/freescale-imx/freescale-imx.mk
> index 39ffa8a..843ba61 100644
> --- a/package/freescale-imx/freescale-imx.mk
> +++ b/package/freescale-imx/freescale-imx.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FREESCALE_IMX_VERSION = 3.5.7-1.0.0
> +FREESCALE_IMX_VERSION = 3.10.17-1.0.0
>  FREESCALE_IMX_SITE    = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/
>  
>  include $(sort $(wildcard package/freescale-imx/*/*.mk))
> diff --git a/package/freescale-imx/imx-lib/imx-lib.mk b/package/freescale-imx/imx-lib/imx-lib.mk
> index 4f605d7..1db01c9 100644
> --- a/package/freescale-imx/imx-lib/imx-lib.mk
> +++ b/package/freescale-imx/imx-lib/imx-lib.mk
> @@ -8,16 +8,17 @@ IMX_LIB_VERSION = $(FREESCALE_IMX_VERSION)
>  IMX_LIB_SITE    = $(FREESCALE_IMX_SITE)
>  IMX_LIB_LICENSE = Freescale License (vpu), LGPLv2.1+ (the rest)
>  IMX_LIB_LICENSE_FILES = EULA
> -IMX_LIB_SOURCE = imx-lib-$(IMX_LIB_VERSION).bin
> +IMX_LIB_SOURCE = imx-lib-$(IMX_LIB_VERSION).tar.gz
>  
>  IMX_LIB_INSTALL_STAGING = YES
>  
>  # imx-lib needs access to imx-specific kernel headers
>  IMX_LIB_DEPENDENCIES += linux
>  IMX_LIB_INCLUDE = \
> +	-I$(LINUX_DIR)/include/uapi \
> +	-I$(LINUX_DIR)/include \
>  	-I$(LINUX_DIR)/drivers/mxc/security/rng/include \
> -	-I$(LINUX_DIR)/drivers/mxc/security/sahara2/include \
> -	-idirafter $(LINUX_DIR)/include
> +	-I$(LINUX_DIR)/drivers/mxc/security/sahara2/include
>  
>  IMX_LIB_MAKE_ENV = \
>  	$(TARGET_MAKE_ENV) \
> @@ -26,23 +27,6 @@ IMX_LIB_MAKE_ENV = \
>  	PLATFORM=$(BR2_PACKAGE_IMX_LIB_PLATFORM) \
>  	INCLUDE="$(IMX_LIB_INCLUDE)"
>  
> -# The archive is a shell-self-extractor of a bzipped tar. It happens
> -# to extract in the correct directory (imx-lib-x.y.z)
> -# The --force makes sure it doesn't fail if the source dir already exists.
> -# The --auto-accept skips the license check - not needed for us
> -# because we have legal-info
> -# Since there's a EULA in the bin file, extract it to imx-lib-x.y.z/EULA
> -#
> -define IMX_LIB_EXTRACT_CMDS
> -	awk 'BEGIN      { start=0; } \
> -	     /^EOEULA/  { start = 0; } \
> -	                { if (start) print; } \
> -	     /<<EOEULA/ { start=1; }'\
> -	    $(DL_DIR)/$(IMX_LIB_SOURCE) > $(@D)/EULA
> -	cd $(BUILD_DIR); \
> -	sh $(DL_DIR)/$(IMX_LIB_SOURCE) --force --auto-accept
> -endef
> -
>  define IMX_LIB_BUILD_CMDS
>  	$(IMX_LIB_MAKE_ENV) $(MAKE1) -C $(@D)
>  endef
> -- 
> 2.0.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
