From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 17 Mar 2016 15:16:44 +0100
Subject: [Buildroot] [PATCH 1/1] hackrf-host: new package
In-Reply-To: <1445485902-1256-1-git-send-email-jrspruitt@gmail.com>
References: <1445485902-1256-1-git-send-email-jrspruitt@gmail.com>
Message-ID: <CAGm1_kt-WDzKuKwjbjRy+CLxBZX1A9NzDYxjhc0jq=QJ30T0Wg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jason,

On Thu, Oct 22, 2015 at 5:51 AM, Jason Pruitt <jrspruitt@gmail.com> wrote:
> This patch adds hackrf/host tools and lib for the HackRF SDR.

could you rebase the patch on the latest BR master?

Have you tried to upstream your patches?

> Signed-off-by: Jason Pruitt <jrspruitt@gmail.com>
> ---
>  package/Config.in                                  |  1 +
>  .../0001-make_hackrf-tools_optional.patch          | 21 ++++++++
>  .../0002-disabled_shared_library_in_build.patch    | 61 ++++++++++++++++++++++
>  package/hackrf-host/Config.in                      | 33 ++++++++++++
>  package/hackrf-host/hackrf-host.mk                 | 27 ++++++++++
>  5 files changed, 143 insertions(+)
>  create mode 100644 package/hackrf-host/0001-make_hackrf-tools_optional.patch
>  create mode 100644 package/hackrf-host/0002-disabled_shared_library_in_build.patch
>  create mode 100644 package/hackrf-host/Config.in
>  create mode 100644 package/hackrf-host/hackrf-host.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 9994bcd..2e264e4 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -862,6 +862,7 @@ menu "Hardware handling"
>         source "package/ccid/Config.in"
>         source "package/dtc/Config.in"
>         source "package/gnu-efi/Config.in"
> +       source "package/hackrf-host/Config.in"
>         source "package/lcdapi/Config.in"
>         source "package/libaio/Config.in"
>         source "package/libatasmart/Config.in"
> diff --git a/package/hackrf-host/0001-make_hackrf-tools_optional.patch b/package/hackrf-host/0001-make_hackrf-tools_optional.patch
> new file mode 100644
> index 0000000..85e199f
> --- /dev/null
> +++ b/package/hackrf-host/0001-make_hackrf-tools_optional.patch
> @@ -0,0 +1,21 @@
> +hackrf-host: Make hackrf-tools optional.
> +
> +Enables hackrf-tools to be a compile time option for build.
> +
> +signed-off-by Jason Pruitt <jrspruitt@gmail.com>
> +---
> +diff --git a/host/CMakeLists.txt b/host/CMakeLists.txt
> +index 874163f..b14896e 100644
> +--- a/host/CMakeLists.txt
> ++++ b/host/CMakeLists.txt
> +@@ -4,7 +4,10 @@ cmake_minimum_required(VERSION 2.8)
> + project (hackrf_all)
> +
> + add_subdirectory(libhackrf)
> ++
> ++if(BR2_PACKAGE_HACKRF_TOOLS)
> + add_subdirectory(hackrf-tools)
> ++endif()
> +
> + ########################################################################
> + # Create uninstall target
> diff --git a/package/hackrf-host/0002-disabled_shared_library_in_build.patch b/package/hackrf-host/0002-disabled_shared_library_in_build.patch
> new file mode 100644
> index 0000000..d9e1b38
> --- /dev/null
> +++ b/package/hackrf-host/0002-disabled_shared_library_in_build.patch
> @@ -0,0 +1,61 @@
> +hackrf-host: disable shared library target in build for libhackrf
> +
> +Disable libhackrf shared library target if BUILD_SHARED_LIBS if OFF.
> +
> +signed-off-by Jason Pruitt <jrspruitt@gmail.com>
> +---
> +diff --git a/host/libhackrf/src/CMakeLists.txt b/host/libhackrf/src/CMakeLists.txt
> +index 9d54a8c..13d6906 100644
> +--- a/host/libhackrf/src/CMakeLists.txt
> ++++ b/host/libhackrf/src/CMakeLists.txt
> +@@ -27,8 +27,10 @@ set(c_sources ${CMAKE_CURRENT_SOURCE_DIR}/hackrf.c CACHE INTERNAL "List of C sou
> + set(c_headers ${CMAKE_CURRENT_SOURCE_DIR}/hackrf.h CACHE INTERNAL "List of C headers")
> +
> + # Dynamic library
> +-add_library(hackrf SHARED ${c_sources})
> +-set_target_properties(hackrf PROPERTIES VERSION ${MAJOR_VERSION}.${MINOR_VERSION}.0 SOVERSION 0)
> ++if(BUILD_SHARED_LIBS)
> ++        add_library(hackrf SHARED ${c_sources})
> ++        set_target_properties(hackrf PROPERTIES VERSION ${MAJOR_VERSION}.${MINOR_VERSION}.0 SOVERSION 0)
> ++endif()
> +
> + # Static library
> + add_library(hackrf-static STATIC ${c_sources})
> +@@ -38,12 +40,17 @@ else()
> +       set_target_properties(hackrf-static PROPERTIES OUTPUT_NAME "hackrf")
> + endif()
> +
> +-set_target_properties(hackrf PROPERTIES CLEAN_DIRECT_OUTPUT 1)
> ++if(BUILD_SHARED_LIBS)
> ++        set_target_properties(hackrf PROPERTIES CLEAN_DIRECT_OUTPUT 1)
> ++endif()
> + set_target_properties(hackrf-static PROPERTIES CLEAN_DIRECT_OUTPUT 1)
> +
> ++
> + # Dependencies
> +-target_link_libraries(hackrf ${LIBUSB_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT})
> +-
> ++if(BUILD_SHARED_LIBS)
> ++        target_link_libraries(hackrf ${LIBUSB_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT})
> ++endif()
> ++
> + # For cygwin just force UNIX OFF and WIN32 ON
> + if( ${CYGWIN} )
> +   SET(UNIX OFF)
> +@@ -51,10 +58,12 @@ if( ${CYGWIN} )
> + endif( ${CYGWIN} )
> +
> + if( ${UNIX} )
> +-   install(TARGETS hackrf
> +-           LIBRARY DESTINATION lib${LIB_SUFFIX}
> +-           COMPONENT sharedlibs
> +-           )
> ++   if(BUILD_SHARED_LIBS)
> ++           install(TARGETS hackrf
> ++                   LIBRARY DESTINATION lib${LIB_SUFFIX}
> ++                   COMPONENT sharedlibs
> ++                   )
> ++   endif()
> +    install(TARGETS hackrf-static
> +            ARCHIVE DESTINATION lib${LIB_SUFFIX}
> +            COMPONENT staticlibs
> diff --git a/package/hackrf-host/Config.in b/package/hackrf-host/Config.in
> new file mode 100644
> index 0000000..eabc4b2
> --- /dev/null
> +++ b/package/hackrf-host/Config.in
> @@ -0,0 +1,33 @@
> +comment "hackrf-host needs a toolchain w/ threads"
> +       depends on !BR2_TOOLCHAIN_HAS_THREADS
> +
> +menuconfig BR2_PACKAGE_HACKRF_HOST
> +       bool "hackrf-host"
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
> +       help
> +         Library and tools for accessing HackRF SDR boards.
> +
> +         https://github.com/mossmann/hackrf/tree/master/host
> +
> +if BR2_PACKAGE_HACKRF_HOST
> +
> +config BR2_PACKAGE_LIBHACKRF
> +       bool "libhackrf"
> +       select BR2_PACKAGE_LIBUSB
> +       help
> +         Library for HackRF SDR boards.
> +
> +if BR2_PACKAGE_LIBHACKRF
> +
> +config BR2_PACKAGE_HACKRF_TOOLS
> +       bool "hackrf-tools"
> +       depends on !BR2_STATIC_LIBS && BR2_PACKAGE_HACKRF_HOST
> +       help
> +         Tools for accessing and updating HackRF SDR boards.
> +
> +comment "hackrf-tools needs a toolchain w/ dynamic libs"
> +       depends on BR2_STATIC_LIBS
> +
> +endif
> +
> +endif
> diff --git a/package/hackrf-host/hackrf-host.mk b/package/hackrf-host/hackrf-host.mk
> new file mode 100644
> index 0000000..1eb6424
> --- /dev/null
> +++ b/package/hackrf-host/hackrf-host.mk
> @@ -0,0 +1,27 @@
> +################################################################################
> +#
> +# HACKRF_HOST
> +#
> +################################################################################
> +
> +HACKRF_HOST_VERSION = v2015.07.2
> +HACKRF_HOST_SITE = $(call github,mossmann,hackrf,$(HACKRF_HOST_VERSION))
> +HACKRF_HOST_LICENSE = GPLv2 GPLv2+ BSD-3c
> +HACKRF_HOST_LICENSE_FILES = COPYING
> +HACKRF_HOST_DEPENDENCIES = libusb

please add host-pkgconf dependency

> +HACKRF_HOST_SUBDIR = host
> +HACKRF_HOST_INSTALL_STAGING = YES
> +
> +ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
> +HACKRF_HOST_CONF_OPTS += -DINSTALL_UDEV_RULES=ON
> +else
> +HACKRF_HOST_CONF_OPTS += -DINSTALL_UDEV_RULES=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_HACKRF_TOOLS),y)
> +HACKRF_HOST_CONF_OPTS += -DBUILD_HACKRF_TOOLS=ON
> +else
> +HACKRF_HOST_CONF_OPTS += -DBUILD_HACKRF_TOOLS=OFF
> +endif
> +
> +$(eval $(cmake-package))
> --
> 2.1.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
