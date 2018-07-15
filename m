From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 15 Jul 2018 22:55:20 +0200
Subject: [Buildroot] [RFC v1 2/2] libdrm: change to meson build system
In-Reply-To: <20180715210238.1ce0c4b8@gmx.net>
References: <20180713205801.25976-1-ps.report@gmx.net>
 <20180713205801.25976-2-ps.report@gmx.net>
 <20180715210238.1ce0c4b8@gmx.net>
Message-ID: <20180715225520.210ae348@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello *,
On Sun, 15 Jul 2018 21:02:38 +0200, Peter Seiderer <ps.report@gmx.net> wrote:

> On Fri, 13 Jul 2018 22:58:01 +0200, Peter Seiderer <ps.report@gmx.net> wrote:
> 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> > Notes:
> >   - convertion from "LIBDRM_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'"
> >     is missing (maybe meson gets it right (?) or use LIBDRM_MESON_CFLAGS
> >     to force it)
> > ---
> >  ...le.am-use-pkg-config-to-discover-lib.patch | 162 ------------------
> >  package/libdrm/libdrm.mk                      |  71 ++++----
> >  2 files changed, 32 insertions(+), 201 deletions(-)
> >  delete mode 100644 package/libdrm/0003-configure-Makefile.am-use-pkg-config-to-discover-lib.patch
> > 
> > diff --git a/package/libdrm/0003-configure-Makefile.am-use-pkg-config-to-discover-lib.patch b/package/libdrm/0003-configure-Makefile.am-use-pkg-config-to-discover-lib.patch
> > deleted file mode 100644
> > index 0fbe77ef7c..0000000000
> > --- a/package/libdrm/0003-configure-Makefile.am-use-pkg-config-to-discover-lib.patch
> > +++ /dev/null  
> 
> Needs substitute patch for this one, the build of the following defconfig failes (again)
> with meson:
> 
>   .../host/bin/sparc-linux-gcc  -o etnaviv/libdrm_etnaviv.so.1.0.0 'etnaviv/etnaviv@@drm_etnaviv at sha/etnaviv_device.c.o' 'etnaviv/etnaviv@@drm_etnaviv at sha/etnaviv_gpu.c.o' 'etnaviv/etnaviv@@drm_etnaviv at sha/etnaviv_bo.c.o' 'etnaviv/etnaviv@@drm_etnaviv at sha/etnaviv_bo_cache.c.o' 'etnaviv/etnaviv@@drm_etnaviv at sha/etnaviv_perfmon.c.o' 'etnaviv/etnaviv@@drm_etnaviv at sha/etnaviv_pipe.c.o' 'etnaviv/etnaviv@@drm_etnaviv at sha/etnaviv_cmd_stream.c.o' -Wl,--no-undefined -Wl,--as-needed -shared -fPIC -Wl,--start-group -Wl,-soname,libdrm_etnaviv.so.1 libdrm.so.2.4.0 -Wl,--end-group '-Wl,-rpath,$ORIGIN/..' -Wl,-rpath-link,.../build/libdrm-2.4.92/build/  
>   etnaviv/etnaviv@@drm_etnaviv at sha/etnaviv_device.c.o: In function `etna_device_ref':
>   .../build/libdrm-2.4.92/build/../etnaviv/etnaviv_device.c:77: undefined reference to `__sync_fetch_and_add_4'
>   etnaviv/etnaviv@@drm_etnaviv at sha/etnaviv_device.c.o: In function `etna_device_del_locked':
>   .../build/libdrm-2.4.92/build/../etnaviv/etnaviv_device.c:96: undefined reference to `__sync_add_and_fetch_4'
>   etnaviv/etnaviv@@drm_etnaviv at sha/etnaviv_device.c.o: In function `etna_device_del':
>   .../build/libdrm-2.4.92/build/../etnaviv/etnaviv_device.c:104: undefined reference to `__sync_add_and_fetch_4'
>   etnaviv/etnaviv@@drm_etnaviv at sha/etnaviv_bo.c.o: In function `etna_bo_ref':
>   .../build/libdrm-2.4.92/build/../etnaviv/etnaviv_bo.c:136: undefined reference to `__sync_fetch_and_add_4'
>   etnaviv/etnaviv@@drm_etnaviv at sha/etnaviv_bo.c.o: In function `etna_bo_del':
>   .../build/libdrm-2.4.92/build/../etnaviv/etnaviv_bo.c:241: undefined reference to `__sync_add_and_fetch_4'
>   collect2: error: ld returned 1 exit status
> 
> BR2_sparc=y
> BR2_ENABLE_DEBUG=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sparc-uclibc-2017.11-rc1.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_SYSTEM_BIN_SH_NONE=y
> BR2_PACKAGE_LIBDRM=y
> BR2_PACKAGE_LIBDRM_NOUVEAU=y
> BR2_PACKAGE_LIBDRM_ETNAVIV=y
> 

