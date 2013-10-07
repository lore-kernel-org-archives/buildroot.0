From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 08 Oct 2013 00:31:53 +0200
Subject: [Buildroot] [PATCH 2/2] i.MX: Update versions to match latest
	Freescale release
In-Reply-To: <1381088868-12739-3-git-send-email-eric.nelson@boundarydevices.com>
References: <1381088868-12739-1-git-send-email-eric.nelson@boundarydevices.com>
 <1381088868-12739-3-git-send-email-eric.nelson@boundarydevices.com>
Message-ID: <52533659.30105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/06/13 21:47, Eric Nelson wrote:
[snip]
> diff --git a/package/freescale-imx/imx-lib/imx-lib.mk b/package/freescale-imx/imx-lib/imx-lib.mk
> index e1a68ef..416bb1b 100644
> --- a/package/freescale-imx/imx-lib/imx-lib.mk
> +++ b/package/freescale-imx/imx-lib/imx-lib.mk
> @@ -6,8 +6,8 @@
>   
>   IMX_LIB_VERSION = $(FREESCALE_IMX_VERSION)
>   IMX_LIB_SITE    = $(FREESCALE_IMX_SITE)
> -IMX_LIB_LICENSE = LGPLv2.1+
> -# No license file included
> +IMX_LIB_LICENSE = Freescale Semiconductor Software License Agreement

 Most of it is still LGPLv2.1+, only the vpu library is FSSLA. So I think
it should be:

IMX_LIB_LICENSE = Freescale Semiconductor Software License Agreement (vpu), LGPLv2.1+ (the rest)

> +IMX_LIB_SOURCE = imx-lib-$(IMX_LIB_VERSION).bin
>   
>   IMX_LIB_INSTALL_STAGING = YES
>   
> @@ -25,6 +25,18 @@ IMX_LIB_MAKE_ENV = \
>   	PLATFORM=$(BR2_PACKAGE_IMX_LIB_PLATFORM) \
>   	INCLUDE="$(IMX_LIB_INCLUDE)"
>   
> +# The archive is a shell-self-extractor of a bzipped tar. It happens
> +# to extract in the correct directory (imx-lib-x.y.z)
> +# The --force makes sure it doesn't fail if the source dir already exists.
> +# The --auto-accept skips the license check - not needed for us
> +# because we have legal-info
> +# Since the EULA in the bin file differs from the one in the tar file,
> +# extract the one from the bin file as well.

 This comment doesn't seem to be correct.

 Can you add the awk trick to extract the license file, and add an 
IMX_LIB_LICENSE_FILES variable?

> +define IMX_LIB_EXTRACT_CMDS
> +	(cd $(BUILD_DIR); \
> +		sh $(DL_DIR)/$(IMX_LIB_SOURCE) --force --auto-accept)
> +endef
> +
>   define IMX_LIB_BUILD_CMDS
>   	$(IMX_LIB_MAKE_ENV) $(MAKE1) -C $(@D)
>   endef

[snip]
> diff --git a/package/libfslparser/libfslparser.mk b/package/libfslparser/libfslparser.mk
> index 3aab3a7..1aa975b 100644
> --- a/package/libfslparser/libfslparser.mk
> +++ b/package/libfslparser/libfslparser.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBFSLPARSER_VERSION = 3.0.1
> +LIBFSLPARSER_VERSION = $(FREESCALE_IMX_VERSION)
>   LIBFSLPARSER_SITE = $(FREESCALE_IMX_SITE)
>   LIBFSLPARSER_SOURCE = libfslparser-$(LIBFSLPARSER_VERSION).bin
>   LIBFSLPARSER_LICENSE = Freescale Semiconductor Software License Agreement
> @@ -36,4 +36,6 @@ endef
>   # The Makefile installs several versions of the libraries, but we only
>   # need one of them, depending on the platform.
>   
> +LIBFSLPARSER_AUTORECONF = YES

 Please add a comment why autoreconf is needed.

> +
>   $(eval $(autotools-package))
> diff --git a/package/libfslvpuwrap/libfslvpuwrap.mk b/package/libfslvpuwrap/libfslvpuwrap.mk
> index 346a20a..45193c4 100644
> --- a/package/libfslvpuwrap/libfslvpuwrap.mk
> +++ b/package/libfslvpuwrap/libfslvpuwrap.mk
> @@ -4,8 +4,9 @@
>   #
>   ################################################################################
>   
> -LIBFSLVPUWRAP_VERSION = 1.0.17
> +LIBFSLVPUWRAP_VERSION = $(FREESCALE_IMX_VERSION)
>   LIBFSLVPUWRAP_SITE = $(FREESCALE_IMX_SITE)
> +LIBFSLVPUWRAP_SOURCE = libfslvpuwrap-$(LIBFSLVPUWRAP_VERSION).bin
>   LIBFSLVPUWRAP_LICENSE = Freescale Semiconductor Software License Agreement
>   LIBFSLVPUWRAP_LICENSE_FILES = EULA.txt
>   LIBFSLVPUWRAP_REDISTRIBUTE = NO
> @@ -14,4 +15,21 @@ LIBFSLVPUWRAP_INSTALL_STAGING = YES
>   
>   LIBFSLVPUWRAP_DEPENDENCIES += imx-lib
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

 You should add this to LIBFSLVPUWRAP_LICENSE_FILES.


 Regards,
 Arnout

> +	cd $(BUILD_DIR); \
> +	sh $(DL_DIR)/$(LIBFSLVPUWRAP_SOURCE) --force --auto-accept
> +endef
> +
>   $(eval $(autotools-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
