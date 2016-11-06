From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Nov 2016 22:50:22 +0100
Subject: [Buildroot] [PATCH] package/openjpeg: fix static build
In-Reply-To: <20161106163559.4788-1-s.martin49@gmail.com>
References: <20161106163559.4788-1-s.martin49@gmail.com>
Message-ID: <20161106225022.6b9acdc5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  6 Nov 2016 17:35:59 +0100, Samuel Martin wrote:


> + # Try to find lib Z
> + IF(BUILD_THIRDPARTY)
> +@@ -35,6 +39,9 @@ IF(BUILD_THIRDPARTY)
> +   SET(PNG_INCLUDE_DIRNAME ${OPENJPEG_SOURCE_DIR}/thirdparty/libpng PARENT_SCOPE)
> + ELSE (BUILD_THIRDPARTY)
> +   IF (ZLIB_FOUND)
> ++    # Static only build:
> ++    #   it is not necessary to invoke pkg_check_module on libpng, because libpng
> ++    #   only depends on zlib, which is already checked.

This is correct today, but in the future? The whole point of pkg-config
is to not make this sort of assumption.

> +     FIND_PACKAGE(PNG)
> +     IF(PNG_FOUND)
> +       message(STATUS "Your system seems to have a PNG lib available, we will use it")
> +@@ -66,12 +73,24 @@ IF(BUILD_THIRDPARTY)
> +   SET(OPJ_HAVE_LIBTIFF 1 PARENT_SCOPE)
> + ELSE (BUILD_THIRDPARTY)
> +   FIND_PACKAGE(TIFF)
> ++  # Static only build:
> ++  #   it is necessary to invoke pkg_check_module on libtiff since it may have
> ++  #   several other dependencies not declared by its cmake module, but they are
> ++  #   in the its pkgconfig module.
> ++  IF(PKG_CONFIG_FOUND)
> ++    FOREACH(pc_tiff_module tiff tiff3 tiff4 tiff-3 tiff-4 libtiff libtiff3 libtiff4 libtiff-3 libtiff-4)

I fail to understand why one needs to call both FIND_PACKAGE(TIFF) and
then check again with PKG_CHECK_MODULES(). Isn't the latter sufficient?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
