From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Jul 2020 13:03:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/libzip: fix build with cmake <
 3.16
In-Reply-To: <20200725102322.1197842-1-fontaine.fabrice@gmail.com>
References: <20200725102322.1197842-1-fontaine.fabrice@gmail.com>
Message-ID: <20200725110337.GO2296@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-07-25 12:23 +0200, Fabrice Fontaine spake thusly:
> Fixes:
>  - http://autobuild.buildroot.org/results/7e996aebafa4c690ff130b7d18e5b09c7b255829
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...001-Add-FindGnuTLS-cmake-from-3-17-3.patch | 103 ++++++++++++++++++
>  1 file changed, 103 insertions(+)
>  create mode 100644 package/libzip/0001-Add-FindGnuTLS-cmake-from-3-17-3.patch
> 
> diff --git a/package/libzip/0001-Add-FindGnuTLS-cmake-from-3-17-3.patch b/package/libzip/0001-Add-FindGnuTLS-cmake-from-3-17-3.patch
> new file mode 100644
> index 0000000000..30bc201048
> --- /dev/null
> +++ b/package/libzip/0001-Add-FindGnuTLS-cmake-from-3-17-3.patch
> @@ -0,0 +1,103 @@
> +From 73f6f8ebff678a0847e6b197b574082cc285b528 Mon Sep 17 00:00:00 2001
> +From: Thomas Klausner <tk@giga.or.at>
> +Date: Sat, 25 Jul 2020 12:03:29 +0200
> +Subject: [PATCH] Add FindGnuTLS.cmake from 3.17.3.
> +
> +Addresses #199
> +
> +[Retrieved from:
> +https://github.com/nih-at/libzip/commit/73f6f8ebff678a0847e6b197b574082cc285b528]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + cmake-compat/FindGnuTLS.cmake | 82 +++++++++++++++++++++++++++++++++++
> + 1 file changed, 82 insertions(+)
> + create mode 100644 cmake-compat/FindGnuTLS.cmake
> +
> +diff --git a/cmake-compat/FindGnuTLS.cmake b/cmake-compat/FindGnuTLS.cmake
> +new file mode 100644
> +index 00000000..819f0001
> +--- /dev/null
> ++++ b/cmake-compat/FindGnuTLS.cmake
> +@@ -0,0 +1,82 @@
> ++# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
> ++# file Copyright.txt or https://cmake.org/licensing for details.
> ++
> ++#[=======================================================================[.rst:
> ++FindGnuTLS
> ++----------
> ++
> ++Find the GNU Transport Layer Security library (gnutls)
> ++
> ++IMPORTED Targets
> ++^^^^^^^^^^^^^^^^
> ++
> ++This module defines :prop_tgt:`IMPORTED` target ``GnuTLS::GnuTLS``, if
> ++gnutls has been found.
> ++
> ++Result Variables
> ++^^^^^^^^^^^^^^^^
> ++
> ++``GNUTLS_FOUND``
> ++  System has gnutls
> ++``GNUTLS_INCLUDE_DIR``
> ++  The gnutls include directory
> ++``GNUTLS_LIBRARIES``
> ++  The libraries needed to use gnutls
> ++``GNUTLS_DEFINITIONS``
> ++  Compiler switches required for using gnutls
> ++``GNUTLS_VERSION``
> ++  version of gnutls.
> ++#]=======================================================================]
> ++
> ++# Note that this doesn't try to find the gnutls-extra package.
> ++
> ++
> ++if (GNUTLS_INCLUDE_DIR AND GNUTLS_LIBRARY)
> ++  # in cache already
> ++  set(gnutls_FIND_QUIETLY TRUE)
> ++endif ()
> ++
> ++if (NOT WIN32)
> ++  # try using pkg-config to get the directories and then use these values
> ++  # in the find_path() and find_library() calls
> ++  # also fills in GNUTLS_DEFINITIONS, although that isn't normally useful
> ++  find_package(PkgConfig QUIET)
> ++  PKG_CHECK_MODULES(PC_GNUTLS QUIET gnutls)
> ++  set(GNUTLS_DEFINITIONS ${PC_GNUTLS_CFLAGS_OTHER})
> ++  set(GNUTLS_VERSION ${PC_GNUTLS_VERSION})
> ++  # keep for backward compatibility
> ++  set(GNUTLS_VERSION_STRING ${PC_GNUTLS_VERSION})
> ++endif ()
> ++
> ++find_path(GNUTLS_INCLUDE_DIR gnutls/gnutls.h
> ++  HINTS
> ++    ${PC_GNUTLS_INCLUDEDIR}
> ++    ${PC_GNUTLS_INCLUDE_DIRS}
> ++  )
> ++
> ++find_library(GNUTLS_LIBRARY NAMES gnutls libgnutls
> ++  HINTS
> ++    ${PC_GNUTLS_LIBDIR}
> ++    ${PC_GNUTLS_LIBRARY_DIRS}
> ++  )
> ++
> ++mark_as_advanced(GNUTLS_INCLUDE_DIR GNUTLS_LIBRARY)
> ++
> ++include(${CMAKE_CURRENT_LIST_DIR}/FindPackageHandleStandardArgs.cmake)
> ++FIND_PACKAGE_HANDLE_STANDARD_ARGS(GnuTLS
> ++                                  REQUIRED_VARS GNUTLS_LIBRARY GNUTLS_INCLUDE_DIR
> ++                                  VERSION_VAR GNUTLS_VERSION_STRING)
> ++
> ++if(GNUTLS_FOUND)
> ++  set(GNUTLS_LIBRARIES    ${GNUTLS_LIBRARY})
> ++  set(GNUTLS_INCLUDE_DIRS ${GNUTLS_INCLUDE_DIR})
> ++
> ++  if(NOT TARGET GnuTLS::GnuTLS)
> ++    add_library(GnuTLS::GnuTLS UNKNOWN IMPORTED)
> ++    set_target_properties(GnuTLS::GnuTLS PROPERTIES
> ++      INTERFACE_INCLUDE_DIRECTORIES "${GNUTLS_INCLUDE_DIRS}"
> ++      INTERFACE_COMPILE_DEFINITIONS "${GNUTLS_DEFINITIONS}"
> ++      IMPORTED_LINK_INTERFACE_LANGUAGES "C"
> ++      IMPORTED_LOCATION "${GNUTLS_LIBRARIES}")
> ++  endif()
> ++endif()
> -- 
> 2.27.0
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
