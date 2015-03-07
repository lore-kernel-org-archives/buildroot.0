From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 7 Mar 2015 13:46:46 +0100
Subject: [Buildroot] [PATCH v4 3/3] GNURadio: new package
In-Reply-To: <1425553401-27461-3-git-send-email-gwenj@trabucayre.com>
References: <1425553401-27461-1-git-send-email-gwenj@trabucayre.com>
 <1425553401-27461-3-git-send-email-gwenj@trabucayre.com>
Message-ID: <CAHXCMM+PYBAiuFXxBOHfXghPBW7x8P6ha_w1qb9eEe2wt_1WrQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gwenhael,

On Thu, Mar 5, 2015 at 12:03 PM, Gwenhael Goavec-Merou
<gwenj@trabucayre.com> wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
>
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
> Changes v2 -> v3:
> * move comment at the beginning of the file.
> * add a patch to suppress boost-test dependency.
> * move python dependencies in the specific option.
> * use stable archive instead of git.
> * add hook specific for ARM for using neon if available (without this hook volk
>   fails to build).
> Changes v1 -> v2:
> * overload _BUILDDIR variable to specify build directory
> ---
>  package/Config.in                                  |  1 +
>  package/gnuradio/Config.in                         | 42 +++++++++++++++++++++
>  ...dio-0001-suppress-boost_unitest-detection.patch | 44 ++++++++++++++++++++++
>  package/gnuradio/gnuradio.hash                     |  2 +
>  package/gnuradio/gnuradio.mk                       | 39 +++++++++++++++++++
>  5 files changed, 128 insertions(+)
>  create mode 100644 package/gnuradio/Config.in
>  create mode 100644 package/gnuradio/gnuradio-0001-suppress-boost_unitest-detection.patch
>  create mode 100644 package/gnuradio/gnuradio.hash
>  create mode 100644 package/gnuradio/gnuradio.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index ba45f32..2e167d5 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1041,6 +1041,7 @@ menu "Miscellaneous"
>         source "package/clamav/Config.in"
>         source "package/collectd/Config.in"
>         source "package/empty/Config.in"
> +       source "package/gnuradio/Config.in"
>         source "package/googlefontdirectory/Config.in"
>         source "package/haveged/Config.in"
>         source "package/mcrypt/Config.in"
> diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
> new file mode 100644
> index 0000000..8e5c516
> --- /dev/null
> +++ b/package/gnuradio/Config.in
> @@ -0,0 +1,42 @@
> +comment "GNURadio needs a toolchain w/ C++, mmu, threads"
> +       depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_MMU \
> +               && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS \
> +               && BR2_LARGEFILE && BR2_INET_IPV6)
> +
> +config BR2_PACKAGE_GNURADIO
> +       bool "GNURadio"
> +       depends on BR2_INET_IPV6
> +       depends on BR2_INSTALL_LIBSTDCPP
> +       depends on BR2_LARGEFILE
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
> +       depends on BR2_USE_MMU
> +       depends on BR2_USE_WCHAR
For all these 'depends on', we usually indicate why they are needed, e.g.:
depends on BR2_USE_MMU # use fork()
depends on BR2_INSTALL_LIBSTDCPP # boost

> +       select BR2_PACKAGE_BOOST
> +       select BR2_PACKAGE_BOOST_DATE_TIME
> +       select BR2_PACKAGE_BOOST_FILESYSTEM
> +       select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
> +       select BR2_PACKAGE_BOOST_SYSTEM
> +       select BR2_PACKAGE_BOOST_THREAD
> +
> +       help
> +         GNU Radio is a free & open-source software development toolkit that
> +         provides signal processing blocks to implement software radios. It can be
> +         used with readily-available low-cost external RF hardware to create
> +         software-defined radios, or without hardware in a simulation-like
> +         environment. It is widely used in hobbyist, academic and commercial
> +         environments to support both wireless communications research and
> +         real-world radio systems.
> +
> +         http://gnuradio.org/
> +
> +if BR2_PACKAGE_GNURADIO
> +
> +config BR2_PACKAGE_GNURADIO_BLOCKS
> +       bool "gnuradio-blocks"
> +
> +config BR2_PACKAGE_GNURADIO_PYTHON
> +       select BR2_PACKAGE_BOOST_PYTHON
> +       select BR2_PACKAGE_PYTHON
> +       bool "gnuradio-python"
> +
> +endif
> diff --git a/package/gnuradio/gnuradio-0001-suppress-boost_unitest-detection.patch b/package/gnuradio/gnuradio-0001-suppress-boost_unitest-detection.patch
> new file mode 100644
> index 0000000..7b35a59
> --- /dev/null
> +++ b/package/gnuradio/gnuradio-0001-suppress-boost_unitest-detection.patch
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
Or just (the CMake infra automatically disable some common sample/test
symbols, see [1]):
if(Boost_FOUND AND BUILD_TESTS)

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
> +md5    b4a917a548f41ce25c6c88f9bc864bca        gnuradio-3.7.5.tar.gz
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
> +GNURADIO_LICENSE = GPLv3+
> +GNURADIO_LICENSE_FILES = COPYING
> +
> +# gnuradio prevent from in-source-tree build
> +GNURADIO_BUILDDIR = $(GNURADIO_SRCDIR)/build
> +
> +#needed for volk compile
> +GNURADIO_DEPENDENCIES += host-python-cheetah
> +GNURADIO_DEPENDENCIES += host-swig host-boost boost
Why is host-boost needed?
AFAICS, host-swig and boost is enough.

> +
> +GNURADIO_DEPENDENCIES += $(if $(BR2_PACKAGE_GNURADIO_PYTHON),python)
Is it only python(2) compliant, or does it also support python3?
Hmm... after a quick test it seems cheetah is not python2 compliant :-/

> +
> +GNURADIO_INSTALL_STAGING = YES
> +
> +GNURADIO_CONF_OPTS += -DENABLE_DEFAULT=OFF -DENABLE_TESTING=OFF
> +GNURADIO_CONF_OPTS += -DENABLE_VOLK=ON -DENABLE_GNURADIO_RUNTIME=ON
> +ifeq ($(BR2_arm),y)
> +ifeq ($(BR2_ARM_CPU_HAS_NEON)$(BR2_ARM_EABIHF),yy)
> +GNURADIO_MTUNE = $(call qstrip,$(BR2_GCC_TARGET_CPU))
> +GNURADIO_CONF_OPTS += -DCMAKE_C_FLAGS="-mfloat-abi=hard -mfpu=neon -march=armv7-a -mtune=$(GNURADIO_MTUNE)"
Hum... Dubious! Enforcing these target flags won't play very well with
the toolchain wrapper!
Also, how about aarch64 targets?

> +GNURADIO_CONF_OPTS += -DCMAKE_ASM_FLAGS="-mfpu=neon -mfloat-abi=hard -march=armv7-a"
ditto

> +else
> +GNURADIO_CONF_OPTS += -Dhave_mfpu_neon=0
Since you explicitly disable have_fpu_neon symbol here in the
else-block, please set it in the if-block as well.

> +endif
> +endif
> +
> +GNURADIO_CONF_OPTS += -DENABLE_GR_BLOCKS=$(if $(BR2_PACKAGE_GNURADIO_BLOCKS),ON,OFF)
> +GNURADIO_CONF_OPTS += -DENABLE_PYTHON=$(if $(BR2_PACKAGE_GNURADIO_PYTHON),ON,OFF)
> +
> +$(eval $(cmake-package))
> --
> 2.0.5
>

[1] http://nightly.buildroot.org/manual.html#cmake-package-reference

Regards,

-- 
Samuel
