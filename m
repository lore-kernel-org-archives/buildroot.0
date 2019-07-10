From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 11 Jul 2019 00:34:41 +0200
Subject: [Buildroot] [PATCH] [PATCHv3] package/python-numpy: fix
 occasional build failure with lapack
In-Reply-To: <20190710141940.13504-1-alexandre.payen@smile.fr>
References: <20190710141940.13504-1-alexandre.payen@smile.fr>
Message-ID: <b1bf4a91-4612-e3a7-b033-c2ff549694ed@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Alexandre,

 Please set your user.name and user.email git config options to match your
Signed-off-by.

On 10/07/2019 16:19, Aalx wrote:
> python-numpy build fails if lapack or clapack are build before python-numpy
> itself, and this boesn't always happen because lapack dependency is missing in
> BR2_PYTHON_NUMPY_DEPENDENCIES.

 Well, that's not true: for clapack, the dependency was already there. However,
the SITE_CFG_LIBS and environment were referring to blas/lapack instead of
cblas/clapack.


> Also, clapack is a C implementation of FORTRAN lapack. At build time, they both
> generate the same liblapack.so file. But because lapack is written in FORTRAN
> then, it can be difficult to build. Both package are kept behind a virtual
> package named vlapack. They are mutually exclusive.

 This is pretty much independent of the numpy fix, so should be a separate patch.

 Note, however, there are three ways to make them mutually exclusive.

1. Making it a virtual package - which is what you did. However, the main
purpose of a virtual package is to make it possible to use it in select/depend
without caring about which implementation is chosen. That might apply for
lapack, I'm not sure.

2. Adding an explicit dependency from one on the other in Config.in. E.g.
clapack could depend on !lapack.

3. Adding a dependency on something else which is mutually exclusive. lapack
depends on BR2_TOOLCHAIN_HAS_FORTRAN, so you could just add a dependency on
!BR2_TOOLCHAIN_HAS_FORTRAN to clapack. This makes sense, since the Fortran
implementation is supposed to be the real source, and clapack is more or less
automatically generated from it. Supposedly, lapack should optimise better than
clapack.


 The commit log should explain that these three options exist, and why you
choose that particular one.

[snip]
> diff --git a/package/liblapack/Config.in b/package/liblapack/Config.in
> new file mode 100644
> index 0000000000..fb155d7c02
> --- /dev/null
> +++ b/package/liblapack/Config.in
> @@ -0,0 +1,86 @@
> +config BR2_PACKAGE_VIRTUAL_LAPACK

 The package name and Config.in symbol must correspond with each other. So if
the package is called VIRTUAL_LAPACK, the directory and .mk file should be
called virtual-lapack, etc.

> +	bool "lapack support"
> +	select BR2_PACKAGE_HAS_LAPACK
> +	help
> +	  Select lapack library provider.
> +
> +if BR2_PACKAGE_VIRTUAL_LAPACK
> +
> +choice
> +        prompt "lapack implementation"
> +        default BR2_PACKAGE_LAPACK
> +        help
> +	  Select lapack or clapack implementation.

 This is not formatted properly. Please use check-package to verify formatting.

> +
> +
> +comment "clapack needs a glibc toolchain"
> +	depends on BR2_powerpc
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC
> +
> +config BR2_PACKAGE_CLAPACK

 Unfortunately, it is not possible to put clapack in a choice at the moment,
since armadillo selects it. So you need to adapt armadillo as well to select
BR2_PACKAGE_VIRTUAL_LAPACK instead of BR2_PACKAGE_CLAPACK (and test that it
works with lapack).

 Also, it is not possible to convert existing Config.in symbols into choice
options, because that breaks existing configurations.

 Anyway, there is no real need for a choice. The normal use of a virtual package
is to select the virtual package from the providers. But then, typically, the
user of the virtual package would depend on it, rather than select it.

