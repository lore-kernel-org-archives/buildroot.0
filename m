From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 7 Nov 2016 06:17:36 +0100
Subject: [Buildroot] [PATCH] package/openjpeg: fix static build
In-Reply-To: <20161106225022.6b9acdc5@free-electrons.com>
References: <20161106163559.4788-1-s.martin49@gmail.com>
 <20161106225022.6b9acdc5@free-electrons.com>
Message-ID: <CAHXCMM+E8+0orOrBOqHyqw0yus5k+bvy8Z8vxcD4AEmeATcKyA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

On Sun, Nov 6, 2016 at 10:50 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Sun,  6 Nov 2016 17:35:59 +0100, Samuel Martin wrote:
>
>
>> + # Try to find lib Z
>> + IF(BUILD_THIRDPARTY)
>> +@@ -35,6 +39,9 @@ IF(BUILD_THIRDPARTY)
>> +   SET(PNG_INCLUDE_DIRNAME ${OPENJPEG_SOURCE_DIR}/thirdparty/libpng PARENT_SCOPE)
>> + ELSE (BUILD_THIRDPARTY)
>> +   IF (ZLIB_FOUND)
>> ++    # Static only build:
>> ++    #   it is not necessary to invoke pkg_check_module on libpng, because libpng
>> ++    #   only depends on zlib, which is already checked.
>
> This is correct today, but in the future? The whole point of pkg-config
> is to not make this sort of assumption.

Some cmake modules are so poorly written, they only set the flags
relative to the package itself (i.e. setting LDFLAGS="-L/usr/lib
-lfoo" for package foo), and completly ignore/miss/forget the indirect
dependencies that are required in the case of static build.
However, cmake can leverage pkgconfig to set all these flags, so the
proper fix is indeed using it in the module. But that's another story
for another patch... ;-)

A future-proof fix is fixing the FindTIFF.cmake module from the cmake
package itself, making it using pkgconfig to get all the libs in the
LDFLAGS instead of only -ltiff. This is not easily possible since we
conditionally build the host-cmake package (patching host-cmake would
mean no-op-ing commit c2d80a8c5d8b97cdc84c297a3d2d6896fff6560b).

>
>> +     FIND_PACKAGE(PNG)
>> +     IF(PNG_FOUND)
>> +       message(STATUS "Your system seems to have a PNG lib available, we will use it")
>> +@@ -66,12 +73,24 @@ IF(BUILD_THIRDPARTY)
>> +   SET(OPJ_HAVE_LIBTIFF 1 PARENT_SCOPE)
>> + ELSE (BUILD_THIRDPARTY)
>> +   FIND_PACKAGE(TIFF)
>> ++  # Static only build:
>> ++  #   it is necessary to invoke pkg_check_module on libtiff since it may have
>> ++  #   several other dependencies not declared by its cmake module, but they are
>> ++  #   in the its pkgconfig module.
>> ++  IF(PKG_CONFIG_FOUND)
>> ++    FOREACH(pc_tiff_module tiff tiff3 tiff4 tiff-3 tiff-4 libtiff libtiff3 libtiff4 libtiff-3 libtiff-4)
>
> I fail to understand why one needs to call both FIND_PACKAGE(TIFF) and
> then check again with PKG_CHECK_MODULES(). Isn't the latter sufficient?

Indeed FIND_PACKAGE(TIFF) is redundant with what PKG_CHECK_MODULES()
does. But to give a chance to this patch to get upstream I have to
take care platform missing pkgconfig (yeah! it exists :( ...), so
FIND_PACKAGE() is always called, and PKG_CHECK_MODULES() is called
only when available (mea culpa, the commit log does not reflect this).

Regards,


-- 
Samuel