The Problem fixed by 0003-configure-Makefile.am-use-pkg-config-to-discover-lib.patch
was (see [1]):

../../etnaviv/.libs/libdrm_etnaviv.so: undefined reference to `AO_store_full_emulation'
../../etnaviv/.libs/libdrm_etnaviv.so: undefined reference to `AO_fetch_compare_and_swap_emulation'
collect2: error: ld returned 1 exit status

This one is a new one, maybe result of different config.h, from the autoconf one:

	$ grep ATOMIC build/libdrm-2.4.92/config.h
#define HAVE_LIBDRM_ATOMIC_PRIMITIVES 0
#define HAVE_LIB_ATOMIC_OPS 1

From the meson one:

	$ grep ATOMIC build/libdrm-2.4.92/build/config.h 
#define HAVE_LIBDRM_ATOMIC_PRIMITIVES 1
#define HAVE_LIB_ATOMIC_OPS 0

Regards,
Peter

[1] http://autobuild.buildroot.net/results/92e074c49417261843eef95872ff935a56077c98/build-end.log

> Regards,
> Peter
> 
> > @@ -1,162 +0,0 @@
> > -From 57d544ff2f96a26cac07d5be00ff7b67678ae7b8 Mon Sep 17 00:00:00 2001
> > -From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > -Date: Mon, 18 Dec 2017 13:08:39 +0100
> > -Subject: [PATCH] configure/Makefile.am: use pkg-config to discover
> > - libatomic_ops
> > -
> > -The configure script currently tests the availability of libatomic_ops
> > -by checking the presence of atomic_ops.h. While this is good enough as
> > -an availability test, it is not sufficient as on some platforms,
> > -libatomic_ops provides an actual shared library against which we
> > -should be linked to access libatomic_ops functionality.
> > -
> > -Therefore, we instead use PKG_CHECK_MODULES() to test the availability
> > -of libatomic_ops. Besides testing its availability, this also fills in
> > -the ATOMIC_OPS_LIBS variable with the list of libraries we need to
> > -link with to use libatomic_ops.
> > -
> > -All Mesa drivers that include xf86atomic.h have been updated to link
> > -against ATOMIC_OPS_LIBS.
> > -
> > -Of course, if we're not using libatomic_ops, ATOMIC_OPS_LIBS is empty,
> > -and we don't link against it.
> > -
> > -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > -Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > -[Bernd: PKG_CHECK_MODULES should not fail when libatomic_ops is missing]
> > -Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> > ----
> > - amdgpu/Makefile.am    | 2 +-
> > - configure.ac          | 2 +-
> > - etnaviv/Makefile.am   | 3 ++-
> > - freedreno/Makefile.am | 3 ++-
> > - intel/Makefile.am     | 3 ++-
> > - nouveau/Makefile.am   | 2 +-
> > - omap/Makefile.am      | 2 +-
> > - radeon/Makefile.am    | 2 +-
> > - tegra/Makefile.am     | 2 +-
> > - 9 files changed, 12 insertions(+), 9 deletions(-)
> > -
> > -diff --git a/amdgpu/Makefile.am b/amdgpu/Makefile.am
> > -index a1b0d05c..b2bcceff 100644
> > ---- a/amdgpu/Makefile.am
> > -+++ b/amdgpu/Makefile.am
> > -@@ -36,7 +36,7 @@ AM_CPPFLAGS = -DAMDGPU_ASIC_ID_TABLE=\"${libdrmdatadir}/amdgpu.ids\"
> > - libdrm_amdgpu_la_LTLIBRARIES = libdrm_amdgpu.la
> > - libdrm_amdgpu_ladir = $(libdir)
> > - libdrm_amdgpu_la_LDFLAGS = -version-number 1:0:0 -no-undefined
> > --libdrm_amdgpu_la_LIBADD = ../libdrm.la @PTHREADSTUBS_LIBS@
> > -+libdrm_amdgpu_la_LIBADD = ../libdrm.la @PTHREADSTUBS_LIBS@ @ATOMIC_OPS_LIBS@
> > - 
> > - libdrm_amdgpu_la_SOURCES = $(LIBDRM_AMDGPU_FILES)
> > - amdgpu_asic_id.lo: $(top_srcdir)/data/amdgpu.ids
> > -diff --git a/configure.ac b/configure.ac
> > -index 35378b33..501d0871 100644
> > ---- a/configure.ac
> > -+++ b/configure.ac
> > -@@ -247,7 +247,7 @@ AC_CACHE_CHECK([for native atomic primitives], drm_cv_atomic_primitives, [
> > - 					  ]],[[]])], [drm_cv_atomic_primitives="Intel"],[])
> > - 
> > - 	if test "x$drm_cv_atomic_primitives" = "xnone"; then
> > --		AC_CHECK_HEADER([atomic_ops.h], drm_cv_atomic_primitives="libatomic-ops")
> > -+		PKG_CHECK_MODULES(ATOMIC_OPS, [atomic_ops], drm_cv_atomic_primitives="libatomic-ops", true)
> > - 	fi
> > - 
> > - 	# atomic functions defined in <atomic.h> & libc on Solaris
> > -diff --git a/etnaviv/Makefile.am b/etnaviv/Makefile.am
> > -index be96ba86..669cf14f 100644
> > ---- a/etnaviv/Makefile.am
> > -+++ b/etnaviv/Makefile.am
> > -@@ -12,7 +12,8 @@ libdrm_etnaviv_la_LDFLAGS = -version-number 1:0:0 -no-undefined
> > - libdrm_etnaviv_la_LIBADD = \
> > - 	../libdrm.la \
> > - 	@PTHREADSTUBS_LIBS@ \
> > --	@CLOCK_LIB@
> > -+	@CLOCK_LIB@ \
> > -+	@ATOMIC_OPS_LIBS@
> > - 
> > - libdrm_etnaviv_la_SOURCES = $(LIBDRM_ETNAVIV_FILES)
> > - 
> > -diff --git a/freedreno/Makefile.am b/freedreno/Makefile.am
> > -index cbb0d031..238407e3 100644
> > ---- a/freedreno/Makefile.am
> > -+++ b/freedreno/Makefile.am
> > -@@ -14,7 +14,8 @@ libdrm_freedreno_la_LDFLAGS = -version-number 1:0:0 -no-undefined
> > - libdrm_freedreno_la_LIBADD = \
> > - 	../libdrm.la \
> > - 	@PTHREADSTUBS_LIBS@ \
> > --	@CLOCK_LIB@
> > -+	@CLOCK_LIB@ \
> > -+	@ATOMIC_OPS_LIBS@
> > - 
> > - libdrm_freedreno_la_SOURCES = $(LIBDRM_FREEDRENO_FILES)
> > - if HAVE_FREEDRENO_KGSL
> > -diff --git a/intel/Makefile.am b/intel/Makefile.am
> > -index c52e8c08..f3635a64 100644
> > ---- a/intel/Makefile.am
> > -+++ b/intel/Makefile.am
> > -@@ -38,7 +38,8 @@ libdrm_intel_la_LDFLAGS = -version-number 1:0:0 -no-undefined
> > - libdrm_intel_la_LIBADD = ../libdrm.la \
> > - 	@PTHREADSTUBS_LIBS@ \
> > - 	@PCIACCESS_LIBS@ \
> > --	@CLOCK_LIB@
> > -+	@CLOCK_LIB@ \
> > -+	@ATOMIC_OPS_LIBS@
> > - 
> > - libdrm_intel_la_SOURCES = $(LIBDRM_INTEL_FILES)
> > - 
> > -diff --git a/nouveau/Makefile.am b/nouveau/Makefile.am
> > -index 344a8445..a4e6a78b 100644
> > ---- a/nouveau/Makefile.am
> > -+++ b/nouveau/Makefile.am
> > -@@ -10,7 +10,7 @@ AM_CFLAGS = \
> > - libdrm_nouveau_la_LTLIBRARIES = libdrm_nouveau.la
> > - libdrm_nouveau_ladir = $(libdir)
> > - libdrm_nouveau_la_LDFLAGS = -version-number 2:0:0 -no-undefined
> > --libdrm_nouveau_la_LIBADD = ../libdrm.la @PTHREADSTUBS_LIBS@
> > -+libdrm_nouveau_la_LIBADD = ../libdrm.la @PTHREADSTUBS_LIBS@ @ATOMIC_OPS_LIBS@
> > - 
> > - libdrm_nouveau_la_SOURCES = $(LIBDRM_NOUVEAU_FILES)
> > - 
> > -diff --git a/omap/Makefile.am b/omap/Makefile.am
> > -index 599bb9de..524afee3 100644
> > ---- a/omap/Makefile.am
> > -+++ b/omap/Makefile.am
> > -@@ -7,7 +7,7 @@ AM_CFLAGS = \
> > - libdrm_omap_la_LTLIBRARIES = libdrm_omap.la
> > - libdrm_omap_ladir = $(libdir)
> > - libdrm_omap_la_LDFLAGS = -version-number 1:0:0 -no-undefined
> > --libdrm_omap_la_LIBADD = ../libdrm.la @PTHREADSTUBS_LIBS@
> > -+libdrm_omap_la_LIBADD = ../libdrm.la @PTHREADSTUBS_LIBS@ @ATOMIC_OPS_LIBS@
> > - 
> > - libdrm_omap_la_SOURCES = omap_drm.c
> > - 
> > -diff --git a/radeon/Makefile.am b/radeon/Makefile.am
> > -index e2415314..c27d3c75 100644
> > ---- a/radeon/Makefile.am
> > -+++ b/radeon/Makefile.am
> > -@@ -33,7 +33,7 @@ AM_CFLAGS = \
> > - libdrm_radeon_la_LTLIBRARIES = libdrm_radeon.la
> > - libdrm_radeon_ladir = $(libdir)
> > - libdrm_radeon_la_LDFLAGS = -version-number 1:0:1 -no-undefined
> > --libdrm_radeon_la_LIBADD = ../libdrm.la @PTHREADSTUBS_LIBS@
> > -+libdrm_radeon_la_LIBADD = ../libdrm.la @PTHREADSTUBS_LIBS@ @ATOMIC_OPS_LIBS@
> > - 
> > - libdrm_radeon_la_SOURCES = $(LIBDRM_RADEON_FILES)
> > - 
> > -diff --git a/tegra/Makefile.am b/tegra/Makefile.am
> > -index fb40be55..12abe8c4 100644
> > ---- a/tegra/Makefile.am
> > -+++ b/tegra/Makefile.am
> > -@@ -9,7 +9,7 @@ AM_CFLAGS = \
> > - libdrm_tegra_ladir = $(libdir)
> > - libdrm_tegra_la_LTLIBRARIES = libdrm_tegra.la
> > - libdrm_tegra_la_LDFLAGS = -version-number 0:0:0 -no-undefined
> > --libdrm_tegra_la_LIBADD = ../libdrm.la @PTHREADSTUBS_LIBS@
> > -+libdrm_tegra_la_LIBADD = ../libdrm.la @PTHREADSTUBS_LIBS@ @ATOMIC_OPS_LIBS@
> > - 
> > - libdrm_tegra_la_SOURCES = \
> > - 	private.h \
> > --- 
> > -2.14.3
> > -
> > diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
> > index 06b1144616..65ed01bb16 100644
> > --- a/package/libdrm/libdrm.mk
> > +++ b/package/libdrm/libdrm.mk
> > @@ -10,111 +10,104 @@ LIBDRM_SITE = https://dri.freedesktop.org/libdrm
> >  LIBDRM_LICENSE = MIT
> >  LIBDRM_INSTALL_STAGING = YES
> >  
> > -# patch 0003-configure-Makefile.am-use-pkg-config-to-discover-lib.patch
> > -# touching configure.ac/Makefile.am (and host-xutil_util-macros dependency)
> > -LIBDRM_AUTORECONF = YES
> > -
> >  LIBDRM_DEPENDENCIES = \
> >  	libpthread-stubs \
> > -	host-pkgconf \
> > -	host-xutil_util-macros
> > +	host-pkgconf
> >  
> >  LIBDRM_CONF_OPTS = \
> > -	--disable-cairo-tests \
> > -	--disable-manpages
> > -
> > -LIBDRM_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
> > +	-Dcairo-tests=false \
> > +	-Dmanpages=false
> >  
> >  ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
> >  LIBDRM_DEPENDENCIES += libatomic_ops
> >  ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
> > -LIBDRM_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -DAO_NO_SPARC_V9"
> > +LIBDRM_MESON_CFLAGS += "\"-DAO_NO_SPARC_V9\","
> >  endif
> >  endif
> >  
> >  ifeq ($(BR2_PACKAGE_LIBDRM_INTEL),y)
> > -LIBDRM_CONF_OPTS += --enable-intel
> > +LIBDRM_CONF_OPTS += -Dintel=true
> >  LIBDRM_DEPENDENCIES += libpciaccess
> >  else
> > -LIBDRM_CONF_OPTS += --disable-intel
> > +LIBDRM_CONF_OPTS += -Dintel=false
> >  endif
> >  
> >  ifeq ($(BR2_PACKAGE_LIBDRM_RADEON),y)
> > -LIBDRM_CONF_OPTS += --enable-radeon
> > +LIBDRM_CONF_OPTS += -Dradeon=true
> >  else
> > -LIBDRM_CONF_OPTS += --disable-radeon
> > +LIBDRM_CONF_OPTS += -Dradeon=false
> >  endif
> >  
> >  ifeq ($(BR2_PACKAGE_LIBDRM_AMDGPU),y)
> > -LIBDRM_CONF_OPTS += --enable-amdgpu
> > +LIBDRM_CONF_OPTS += -Damdgpu=true
> >  else
> > -LIBDRM_CONF_OPTS += --disable-amdgpu
> > +LIBDRM_CONF_OPTS += -Damdgpu=false
> >  endif
> >  
> >  ifeq ($(BR2_PACKAGE_LIBDRM_NOUVEAU),y)
> > -LIBDRM_CONF_OPTS += --enable-nouveau
> > +LIBDRM_CONF_OPTS += -Dnouveau=true
> >  else
> > -LIBDRM_CONF_OPTS += --disable-nouveau
> > +LIBDRM_CONF_OPTS += -Dnouveau=false
> >  endif
> >  
> >  ifeq ($(BR2_PACKAGE_LIBDRM_VMWGFX),y)
> > -LIBDRM_CONF_OPTS += --enable-vmwgfx
> > +LIBDRM_CONF_OPTS += -Dvmwgfx=true
> >  else
> > -LIBDRM_CONF_OPTS += --disable-vmwgfx
> > +LIBDRM_CONF_OPTS += -Dvmwgfx=false
> >  endif
> >  
> >  ifeq ($(BR2_PACKAGE_LIBDRM_OMAP),y)
> > -LIBDRM_CONF_OPTS += --enable-omap-experimental-api
> > +LIBDRM_CONF_OPTS += -Domap=true
> >  else
> > -LIBDRM_CONF_OPTS += --disable-omap-experimental-api
> > +LIBDRM_CONF_OPTS += -Domap=false
> >  endif
> >  
> >  ifeq ($(BR2_PACKAGE_LIBDRM_ETNAVIV),y)
> > -LIBDRM_CONF_OPTS += --enable-etnaviv-experimental-api
> > +LIBDRM_CONF_OPTS += -Detnaviv=true
> >  else
> > -LIBDRM_CONF_OPTS += --disable-etnaviv-experimental-api
> > +LIBDRM_CONF_OPTS += -Detnaviv=false
> >  endif
> >  
> >  ifeq ($(BR2_PACKAGE_LIBDRM_EXYNOS),y)
> > -LIBDRM_CONF_OPTS += --enable-exynos-experimental-api
> > +LIBDRM_CONF_OPTS += -Dexynos=true
> >  else
> > -LIBDRM_CONF_OPTS += --disable-exynos-experimental-api
> > +LIBDRM_CONF_OPTS += -Dexynos=false
> >  endif
> >  
> >  ifeq ($(BR2_PACKAGE_LIBDRM_FREEDRENO),y)
> > -LIBDRM_CONF_OPTS += --enable-freedreno
> > +LIBDRM_CONF_OPTS += -Dfreedreno=true
> >  else
> > -LIBDRM_CONF_OPTS += --disable-freedreno
> > +LIBDRM_CONF_OPTS += -Dfreedreno=false
> >  endif
> >  
> >  ifeq ($(BR2_PACKAGE_LIBDRM_TEGRA),y)
> > -LIBDRM_CONF_OPTS += --enable-tegra-experimental-api
> > +LIBDRM_CONF_OPTS += -Dtegra=true
> >  else
> > -LIBDRM_CONF_OPTS += --disable-tegra-experimental-api
> > +LIBDRM_CONF_OPTS += -Dtegra=false
> >  endif
> >  
> >  ifeq ($(BR2_PACKAGE_LIBDRM_VC4),y)
> > -LIBDRM_CONF_OPTS += --enable-vc4
> > +LIBDRM_CONF_OPTS += -Dvc4=true
> >  else
> > -LIBDRM_CONF_OPTS += --disable-vc4
> > +LIBDRM_CONF_OPTS += -Dvc4=false
> >  endif
> >  
> >  ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
> > -LIBDRM_CONF_OPTS += --enable-udev
> > +LIBDRM_CONF_OPTS += -Dudev=true
> >  LIBDRM_DEPENDENCIES += udev
> >  else
> > -LIBDRM_CONF_OPTS += --disable-udev
> > +LIBDRM_CONF_OPTS += -Dudev=false
> >  endif
> >  
> >  ifeq ($(BR2_PACKAGE_VALGRIND),y)
> > -LIBDRM_CONF_OPTS += --enable-valgrind
> > +LIBDRM_CONF_OPTS += -Dvalgrind=true
> >  LIBDRM_DEPENDENCIES += valgrind
> >  else
> > -LIBDRM_CONF_OPTS += --disable-valgrind
> > +LIBDRM_CONF_OPTS += -Dvalgrind=false
> >  endif
> >  
> >  ifeq ($(BR2_PACKAGE_LIBDRM_INSTALL_TESTS),y)
> > -LIBDRM_CONF_OPTS += --enable-install-test-programs
> > +LIBDRM_CONF_OPTS += -Dinstall-test-programs=true
> >  endif
> >  
> > -$(eval $(autotools-package))
> > +$(eval $(meson-package))  
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
