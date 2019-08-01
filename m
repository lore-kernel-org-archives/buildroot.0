From: Romain Naour <romain.naour@smile.fr>
Date: Thu, 1 Aug 2019 23:14:29 +0200
Subject: [Buildroot] [PATCH] package/dlib: new package
In-Reply-To: <20190702201713.1043-1-romain.naour@smile.fr>
References: <20190702201713.1043-1-romain.naour@smile.fr>
Message-ID: <5d539c14-1433-41eb-f1ce-d9002251a45a@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 02/07/2019 ? 22:17, Romain Naour a ?crit?:
> Build the dlib library using the cmake package infrastructure
> and build the dlib python module as POST_HOOKS instead of
> adding a python-dlib package. Doing so, we borrow some
> variables from the python infrastructure and reuse
> DLIB_CONF_OPTS to convert cmake option (-D) to python
> syntax (--set).

I marked this patch Changes Requested since I'm going to send a new version
after fixing packaging issues.

Best regards,
Romain

> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
> Tested on a potato board (aarch64) using the ARM Aarch64 toolchain.
> This require a fix to python-numpy package [1] to fix a runtime
> issue.
> 
> [1] http://patchwork.ozlabs.org/patch/1114198/
> ---
>  DEVELOPERS             |  1 +
>  package/Config.in      |  1 +
>  package/dlib/Config.in | 42 +++++++++++++++++++++++++++
>  package/dlib/dlib.hash |  2 ++
>  package/dlib/dlib.mk   | 64 ++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 110 insertions(+)
>  create mode 100644 package/dlib/Config.in
>  create mode 100644 package/dlib/dlib.hash
>  create mode 100644 package/dlib/dlib.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index ef6fe1feca..6496af6d88 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1934,6 +1934,7 @@ F:	package/vnstat/
>  N:	Romain Naour <romain.naour@gmail.com>
>  F:	package/aubio/
>  F:	package/bullet/
> +F:	package/dlib/
>  F:	package/efl/
>  F:	package/enet/
>  F:	package/enlightenment/
> diff --git a/package/Config.in b/package/Config.in
> index 076f21712e..41d07c71fa 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1672,6 +1672,7 @@ menu "Other"
>  	source "package/cracklib/Config.in"
>  	source "package/dawgdic/Config.in"
>  	source "package/ding-libs/Config.in"
> +	source "package/dlib/Config.in"
>  	source "package/eigen/Config.in"
>  	source "package/elfutils/Config.in"
>  	source "package/ell/Config.in"
> diff --git a/package/dlib/Config.in b/package/dlib/Config.in
> new file mode 100644
> index 0000000000..086d82857c
> --- /dev/null
> +++ b/package/dlib/Config.in
> @@ -0,0 +1,42 @@
> +config BR2_PACKAGE_DLIB
> +	bool "dlib"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC) # lapack
> +	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_XORG7
> +	depends on BR2_TOOLCHAIN_HAS_FORTRAN # lapack
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_JPEG
> +	select BR2_PACKAGE_LAPACK
> +	select BR2_PACKAGE_LIBPNG
> +	select BR2_PACKAGE_OPENBLAS
> +	select BR2_PACKAGE_XLIB_LIBXEXT
> +	help
> +	  Dlib is a modern C++ toolkit containing machine learning
> +	  algorithms and tools for creating complex software in C++
> +	  to solve real world problems. It is used in both industry
> +	  and academia in a wide range of domains including robotics,
> +	  embedded devices, mobile phones, and large high performance
> +	  computing environments. Dlib's open source licensing allows
> +	  you to use it in any application, free of charge.
> +
> +	  http://dlib.net
> +
> +if BR2_PACKAGE_DLIB
> +
> +config BR2_PACKAGE_DLIB_PYTHON_MODULE
> +	bool "python-dlib"
> +	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
> +	help
> +	  This option provide the dlib python module.
> +
> +	  http://dlib.net
> +
> +endif
> +
> +comment "dlib needs a toolchain w/ C++, threads"
> +	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)
> +	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_XORG7
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
> +		|| !BR2_TOOLCHAIN_HAS_FORTRAN
> diff --git a/package/dlib/dlib.hash b/package/dlib/dlib.hash
> new file mode 100644
> index 0000000000..a3cdd281dc
> --- /dev/null
> +++ b/package/dlib/dlib.hash
> @@ -0,0 +1,2 @@
> +sha256 9d2a158b2adad6acba2346f90d929558a691151aa076a0b409ee685534118692  dlib-v19.17.tar.gz
> +sha256 8d8291caf1cee26d23acf3eb67c9f9a2d58f1c681b16a4fbe8cbfb9e3c0b5a9b  dlib/LICENSE.txt
> diff --git a/package/dlib/dlib.mk b/package/dlib/dlib.mk
> new file mode 100644
> index 0000000000..6189c8da94
> --- /dev/null
> +++ b/package/dlib/dlib.mk
> @@ -0,0 +1,64 @@
> +################################################################################
> +#
> +# dlib
> +#
> +################################################################################
> +
> +DLIB_VERSION = v19.17
> +DLIB_SITE = $(call github,davisking,dlib,$(DLIB_VERSION))
> +DLIB_INSTALL_STAGING = YES
> +DLIB_LICENSE = BSL-1.0
> +DLIB_LICENSE_FILES = dlib/LICENSE.txt
> +
> +DLIB_DEPENDENCIES += \
> +	xlib_libX11 \
> +	xlib_libXext \
> +	lapack \
> +	openblas \
> +	jpeg \
> +	libpng
> +
> +# Disable cuda support for now.
> +DLIB_CONF_OPTS = -DDLIB_USE_CUDA=OFF
> +
> +ifeq ($(BR2_PACKAGE_GIFLIB),y)
> +DLIB_DEPENDENCIES += giflib
> +DLIB_CONF_OPTS += -DDLIB_GIF_SUPPORT=ON
> +else
> +DLIB_CONF_OPTS += -DDLIB_GIF_SUPPORT=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SQLITE),y)
> +DLIB_DEPENDENCIES += sqlite
> +DLIB_CONF_OPTS += -DDLIB_LINK_WITH_SQLITE3=ON
> +else
> +DLIB_CONF_OPTS += -DDLIB_LINK_WITH_SQLITE3=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_DLIB_PYTHON_MODULE),y)
> +
> +DLIB_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
> +
> +# python-dlib call cmake to build the python module library, so we have
> +# to provide at least CMAKE_TOOLCHAIN_FILE to crosscompile.
> +DLIB_PYTHON_BUILD_OPTS += \
> +	--set CMAKE_TOOLCHAIN_FILE="$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
> +	--set CMAKE_INSTALL_PREFIX="/usr" \
> +	--set CMAKE_COLOR_MAKEFILE=OFF \
> +	$(subst -D,--set ,$(DLIB_CONF_OPTS))
> +
> +define DLIB_PYTHON_BUILD_TGT
> +	cd $(@D) && $(PKG_PYTHON_SETUPTOOLS_ENV) $(HOST_DIR)/bin/python \
> +		setup.py build $(DLIB_PYTHON_BUILD_OPTS)
> +endef
> +DLIB_POST_BUILD_HOOKS += DLIB_PYTHON_BUILD_TGT
> +
> +define DLIB_PYTHON_INSTALL_TGT
> +	cd $(@D) && $(PKG_PYTHON_SETUPTOOLS_ENV) $(HOST_DIR)/bin/python \
> +		setup.py install --no-compile $(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS)
> +endef
> +DLIB_POST_INSTALL_TARGET_HOOKS += DLIB_PYTHON_INSTALL_TGT
> +
> +endif
> +
> +$(eval $(cmake-package))
> 