> +	bool "C implementation"
> +	# _fpu_control is used on PowerPC, but not available with
> +	# uClibc or musl
> +	depends on !BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC
> +	# assembler: Error: value out of range
> +	depends on !BR2_m68k_cf
> +	help
> +	  LAPACK and BLAS C implementation (f2c'ed version of).'
> +
> +	  http://www.netlib.org/clapack/
> +
> +if BR2_PACKAGE_CLAPACK
> +
> +config BR2_PACKAGE_CLAPACK_ARITH_H

 This has to go outside of the choice block.

> +	string "Custom BLAS arith.h"
> +	depends on BR2_PACKAGE_CLAPACK
> +	help
> +	  To optimize BLAS library for the hardware, an 'arith.h' header
> +	  should be provided.
> +
> +	  If empty, the library will not be optimized by the compiler.
> +
> +	  In any case an 'arithchk' program is built
> +	  (but not installed), to be run on the target to generate this
> +	  arith.h header.
> +
> +endif
> +
> +comment "lapack/blas needs a toolchain w/ fortran"
> +	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)
> +	depends on !BR2_TOOLCHAIN_HAS_FORTRAN
> +
> +config BR2_PACKAGE_LAPACK
> +	bool "FORTRAN implementation"
> +	depends on BR2_TOOLCHAIN_HAS_FORTRAN
> +	# _fpu_control is used on PowerPC, but not available with uClibc
> +	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)
> +	help
> +	  LAPACK and BLAS FORTRAN implementation. This package
> +	  installs two libraries: libblas and liblapack.
> +
> +	  http://www.netlib.org/lapack/
> +
> +if BR2_PACKAGE_LAPACK
> +
> +config BR2_PACKAGE_LAPACK_COMPLEX

 This as well.

> +	bool "Complex/Complex16 support"
> +	default y
> +	depends on BR2_PACKAGE_LAPACK
> +	help
> +	  Builds support for COMPLEX and COMPLEX16 data types.
> +
> +endif
> +
> +endchoice
> +
> +config BR2_PACKAGE_HAS_VIRT_LAPACK

 Again, this name should be the same as the package name, so
BR2_PACKAGE_HAS_VIRTUAL_LAPACK.

 Regards,
 Arnout

> +	bool
> +
> +config BR2_PACKAGE_PROVIDES_VIRT_LAPACK
> +        depends on BR2_PACKAGE_HAS_VIRT_LAPACK
> +        string
> +	default "lapack"  if BR2_PACKAGE_LAPACK
> +	default "clapack"  if BR2_PACKAGE_CLAPACK
> +
> +endif
> diff --git a/package/liblapack/liblapack.mk b/package/liblapack/liblapack.mk
> new file mode 100644
> index 0000000000..06cece60f9
> --- /dev/null
> +++ b/package/liblapack/liblapack.mk
> @@ -0,0 +1,7 @@
> +################################################################################
> +#
> +# liblapack
> +#
> +################################################################################
> +
> +$(eval $(virtual-package))
> diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
> index 5d2fbfc7ad..71de61f6e3 100644
> --- a/package/python-numpy/python-numpy.mk
> +++ b/package/python-numpy/python-numpy.mk
> @@ -17,7 +17,12 @@ PYTHON_NUMPY_SETUP_TYPE = setuptools
>  
>  ifeq ($(BR2_PACKAGE_CLAPACK),y)
>  PYTHON_NUMPY_DEPENDENCIES += clapack
> +PYTHON_NUMPY_SITE_CFG_LIBS += cblas clapack
> +PYTHON_NUMPY_ENV += BLAS=clapack LAPACK=clapack
> +else ifeq ($(BR2_PACKAGE_LAPACK_COMPLEX),y)
> +PYTHON_NUMPY_DEPENDENCIES += lapack
>  PYTHON_NUMPY_SITE_CFG_LIBS += blas lapack
> +PYTHON_NUMPY_ENV += BLAS=lapack LAPACK=lapack
>  else
>  PYTHON_NUMPY_ENV += BLAS=None LAPACK=None
>  endif
> 
