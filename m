From: =?utf-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
Date: Thu, 20 Dec 2012 02:06:03 +0100 (CET)
Subject: [Buildroot] [PATCH RFC 5/6] libfslcodec: new package
In-Reply-To: <1355960256-10786-6-git-send-email-arnout@mind.be>
References: <1355960256-10786-1-git-send-email-arnout@mind.be>
 <1355960256-10786-6-git-send-email-arnout@mind.be>
Message-ID: <653065179.1471991.1355965563202.JavaMail.root@advansee.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thursday, December 20, 2012 12:37:35 AM, Arnout Vandecappelle wrote:
> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/Config.in                  |    1 +
>  package/libfslcodec/Config.in      |    8 ++++++++
>  package/libfslcodec/libfslcodec.mk |   40
>  ++++++++++++++++++++++++++++++++++++
>  3 files changed, 49 insertions(+)
>  create mode 100644 package/libfslcodec/Config.in
>  create mode 100644 package/libfslcodec/libfslcodec.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 171d936..a2bded6 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -454,6 +454,7 @@ menu "Multimedia"
>  source "package/libdvdread/Config.in"
>  source "package/libdvdnav/Config.in"
>  source "package/libebml/Config.in"
> +source "package/libfslcodec/Config.in"
>  source "package/libfslparser/Config.in"
>  source "package/libfslvpuwrap/Config.in"
>  source "package/libmatroska/Config.in"
> diff --git a/package/libfslcodec/Config.in
> b/package/libfslcodec/Config.in
> new file mode 100644
> index 0000000..7b31b7a
> --- /dev/null
> +++ b/package/libfslcodec/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_LIBFSLCODEC
> +	bool "libfslcodec"
> +	depends on BR2_arm # Only relevant for i.MX
> +	help
> +	  Binary codec libraries for the Freescale i.MX SoCs.
> +
> +	  This library is provided by Freescale as-is and doesn't have
> +	  an upstream.
> diff --git a/package/libfslcodec/libfslcodec.mk
> b/package/libfslcodec/libfslcodec.mk
> new file mode 100644
> index 0000000..a2b57b8
> --- /dev/null
> +++ b/package/libfslcodec/libfslcodec.mk
> @@ -0,0 +1,40 @@
> +#############################################################
> +#
> +# buildroot makefile for libfslcodec
> +#
> +#############################################################
> +
> +LIBFSLCODEC_VERSION = 3.0.1
> +# No official download site from freescale, just this mirror
> +LIBFSLCODEC_SITE =
> http://download.ossystems.com.br/bsp/freescale/source
> +LIBFSLCODEC_SOURCE = libfslcodec-$(LIBFSLCODEC_VERSION).bin
> +LIBFSLCODEC_LICENSE = Freescale Semiconductor Software License
> Agreement, BSD-3c (flac, ogg headers)
> +LIBFSLCODEC_LICENSE_FILES = EULA EULA.txt
> +# This is a legal minefield: the EULA in the bin file specifies that
> +# the Board Support Package includes software and hardware (sic!)
> +# for which a separate license is needed...
> +LIBFSLCODEC_REDISTRIBUTE = NO
> +
> +LIBFSLCODEC_INSTALL_STAGING = YES
> +
> +# The archive is a shell-self-extractor of a bzipped tar. It happens
> +# to extract in the correct directory (libfslcodec-x.y.z)
> +# The --force makes sure it doesn't fail if the source dir already
> exists.
> +# The --auto-accept skips the license check - not needed for us
> +# because we have legal-info.
> +# Since the EULA in the bin file differs from the one in the tar
> file,
> +# extract the one from the bin file as well.
> +define LIBFSLCODEC_EXTRACT_CMDS
> +	awk 'BEGIN      { start=0; } \
> +	     /^EOEULA/  { start = 0; } \
> +	                { if (start) print; } \
> +	     /<<EOEULA/ { start=1; }'\
> +	    $(DL_DIR)/$(LIBFSLCODEC_SOURCE) > $(@D)/EULA
> +	cd $(BUILD_DIR); \
> +	sh $(DL_DIR)/$(LIBFSLCODEC_SOURCE) --force --auto-accept
> +endef
> +
> +# FIXME The Makefile installs both the arm9 and arm11 versions of
> the
> +# libraries, but we only need one of them.
> +
> +$(eval $(autotools-package))

For packages like this one that install pre-built libraries, it would be good to
document somewhere or to auto-check (e.g. with toolchain kconfig options vs.
package kconfig options) the ABI compatibility to make sure that there won't be
any issue with the toolchain used.

Best regards,
Beno?t
