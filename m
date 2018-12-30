From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 21:58:47 +0100
Subject: [Buildroot] [PATCH 1/1] exempi: new package
In-Reply-To: <20181218181102.28596-1-averyanovin@gmail.com>
References: <20181218181102.28596-1-averyanovin@gmail.com>
Message-ID: <20181230215847.6a39ff76@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ilya,

Thanks for your contribution! I have applied your patch, but since this
is your first contribution, there were obviously a few issues. Please
read below for details about those issues, in order to improve your
future contributions!

On Tue, 18 Dec 2018 21:11:02 +0300, averyanovin at gmail.com wrote:
> From: Ilya Averyanov <averyanovin@gmail.com>
> 
> Signed-off-by: Ilya Averyanov <averyanovin@gmail.com>
> ---
>  package/Config.in          |  1 +
>  package/exempi/Config.in   |  5 +++++
>  package/exempi/exempi.hash |  2 ++
>  package/exempi/exempi.mk   | 16 ++++++++++++++++

First of all, you should have added an entry in the DEVELOPERS file for
this new package. I have done that, and it will ensure that you will
receive e-mail notifications if there is a build failure caused by this
package.


> diff --git a/package/exempi/Config.in b/package/exempi/Config.in
> new file mode 100644
> index 0000000000..299ee5c482
> --- /dev/null
> +++ b/package/exempi/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_EXEMPI
> +    bool "exempi"
> +    help
> +        Exempi is an implementation of XMP. Version 2.x is based on Adobe XMP SDK.
> +        http://libopenraw.freedesktop.org/wiki/Exempi

The indentation was not correct: this could have been detected by
running "make check-package", which validates the coding style of
packages.

Also, you forgot to select the expat and zlib package, and to depend on
C++ support and dynamic library support.

A Config.in comment was missing to document the C++ and dynamic library
dependencies.

For your next contribution: remember to use the ./utils/test-pkg
script, which will help you validate your package builds fine in a
number of configurations.

> diff --git a/package/exempi/exempi.hash b/package/exempi/exempi.hash
> new file mode 100644
> index 0000000000..65535228e0
> --- /dev/null
> +++ b/package/exempi/exempi.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256 406185feb88e84ea1d4b4251370be2991205790d7113a7e28e192ff46a4f221e  exempi-2.4.5.tar.bz2

The hash of the license file was missing.

> diff --git a/package/exempi/exempi.mk b/package/exempi/exempi.mk
> new file mode 100644
> index 0000000000..44774db6c3
> --- /dev/null
> +++ b/package/exempi/exempi.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# exempi
> +#
> +################################################################################
> +
> +EXEMPI_VERSION = 2.4.5
> +EXEMPI_SOURCE = exempi-$(EXEMPI_VERSION).tar.bz2
> +EXEMPI_SITE = https://libopenraw.freedesktop.org/download
> +EXEMPI_INSTALL_STAGING = YES
> +EXEMPI_CONF_OPTS = --enable-unittest=no

We normally use --disable-foo instead of --enable-foo=no.

> +EXEMPI_DEPENDENCIES = host-pkgconf

expat and zlib were missing from that list.

> +EXEMPI_LICENSE = BSD-3-Clause
> +EXEMPI_LICENSE_FILES = COPYING
> +
> +$(eval $(autotools-package))

I've applied with the above issues fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
