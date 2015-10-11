From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 11 Oct 2015 10:17:04 +0200
Subject: [Buildroot] [PATCH 1/2] Add package libhackrf
In-Reply-To: <1444546853-1505-1-git-send-email-jrspruitt@gmail.com>
References: <1444546853-1505-1-git-send-email-jrspruitt@gmail.com>
Message-ID: <CAHXCMMLw6W2gQ=u-mw07tOL=E-GNCLtn7wEHRk=CXvcM-8x6Kg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jason,

On Sun, Oct 11, 2015 at 9:00 AM, Jason Pruitt <jrspruitt@gmail.com> wrote:
> Signed-off-by: Jason Pruitt <jrspruitt@gmail.com>
> ---
>  package/Config.in                                  |  1 +
>  .../0001-disabled_shared_library_in_build.patch    | 54 ++++++++++++++++++++++
>  package/libhackrf/Config.in                        |  9 ++++
>  package/libhackrf/libhackrf.mk                     | 21 +++++++++
>  4 files changed, 85 insertions(+)
>  create mode 100644 package/libhackrf/0001-disabled_shared_library_in_build.patch
>  create mode 100644 package/libhackrf/Config.in
>  create mode 100644 package/libhackrf/libhackrf.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 1ceb7d6..0184e46 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -866,6 +866,7 @@ menu "Hardware handling"
>         source "package/libftdi/Config.in"
>         source "package/libftdi1/Config.in"
>         source "package/libgudev/Config.in"
> +       source "package/libhackrf/Config.in"
>         source "package/libhid/Config.in"
>         source "package/libiio/Config.in"
>         source "package/libinput/Config.in"
> diff --git a/package/libhackrf/0001-disabled_shared_library_in_build.patch b/package/libhackrf/0001-disabled_shared_library_in_build.patch
> new file mode 100644
> index 0000000..98a2af8
> --- /dev/null
> +++ b/package/libhackrf/0001-disabled_shared_library_in_build.patch
> @@ -0,0 +1,54 @@
> +diff -rupN hackrf/host/libhackrf/src/CMakeLists.txt libhackrf-v2015.07.2/host/libhackrf/src/CMakeLists.txt
> +--- hackrf/host/libhackrf/src/CMakeLists.txt   2015-10-10 13:31:57.754026872 -0700
> ++++ libhackrf-v2015.07.2/host/libhackrf/src/CMakeLists.txt     2015-10-10 13:30:52.162026628 -0700
> +@@ -27,8 +27,10 @@ set(c_sources ${CMAKE_CURRENT_SOURCE_DIR
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

So, static libs are always built... Don't know if this is an issue
(some other packages may do the same).

> diff --git a/package/libhackrf/Config.in b/package/libhackrf/Config.in
> new file mode 100644
> index 0000000..2666a46
> --- /dev/null
> +++ b/package/libhackrf/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_LIBHACKRF
> +       bool "libhackrf"
> +       select BR2_PACKAGE_LIBUSB
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
> +       help
> +         Library for accessing HackRF SDR boards.
> +
> +         https://github.com/mossmann/hackrf/host/libhackrf

The right url seems to be:
https://github.com/mossmann/hackrf/tree/master/host/libhackrf

> +
> diff --git a/package/libhackrf/libhackrf.mk b/package/libhackrf/libhackrf.mk
> new file mode 100644
> index 0000000..d7ed919
> --- /dev/null
> +++ b/package/libhackrf/libhackrf.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# libhackrf
> +#
> +################################################################################
> +
> +LIBHACKRF_VERSION = v2015.07.2
> +LIBHACKRF_SITE = $(call github,mossmann,hackrf,$(LIBHACKRF_VERSION))
> +LIBHACKRF_LICENSE = GPLv2+
> +LIBHACKRF_LICENSE_FILES = COPYING
> +LIBHACKRF_DEPENDENCIES = libusb
> +LIBHACKRF_SUBDIR = host/libhackrf
> +LIBHACKRF_INSTALL_STAGING = YES
> +
> +ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
> +LIBHACKRF_CONF_OPTS += -DINSTALL_UDEV_RULES=ON
> +else
> +LIBHACKRF_CONF_OPTS += -DINSTALL_UDEV_RULES=OFF
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

Otherwise it looks pretty good :)

Regards,

-- 
Samuel
