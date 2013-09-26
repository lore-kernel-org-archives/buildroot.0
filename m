From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 26 Sep 2013 21:36:23 +0200
Subject: [Buildroot] [PATCH 4/4] i.MX6: Update Freescale
	hardware-acceleration bits to latest versions
In-Reply-To: <1380136072-9879-5-git-send-email-eric.nelson@boundarydevices.com>
 (Eric Nelson's message of "Wed, 25 Sep 2013 12:07:52 -0700")
References: <1380136072-9879-1-git-send-email-eric.nelson@boundarydevices.com>
 <1380136072-9879-5-git-send-email-eric.nelson@boundarydevices.com>
Message-ID: <87k3i35qa0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eric" == Eric Nelson <eric.nelson@boundarydevices.com> writes:

 Eric> This patchset updates the Freescale gstreamer and GPU libraries
 Eric> to the latest release (3.0.35_4.1.0).

 Eric> Note that the package names refer to and are compatible with
 Eric> an alpha release of kernel version 3.5.7.

 Eric> The primary release package (based on LTIB) is available
 Eric> here and includes documentation.
 Eric> 	https://community.freescale.com/docs/DOC-95560

 Eric> The 3.5.7 kernel sources are available here:
 Eric> 	http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git/log/?h=imx_3.5.7_1.0.0_alpha


 Eric> # No official download site from freescale, just this mirror
 Eric> -FREESCALE_IMX_MIRROR_SITE   = http://download.ossystems.com.br/bsp/freescale/source
 Eric> +FREESCALE_IMX_MIRROR_SITE   = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/

That sounds pretty official to me, so the comment should probably go and
the variable perhaps renamed to FREESCALE_IMX_SITE?

The page btw seems to be down at the moment as I just get:
The system is currently unavailable.

Please accept our apologies for any inconvenience this may cause.
Feel free to contact our Technical Helpline at one of the following numbers:
...


 Eric> +++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
 Eric> @@ -3,8 +3,12 @@
 Eric>  # gpu-viv-bin-mx6q
 Eric>  #
 Eric>  ################################################################################
 Eric> +ifeq ($(BR2_ARM_EABIHF),y)
 Eric> +GPU_VIV_BIN_MX6Q_VERSION = $(FREESCALE_IMX_VERSION)-hfp
 Eric> +else
 Eric> +GPU_VIV_BIN_MX6Q_VERSION = $(FREESCALE_IMX_VERSION)-sfp
 Eric> +endif

NIT: There should be an empty line after the ##### line.
 
 Eric> -GPU_VIV_BIN_MX6Q_VERSION = $(FREESCALE_IMX_VERSION)
 Eric>  GPU_VIV_BIN_MX6Q_SITE    = $(FREESCALE_IMX_MIRROR_SITE)
 Eric>  GPU_VIV_BIN_MX6Q_SOURCE  = gpu-viv-bin-mx6q-$(GPU_VIV_BIN_MX6Q_VERSION).bin
 
 Eric> @@ -30,8 +34,6 @@ endif
 Eric>  # The archive is a shell-self-extractor of a bzipped tar. It happens
 Eric>  # to extract in the correct directory (gpu-viv-bin-mx6q-x.y.z)
 Eric>  # The --force makes sure it doesn't fail if the source dir already exists.
 Eric> -# The --auto-accept skips the license check - not needed for us
 Eric> -# because we have legal-info.
 Eric>  define GPU_VIV_BIN_MX6Q_EXTRACT_CMDS
 Eric>  	(cd $(BUILD_DIR); \
 Eric>  		sh $(DL_DIR)/$(GPU_VIV_BIN_MX6Q_SOURCE) --force --auto-accept)

Did you remove this on purpose? If the --auto-accept option is gone then
it should also be removed from here.


 Eric> diff --git a/package/freescale-imx/imx-lib/imx-lib.mk b/package/freescale-imx/imx-lib/imx-lib.mk
 Eric> index bd7e174..e3c29b1 100644
 Eric> --- a/package/freescale-imx/imx-lib/imx-lib.mk
 Eric> +++ b/package/freescale-imx/imx-lib/imx-lib.mk
 Eric> @@ -6,7 +6,8 @@
 
 Eric>  IMX_LIB_VERSION = $(FREESCALE_IMX_VERSION)
 Eric>  IMX_LIB_SITE    = $(FREESCALE_IMX_MIRROR_SITE)
 Eric> -IMX_LIB_LICENSE = LGPLv2.1+
 Eric> +IMX_LIB_SOURCE = imx-lib-$(IMX_LIB_VERSION).bin
 Eric> +IMX_LIB_LICENSE = Freescale Semiconductor Software License Agreement
 Eric>  # No license file included

Sigh, back to self extracting binaries? :/

 
 Eric>  IMX_LIB_INSTALL_STAGING = YES
 Eric> @@ -25,6 +26,14 @@ IMX_LIB_MAKE_ENV = \
 Eric>  	PLATFORM=$(BR2_PACKAGE_IMX_LIB_PLATFORM) \
 Eric>  	INCLUDE="$(IMX_LIB_INCLUDE)"
 
 Eric> +# The archive is a shell-self-extractor of a bzipped tar. It happens
 Eric> +# to extract in the correct directory (imx-lib-x.y.z)
 Eric> +# The --force makes sure it doesn't fail if the source dir already exists.
 Eric> +define IMX_LIB_EXTRACT_CMDS
 Eric> +	(cd $(BUILD_DIR); \
 Eric> +		sh $(DL_DIR)/$(IMX_LIB_SOURCE) --force --auto-accept)
 Eric> +endef

Does it have an --auto-accept option? If so, please document it, if not
remove it here.

 Eric> +++ b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
 Eric> @@ -4,9 +4,9 @@
 Eric>  #
 Eric>  ################################################################################
 
 Eric> -GST_FSL_PLUGINS_VERSION = 3.0.1
 Eric> +GST_FSL_PLUGINS_VERSION = 3.5.7-1.0.0
 Eric>  # No official download site from freescale, just this mirror
 Eric> -GST_FSL_PLUGINS_SITE = http://download.ossystems.com.br/bsp/freescale/source
 Eric> +GST_FSL_PLUGINS_SITE = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/

Is this still for gstreamer 0.10?
 

Eric> +++ b/package/libfslcodec/libfslcodec.mk
 Eric> @@ -4,9 +4,9 @@
 Eric>  #
 Eric>  ################################################################################
 
 Eric> -LIBFSLCODEC_VERSION = 3.0.1
 Eric> +LIBFSLCODEC_VERSION = 3.5.7-1.0.0
 Eric>  # No official download site from freescale, just this mirror
 Eric> -LIBFSLCODEC_SITE = http://download.ossystems.com.br/bsp/freescale/source
 Eric> +LIBFSLCODEC_SITE = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/

Maybe this should use FREESCALE_IMX_SITE


 Eric>  LIBFSLCODEC_SOURCE = libfslcodec-$(LIBFSLCODEC_VERSION).bin
 Eric>  LIBFSLCODEC_LICENSE = Freescale Semiconductor Software License Agreement, BSD-3c (flac, ogg headers)
 Eric>  LIBFSLCODEC_LICENSE_FILES = EULA EULA.txt
 Eric> diff --git a/package/libfslparser/libfslparser.mk b/package/libfslparser/libfslparser.mk
 Eric> index 3e27a6a..66068fe 100644
 Eric> --- a/package/libfslparser/libfslparser.mk
 Eric> +++ b/package/libfslparser/libfslparser.mk
 Eric> @@ -4,9 +4,9 @@
 Eric>  #
 Eric>  ################################################################################
 
 Eric> -LIBFSLPARSER_VERSION = 3.0.1
 Eric> +LIBFSLPARSER_VERSION = 3.5.7-1.0.0
 Eric>  # No official download site from freescale, just this mirror
 Eric> -LIBFSLPARSER_SITE = http://download.ossystems.com.br/bsp/freescale/source
 Eric> +LIBFSLPARSER_SITE = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/

Same here (and comment dropped).


 Eric>  LIBFSLPARSER_SOURCE = libfslparser-$(LIBFSLPARSER_VERSION).bin
 Eric>  LIBFSLPARSER_LICENSE = Freescale Semiconductor Software License Agreement
 Eric>  LIBFSLPARSER_LICENSE_FILES = EULA EULA.txt
 Eric> @@ -31,7 +31,9 @@ define LIBFSLPARSER_EXTRACT_CMDS
 Eric>  	     /<<EOEULA/ { start=1; }'\
 Eric>  	    $(DL_DIR)/$(LIBFSLPARSER_SOURCE) > $(@D)/EULA
 Eric>  	cd $(BUILD_DIR); \
 Eric> -	sh $(DL_DIR)/$(LIBFSLPARSER_SOURCE) --force --auto-accept
 Eric> +	sh $(DL_DIR)/$(LIBFSLPARSER_SOURCE) --force --auto-accept ; \
 Eric> +	cd libfslparser-3.5.7-1.0.0; \
 Eric> +	pwd && sh ./autogen.sh
 Eric>  endef

Why the pwd?

We do have generic autoreconf support in Buildroot. Normally you can
just set:

 LIBFSLPARSERS_AUTORECONF = YES

And Buildroot will take care of building the proper auto* packages for
the host and running autoreconf.


 Eric> +++ b/package/libfslvpuwrap/libfslvpuwrap.mk
 Eric> @@ -4,9 +4,10 @@
 Eric>  #
 Eric>  ################################################################################
 
 Eric> -LIBFSLVPUWRAP_VERSION = 1.0.17
 Eric> +LIBFSLVPUWRAP_VERSION = 3.5.7-1.0.0
 Eric>  # No official download site from freescale, just this mirror
 Eric> -LIBFSLVPUWRAP_SITE = http://download.ossystems.com.br/bsp/freescale/source
 Eric> +LIBFSLVPUWRAP_SITE = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/

Same comment as elsewhere.

Care to fix these issues and resubmit? Thanks.

-- 
Bye, Peter Korsgaard
