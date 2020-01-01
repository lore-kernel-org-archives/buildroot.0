From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 1 Jan 2020 11:29:40 +0100
Subject: [Buildroot] [PATCH] package/dlib: new package
In-Reply-To: <20190802121540.17377-1-alexandre.payen@smile.fr>
References: <20190802121540.17377-1-alexandre.payen@smile.fr>
Message-ID: <20200101102940.GG3519@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexandre, Romain, All,

Sorry for the long delay before this review...

On 2019-08-02 14:15 +0200, Aalx spake thusly:
> From: Romain Naour <romain.naour@smile.fr>
> 
> Build the dlib library using the cmake package infrastructure
> and build the dlib python module as POST_HOOKS instead of
> adding a python-dlib package. Doing so, we borrow some
> variables from the python infrastructure and reuse
> DLIB_CONF_OPTS to convert cmake option (-D) to python
> syntax (--set).
> 
> Don't use bundled version of libpng and libjpeg
> Unconditionally use blas and liblapack since dlib needs a lot of
> math support.
> 
> Testing this package with test-pkg show an error on `exception_ptr`.
> This exception_ptr is present in newer version of GCC. To fix this a new
> depedencie is added.
> 
> The dlib.mk needs to handle AVX_IS_AVAILABLE_ON_HOST and
> SSE4_IS_AVAILABLE_ON_HOST to avoid runing a test program
> build with the cross-compiler on the host.
> 
> Otherwise, the build stop while using try_run when cross-compiling
> for the same architecture (x86_64 to x86_64).
> 
> So:
> - dlib depends on NOT BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> - dlib handle AVX_IS_AVAILABLE_ON_HOST
> - dlib handle SSE4_IS_AVAILABLE_ON_HOST
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Alexandre PAYEN <alexandre.payen@smile.fr>

I worked on this patch this morning, and was about to push, but at the
last minute I noticed that this depends on the package liblapack, which
does not exist in Buildroot. We only have lapack and clapack.

Otherwise, here is a list of changes I had already made before bailiong
out on this lapack issue:

  - first thing I did was drop the python stuff: I know we may do
    similar stuff in other packages, but it really looks clumsy,

  - also I think it is easier to review and work on new packages when
    they are made as simple as possible (the complexity of this one
    might explain why it was not reviewed so far...); for example:
      - simple dlib package with everything default to sane values:
        no cuda, nosqlite, no giflib, no gui, no python; only the AVX,
        SSE and NEON conditions shoud be there
      - second patch enables giflib
      - third patch enables sqlite
      - fourth patch enables gui
      - and so on...
    (the order may vary, but you get the idea)

  - the bundled patch has been applied upstream, so I used git
    format-patch  to regenerate it, so it is exactly as it appears
    upstream:
        git format-patch -1 -N 7e70a92765aa8

  - forcibly disable MKL_FFT as well

So, appart from the liblapack issue, I was ready to apply it.

