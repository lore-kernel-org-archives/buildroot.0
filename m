From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Jun 2020 23:38:02 +0200
Subject: [Buildroot] [NEXT] package/xml-security-c: new package
In-Reply-To: <20200601121741.47471-1-matthew.weber@rockwellcollins.com>
References: <20200601121741.47471-1-matthew.weber@rockwellcollins.com>
Message-ID: <20200604233802.14288540@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matt,

On Mon,  1 Jun 2020 07:17:41 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> From: Chris Simons <chris.simons@rockwellcollins.com>
> 
> Adds support for the Apache Santuario XML Security for C++ that
> implementations the XML Digital Signature and Encryption
> specifications.
> 
> Signed-off-by: Chris Simons <chris.simons@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>

Overall looks good. Two comments below, though.

> diff --git a/package/xml-security-c/0001-Fix-cross-compile-build-failure.patch b/package/xml-security-c/0001-Fix-cross-compile-build-failure.patch
> new file mode 100644
> index 0000000000..6bbfef7a91
> --- /dev/null
> +++ b/package/xml-security-c/0001-Fix-cross-compile-build-failure.patch
> @@ -0,0 +1,37 @@
> +From c783fce79895efbad5138666eb18a1b47f5d0db8 Mon Sep 17 00:00:00 2001
> +From: Chris Simons <chris.simons@rockwellcollins.com>
> +Date: Wed, 13 May 2020 14:12:39 -0500
> +Subject: [PATCH] xml-security-c: Fix cross compile build failure.
> +
> +Fix build for cross compiling.
> +
> +Signed-off-by: Chris Simons <chris.simons@rockwellcollins.com>
> +---
> + configure.ac | 11 -----------
> + 1 file changed, 11 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index b43d7a58..f701069b 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -72,17 +72,6 @@ AC_CHECK_HEADERS([unistd.h direct.h])
> + 
> + AC_CHECK_FUNCS([strcasecmp])
> + 
> +-# Check whether getcwd can dynamically allocate memory.
> +-AC_MSG_CHECKING([whether getcwd(NULL, 0) works])
> +-AC_RUN_IFELSE([AC_LANG_PROGRAM([#include <stdlib.h>
> +-     #include <unistd.h>],
> +-[char *cwd = getcwd(NULL, 0);
> +-return (cwd != NULL) ? EXIT_SUCCESS : EXIT_FAILURE;])],
> +-     [AC_MSG_RESULT(yes)
> +-      AC_DEFINE([XSEC_HAVE_GETCWD_DYN], [1],
> +-         [Define to 1 if getcwd(NULL, 0) works])],
> +-     [AC_MSG_RESULT(no)])

Can we make this upstreamable by enclosing this in an AC_CACHE_VAL or
AC_CACHE_CHECK check? This will allow to override this with an autoconf
cache variable, and avoid the AC_RUN_IFELSE test. It seems like all of
glibc, uclibc-ng and musl support getcwd(NULL, 0).

> +config BR2_PACKAGE_XML_SECURITY_C
> +	bool "xml-security-c"
> +	depends on BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR # xerces

Normally written as:

	depends on BR2_INSTALL_LIBSTDCPP
	depends on BR2_USE_WCHAR

> +	select BR2_PACKAGE_XERCES
> +	select BR2_PACKAGE_OPENSSL
> +	help
> +	  The xml-security-c library is a C++ implementation of
> +	  the XML Digital Signature and Encryption specifications.
> +
> +	  https://santuario.apache.org/cindex.html
> +
> +comment "xml-security-c needs a toolchain w/ C++, wchar"
> +	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)

	depends on !BR2_INSTALL_LIBSTDCPP || \
		!BR2_USE_WCHAR


> +XML_SECURITY_C_VERSION = 2.0.2
> +XML_SECURITY_C_SITE = http://archive.apache.org/dist/santuario/c-library
> +XML_SECURITY_C_LICENSE = Apache-2.0
> +XML_SECURITY_C_LICENSE_FILES = LICENSE.txt
> +XML_SECURITY_C_DEPENDENCIES = xerces

openssl is a runtime dependency only ?

> +XML_SECURITY_C_INSTALL_STAGING = YES
> +
> +# Patched configure.ac
> +XML_SECURITY_C_AUTORECONF = YES
> +
> +$(eval $(autotools-package))

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
