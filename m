From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Oct 2015 10:22:51 +0200
Subject: [Buildroot] [PATCH v2] package/python-pillow: new package
In-Reply-To: <1445549143-10983-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1445549143-10983-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20151023102251.4766d6fc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Thu, 22 Oct 2015 23:25:43 +0200, Angelo Compagnucci wrote:

> +config BR2_PACKAGE_PYTHON_PILLOW_JPEG
> +	bool "JPEG support"
> +	select BR2_PACKAGE_JPEG
> +	help
> +	  This option provides JPEG functionality.
> +
> +config BR2_PACKAGE_PYTHON_PILLOW_ZLIB
> +	bool "compressed PNGs support"
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  This option provides access to compressed PNGs.
> +
> +config BR2_PACKAGE_PYTHON_PILLOW_TIFF
> +	bool "compressed TIFF support"
> +	select BR2_PACKAGE_TIFF
> +	help
> +	  This option provides compressed TIFF functionality.
> +
> +config BR2_PACKAGE_PYTHON_PILLOW_FREETYPE
> +	bool "freetype support"
> +	select BR2_PACKAGE_FREETYPE
> +	help
> +	  This option provides type related services.
> +
> +config BR2_PACKAGE_PYTHON_PILLOW_WEBP
> +	bool "WebP format support"
> +	select BR2_PACKAGE_WEBP
> +	help
> +	  This option provides the WebP format.
> +
> +config BR2_PACKAGE_PYTHON_PILLOW_JPEG2000
> +	bool "JPEG 2000 support"
> +	select BR2_PACKAGE_OPENJPEG
> +	help
> +	  This option provides JPEG 2000 functionality.

If you declare options here...

> diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
> new file mode 100644
> index 0000000..ccf8440
> --- /dev/null
> +++ b/package/python-pillow/python-pillow.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# python-pillow
> +#
> +################################################################################
> +
> +PYTHON_PILLOW_VERSION = 3.0.0
> +PYTHON_PILLOW_SITE = $(call github,python-pillow,Pillow,$(PYTHON_PILLOW_VERSION))
> +PYTHON_PILLOW_SETUP_TYPE = distutils
> +PYTHON_PILLOW_DEPENDENCIES = python-setuptools \
> +      $(if $(BR2_PACKAGE_JPEG),jpeg) \
> +      $(if $(BR2_PACKAGE_ZLIB),zlib) \
> +      $(if $(BR2_PACKAGE_TIFF),tiff) \
> +      $(if $(BR2_PACKAGE_FREETYPE),freetype) \
> +      $(if $(BR2_PACKAGE_WEBP),webp) \
> +      $(if $(BR2_PACKAGE_OPENJPEG),openjpeg)

It would be good to use them here.

However, I believe you shouldn't declare any of those options. Just
remove them from the Config.in, and use "implicit optional
dependencies": i.e python-pillow will have jpeg support if the jpeg
package is enabled.

Also, why do you need "python-setuptools" ? It is a bit strange to
declare distutils as the <pkg>_SETUP_TYPE, and then having to depend on
python-setuptools. Can you clarify ?

Finally, we now want to have hash files, even for github sourced
packages, so please add one.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