Care to address those comments, check on thr lapack issue, and
respin, please?

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS                                    |   1 +
>  package/Config.in                             |   1 +
>  ...gnore-the-check-between-host-python-.patch |  68 ++++++++++++
>  package/dlib/Config.in                        |  48 ++++++++
>  package/dlib/dlib.hash                        |   2 +
>  package/dlib/dlib.mk                          | 103 ++++++++++++++++++
>  6 files changed, 223 insertions(+)
>  create mode 100644 package/dlib/0001-pybind11-cmake-ignore-the-check-between-host-python-.patch
>  create mode 100644 package/dlib/Config.in
>  create mode 100644 package/dlib/dlib.hash
>  create mode 100644 package/dlib/dlib.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 74f52d26fd..ef33b46483 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1933,6 +1933,7 @@ F:	package/vnstat/
>  N:	Romain Naour <romain.naour@gmail.com>
>  F:	package/aubio/
>  F:	package/bullet/
> +F:	package/dlib/
>  F:	package/efl/
>  F:	package/enet/
>  F:	package/enlightenment/
> diff --git a/package/Config.in b/package/Config.in
> index 12eadbd483..165dafe13e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1674,6 +1674,7 @@ menu "Other"
>  	source "package/cracklib/Config.in"
>  	source "package/dawgdic/Config.in"
>  	source "package/ding-libs/Config.in"
> +	source "package/dlib/Config.in"
>  	source "package/eigen/Config.in"
>  	source "package/elfutils/Config.in"
>  	source "package/ell/Config.in"
> diff --git a/package/dlib/0001-pybind11-cmake-ignore-the-check-between-host-python-.patch b/package/dlib/0001-pybind11-cmake-ignore-the-check-between-host-python-.patch
> new file mode 100644
> index 0000000000..6e6ff23072
> --- /dev/null
> +++ b/package/dlib/0001-pybind11-cmake-ignore-the-check-between-host-python-.patch
> @@ -0,0 +1,68 @@
> +From a6f3cd320777217fcfafeb863146e1c7b57454e1 Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@smile.fr>
> +Date: Sun, 28 Jul 2019 21:54:47 +0200
> +Subject: [PATCH] pybind11: cmake: ignore the check between host-python and
> + cross-compiler
> +
> +When dlib is compiling, cmake will compare python architecture and target
> +architecture. So in cross-compiling case, it is irrevelant because host and
> +target architecture often differs. The main problem come from checking python
> +architecture on host and not on target.
> +
> +Here is an error when compiling dlib from x86_64 to arm 32-bit target :
> +```
> +Python config failure: Python is 64-bit, chosen compiler is 32-bit
> +```
> +
> +So :
> +- Skipping the comparation when cross-compiling is enabled.
> +
> +Upstream status : upstream
> +https://github.com/davisking/dlib/pull/1848
> +
> +Signed-off-by: Romain Naour <romain.naour@smile.fr>
> +Signed-off-by: Alexandre PAYEN <alexandre.payen@smile.fr>
> +---
> + .../pybind11/tools/FindPythonLibsNew.cmake    | 25 +++++++++++--------
> + 1 file changed, 14 insertions(+), 11 deletions(-)
> +
> +diff --git a/dlib/external/pybind11/tools/FindPythonLibsNew.cmake b/dlib/external/pybind11/tools/FindPythonLibsNew.cmake
> +index b29b287d..690724af 100644
> +--- a/dlib/external/pybind11/tools/FindPythonLibsNew.cmake
> ++++ b/dlib/external/pybind11/tools/FindPythonLibsNew.cmake
> +@@ -113,18 +113,21 @@ list(GET _PYTHON_VALUES 7 PYTHON_LIBRARY_SUFFIX)
> + list(GET _PYTHON_VALUES 8 PYTHON_LIBDIR)
> + list(GET _PYTHON_VALUES 9 PYTHON_MULTIARCH)
> + 
> +-# Make sure the Python has the same pointer-size as the chosen compiler
> +-# Skip if CMAKE_SIZEOF_VOID_P is not defined
> +-if(CMAKE_SIZEOF_VOID_P AND (NOT "${PYTHON_SIZEOF_VOID_P}" STREQUAL "${CMAKE_SIZEOF_VOID_P}"))
> +-    if(PythonLibsNew_FIND_REQUIRED)
> +-        math(EXPR _PYTHON_BITS "${PYTHON_SIZEOF_VOID_P} * 8")
> +-        math(EXPR _CMAKE_BITS "${CMAKE_SIZEOF_VOID_P} * 8")
> +-        message(FATAL_ERROR
> +-            "Python config failure: Python is ${_PYTHON_BITS}-bit, "
> +-            "chosen compiler is  ${_CMAKE_BITS}-bit")
> ++# Ignore this test while crosscompiling otherwise it will use the host python.
> ++IF(NOT CMAKE_CROSSCOMPILING)
> ++    # Make sure the Python has the same pointer-size as the chosen compiler
> ++    # Skip if CMAKE_SIZEOF_VOID_P is not defined
> ++    if(CMAKE_SIZEOF_VOID_P AND (NOT "${PYTHON_SIZEOF_VOID_P}" STREQUAL "${CMAKE_SIZEOF_VOID_P}"))
> ++        if(PythonLibsNew_FIND_REQUIRED)
> ++            math(EXPR _PYTHON_BITS "${PYTHON_SIZEOF_VOID_P} * 8")
> ++            math(EXPR _CMAKE_BITS "${CMAKE_SIZEOF_VOID_P} * 8")
> ++            message(FATAL_ERROR
> ++                "Python config failure: Python is ${_PYTHON_BITS}-bit, "
> ++                "chosen compiler is  ${_CMAKE_BITS}-bit")
> ++        endif()
> ++        set(PYTHONLIBS_FOUND FALSE)
> ++        return()
> +     endif()
> +-    set(PYTHONLIBS_FOUND FALSE)
> +-    return()
> + endif()
> + 
> + # The built-in FindPython didn't always give the version numbers
> +-- 
> +2.21.0
> +
> diff --git a/package/dlib/Config.in b/package/dlib/Config.in
> new file mode 100644
> index 0000000000..9ba6cf2526
> --- /dev/null
> +++ b/package/dlib/Config.in
> @@ -0,0 +1,48 @@
> +config BR2_PACKAGE_DLIB
> +	bool "dlib"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_PACKAGE_LIBLAPACK
> +	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
> +	select BR2_PACKAGE_JPEG
> +	select BR2_PACKAGE_LIBPNG
> +	select BR2_PACKAGE_OPENBLAS
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
> +config BR2_PACKAGE_DLIB_GUI_SUPPORT
> +	bool "dlib GUI support"
> +	depends on BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_XLIB_LIBXEXT
> +	help
> +	  This option enable the GUI widgets using X.Org.
> +
> +comment "dlib GUI support needs X.Org"
> +	depends on !BR2_PACKAGE_XORG7
> +
> +config BR2_PACKAGE_DLIB_PYTHON_MODULE
> +	bool "python-dlib"
> +	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
> +	help
> +	  This option provide the dlib python module.
> +
> +endif
> +
> +comment "dlib needs a toolchain w/ C++, threads"
> +	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> +
> +comment "dlib needs exception_ptr"
> +	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
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
> index 0000000000..fff48a8533
> --- /dev/null
> +++ b/package/dlib/dlib.mk
> @@ -0,0 +1,103 @@
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
> +DLIB_DEPENDENCIES += host-pkgconf liblapack openblas jpeg libpng
> +
> +# Disable cuda support.
> +# Don't use bundled version of libpng and jpeg
> +DLIB_CONF_OPTS = -DDLIB_USE_CUDA=OFF \
> +	-DDLIB_JPEG_SUPPORT=ON \
> +	-DDLIB_PNG_SUPPORT=ON \
> +	-DDLIB_USE_BLAS=ON \
> +	-DDLIB_USE_LAPACK=ON
> +
> +# Set AVX_IS_AVAILABLE_ON_HOST to avoid using try_run while crosscompiling.
> +ifeq ($(BR2_X86_CPU_HAS_AVX),y)
> +DLIB_CONF_OPTS += -DUSE_AVX_INSTRUCTIONS=ON \
> +	-DAVX_IS_AVAILABLE_ON_HOST=ON
> +else
> +DLIB_CONF_OPTS += -DUSE_AVX_INSTRUCTIONS=OFF \
> +	-DAVX_IS_AVAILABLE_ON_HOST=OFF
> +endif
> +
> +# Set SSE4_IS_AVAILABLE_ON_HOST to avoid using try_run while crosscompiling.
> +ifeq ($(BR2_X86_CPU_HAS_SSE4),y)
> +DLIB_CONF_OPTS += -DUSE_SSE4_INSTRUCTIONS=ON \
> +	-DSSE4_IS_AVAILABLE_ON_HOST=ON
> +else
> +DLIB_CONF_OPTS += -DUSE_SSE4_INSTRUCTIONS=OFF \
> +	-DSSE4_IS_AVAILABLE_ON_HOST=OFF
> +endif
> +
> +ifeq ($(BR2_ARM_ENABLE_NEON),y)
> +DLIB_CONF_OPTS += -DUSE_NEON_INSTRUCTIONS=ON \
> +	-DARM_NEON_IS_AVAILABLE=ON
> +else
> +DLIB_CONF_OPTS += -DUSE_NEON_INSTRUCTIONS=OFF \
> +	-DARM_NEON_IS_AVAILABLE=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_DLIB_GUI_SUPPORT),y)
> +DLIB_DEPENDENCIES += xlib_libX11 xlib_libXext
> +DLIB_CONF_OPTS += -DDLIB_NO_GUI_SUPPORT=OFF
> +else
> +DLIB_CONF_OPTS += -DDLIB_NO_GUI_SUPPORT=ON
> +endif
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
> +DLIB_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),python3,python) \
> +	$(if $(BR2_PACKAGE_PYTHON3),host-python3-setuptools,host-python-setuptools)
> +
> +# python-dlib call cmake to build the python module library, so we have
> +# to provide at least CMAKE_TOOLCHAIN_FILE to crosscompile.
> +DLIB_PYTHON_BUILD_OPTS += \
> +	--set CMAKE_TOOLCHAIN_FILE="$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
> +	--set CMAKE_INSTALL_PREFIX="/usr" \
> +	--set CMAKE_COLOR_MAKEFILE=OFF \
> +	$(subst -D,--set ,$(DLIB_CONF_OPTS))
> +
> +define DLIB_PYTHON_BUILD
> +	cd $(@D) && $(PKG_PYTHON_SETUPTOOLS_ENV) $(HOST_DIR)/bin/python \
> +		setup.py build $(DLIB_PYTHON_BUILD_OPTS)
> +endef
> +DLIB_POST_BUILD_HOOKS += DLIB_PYTHON_BUILD
> +
> +define DLIB_PYTHON_INSTALL_STAGING
> +	cd $(@D) && $(PKG_PYTHON_SETUPTOOLS_ENV) $(HOST_DIR)/bin/python \
> +		setup.py install $(PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS)
> +endef
> +DLIB_POST_INSTALL_STAGING_HOOKS += DLIB_PYTHON_INSTALL_STAGING
> +
> +define DLIB_PYTHON_INSTALL_TARGET
> +	cd $(@D) && $(PKG_PYTHON_SETUPTOOLS_ENV) $(HOST_DIR)/bin/python \
> +		setup.py install --no-compile $(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS)
> +endef
> +DLIB_POST_INSTALL_TARGET_HOOKS += DLIB_PYTHON_INSTALL_TARGET
> +
> +endif
> +
> +$(eval $(cmake-package))
> -- 
> 2.21.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
