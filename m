From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Feb 2018 15:51:00 +0100
Subject: [Buildroot] [PATCH 1/3] imx-mkimage: new package
In-Reply-To: <1518960511-4823-2-git-send-email-karl.erik.larsson@gmail.com>
References: <1518960511-4823-1-git-send-email-karl.erik.larsson@gmail.com>
 <1518960511-4823-2-git-send-email-karl.erik.larsson@gmail.com>
Message-ID: <20180218155100.3e4e090f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this contribution!

On Sun, 18 Feb 2018 14:28:29 +0100, Erik Larsson wrote:
> Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
> ---
>  package/Config.in.host                             |  1 +
>  .../0001-make-bl33-read-env-variables.patch        | 37 ++++++++++++++++++++++
>  package/freescale-imx/imx-mkimage/Config.in.host   |  5 +++
>  package/freescale-imx/imx-mkimage/imx-mkimage.hash |  3 ++
>  package/freescale-imx/imx-mkimage/imx-mkimage.mk   | 23 ++++++++++++++
>  5 files changed, 69 insertions(+)
>  create mode 100644 package/freescale-imx/imx-mkimage/0001-make-bl33-read-env-variables.patch
>  create mode 100644 package/freescale-imx/imx-mkimage/Config.in.host
>  create mode 100644 package/freescale-imx/imx-mkimage/imx-mkimage.hash
>  create mode 100644 package/freescale-imx/imx-mkimage/imx-mkimage.mk
> 
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 199a8e9..b1cfa75 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -15,6 +15,7 @@ menu "Host utilities"
>  	source "package/e2fsprogs/Config.in.host"
>  	source "package/e2tools/Config.in.host"
>  	source "package/faketime/Config.in.host"
> +	source "package/freescale-imx/imx-mkimage/Config.in.host"

I'm not sure this package needs to be under package/freescale-imx/.
This sub-directory was initially created to share the
FREESCALE_IMX_SITE and FREESCALE_IMX_EXTRACT_HELPER definitions, but
you don't use them.

> diff --git a/package/freescale-imx/imx-mkimage/0001-make-bl33-read-env-variables.patch b/package/freescale-imx/imx-mkimage/0001-make-bl33-read-env-variables.patch
> new file mode 100644
> index 0000000..490eb05
> --- /dev/null
> +++ b/package/freescale-imx/imx-mkimage/0001-make-bl33-read-env-variables.patch
> @@ -0,0 +1,37 @@
> +From 5ca549356ef889286c12b4d736d9026efafb8fff Mon Sep 17 00:00:00 2001
> +From: Erik Larsson <erik.larsson@combitech.se>
> +Date: Mon, 29 Jan 2018 08:00:57 +0100
> +Subject: [PATCH] Add support for overriding BL32 and BL33 not only BL31
> +
> +Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
> +Signed-off-by: Christopher Dahlberg <crille.dahlberg@gmail.com>
> +Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

What is the upstream status of this patch ?

> diff --git a/package/freescale-imx/imx-mkimage/Config.in.host b/package/freescale-imx/imx-mkimage/Config.in.host
> new file mode 100644
> index 0000000..3cf0966
> --- /dev/null
> +++ b/package/freescale-imx/imx-mkimage/Config.in.host
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_HOST_IMX_MKIMAGE
> +	bool "host imx-mkimage"
> +	help
> +	  imx-mkimage is used to combine input images and generate
> +	  final boot image with appropriate IVT set.

We like to have a blank line, and then the URL of the upstream project
main page. Here, https://source.codeaurora.org/external/imx/imx-mkimage
might be enough, unless there is a better page.

> diff --git a/package/freescale-imx/imx-mkimage/imx-mkimage.mk b/package/freescale-imx/imx-mkimage/imx-mkimage.mk
> new file mode 100644
> index 0000000..a5b1f93
> --- /dev/null
> +++ b/package/freescale-imx/imx-mkimage/imx-mkimage.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# imx-mkimage
> +#
> +################################################################################
> +
> +IMX_MKIMAGE_VERSION = imx_4.9.51_imx8m_beta
> +IMX_MKIMAGE_SITE = https://source.codeaurora.org/external/imx/imx-mkimage
> +IMX_MKIMAGE_SITE_METHOD = git
> +IMX_MKIMAGE_LICENSE = GPL-2.0
> +IMX_MKIMAGE_LICENSE_FILES = iMX8dv/COPYING
> +
> +define HOST_IMX_MKIMAGE_BUILD_CMDS
> +	$(MAKE) -C $(@D)/iMX8M -f soc.mak mkimage_imx8

Why are you building just the tool in iMX8M ? There is also one in src/
and in iMX8dv. What are the differences ? Should we build/install all
of them ? Conditionally ?

> +define HOST_IMX_MKIMAGE_INSTALL_CMDS
> +	mkdir -p $(HOST_DIR)/bin

This line is not needed... if...

> +	$(INSTALL) -m 755 $(@D)/iMX8M/mkimage_imx8 $(HOST_DIR)/bin
> +	$(INSTALL) -m 755 $(@D)/iMX8M/mkimage_fit_atf.sh $(HOST_DIR)/bin

You replace those lines by:

	$(INSTALL) -D -m 755 $(@D)/iMX8M/mkimage_imx8 $(HOST_DIR)/bin/mkimage_imx8
	$(INSTALL) -D -m 755 $(@D)/iMX8M/mkimage_fit_atf.sh $(HOST_DIR)/bin/mkimage_fit_atf.sh

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
