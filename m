From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 23:26:17 +0200
Subject: [Buildroot] [PATCH v2 15/15] package/lapack: new package
In-Reply-To: <20160701162920.19632-16-s.martin49@gmail.com>
References: <20160701162920.19632-1-s.martin49@gmail.com>
 <20160701162920.19632-16-s.martin49@gmail.com>
Message-ID: <20160701232617.1914f0b4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Jul 2016 18:29:20 +0200, Samuel Martin wrote:

> diff --git a/package/lapack/Config.in b/package/lapack/Config.in
> new file mode 100644
> index 0000000..8e028bd
> --- /dev/null
> +++ b/package/lapack/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_LAPACK
> +	bool "lapack/blas"
> +	depends on BR2_TOOLCHAIN_HAS_FORTRAN
> +	# _fpu_control is used on PowerPC, but not available with
> +	# uClibc
> +	depends on !BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC

What about musl here ?

Also, just like we have a comment for packages that need C++ support,
we should probably have a similar comment for packages that need
Fortran support. And of course, the documentation should be updated
accordingly.

> +	help
> +	  LAPACK and BLAS FORTRAN implementation.
> +
> +	  http://www.netlib.org/lapack/
> +
> +config BR2_PACKAGE_LAPACK_COMPLEX
> +	bool "Complex/Complex16 support"
> +	depends on BR2_PACKAGE_LAPACK
> +	default y
> +	help
> +	  Builds support for COMPLEX and COMPLEX16 data types.
> diff --git a/package/lapack/lapack.hash b/package/lapack/lapack.hash
> new file mode 100644
> index 0000000..99d25b5
> --- /dev/null
> +++ b/package/lapack/lapack.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256  a9a0082c918fe14e377bbd570057616768dca76cbdc713457d8199aaa233ffc3  lapack-3.6.0.tgz
> diff --git a/package/lapack/lapack.mk b/package/lapack/lapack.mk
> new file mode 100644
> index 0000000..7656291
> --- /dev/null
> +++ b/package/lapack/lapack.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# lapack
> +#
> +################################################################################
> +
> +# This package provides 2 libraries:
> +# - libblas
> +# - liblapack
> +
> +LAPACK_VERSION = 3.6.0
> +LAPACK_SOURCE = lapack-$(LAPACK_VERSION).tgz
> +LAPACK_LICENSE = BSD-3c (libblas and liblapack)

No need to mention "libblas and liblapack" if that's all what the
package is installing. Specifying what is under what license is only
needed when multiple licenses are used.

> +LAPACK_LICENSE_FILES = LICENSE
> +LAPACK_SITE = http://www.netlib.org/lapack
> +LAPACK_INSTALL_STAGING = YES
> +LAPACK_CONF_OPTS = -DLAPACKE=on -DCBLAS=on
> +
> +ifeq ($(BR2_PACKAGE_LAPACK_COMPLEX),y)
> +LAPACK_CONF_OPTS += -DBUILD_COMPLEX=on -DBUILD_COMPLEX16=on
> +else
> +LAPACK_CONF_OPTS += -DBUILD_COMPLEX=off -DBUILD_COMPLEX16=off
> +endif

Don't we generally use upper-case for ON/OFF in CMake packages ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
