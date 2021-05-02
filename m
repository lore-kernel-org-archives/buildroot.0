From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 2 May 2021 20:03:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/libgdal: new package
In-Reply-To: <20210502163829.69f12088@gmx.net>
References: <20210502130619.683435-1-dmrauh@posteo.de>
 <20210502163829.69f12088@gmx.net>
Message-ID: <20210502200323.33b0e925@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2 May 2021 16:38:29 +0200, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Dominik,
>
> thanks for patch contribution, a quick/first review below:
>
> On Sun,  2 May 2021 13:06:19 +0000, Dominik Michael Rauh <dmrauh@posteo.de> wrote:
>
> > GDAL is a translator library for raster and vector geospatial data
> > formats. As a library, it presents a single raster abstract data model
> > and single vector abstract data model to the calling application for all
> > supported formats. It also comes with a variety of useful command line
> > utilities for data translation and processing.
> >
> > https://gdal.org/
> >
> > Signed-off-by: Dominik Michael Rauh <dmrauh@posteo.de>
> > ---
> >  package/Config.in                             |  1 +
> >  ...1-port-cpl_recode_iconv.cpp-use-cast.patch | 38 +++++++++++++++++++
> >  package/libgdal/Config.in                     | 22 +++++++++++
> >  package/libgdal/libgdal.hash                  |  6 +++
> >  package/libgdal/libgdal.mk                    | 26 +++++++++++++
> >  5 files changed, 93 insertions(+)
> >  create mode 100644 package/libgdal/0001-port-cpl_recode_iconv.cpp-use-cast.patch
> >  create mode 100644 package/libgdal/Config.in
> >  create mode 100644 package/libgdal/libgdal.hash
> >  create mode 100644 package/libgdal/libgdal.mk
> >
> > diff --git a/package/Config.in b/package/Config.in
> > index 6181aaac2c..56c55dffc5 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -1915,6 +1915,7 @@ menu "Other"
> >  	source "package/libevdev/Config.in"
> >  	source "package/libevent/Config.in"
> >  	source "package/libffi/Config.in"
> > +	source "package/libgdal/Config.in"
> >  	source "package/libgee/Config.in"
> >  	source "package/libgeos/Config.in"
> >  	source "package/libglib2/Config.in"
> > diff --git a/package/libgdal/0001-port-cpl_recode_iconv.cpp-use-cast.patch b/package/libgdal/0001-port-cpl_recode_iconv.cpp-use-cast.patch
> > new file mode 100644
> > index 0000000000..fd168c769e
> > --- /dev/null
> > +++ b/package/libgdal/0001-port-cpl_recode_iconv.cpp-use-cast.patch
> > @@ -0,0 +1,38 @@
> > +From 8f59911ced01da6dba7784098e97eefeef96d3a5 Mon Sep 17 00:00:00 2001
> > +From: Dominik Michael Rauh <dmrauh@posteo.de>
> > +Date: Sat, 1 May 2021 20:11:30 +0200
> > +Subject: [PATCH] port/cpl_recode_iconv.cpp: use cast
> > +
> > +Fixes error: invalid cast from type 'int' to type 'iconv_t' {aka 'long
> > +int'}.
> > +
> > +Signed-off-by: Dominik Michael Rauh <dmrauh@posteo.de>
> > +---
> > + port/cpl_recode_iconv.cpp | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/port/cpl_recode_iconv.cpp b/port/cpl_recode_iconv.cpp
> > +index d341bb1..2346012 100644
> > +--- a/port/cpl_recode_iconv.cpp
> > ++++ b/port/cpl_recode_iconv.cpp
> > +@@ -87,7 +87,7 @@ char *CPLRecodeIconv( const char *pszSource,
> > +
> > +     sConv = iconv_open( pszDstEncoding, pszSrcEncoding );
> > +
> > +-    if( sConv == reinterpret_cast<iconv_t>(-1) )
> > ++    if( sConv == (iconv_t)(-1) )
> > +     {
> > +         CPLError( CE_Warning, CPLE_AppDefined,
> > +                   "Recode from %s to %s failed with the error: \"%s\".",
> > +@@ -234,7 +234,7 @@ char *CPLRecodeFromWCharIconv( const wchar_t *pwszSource,
> > +
> > +     sConv = iconv_open( pszDstEncoding, pszSrcEncoding );
> > +
> > +-    if( sConv == reinterpret_cast<iconv_t>(-1) )
> > ++    if( sConv == (iconv_t)(-1) )
> > +     {
> > +         CPLFree( pszIconvSrcBuf );
> > +         CPLError( CE_Warning, CPLE_AppDefined,
> > +--
> > +2.31.1
> > +
> > diff --git a/package/libgdal/Config.in b/package/libgdal/Config.in
> > new file mode 100644
> > index 0000000000..1d64bfb67f
> > --- /dev/null
> > +++ b/package/libgdal/Config.in
> > @@ -0,0 +1,22 @@
> > +config BR2_PACKAGE_LIBGDAL
> > +	bool "libgdal"
> > +	depends on BR2_INSTALL_LIBSTDCPP
> > +	# configure can't find proj, when linking statically
> > +	depends on !BR2_STATIC_LIBS
> > +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
> > +	select BR2_PACKAGE_PROJ
>
> The full proj dependencies are:
>
> config BR2_PACKAGE_PROJ
>         bool "proj"
>         depends on BR2_INSTALL_LIBSTDCPP
>         depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
>         depends on BR2_TOOLCHAIN_HAS_THREADS
>         depends on BR2_USE_WCHAR
>         select BR2_PACKAGE_SQLITE
>
> So BR2_TOOLCHAIN_HAS_THREADS and BR2_USE_WCHAR are missing here (and propagated
> dependencies should be marked by a comment like the following '... # proj')...
>
> > +	help
> > +	  GDAL is a translator library for raster and vector geospatial
> > +	  data formats. As a library, it presents a single raster
> > +	  abstract data model and single vector abstract data model to
> > +	  the calling application for all supported formats. It also
> > +	  comes with a variety of useful command line utilities for data
> > +	  translation and processing.
> > +
> > +	  https://gdal.org/
> > +
> > +comment "libgdal needs a toolchain w/ C++, dynamic library, gcc >= 4.7, proj"
> > +	depends on !BR2_INSTALL_LIBSTDCPP || \
> > +		!BR2_STATIC_LIBS || \
> > +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
> > +		!BR2_PACKAGE_PROJ
>
> No need for proj/BR2_PACKAGE_PROJ here (as your are already selecting it above)...
>
> > diff --git a/package/libgdal/libgdal.hash b/package/libgdal/libgdal.hash
> > new file mode 100644
> > index 0000000000..48aad360d7
> > --- /dev/null
> > +++ b/package/libgdal/libgdal.hash
> > @@ -0,0 +1,6 @@
> > +# md5 from: https://download.osgeo.org/gdal/3.2.2/gdal-3.2.2.tar.xz.md5, sha256 locally computed:
> > +md5  c656be582f7beb528c66486cd1fca7a2  gdal-3.2.2.tar.xz
> > +sha256  a7e1e414e5c405af48982bf4724a3da64a05770254f2ce8affb5f58a7604ca57  gdal-3.2.2.tar.xz
> > +
> > +# Hash for license file:
> > +sha256 b82e6cca0b13f5db2f22ab667f22254fb1f4b135ea73d5bd6238ef89aff31f6c  LICENSE.TXT
> > diff --git a/package/libgdal/libgdal.mk b/package/libgdal/libgdal.mk
> > new file mode 100644
> > index 0000000000..31bf73ec84
> > --- /dev/null
> > +++ b/package/libgdal/libgdal.mk
> > @@ -0,0 +1,26 @@
> > +################################################################################
> > +#
> > +# libgdal
> > +#
> > +################################################################################
> > +
> > +LIBGDAL_VERSION = 3.2.2
> > +LIBGDAL_SITE = https://download.osgeo.org/gdal/$(LIBGDAL_VERSION)
> > +LIBGDAL_SOURCE = gdal-$(LIBGDAL_VERSION).tar.xz
> > +LIBGDAL_LICENSE = MIT
> > +LIBGDAL_LICENSE_FILES = LICENSE.TXT
>
> There are (many) more licenses referenced from LICENSE.TXT...
>
> > +LIBGDAL_INSTALL_STAGING = YES
> > +LIBGDAL_CONFIG_SCRIPTS = gdal-config
> > +LIBGDAL_DEPENDENCIES = host-pkgconf proj
> > +
> > +ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
> > +LIBGDAL_DEPENDENCIES += postgresql
> > +LIBGDAL_CONF_OPTS += --with-pg
> > +endif
>
> Else case with explicit disable preferred here (in case the
> upstream default changes)...
>
> > +
> > +ifeq ($(BR2_PACKAGE_LIBXML2),y)
> > +LIBGDAL_DEPENDENCIES += libxml2
> > +LIBGDAL_CONF_OPTS += --with-xml2
> > +endif
>
> Else case with explicit disable preferred here (in case the
> upstream default changes)...
>
> Quick look at ./configure --help prevails a lot more configure options
> and/or (optional?) dependencies...


A test with utils/test-pkg and the following config:

BR2_PACKAGE_PROJ=y
BR2_PACKAGE_LIBGDAL=y

gives:
                             andes-nds32 [ 1/45]: SKIPPED
                             arm-aarch64 [ 2/45]: FAILED
                   bootlin-aarch64-glibc [ 3/45]: FAILED
               bootlin-arcle-hs38-uclibc [ 4/45]: OK
                    bootlin-armv5-uclibc [ 5/45]: OK
                     bootlin-armv7-glibc [ 6/45]: OK
                   bootlin-armv7m-uclibc [ 7/45]: SKIPPED
                      bootlin-armv7-musl [ 8/45]: OK
                bootlin-m68k-5208-uclibc [ 9/45]: SKIPPED
               bootlin-m68k-68040-uclibc [10/45]: FAILED
             bootlin-microblazeel-uclibc [11/45]: OK
                bootlin-mipsel32r6-glibc [12/45]: OK
                   bootlin-mipsel-uclibc [13/45]: OK
                     bootlin-nios2-glibc [14/45]: FAILED

.../bootlin-nios2-glibc/host/opt/ext-toolchain/bin/../lib/gcc/nios2-buildroot-linux-gnu/9.3.0/../../../../nios2-buildroot-linux-gnu/bin/ld: BFD (GNU Binutils) 2.33.1 assertion fail elf32-nios2.c:1887


                 bootlin-openrisc-uclibc [15/45]: FAILED

swq_op_general.cpp:(.text+0x2500): relocation truncated to fit: R_OR1K_GOT16 against symbol `vtable for CPLSafeIntOverflow' defined in .data.rel.ro._ZTV18CPLSafeIntOverflow[_ZTV18CPLSafeIntOverflow] section in ./ogr/.libs/swq_op_general.o

        bootlin-powerpc64le-power8-glibc [16/45]: FAILED

.../bootlin-powerpc64le-power8-glibc/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64le-buildroot-linux-gnu/9.3.0/../../../../powerpc64le-buildroot-linux-gnu/bin/ld: .../bootlin-powerpc64le-power8-glibc/build/libgdal-3.2.2/.libs/libgdal.so: undefined reference to `png_init_filter_functions_vsx'

           bootlin-powerpc-e500mc-uclibc [17/45]: OK
                   bootlin-riscv32-glibc [18/45]: OK
                   bootlin-riscv64-glibc [19/45]: OK
                    bootlin-riscv64-musl [20/45]: OK
                      bootlin-sh4-uclibc [21/45]: OK
                   bootlin-sparc64-glibc [22/45]: OK
                    bootlin-sparc-uclibc [23/45]: OK
                    bootlin-x86-64-glibc [24/45]: OK
                     bootlin-x86-64-musl [25/45]: OK
                   bootlin-x86-64-uclibc [26/45]: OK
                   bootlin-xtensa-uclibc [27/45]: OK
                            br-arm-basic [28/45]: SKIPPED
                    br-arm-full-nothread [29/45]: SKIPPED
                      br-arm-full-static [30/45]: SKIPPED
                   br-i386-pentium4-full [31/45]: OK
                br-i386-pentium-mmx-musl [32/45]: OK
                      br-mips64-n64-full [33/45]: OK
                 br-mips64r6-el-hf-glibc [34/45]: OK
               br-powerpc-603e-basic-cpp [35/45]: SKIPPED
               br-powerpc64-power7-glibc [36/45]: FAILED

.../br-powerpc64-power7-glibc/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64-buildroot-linux-gnu/9.3.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: .../br-powerpc64-power7-glibc/build/libgdal-3.2.2/.libs/libgdal.so: undefined reference to `png_init_filter_functions_vsx'


                       linaro-aarch64-be [37/45]: FAILED

.../linaro-aarch64-be/build/libgdal-3.2.2/.libs/libgdal.so: undefined reference to `png_init_filter_functions_neon'

                          linaro-aarch64 [38/45]: FAILED

.../linaro-aarch64/build/libgdal-3.2.2/.libs/libgdal.so: undefined reference to `png_init_filter_functions_neon'

                              linaro-arm [39/45]: OK
                     sourcery-arm-armv4t [40/45]: OK
                            sourcery-arm [41/45]: OK
                     sourcery-arm-thumb2 [42/45]: OK
                         sourcery-mips64 [43/45]: OK
                           sourcery-mips [44/45]: OK
                          sourcery-nios2 [45/45]: FAILED

.../sourcery-nios2/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/7.3.1/../../../../nios2-linux-gnu/bin/ld: BFD (Sourcery CodeBench Lite 2018.05-5) 2.28.51 assertion fail /scratch/sandra/nios2-linux-spring-release/obj/binutils-src-2018.05-5-nios2-linux-gnu-i686-pc-linux-gnu/bfd/elf32-nios2.c:1906

Regars,
Peter

>
> Regards,
> Peter
>
> > +
> > +$(eval $(autotools-package))
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
