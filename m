From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Mar 2015 22:03:49 +0100
Subject: [Buildroot] [PATCH v4 3/3] GNURadio: new package
In-Reply-To: <1425553401-27461-3-git-send-email-gwenj@trabucayre.com>
References: <1425553401-27461-1-git-send-email-gwenj@trabucayre.com>
 <1425553401-27461-3-git-send-email-gwenj@trabucayre.com>
Message-ID: <20150309220349.10f1cb5f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gwenhael Goavec-Merou,

On Thu,  5 Mar 2015 12:03:21 +0100, Gwenhael Goavec-Merou wrote:

> diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
> new file mode 100644
> index 0000000..8e5c516
> --- /dev/null
> +++ b/package/gnuradio/Config.in
> @@ -0,0 +1,42 @@
> +comment "GNURadio needs a toolchain w/ C++, mmu, threads"

GNURadio -> gnuradio

MMU shouldn't be listed in the comment. And you missed largefile, IPv6
and wide char.

> +	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_MMU \
> +		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS \
> +		&& BR2_LARGEFILE && BR2_INET_IPV6)

So, this block should be:

comment "gnuradio needs a toolchain w/ C++, IPv6, threads, largefile, wchar"
	depends on BR2_USE_MMU
	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || \
		!BR2_INET_IPV6

> +config BR2_PACKAGE_GNURADIO
> +	bool "GNURadio"

GNURadio -> gnuradio

> +	depends on BR2_INET_IPV6
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_LARGEFILE
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_MMU
> +	depends on BR2_USE_WCHAR
> +	select BR2_PACKAGE_BOOST
> +	select BR2_PACKAGE_BOOST_DATE_TIME
> +	select BR2_PACKAGE_BOOST_FILESYSTEM
> +	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
> +	select BR2_PACKAGE_BOOST_SYSTEM
> +	select BR2_PACKAGE_BOOST_THREAD
> +

Unneeded empty new line.

> +	help
> +	  GNU Radio is a free & open-source software development toolkit that
> +	  provides signal processing blocks to implement software radios. It can be
> +	  used with readily-available low-cost external RF hardware to create
> +	  software-defined radios, or without hardware in a simulation-like
> +	  environment. It is widely used in hobbyist, academic and commercial
> +	  environments to support both wireless communications research and
> +	  real-world radio systems.

Too long lines, please wrap to 72 columns.

> +
> +	  http://gnuradio.org/
> +
> +if BR2_PACKAGE_GNURADIO
> +
> +config BR2_PACKAGE_GNURADIO_BLOCKS
> +	bool "gnuradio-blocks"

No need to repeat "gnuradio-" in the prompt of sub-options, since they
are indented under the main "gnuradio" option. Maybe use something like
"blocks support" instead. And please add a help text.

> +
> +config BR2_PACKAGE_GNURADIO_PYTHON
> +	select BR2_PACKAGE_BOOST_PYTHON
> +	select BR2_PACKAGE_PYTHON

select after the bool line.

> +	bool "gnuradio-python"

Ditto, the prompt should be "python support" or something like that.
And help text needed.

> +
> +endif
> diff --git a/package/gnuradio/gnuradio-0001-suppress-boost_unitest-detection.patch b/package/gnuradio/gnuradio-0001-suppress-boost_unitest-detection.patch
> new file mode 100644
> index 0000000..7b35a59
> --- /dev/null
> +++ b/package/gnuradio/gnuradio-0001-suppress-boost_unitest-detection.patch

The file name of the patch should be just
0001-suppress-boost_unitest-detection.patch. See the documentation on
how to name patches.

There should also be a description + Signed-off-by line in each patch.

> @@ -0,0 +1,44 @@
> +Index: gnuradio-3.7.5/volk/cmake/VolkBoost.cmake
> +===================================================================
> +--- gnuradio-3.7.5.orig/volk/cmake/VolkBoost.cmake
> ++++ gnuradio-3.7.5/volk/cmake/VolkBoost.cmake
> +@@ -29,7 +29,6 @@ set(__INCLUDED_VOLK_BOOST_CMAKE TRUE)
> + set(BOOST_REQUIRED_COMPONENTS
> +     filesystem
> +     system
> +-    unit_test_framework
> +     program_options
> + )
> + 
> +Index: gnuradio-3.7.5/volk/lib/CMakeLists.txt
> +===================================================================
> +--- gnuradio-3.7.5.orig/volk/lib/CMakeLists.txt
> ++++ gnuradio-3.7.5/volk/lib/CMakeLists.txt
> +@@ -535,27 +535,3 @@ if(ENABLE_STATIC_LIBS)
> +     ARCHIVE DESTINATION lib${LIB_SUFFIX} COMPONENT "volk_devel"   # .lib file
> +     )
> + endif(ENABLE_STATIC_LIBS)
> +-
> +-########################################################################
> +-# Build the QA test application
> +-########################################################################
> +-
> +-
> +-if(Boost_FOUND)
> +-
> +-    set_source_files_properties(
> +-        ${CMAKE_CURRENT_SOURCE_DIR}/testqa.cc PROPERTIES
> +-        COMPILE_DEFINITIONS "BOOST_TEST_DYN_LINK;BOOST_TEST_MAIN"
> +-    )
> +-
> +-    include_directories(${Boost_INCLUDE_DIRS})
> +-    link_directories(${Boost_LIBRARY_DIRS})
> +-
> +-    add_executable(test_all
> +-        ${CMAKE_CURRENT_SOURCE_DIR}/testqa.cc
> +-        ${CMAKE_CURRENT_SOURCE_DIR}/qa_utils.cc
> +-    )
> +-    target_link_libraries(test_all volk ${Boost_LIBRARIES})
> +-    add_test(qa_volk_test_all test_all)
> +-
> +-endif(Boost_FOUND)
> diff --git a/package/gnuradio/gnuradio.hash b/package/gnuradio/gnuradio.hash
> new file mode 100644
> index 0000000..a25b466
> --- /dev/null
> +++ b/package/gnuradio/gnuradio.hash
> @@ -0,0 +1,2 @@
> +# From http://gnuradio.org/redmine/projects/gnuradio/files
> +md5	b4a917a548f41ce25c6c88f9bc864bca	gnuradio-3.7.5.tar.gz
> diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
> new file mode 100644
> index 0000000..4528e55
> --- /dev/null
> +++ b/package/gnuradio/gnuradio.mk
> @@ -0,0 +1,39 @@
> +################################################################################
> +#
> +# gnuradio
> +#
> +################################################################################
> +
> +GNURADIO_VERSION = 3.7.5
> +GNURADIO_SITE = http://gnuradio.org/redmine/attachments/download/792
> +GNURADIO_SOURCE = gnuradio-$(GNURADIO_VERSION).tar.gz

This line is not needed since it's the default.

> +GNURADIO_LICENSE = GPLv3+
> +GNURADIO_LICENSE_FILES = COPYING
> +
> +# gnuradio prevent from in-source-tree build

# gnuradio prevents doing an in-source-tree build

> +GNURADIO_BUILDDIR = $(GNURADIO_SRCDIR)/build
> +
> +#needed for volk compile
> +GNURADIO_DEPENDENCIES += host-python-cheetah
> +GNURADIO_DEPENDENCIES += host-swig host-boost boost

Only one variable assignment needed here:

# <foo> is needed for volk to compile
GNURADIO_DEPENDENCIES = \
	host-python-cheetah \
	host-swig \
	host-boost \
	boost

> +GNURADIO_DEPENDENCIES += $(if $(BR2_PACKAGE_GNURADIO_PYTHON),python)

Please keep the Python related stuff together. We normally do something like:

ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
GNURADIO_DEPENDENCIES += python
GNURADIO_CONF_OPTS += -DENABLE_PYTHON=ON
else
GNURADIO_CONF_OPTS += -DENABLE_PYTHON=OFF
endif

> +
> +GNURADIO_INSTALL_STAGING = YES

Add a comment above this line to explain why it is used.

> +
> +GNURADIO_CONF_OPTS += -DENABLE_DEFAULT=OFF -DENABLE_TESTING=OFF
> +GNURADIO_CONF_OPTS += -DENABLE_VOLK=ON -DENABLE_GNURADIO_RUNTIME=ON

Please put these earlier (i.e before the condition about
BR2_PACKAGE_GNURADIO_PYTHON, and without the += sign. Like this:

GNURADIO_CONF_OPTS = \
	-DENABLE_DEFAULT=OFF \
	-DENABLE_VOLK=ON \
	-DENABLE_GNURADIO_RUNTIME=ON

I intentionally removed -DENABLE_TESTING=OFF since it's already passed
by the cmake package infrastructure.

> +ifeq ($(BR2_arm),y)
> +ifeq ($(BR2_ARM_CPU_HAS_NEON)$(BR2_ARM_EABIHF),yy)
> +GNURADIO_MTUNE = $(call qstrip,$(BR2_GCC_TARGET_CPU))
> +GNURADIO_CONF_OPTS += -DCMAKE_C_FLAGS="-mfloat-abi=hard -mfpu=neon -march=armv7-a -mtune=$(GNURADIO_MTUNE)"
> +GNURADIO_CONF_OPTS += -DCMAKE_ASM_FLAGS="-mfpu=neon -mfloat-abi=hard -march=armv7-a"
> +else
> +GNURADIO_CONF_OPTS += -Dhave_mfpu_neon=0
> +endif
> +endif

Please replace this by:

# Yes, this is silly, because -march is already known by the compiler
# with the internal toolchain, and passed by the external wrapper for
# external toolchains. Nonetheless, gnuradio does some matching on the
# CFLAGS to decide whether to build the NEON functions or not, and
# wants to see the string 'armv7' in the CFLAGS.
ifeq ($(BR2_ARM_CPU_ARMV7A),y)
GNURADIO_CONF_OPTS += -DCMAKE_C_FLAGS="-march=armv7-a"
endif

# As soon as -mfpu=neon is supported by the compiler, gnuradio will try
# to use it. But having NEON support in the compiler doesn't necessarily
# mean we have NEON support in our CPU.
ifeq ($(BR2_ARM_CPU_HAS_NEON),)
GNURADIO_CONF_OPTS += -Dhave_mfpu_neon=0
endif

> +GNURADIO_CONF_OPTS += -DENABLE_GR_BLOCKS=$(if $(BR2_PACKAGE_GNURADIO_BLOCKS),ON,OFF)
> +GNURADIO_CONF_OPTS += -DENABLE_PYTHON=$(if $(BR2_PACKAGE_GNURADIO_PYTHON),ON,OFF)

See above for -DENABLE_PYTHON.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
