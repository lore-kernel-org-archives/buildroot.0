From: Gilles Talis <gilles.talis@gmail.com>
Date: Thu, 24 Jan 2013 20:37:39 -0800
Subject: [Buildroot] [PATCH 1/1] webp: new package
In-Reply-To: <1359088553-11261-1-git-send-email-gilles.talis@gmail.com>
References: <1359088553-11261-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <CAKcgs2ySqJ8agkcaf_e40y=ZZZDJPnxsvDGwN7t0_Yn=tn7YEA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,
This is a version where all paths are hardcoded. Let me know what you think.
Gilles.

2013/1/24 Gilles Talis <gilles.talis@gmail.com>

> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
> ---
>  package/Config.in      |    1 +
>  package/webp/Config.in |    7 +++++++
>  package/webp/webp.mk   |   30 ++++++++++++++++++++++++++++++
>  3 files changed, 38 insertions(+), 0 deletions(-)
>  create mode 100644 package/webp/Config.in
>  create mode 100644 package/webp/webp.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index ebd9817..95d51fb 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -437,6 +437,7 @@ source "package/pango/Config.in"
>  source "package/pixman/Config.in"
>  source "package/tiff/Config.in"
>  source "package/webkit/Config.in"
> +source "package/webp/Config.in"
>  source "package/zxing/Config.in"
>  endmenu
>
> diff --git a/package/webp/Config.in b/package/webp/Config.in
> new file mode 100644
> index 0000000..dcee8aa
> --- /dev/null
> +++ b/package/webp/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_WEBP
> +       bool "webp"
> +       help
> +         WebP is a new image format that provides lossless and
> +         lossy compression for images on the web
> +
> +         https://developers.google.com/speed/webp/
> diff --git a/package/webp/webp.mk b/package/webp/webp.mk
> new file mode 100644
> index 0000000..d6d7509
> --- /dev/null
> +++ b/package/webp/webp.mk
> @@ -0,0 +1,30 @@
> +#####################################################################
> +#
> +# webp
> +#
> +#####################################################################
> +
> +WEBP_VERSION = 0.2.1
> +WEBP_SOURCE = libwebp-$(WEBP_VERSION).tar.gz
> +WEBP_SITE = https://webp.googlecode.com/files
> +WEBP_LICENSE = BSD-3c
> +WEBP_LICENSE_FILES = COPYING
> +WEBP_INSTALL_STAGING = YES
> +
> +WEBP_CONF_OPT += \
> +       --with-jpegincludedir=$(STAGING_DIR)/usr/include \
> +       --with-jpeglibdir=$(STAGING_DIR)/usr/lib \
> +       --with-tiffincludedir=$(STAGING_DIR)/usr/include \
> +       --with-tifflibdir=$(STAGING_DIR)/usr/lib
> +
> +ifeq ($(BR2_PACKAGE_LIBPNG),y)
> +WEBP_DEPENDENCIES += libpng
> +WEBP_CONF_ENV +=
> ac_cv_path_LIBPNG_CONFIG=$(STAGING_DIR)/usr/bin/libpng-config
> +else
> +WEBP_CONF_ENV += ac_cv_path_LIBPNG_CONFIG=/bin/false
> +endif
> +
> +WEBP_DEPENDENCIES += $(if $(BR2_PACKAGE_JPEG),jpeg)
> +WEBP_DEPENDENCIES += $(if $(BR2_PACKAGE_TIFF),tiff)
> +
> +$(eval $(autotools-package))
> --
> 1.7.4.1
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130124/89123be7/attachment.html>
