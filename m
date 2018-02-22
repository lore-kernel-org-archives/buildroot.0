From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 22 Feb 2018 15:37:08 +0100
Subject: [Buildroot] [PATCH v2 1/3] imx-mkimage: new package
In-Reply-To: <1519293778-5185-2-git-send-email-karl.erik.larsson@gmail.com>
References: <1519293778-5185-1-git-send-email-karl.erik.larsson@gmail.com>
 <1519293778-5185-2-git-send-email-karl.erik.larsson@gmail.com>
Message-ID: <20180222143708.GB1718@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Erik,

On Thu, Feb 22, 2018 at 11:02:56AM +0100, Erik Larsson wrote:
> This package add support for imx-mkimage for iMX8M.
> Currently the only hardware it's tested for.
> 
> Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>

Still no Crille nor Marcus? :-)
Same for the all patches in this set.

> ---
>  package/Config.in.host                             |  1 +
>  .../imx-mkimage/0001-remove-git-build-info.patch   | 28 +++++++++++++++
>  package/imx-mkimage/Config.in.host                 | 11 ++++++
>  package/imx-mkimage/imx-mkimage.hash               |  3 ++
>  package/imx-mkimage/imx-mkimage.mk                 | 41 ++++++++++++++++++++++
>  5 files changed, 84 insertions(+)
>  create mode 100644 package/imx-mkimage/0001-remove-git-build-info.patch
>  create mode 100644 package/imx-mkimage/Config.in.host
>  create mode 100644 package/imx-mkimage/imx-mkimage.hash
>  create mode 100644 package/imx-mkimage/imx-mkimage.mk
> 
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 199a8e9..06ef5cb 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -24,6 +24,7 @@ menu "Host utilities"
>  	source "package/go-bootstrap/Config.in.host"
>  	source "package/google-breakpad/Config.in.host"
>  	source "package/gptfdisk/Config.in.host"
> +	source "package/imx-mkimage/Config.in.host"
>  	source "package/imx-usb-loader/Config.in.host"
>  	source "package/jq/Config.in.host"
>  	source "package/jsmin/Config.in.host"
> diff --git a/package/imx-mkimage/0001-remove-git-build-info.patch b/package/imx-mkimage/0001-remove-git-build-info.patch
> new file mode 100644
> index 0000000..e472133
> --- /dev/null
> +++ b/package/imx-mkimage/0001-remove-git-build-info.patch
> @@ -0,0 +1,28 @@
> +From d1bb893300b1bd80eaac27fcc8eb4347f56f83b4 Mon Sep 17 00:00:00 2001
> +From: Erik Larsson <erik.larsson@combitech.se>
> +Date: Thu, 22 Feb 2018 09:56:53 +0100
> +Subject: [PATCH] Remove buildinformation step.
> +
> +Signed-off-by: Erik Larsson <erik.larsson@combitech.se>
> +---
> + Makefile | 4 +---
> + 1 file changed, 1 insertion(+), 3 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 4b449ad..4042a39 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -33,9 +33,7 @@ $(MKIMG): buildinfo $(SRCS)
> + bin: $(MKIMG)
> + 
> + buildinfo:
> +-	@echo -n '#define MKIMAGE_COMMIT 0x' > src/build_info.h
> +-	@git rev-parse --short=8 HEAD >> src/build_info.h
> +-	@echo '' >> src/build_info.h
> ++	@echo "#define MKIMAGE_COMMIT 0x0000" > src/build_info.h
> + 
> + help:
> + 	@echo $(CURR_DIR)
> +-- 
> +2.7.4
> +
> diff --git a/package/imx-mkimage/Config.in.host b/package/imx-mkimage/Config.in.host
> new file mode 100644
> index 0000000..411f67c
> --- /dev/null
> +++ b/package/imx-mkimage/Config.in.host
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_HOST_IMX_MKIMAGE
> +	bool "host imx-mkimage"
> +	select BR2_PACKAGE_HOST_UBOOT_TOOLS
> +	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT
> +	depends on BR2_LINUX_KERNEL
> +	depends on BR2_TARGET_UBOOT
> +	help
> +	  imx-mkimage is used to combine input images and generate
> +	  final boot image with appropriate IVT set.
> +
> +	  https://source.codeaurora.org/external/imx/imx-mkimage
> diff --git a/package/imx-mkimage/imx-mkimage.hash b/package/imx-mkimage/imx-mkimage.hash
> new file mode 100644
> index 0000000..08d31ce
> --- /dev/null
> +++ b/package/imx-mkimage/imx-mkimage.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256 4ddb144520001c33baa24493f68ef2ea9434ac36bf3ae223f78d7ec581aa484c  imx-mkimage-imx_4.9.51_imx8m_beta.tar.gz
> +sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  iMX8dv/COPYING
> diff --git a/package/imx-mkimage/imx-mkimage.mk b/package/imx-mkimage/imx-mkimage.mk
> new file mode 100644
> index 0000000..e3c62bb
> --- /dev/null
> +++ b/package/imx-mkimage/imx-mkimage.mk
> @@ -0,0 +1,41 @@
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

The license is GPL-2.0+ as pointed out in v1.


Best regards
Marcus Folkesson
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180222/8dab871e/attachment.asc>
