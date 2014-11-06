From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Nov 2014 08:30:50 +0100
Subject: [Buildroot] [PATCH 1/1] exiv2: new package
In-Reply-To: <1415197829-7086-1-git-send-email-nicolas.serafini@sensefly.com>
References: <1415197829-7086-1-git-send-email-nicolas.serafini@sensefly.com>
Message-ID: <20141106083050.60e4d614@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nicolas Serafini,

Thanks for your contribution. See a few comments below.

On Wed, 5 Nov 2014 15:30:29 +0100, Nicolas Serafini wrote:

> diff --git a/package/exiv2/Config.in b/package/exiv2/Config.in
> new file mode 100644
> index 0000000..d03447b
> --- /dev/null
> +++ b/package/exiv2/Config.in
> @@ -0,0 +1,33 @@
> +config BR2_PACKAGE_EXIV2
> +	bool "exiv2"
> +	help
> +	  Exiv2 is a C++ library and a command line utility to manage image metadata.

This line is a bit too long. Please wrap the help text so that it
doesn't go over 72 columns.

> diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
> new file mode 100644
> index 0000000..cbf5bcd
> --- /dev/null
> +++ b/package/exiv2/exiv2.mk
> @@ -0,0 +1,32 @@
> +################################################################################
> +#
> +# exiv2
> +#
> +################################################################################
> +
> +EXIV2_VERSION = 0.24
> +EXIV2_SOURCE = exiv2-$(EXIV2_VERSION).tar.gz

This line is not needed, as it is the default value.

> +EXIV2_SITE = http://www.exiv2.org
> +EXIV2_LICENSE = GPLv2+ or commercial
> +EXIV2_LICENSE_FILES = COPYING

You should probably make this conditional:

ifeq ($(BR2_PACKAGE_EXIV2_COMMERCIAL),y)
EXIV2_LICENSE = commercial
else
EXIV2_LICENSE = GPLv2+
EXIV2_LICENSE_FILES = COPYING
endif

(Assuming COPYING contains the text of the GPLv2)

> +ifeq ($(BR2_PACKAGE_EXIV2_COMMERCIAL),y)
> +EXIV2_CONF_OPTS += --enable-commercial --disable-nls --disable-lensdata
> +endif

Why --disable-nls here? It is already passed automatically by the
package infrastructure when locale support is not available.

Maybe a comment about why --disable-lensdata is passed when the
commercial license is used would be useful.

> +
> +ifeq ($(BR2_PACKAGE_EXIV2_PNG),y)
> +EXIV2_CONF_OPTS += --with-zlib=$(STAGING_DIR)
> +EXIV2_DEPENDENCIES += zlib
> +else
> +EXIV2_CONF_OPTS += --without-zlib
> +endif
> +
> +ifeq ($(BR2_PACKAGE_EXIV2_XMP),y)
> +EXIV2_CONF_OPTS += --with-expat=$(STAGING_DIR)/usr/lib

Maybe --enable-xmp here?

> +EXIV2_DEPENDENCIES += expat
> +else
> +EXIV2_CONF_OPTS += --disable-xmp
> +endif
> +
> +$(eval $(autotools-package))

Other than that, this patch looks good. Could you submit an updated
version that fixes the minor issues mentioned above?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
