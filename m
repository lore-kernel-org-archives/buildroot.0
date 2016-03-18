From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 18 Mar 2016 07:23:06 +0200
Subject: [Buildroot] [PATCH 2/2] package: add lapack
In-Reply-To: <1458258022-20613-2-git-send-email-kamath.ben@gmail.com>
References: <1458258022-20613-1-git-send-email-kamath.ben@gmail.com>
 <1458258022-20613-2-git-send-email-kamath.ben@gmail.com>
Message-ID: <20160318052305.GK5528@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Benjamin,

On Thu, Mar 17, 2016 at 04:40:22PM -0700, Benjamin Kamath wrote: 
> diff --git a/package/lapack/0001-case-sensitive-paths.patch b/package/lapack/0001-case-sensitive-paths.patch
> new file mode 100644
> index 0000000..e032d78
> --- /dev/null
> +++ b/package/lapack/0001-case-sensitive-paths.patch
> @@ -0,0 +1,15 @@
> +diff -rupN lapack-3.6.0/CBLAS/CMakeLists.txt lapack-3.6.0-old/CBLAS/CMakeLists.txt
> +--- lapack-3.6.0/CBLAS/CMakeLists.txt	2016-03-17 13:42:31.121248051 -0700
> ++++ lapack-3.6.0-old/CBLAS/CMakeLists.txt	2016-03-17 13:41:37.819316904 -0700
> +@@ -65,9 +65,9 @@ if(ALL_TARGETS)
> +   list(GET ALL_TARGETS 0 _cblas_config_build_guard_target)
> + endif()
> + 
> +-configure_file(${CMAKE_CURRENT_SOURCE_DIR}/CMAKE/cblas-config-version.cmake.in
> ++configure_file(${CMAKE_CURRENT_SOURCE_DIR}/cmake/cblas-config-version.cmake.in
> +   ${LAPACK_BINARY_DIR}/cblas-config-version.cmake @ONLY)
> +-configure_file(${CMAKE_CURRENT_SOURCE_DIR}/CMAKE/cblas-config-build.cmake.in
> ++configure_file(${CMAKE_CURRENT_SOURCE_DIR}/cmake/cblas-config-build.cmake.in
> +   ${LAPACK_BINARY_DIR}/cblas-config.cmake @ONLY)

The patch needs a description and your sign-off.

[snip]

> diff --git a/package/lapack/lapack.mk b/package/lapack/lapack.mk
> new file mode 100644
> index 0000000..fb91543
> --- /dev/null
> +++ b/package/lapack/lapack.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# lapack
> +#
> +################################################################################
> +
> +LAPACK_VERSION = 3.6.0
> +LAPACK_SOURCE = lapack-$(LAPACK_VERSION).tgz
> +# This package provides 2 libraries:
> +# - libblas
> +# - liblapack
> +LAPACK_LICENSE = BSD-3c (libblas and liblapack)
> +LAPACK_LICENSE_FILES = LICENSE
> +LAPACK_SITE = http://www.netlib.org/lapack
> +LAPACK_INSTALL_STAGING = YES
> +LAPACK_CONF_OPTS = -DBUILD_SHARED_LIBS=on -DLAPACKE=on -DCBLAS=on

The Buildroot cmake infrastructure sets BUILD_SHARED_LIBS automatically based 
on Buildroot config. If lapack does not support static build it should depend 
on !BR2_STATIC_LIBS in Config.in

> +ifeq ($(BR2_PACKAGE_LAPACK_COMPLEX),y)
> +LAPACK_CONF_OPTS += -DBUILD_COMPLEX=on -DBUILD_COMPLEX16=on
> +else
> +LAPACK_CONF_OPTS += -DBUILD_COMPLEX=off -DBUILD_COMPLEX16=off
> +endif
> +
> +$(eval $(cmake-package))

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
