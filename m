From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Feb 2019 10:37:49 +0100
Subject: [Buildroot] [PATCH] add library xmlsec1
In-Reply-To: <20190209215351.29395-1-basti171@gmail.com>
References: <20190209215351.29395-1-basti171@gmail.com>
Message-ID: <20190210103749.50caf547@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bastian,

Thanks for your contribution!

First of all, the commit title should be:

	package/xmlsec1: new package

On Sat,  9 Feb 2019 22:53:51 +0100
Bastian Breit <basti171@gmail.com> wrote:

> ---
>  package/Config.in                  |  1 +
>  package/libxmlsec1/COPYING         |  1 +

What is this file about ?

>  package/libxmlsec1/Config.in       | 11 +++++++++++
>  package/libxmlsec1/libxmlsec1.hash |  1 +
>  package/libxmlsec1/libxmlsec1.mk   | 17 +++++++++++++++++
>  5 files changed, 31 insertions(+)

Please add an entry to the DEVELOPERS file for this package.

> diff --git a/package/libxmlsec1/Config.in b/package/libxmlsec1/Config.in
> new file mode 100644
> index 0000000000..836d4db674
> --- /dev/null
> +++ b/package/libxmlsec1/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_LIBXMLSEC1
> +	bool "libxmlsec1"
> +	select BR2_PACKAGE_LIBXML2
> +	select BR2_PACKAGE_LIBXSLT
> +	select BR2_PACKAGE_OPENSSL
> +	help
> +	XMLSec library provides C based implementation for major XML
> +	Security standards:
> +	- XML Signature Syntax and Processing
> +	- XML Encryption Syntax and Processing
> +	https://www.aleksey.com/xmlsec/

The indentation of the help is text is one tab + two spaces, and there
should be one blank line before the upstream URL of the project.

Could you make sure to run "make check-package" ? This validates some
basic coding styles rules in packages.

> diff --git a/package/libxmlsec1/libxmlsec1.hash b/package/libxmlsec1/libxmlsec1.hash
> new file mode 100644
> index 0000000000..ce44e23ac5
> --- /dev/null
> +++ b/package/libxmlsec1/libxmlsec1.hash
> @@ -0,0 +1 @@
> +md5  508bee7e4f1b99f2d50aaa7d38ede56e  xmlsec1-1.2.27.tar.gz

Where does this hash comes from ? Please add a comment above it that
says where it was from. If it was locally calculated, then use a sha256
hash instead, and say so:

# Locally calculated
sha256 .... xmlsec1-1.2.27.tar.gz

If you found this md5 on the upstream website, then say so, and also
include a locally calculated sha256 hash:

# From http://somewhere.com
md5 ... xmlsec1-1.2.27.tar.gz
# Locally calculated
sha256 ... xmlsec1-1.2.27.tar.gz

And finally, add a hash for the license file.

> diff --git a/package/libxmlsec1/libxmlsec1.mk b/package/libxmlsec1/libxmlsec1.mk
> new file mode 100644
> index 0000000000..6bf8944f1e
> --- /dev/null
> +++ b/package/libxmlsec1/libxmlsec1.mk
> @@ -0,0 +1,17 @@

Please include the typical comment header that we have in all
package .mk files.

> +LIBXMLSEC1_VERSION = 1.2.27
> +LIBXMLSEC1_SOURCE = xmlsec1-${LIBXMLSEC1_VERSION}.tar.gz

Please use $(...) instead of ${...}

> +LIBXMLSEC1_SITE = http://www.aleksey.com/xmlsec/download
> +LIBXMLSEC1_INSTALL_STAGING = YES
> +LIBXMLSEC1_INSTALL_TARGET = YES

This line is not needed, as it is the default.

> +LIBXMLSEC1_LICENSE = MIT
> +LIBXMLSEC1_LICENSE_FILES = Copyright
> +
> +LIBXMLSEC1_CONF_OPTS += --disable-static

Please don't pass --disable-static. Passing
--{enable,disable}-{static,shared} is automatically done by the
autotools-package infrastructure.

> +LIBXMLSEC1_CONF_OPTS += --enable-crypto-dl=no
> +LIBXMLSEC1_CONF_OPTS += --with-openssl=${STAGING_DIR}/usr

Use $(...) instead of ${...}

> +LIBXMLSEC1_CONF_OPTS += --with-libxslt=no

Why ? You have a dependency on libxslt. Also, if this dependency is not
mandatory, it should be made optional.

> +LIBXMLSEC1_CONF_OPTS += --with-gnutls=no
> +LIBXMLSEC1_CONF_OPTS += --with-gcrypt=no

So OpenSSL is not mandatory and GnuTLS or GCrypt could be used ? If
that is the case, then it should be supported.

> +LIBXMLSEC1_DEPENDENCIES = libxml2 libxslt openssl
> +
> +$(eval $(autotools-package))

Could you rework your package to address those comments ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
