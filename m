From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 25 Sep 2019 00:24:21 +0200
Subject: [Buildroot] [PATCH v3 2/2] package/python-scipy: new package
In-Reply-To: <20190924143946.101846-2-esben@geanix.com>
References: <20190924143946.101846-1-esben@geanix.com>
 <20190924143946.101846-2-esben@geanix.com>
Message-ID: <59c0bc63-5a32-eff9-a8dc-42bb9f513acd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24/09/2019 16:39, Esben Haabendal wrote:

 We'd like a bit more commit log to explain the intricacies of this package -
see below.

> ---
>  DEVELOPERS                             |  1 +
>  package/Config.in                      |  1 +
>  package/python-scipy/Config.in         | 20 ++++++++++++++
>  package/python-scipy/python-scipy.hash |  9 +++++++
>  package/python-scipy/python-scipy.mk   | 37 ++++++++++++++++++++++++++
>  5 files changed, 68 insertions(+)
>  create mode 100644 package/python-scipy/Config.in
>  create mode 100644 package/python-scipy/python-scipy.hash
>  create mode 100644 package/python-scipy/python-scipy.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 67a0fef0886d..975a197404bb 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -723,6 +723,7 @@ F:	package/szip/
>  N:	Esben Haabendal <esben@haabendal.dk>
>  F:	boot/gummiboot/
>  F:	package/python-kiwisolver/
> +F:	package/python-scipy/
>  
>  N:	Etienne Carriere <etienne.carriere@linaro.org>
>  F:	boot/optee-os/
> diff --git a/package/Config.in b/package/Config.in
> index dbf297f4df39..818a2abca591 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1056,6 +1056,7 @@ menu "External python modules"
>  	source "package/python-scapy/Config.in"
>  	source "package/python-scapy3k/Config.in"
>  	source "package/python-schedule/Config.in"
> +	source "package/python-scipy/Config.in"
>  	source "package/python-sdnotify/Config.in"
>  	source "package/python-secretstorage/Config.in"
>  	source "package/python-see/Config.in"
> diff --git a/package/python-scipy/Config.in b/package/python-scipy/Config.in
> new file mode 100644
> index 000000000000..8396b507d2ca
> --- /dev/null
> +++ b/package/python-scipy/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_PYTHON_SCIPY
> +	bool "python-scipy"
> +	depends on BR2_PACKAGE_PYTHON3
> +	depends on BR2_TOOLCHAIN_HAS_FORTRAN
> +	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS

 You forgot

        depends on !BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC # clapack
        depends on !BR2_m68k_cf # clapack
	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy

 Also, the 4 arch dependencies should be first, and then the toolchain
dependencies. I'm not sure where we put the python3 dependency.

> +	select BR2_PACKAGE_HOST_PYTHON_CYTHON
> +	select BR2_PACKAGE_PYTHON_NUMPY
> +	select BR2_PACKAGE_OPENBLAS
> +	select BR2_PACKAGE_CLAPACK

 This clapack, fortran, openblas stuff really needs some explanation in the
commit message. Why clapack and not lapack or the lapack bundled with openblas?
Why Fortran? etc.

> +	help
> +	  The SciPy library is one of the core packages that make up the SciPy
> +	  stack. It provides many user-friendly and efficient numerical
> +	  routines such as routines for numerical integration, interpolation,
> +	  optimization, linear algebra and statistics.
> +
> +	  https://www.scipy.org/scipylib/
> +
> +comment "python-scipy needs a toolchain w/ fortran"
> +	depends on !BR2_TOOLCHAIN_HAS_FORTRAN

 Python3 and glibc/musl dependency should be added as well, and the arch
dependencies should be repeated. I.e.

	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
        depends on !BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC # clapack
        depends on !BR2_m68k_cf # clapack

	depends on !BR2_TOOLCHAIN_HAS_FORTRAN || \
		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
		!BR2_PACKAGE_PYTHON3

