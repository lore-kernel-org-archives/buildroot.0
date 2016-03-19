From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 19 Mar 2016 09:54:40 +0100
Subject: [Buildroot] [PATCH 11/14] imx-uuc: add new package
In-Reply-To: <1458140214-22303-12-git-send-email-gary.bisson@boundarydevices.com>
 (Gary Bisson's message of "Wed, 16 Mar 2016 15:56:51 +0100")
References: <1458140214-22303-1-git-send-email-gary.bisson@boundarydevices.com>
 <1458140214-22303-12-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <87egb6zw33.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gary" == Gary Bisson <gary.bisson@boundarydevices.com> writes:

 > This package provides the Universal Adapter user-space utility that is
 > used to receive commands from the Manufacturing Tool by the Freescale
 > UTP Protocol.

 > It only works on Freescale/NXP kernels whose configuration contains
 > the CONFIG_FSL_UTP option.

 > In order to use it, the best is to make a ramdisk image whose init
 > points to /linuxrc. Otherwise you can simply invoke the tool once
 > booted:
 >  $ uuc

 > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
 > ---
 >  package/freescale-imx/Config.in            |  1 +
 >  package/freescale-imx/imx-uuc/Config.in    | 11 +++++++++++
 >  package/freescale-imx/imx-uuc/imx-uuc.hash |  1 +
 >  package/freescale-imx/imx-uuc/imx-uuc.mk   | 20 ++++++++++++++++++++
 >  4 files changed, 33 insertions(+)
 >  create mode 100644 package/freescale-imx/imx-uuc/Config.in
 >  create mode 100644 package/freescale-imx/imx-uuc/imx-uuc.hash
 >  create mode 100644 package/freescale-imx/imx-uuc/imx-uuc.mk

 > diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
 > index dfb6cc4..bc3ddd6 100644
 > --- a/package/freescale-imx/Config.in
 > +++ b/package/freescale-imx/Config.in
 > @@ -44,6 +44,7 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
 
 >  source "package/freescale-imx/imx-kobs/Config.in"
 >  source "package/freescale-imx/imx-lib/Config.in"
 > +source "package/freescale-imx/imx-uuc/Config.in"
 >  source "package/freescale-imx/imx-vpu/Config.in"
 >  source "package/freescale-imx/firmware-imx/Config.in"
 >  if (BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 || BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53)
 > diff --git a/package/freescale-imx/imx-uuc/Config.in b/package/freescale-imx/imx-uuc/Config.in
 > new file mode 100644
 > index 0000000..2cd8299
 > --- /dev/null
 > +++ b/package/freescale-imx/imx-uuc/Config.in
 > @@ -0,0 +1,11 @@
 > +config BR2_PACKAGE_IMX_UUC
 > +	bool "imx-uuc"
 > +	depends on BR2_arm # Only relevant for i.MX
 > +	help
 > +	  This package provides the Universal Adapter user-space utility
 > +	  that is used to receive commands from the Manufacturing Tool
 > +	  by the Freescale UTP Protocol.
 > +
 > +	  This package is provided by Freescale/NXP as-is and doesn't have
 > +	  an upstream.

I think we should add some of the more detailed description from your
commit text here.

Looking at the upstream Makefile I see that it links with -lpthread, so
you need to make the package depend on BR2_TOOLCHAIN_HAS_THREADS (and
show a comment if not).

I see it also creates a 1MB fat filesystem image using mkfs.vfat. It is
not clear to me what that is for, but if it is needed then the package
should select BR2_PACKAGE_HOST_DOSFSTOOLS.

I'm not really sure installing linuxrc makes any sense. Perhaps we
should just install an init script to run it at startup?

-- 
Bye, Peter Korsgaard
