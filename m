From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Feb 2020 23:35:43 +0100
Subject: [Buildroot] [PATCH v1 1/1] package/libtalloc: update to add
 libtalloc
In-Reply-To: <20200129150841.9546-1-jared.bents@rockwellcollins.com>
References: <20200129150841.9546-1-jared.bents@rockwellcollins.com>
Message-ID: <20200201233543.1729e8a8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jared,

Thanks for your contribution. A number of comments/questions below.

On Wed, 29 Jan 2020 09:08:41 -0600
jared.bents at rockwellcollins.com wrote:

>  package/Config.in                |  1 +
>  package/libtalloc/Config.in      |  8 ++++
>  package/libtalloc/libtalloc.hash |  2 +
>  package/libtalloc/libtalloc.mk   | 74 ++++++++++++++++++++++++++++++++
>  4 files changed, 85 insertions(+)

Entry missing in the DEVELOPERS file.

> diff --git a/package/libtalloc/Config.in b/package/libtalloc/Config.in
> new file mode 100644
> index 0000000000..168d367793
> --- /dev/null
> +++ b/package/libtalloc/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_LIBTALLOC
> +	bool "libtalloc"

Really no toolchain dependencies at all? Did you test this package with
test-pkg ?

> diff --git a/package/libtalloc/libtalloc.hash b/package/libtalloc/libtalloc.hash
> new file mode 100644
> index 0000000000..ff1df0f8a9
> --- /dev/null
> +++ b/package/libtalloc/libtalloc.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated after checking pgp signature
> +sha256 ef4822d2fdafd2be8e0cabc3ec3c806ae29b8268e932c5e9a4cd5585f37f9f77  talloc-2.3.1.tar.gz

We will need a license file hash. See below.

> diff --git a/package/libtalloc/libtalloc.mk b/package/libtalloc/libtalloc.mk
> new file mode 100644
> index 0000000000..82a5bcb45e
> --- /dev/null
> +++ b/package/libtalloc/libtalloc.mk
> @@ -0,0 +1,74 @@
> +################################################################################
> +#
> +# libtalloc
> +#
> +################################################################################
> +
> +LIBTALLOC_VERSION = 2.3.1
> +LIBTALLOC_SITE = https://www.samba.org/ftp/talloc
> +LIBTALLOC_SOURCE = talloc-$(LIBTALLOC_VERSION).tar.gz
> +LIBTALLOC_LICENSE = LGPL-3.0+

The python bindings are under GPL-3.0+

> +# no license file but available in source at man/talloc.3.xml

I suggest using talloc.h as the license file for LGPL-3.0+ and
pytalloc.h as the license file for GPL-3.0+.

> +LIBTALLOC_INSTALL_STAGING = YES
> +LIBTALLOC_CFLAGS = $(TARGET_CFLAGS)
> +LIBTALLOC_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)

If you use TARGET_NLS_LIBS here, then you need
$(TARGET_NLS_DEPENDENCIES) in the <pkg>_DEPENDENCIES variable. Make
sure it is really needed though.

> +LIBTALLOC_CONF_ENV = \
> +	CFLAGS="$(LIBTALLOC_CFLAGS)" \
> +	LDFLAGS="$(LIBTALLOC_LDFLAGS)" \
> +	XSLTPROC=false \
> +	WAF_NO_PREFORK=1
> +
> +ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
> +LIBTALLOC_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`
> +LIBTALLOC_LDFLAGS += `$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`
> +LIBTALLOC_DEPENDENCIES += libtirpc host-pkgconf
> +endif

Are you sure libtirpc is really used by libtalloc ? I know it is
checked in lib/replace/wscript, but I don't see where it gets used, and
I don't see why a memory allocator library would care about RPC
support. Could you comment on this ?

> +
> +ifeq ($(BR2_PACKAGE_PYTHON3),y)
> +LIBTALLOC_PYTHON = \
> +	PYTHON="$(HOST_DIR)/bin/python3" \
> +	PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python3-config"

I'm not sure we need this LIBTALLOC_PYTHON variable, just put these
variables in LIBTALLOC_MAKE_ENV, which itself is initially set to
TARGET_MAKE_ENV, and then used in the commands.

> +LIBTALLOC_DEPENDENCIES += host-python3 python3
> +LIBTALLOC_CONF_ENV += \
> +	$(LIBTALLOC_PYTHON) \
> +	python_LDFLAGS="" \
> +	python_LIBDIR=""

Setting these python_LDFLAGS and python_LIBDIR to empty values looks
weird. Why do you need that? Aren't they empty by default anyway?

> +define LIBTALLOC_CONFIGURE_CMDS
> +	$(INSTALL) -m 0644 package/samba4/samba4-cache.txt $(@D)/cache.txt;
> +	echo 'Checking uname machine type: $(BR2_ARCH)' >>$(@D)/cache.txt;
> +	(cd $(@D); \
> +		$(TARGET_CONFIGURE_OPTS) \
> +		$(LIBTALLOC_CONF_ENV) \
> +		./buildtools/bin/waf configure \
> +			--prefix=/usr \
> +			--sysconfdir=/etc \
> +			--localstatedir=/var \
> +			--with-libiconv=$(STAGING_DIR)/usr \
> +			--cross-compile \
> +			--cross-answers=$(@D)/cache.txt \
> +			--hostcc=gcc \
> +			--disable-rpath \
> +			--disable-rpath-install \
> +			--bundled-libraries='!asn1_compile,!compile_et' \
> +			$(LIBTALLOC_CONF_OPTS) \

Why don't you use the waf-package infrastructure if this is a waf
package ? Hm, I see samba4 is also not using the waf package
infrastructure for some reason.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