> diff --git a/package/python-scipy/python-scipy.hash b/package/python-scipy/python-scipy.hash
> new file mode 100644
> index 000000000000..6b0c3605a3b8
> --- /dev/null
> +++ b/package/python-scipy/python-scipy.hash
> @@ -0,0 +1,9 @@
> +# Locally generated
> +sha256 4ea68de2840cf7d35c58464412d21f6f154cab7fba610c11002603ee0b9e2372  python-scipy-1.3.1.tar.gz
> +sha256 904942f7df1dc0f4a48af8d72405854fd96497bd1fe9ddb2c69d1797c22dfcd7  LICENSE.txt
> +sha256 37e64a498894ac7c3b070023e3689e954a8ecf8a23b90968d09a455f1b4f7b35  scipy/linalg/src/lapack_deprecations/LICENSE
> +sha256 606209a000716c5f66e33e180ce08434b96ed17db4975ab9723c6b5fbcc89609  scipy/ndimage/LICENSE.txt
> +sha256 3df9207af2fdb861af0ae3b22026f163b9bcfab4e525dc4943afe2ffa3f77624  scipy/optimize/tnc/LICENSE
> +sha256 f0cedf52503b2d42b83411a0a16e6fefac346dfad8fddc66f50050150123470c  scipy/sparse/linalg/dsolve/SuperLU/License.txt
> +sha256 0926566f9f406178d1214f8cc796e166b1213dd7c05e0c5b461a8b8ac9e50bbe  scipy/sparse/linalg/eigen/arpack/ARPACK/COPYING
> +sha256 51a5a08d537b34febb851c761496ead461f90b6c3c46a5248780d63870124e9c  scipy/spatial/qhull_src/COPYING.txt
> diff --git a/package/python-scipy/python-scipy.mk b/package/python-scipy/python-scipy.mk
> new file mode 100644
> index 000000000000..4ba3f286431b
> --- /dev/null
> +++ b/package/python-scipy/python-scipy.mk
> @@ -0,0 +1,37 @@
> +################################################################################
> +#
> +# python-scipy
> +#
> +################################################################################
> +
> +PYTHON_SCIPY_VERSION = 1.3.1
> +PYTHON_SCIPY_SITE = $(call github,scipy,scipy,v$(PYTHON_SCIPY_VERSION))
> +PYTHON_SCIPY_LICENSE = BSD-3-Clause, BSD-2-Clause, BSD, BSD-Style, PSF, \

 PSF is no SPDX abbreviation, it's Python-2.0

 However, IIUC this license only applies to the scipy-sphinx-theme, which isn't
used in our build, so it can be removed from the license list.

> +	Apache-2.0, MIT
> +PYTHON_SCIPY_LICENSE_FILES = LICENSE.txt \

 Split the line before already, so

PYTHON_SCIPY_LICENSE_FILES = \
	LICENSE.txt \

 Also, I think it's useful to add the LICENSES_bundled.txt, because changes in
that file should be noticed (i.e. the hash changes).

> +	scipy/linalg/src/lapack_deprecations/LICENSE \
> +	scipy/ndimage/LICENSE.txt \
> +	scipy/optimize/tnc/LICENSE \
> +	scipy/sparse/linalg/dsolve/SuperLU/License.txt \
> +	scipy/sparse/linalg/eigen/arpack/ARPACK/COPYING \
> +	scipy/spatial/qhull_src/COPYING.txt
> +PYTHON_SCIPY_SETUP_TYPE = setuptools
> +PYTHON_SCIPY_DEPENDENCIES += host-python-cython host-python-numpy python-numpy \
> +	openblas clapack
> +
> +PYTHON_SCIPY_BUILD_OPTS = config_fc --fcompiler=gnu95
> +PYTHON_SCIPY_ENV += F90=$(TARGET_CROSS)gfortran F77=$(TARGET_CROSS)gfortran
> +
> +define PYTHON_SCIPY_CONFIGURE_CMDS
> +	-rm -f $(@D)/site.cfg
> +	echo "[DEFAULT]" >> $(@D)/site.cfg
> +	echo "library_dirs = $(STAGING_DIR)/usr/lib" >> $(@D)/site.cfg
> +	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(@D)/site.cfg

 It would also be useful to comment about the site.cfg in the commit message.

> +endef
> +
> +# Use the target numpy pkg-config configuration files modified for target
> +# cross-compilation.  Without this, numpy distutils will cause the linker to
> +# link with host libnpymath.a.

 Excellent comment!

 Regards,
 Arnout

> +PYTHON_SCIPY_ENV += NPY_PKG_CONFIG_PATH=$(PYTHON_NUMPY_NPY_PKG_CONFIG_PATH)
> +
> +$(eval $(python-package))
> 
