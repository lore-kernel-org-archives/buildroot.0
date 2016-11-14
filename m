From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 14 Nov 2016 23:30:06 +0100
Subject: [Buildroot] [PATCH] openjpeg: refresh patches
In-Reply-To: <15d0ff6af38ff41acb2129a619e49a0e3ba866d9.1479160710.git.baruch@tkos.co.il>
References: <15d0ff6af38ff41acb2129a619e49a0e3ba866d9.1479160710.git.baruch@tkos.co.il>
Message-ID: <20161114233006.25256e96@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

On Mon, 14 Nov 2016 23:58:30 +0200, Baruch Siach <baruch@tkos.co.il> wrote:

> The 2.1.2 version bump did not take into account the recently added fixes.
> Update the patches to apply based on upstream pull requests #866 and #867.
> 
> Cc: Peter Seiderer <ps.report@gmx.net>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...tiff-append-flags-found-by-pkg-config-if-.patch | 60 +++++++++++-----------
>  ...lcms2-append-flags-found-by-pkg-config-if.patch | 38 +++++++-------
>  2 files changed, 50 insertions(+), 48 deletions(-)
> 
> diff --git a/package/openjpeg/0001-thirdparty-tiff-append-flags-found-by-pkg-config-if-.patch b/package/openjpeg/0001-thirdparty-tiff-append-flags-found-by-pkg-config-if-.patch
> index be509024de86..bce790a47863 100644
> --- a/package/openjpeg/0001-thirdparty-tiff-append-flags-found-by-pkg-config-if-.patch
> +++ b/package/openjpeg/0001-thirdparty-tiff-append-flags-found-by-pkg-config-if-.patch
> @@ -17,56 +17,56 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>   1 file changed, 21 insertions(+), 2 deletions(-)
>  
>  diff --git a/thirdparty/CMakeLists.txt b/thirdparty/CMakeLists.txt
> -index d1e68ca..225f51d 100644
> +index cb24b43b58e2..cd6a5e1391b0 100644
>  --- a/thirdparty/CMakeLists.txt
>  +++ b/thirdparty/CMakeLists.txt
>  @@ -1,5 +1,9 @@
>   # 3rd party libs
>   
> -+IF(NOT BUILD_THIRDPARTY)
> ++if(NOT BUILD_THIRDPARTY)
>  +  include(FindPkgConfig)
> -+ENDIF(NOT BUILD_THIRDPARTY)
> ++endif(NOT BUILD_THIRDPARTY)
>  +
>   #------------
>   # Try to find lib Z
> - IF(BUILD_THIRDPARTY)
> -@@ -35,6 +39,9 @@ IF(BUILD_THIRDPARTY)
> -   SET(PNG_INCLUDE_DIRNAME ${OPENJPEG_SOURCE_DIR}/thirdparty/libpng PARENT_SCOPE)
> - ELSE (BUILD_THIRDPARTY)
> -   IF (ZLIB_FOUND)
> + if(BUILD_THIRDPARTY)
> +@@ -36,6 +40,9 @@ if(BUILD_THIRDPARTY)
> + else(BUILD_THIRDPARTY)
> +   if(ZLIB_FOUND)
> +     find_package(PNG)
>  +    # Static only build:
>  +    #   it is not necessary to invoke pkg_check_module on libpng, because libpng
>  +    #   only depends on zlib, which is already checked.
> -     FIND_PACKAGE(PNG)
> -     IF(PNG_FOUND)
> +     if(PNG_FOUND)
>         message(STATUS "Your system seems to have a PNG lib available, we will use it")
> -@@ -66,12 +73,24 @@ IF(BUILD_THIRDPARTY)
> -   SET(OPJ_HAVE_LIBTIFF 1 PARENT_SCOPE)
> - ELSE (BUILD_THIRDPARTY)
> -   FIND_PACKAGE(TIFF)
> +       set(OPJ_HAVE_PNG_H 1 PARENT_SCOPE)
> +@@ -66,12 +73,24 @@ if(BUILD_THIRDPARTY)
> +   set(OPJ_HAVE_LIBTIFF 1 PARENT_SCOPE)
> + else(BUILD_THIRDPARTY)
> +   find_package(TIFF)
>  +  # Static only build:
>  +  #   it is necessary to invoke pkg_check_module on libtiff since it may have
>  +  #   several other dependencies not declared by its cmake module, but they are
>  +  #   in the its pkgconfig module.
> -+  IF(PKG_CONFIG_FOUND)
> -+    FOREACH(pc_tiff_module tiff tiff3 tiff4 tiff-3 tiff-4 libtiff libtiff3 libtiff4 libtiff-3 libtiff-4)
> ++  if(PKG_CONFIG_FOUND)
> ++    foreach(pc_tiff_module tiff tiff3 tiff4 tiff-3 tiff-4 libtiff libtiff3 libtiff4 libtiff-3 libtiff-4)
>  +      pkg_check_modules(PC_TIFF QUIET ${pc_tiff_module})
> -+      IF(PC_TIFF_FOUND)
> ++      if(PC_TIFF_FOUND)
>  +        break()
> -+      ENDIF(PC_TIFF_FOUND)
> -+    ENDFOREACH()
> -+  ENDIF(PKG_CONFIG_FOUND)
> -   IF(TIFF_FOUND)
> ++      endif(PC_TIFF_FOUND)
> ++    endforeach()
> ++  endif(PKG_CONFIG_FOUND)
> +   if(TIFF_FOUND)
>       message(STATUS "Your system seems to have a TIFF lib available, we will use it")
> -     SET(OPJ_HAVE_TIFF_H 1 PARENT_SCOPE)
> -     SET(OPJ_HAVE_LIBTIFF 1 PARENT_SCOPE)
> --    SET(TIFF_LIBNAME ${TIFF_LIBRARIES} PARENT_SCOPE)
> --    SET(TIFF_INCLUDE_DIRNAME ${TIFF_INCLUDE_DIR} PARENT_SCOPE)
> -+    SET(TIFF_LIBNAME ${TIFF_LIBRARIES} ${PC_TIFF_STATIC_LIBRARIES} PARENT_SCOPE)
> -+    SET(TIFF_INCLUDE_DIRNAME ${TIFF_INCLUDE_DIR} ${PC_TIFF_STATIC_INCLUDE_DIRS} PARENT_SCOPE)
> -   ELSE (TIFF_FOUND) # not found
> -     SET(OPJ_HAVE_TIFF_H 0 PARENT_SCOPE)
> -     SET(OPJ_HAVE_LIBTIFF 0 PARENT_SCOPE)
> +     set(OPJ_HAVE_TIFF_H 1 PARENT_SCOPE)
> +     set(OPJ_HAVE_LIBTIFF 1 PARENT_SCOPE)
> +-    set(TIFF_LIBNAME ${TIFF_LIBRARIES} PARENT_SCOPE)
> +-    set(TIFF_INCLUDE_DIRNAME ${TIFF_INCLUDE_DIR} PARENT_SCOPE)
> ++    set(TIFF_LIBNAME ${TIFF_LIBRARIES} ${PC_TIFF_STATIC_LIBRARIES} PARENT_SCOPE)
> ++    set(TIFF_INCLUDE_DIRNAME ${TIFF_INCLUDE_DIR} ${PC_TIFF_STATIC_INCLUDE_DIRS} PARENT_SCOPE)
> +   else(TIFF_FOUND) # not found
> +     set(OPJ_HAVE_TIFF_H 0 PARENT_SCOPE)
> +     set(OPJ_HAVE_LIBTIFF 0 PARENT_SCOPE)
>  -- 
>  2.10.2
>  
> diff --git a/package/openjpeg/0002-thirdparty-lcms2-append-flags-found-by-pkg-config-if.patch b/package/openjpeg/0002-thirdparty-lcms2-append-flags-found-by-pkg-config-if.patch
> index 4366c0af88cf..5697b82de2e0 100644
> --- a/package/openjpeg/0002-thirdparty-lcms2-append-flags-found-by-pkg-config-if.patch
> +++ b/package/openjpeg/0002-thirdparty-lcms2-append-flags-found-by-pkg-config-if.patch
> @@ -7,9 +7,11 @@ Subject: [PATCH] thirdparty: lcms2: append flags found by pkg-config if
>  This change allows to get all required CFLAGS/LDFLAGS in case of static only
>  build.
>  
> -Fixes a buildroot build failure (see [1]).
> +Fixes a buildroot build failure (see [1], [2] and [3]).
>  
>  [1] http://autobuild.buildroot.net/results/5ce/5cee20afd8bef5268832cddcb3a5270746be7a57
> +[2] http://lists.busybox.net/pipermail/buildroot/2016-November/177187.html
> +[3] http://lists.busybox.net/pipermail/buildroot/2016-November/177188.html
>  
>  Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>  ---
> @@ -17,31 +19,31 @@ Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>   1 file changed, 9 insertions(+), 2 deletions(-)
>  
>  diff --git a/thirdparty/CMakeLists.txt b/thirdparty/CMakeLists.txt
> -index 225f51d..42770ad 100644
> +index cd6a5e1391b0..a3a8494d89b1 100644
>  --- a/thirdparty/CMakeLists.txt
>  +++ b/thirdparty/CMakeLists.txt
> -@@ -113,12 +113,19 @@ IF( BUILD_THIRDPARTY)
> -   SET(OPJ_HAVE_LIBLCMS2 1 PARENT_SCOPE)
> - ELSE (BUILD_THIRDPARTY)
> -   FIND_PACKAGE(LCMS2)
> +@@ -113,12 +113,19 @@ if( BUILD_THIRDPARTY)
> +   set(OPJ_HAVE_LIBLCMS2 1 PARENT_SCOPE)
> + else(BUILD_THIRDPARTY)
> +   find_package(LCMS2)
>  +  # Static only build:
>  +  #   it is necessary to invoke pkg_check_module on lcms2 since it may have
>  +  #   several other dependencies not declared by its cmake module, but they are
>  +  #   in the its pkgconfig module.
> -+  IF(PKG_CONFIG_FOUND)
> ++  if(PKG_CONFIG_FOUND)
>  +    pkg_check_modules(PC_LCMS2 QUIET lcms2)
> -+  ENDIF(PKG_CONFIG_FOUND)
> -   IF(LCMS2_FOUND)
> ++  endif(PKG_CONFIG_FOUND)
> +   if(LCMS2_FOUND)
>       message(STATUS "Your system seems to have a LCMS2 lib available, we will use it")
> -     SET(OPJ_HAVE_LCMS2_H 1 PARENT_SCOPE)
> -     SET(OPJ_HAVE_LIBLCMS2 1 PARENT_SCOPE)
> --    SET(LCMS_LIBNAME ${LCMS2_LIBRARIES} PARENT_SCOPE)
> --    SET(LCMS_INCLUDE_DIRNAME ${LCMS2_INCLUDE_DIRS} PARENT_SCOPE)
> -+    SET(LCMS_LIBNAME ${LCMS2_LIBRARIES} ${PC_LCMS2_STATIC_LIBRARIES} PARENT_SCOPE)
> -+    SET(LCMS_INCLUDE_DIRNAME ${LCMS2_INCLUDE_DIRS} ${PC_LCMS2_STATIC_INCLUDE_DIRS} PARENT_SCOPE)
> -   ELSE (LCMS2_FOUND) # not found lcms2
> +     set(OPJ_HAVE_LCMS2_H 1 PARENT_SCOPE)
> +     set(OPJ_HAVE_LIBLCMS2 1 PARENT_SCOPE)
> +-    set(LCMS_LIBNAME ${LCMS2_LIBRARIES} PARENT_SCOPE)
> +-    set(LCMS_INCLUDE_DIRNAME ${LCMS2_INCLUDE_DIRS} PARENT_SCOPE)
> ++    set(LCMS_LIBNAME ${LCMS2_LIBRARIES} ${PC_LCMS2_STATIC_LIBRARIES} PARENT_SCOPE)
> ++    set(LCMS_INCLUDE_DIRNAME ${LCMS2_INCLUDE_DIRS} ${PC_LCMS2_STATIC_INCLUDE_DIRS} PARENT_SCOPE)
> +   else(LCMS2_FOUND) # not found lcms2
>       # try to find LCMS
> -     FIND_PACKAGE(LCMS)
> +     find_package(LCMS)
>  -- 
> -2.8.1
> +2.10.2
>  

Acked-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter
