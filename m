From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Mar 2021 22:45:46 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/libqrtr-glib: add as a new
 package
In-Reply-To: <20210325175832.12322-1-petr.vorel@gmail.com>
References: <20210325175832.12322-1-petr.vorel@gmail.com>
Message-ID: <20210328224546.2f501c83@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Petr,

I've applied, after doing a number of changes. See below.

On Thu, 25 Mar 2021 18:58:31 +0100
Petr Vorel <petr.vorel@gmail.com> wrote:

>  package/Config.in                      |  1 +
>  package/libqrtr-glib/Config.in         | 19 +++++++++++++++++++
>  package/libqrtr-glib/libqrtr-glib.hash |  3 +++
>  package/libqrtr-glib/libqrtr-glib.mk   | 15 +++++++++++++++
>  4 files changed, 38 insertions(+)

The entry to the DEVELOPERS file was missing. Without such entry, you
won't be notified for build failures, CVEs or new upstream releases.

> diff --git a/package/libqrtr-glib/Config.in b/package/libqrtr-glib/Config.in
> new file mode 100644
> index 0000000000..d0be16d3ab
> --- /dev/null
> +++ b/package/libqrtr-glib/Config.in
> @@ -0,0 +1,19 @@
> +config BR2_PACKAGE_LIBQRTR_GLIB
> +	bool "libqrtr-glib"
> +	depends on BR2_USE_WCHAR # glib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
> +	depends on BR2_USE_MMU # glib2
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15 # da7653f0faab
> +	select BR2_PACKAGE_LIBGLIB2
> +	help
> +	  Qualcomm IPC Router protocol helper library.
> +	  Optional dependency for libqmi >= 1.28.0.
> +
> +	  https://www.freedesktop.org/software/libqmi/libqrtr-glib/latest/
> +
> +comment "json-glib needs a toolchain w/ wchar, threads"

Bad copy paste: this package is not json-glib :-)

> +	depends on BR2_USE_MMU
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> +
> +comment "libqrtr-glib needs a toolchain w/ headers >= 4.15"
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15

This should have been in the same comment as the wchar/threads
dependency.

> +LIBQRTR_GLIB_VERSION = 1.0.0
> +LIBQRTR_GLIB_SITE = http://www.freedesktop.org/software/libqmi
> +LIBQRTR_GLIB_SOURCE = libqrtr-glib-$(LIBQRTR_GLIB_VERSION).tar.xz
> +LIBQRTR_GLIB_LICENSE_FILES = COPYING.LIB

The LIBQRTR_GLIB_LICENSE variable was missing.

I fixed this up, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
