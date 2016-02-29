From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 23:37:41 +0100
Subject: [Buildroot] [PATCH/next 01/31] package/kodi-visualisation-goom:
 new package
In-Reply-To: <1456006176-21308-2-git-send-email-bernd.kuhls@t-online.de>
References: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
 <1456006176-21308-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160229233741.347b5d69@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

I've applied your patch to the next branch, but still have a few
comments, see below.

On Sat, 20 Feb 2016 23:09:06 +0100, Bernd Kuhls wrote:

>  config BR2_PACKAGE_OPENPOWERLINK_DEBUG_LEVEL
> diff --git a/package/kodi-visualisation-goom/0001-cross-compile.patch b/package/kodi-visualisation-goom/0001-cross-compile.patch
> new file mode 100644
> index 0000000..8dd0fe9
> --- /dev/null
> +++ b/package/kodi-visualisation-goom/0001-cross-compile.patch
> @@ -0,0 +1,32 @@
> +Fix cross-compilation
> +
> +Use the cross-compiler and not the host version.
> +
> +Patch sent upstream:
> +https://github.com/notspiff/visualization.goom/pull/4

You received some comments in this pull request. Could you address
them, so that the patch can move forward and hopefully be applied at
some point?

> +diff -uNr visualization.goom-fb5933ba5b2143d055cc7749dc60a82f6002b305.org/CMakeLists.txt visualization.goom-fb5933ba5b2143d055cc7749dc60a82f6002b305/CMakeLists.txt
> +--- visualization.goom-fb5933ba5b2143d055cc7749dc60a82f6002b305.org/CMakeLists.txt	2014-10-31 11:34:21.000000000 +0100
> ++++ visualization.goom-fb5933ba5b2143d055cc7749dc60a82f6002b305/CMakeLists.txt	2015-07-19 19:49:43.340054342 +0200
> +@@ -13,6 +13,10 @@
> +                     ${KODI_INCLUDE_DIR}
> +                     ${PROJECT_SOURCE_DIR}/lib/goom2k4-0/src)
> + 
> ++get_filename_component( COMPILER_FILENAME "${CMAKE_C_COMPILER}" NAME )
> ++string( REGEX REPLACE "-[^-]+$" ""
> ++        TOOLCHAIN_NAME "${COMPILER_FILENAME}" )
> ++
> + include(ExternalProject)
> + set(update_command "")
> + if(BOOTSTRAP_IN_TREE OR NOT DEFINED BOOTSTRAP_IN_TREE)
> +@@ -20,7 +24,7 @@
> + endif()
> + externalproject_add(libgoom SOURCE_DIR ${PROJECT_SOURCE_DIR}/lib/goom2k4-0
> +                     "${update_command}"
> +-                    CONFIGURE_COMMAND ${PROJECT_SOURCE_DIR}/lib/goom2k4-0/configure --disable-shared --enable-static --with-pic --prefix=<INSTALL_DIR>
> ++                    CONFIGURE_COMMAND ${PROJECT_SOURCE_DIR}/lib/goom2k4-0/configure --disable-shared --enable-static --with-pic --prefix=<INSTALL_DIR> --host=${TOOLCHAIN_NAME}

I really hate those CMake packages that internally call an an autotools
configure script :-/

> diff --git a/package/kodi-visualisation-goom/Config.in b/package/kodi-visualisation-goom/Config.in
> new file mode 100644
> index 0000000..c1f1751
> --- /dev/null
> +++ b/package/kodi-visualisation-goom/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_KODI_VISUALISATION_GOOM
> +	bool "kodi-visualisation-goom"
> +	depends on BR2_PACKAGE_KODI_GL
> +	help
> +	  GOOM visualiser for Kodi
> +
> +	  https://github.com/notspiff/visualization.goom
> +
> +comment "goom needs an OpenGL backend"

This should have been:

comment "kodi-visualisation-goom needs an OpenGL backend"

I've fixed that when applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
