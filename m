From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 Dec 2009 19:58:45 +0100
Subject: [Buildroot] [git commit master] package: get rid of redundant
	malloc related configure presets
Message-ID: <20091206190102.8080F777F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9e767147474be1e0db131154876817033a029b1f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Those are already in TARGET_CONFIGURE_ARGS. Also get rid of unused
BR2_AC_CV_FUNC_MALLOC_0_NONNULL variable.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in                      |   14 --------------
 package/atk/atk.mk                       |    2 --
 package/avahi/avahi.mk                   |    6 ------
 package/bootutils/bootutils.mk           |    2 --
 package/cairo/cairo.mk                   |    5 +----
 package/coreutils/coreutils.mk           |    6 ------
 package/diffutils/diffutils.mk           |    6 ------
 package/fbdump/fbdump.mk                 |    2 --
 package/games/gnuchess/gnuchess.mk       |    4 ----
 package/gettext/gettext.mk               |    6 ------
 package/gtk2-engines/gtk2-engines.mk     |    6 ------
 package/iperf/iperf.mk                   |    5 +----
 package/java/classpath/classpath.mk      |    4 +---
 package/java/jamvm/jamvm.mk              |    4 +---
 package/libglib2/libglib2.mk             |    4 +---
 package/libgtk2/libgtk2.mk               |    6 ------
 package/libpng/libpng.mk                 |    7 -------
 package/lvm2/lvm2.mk                     |    5 -----
 package/pango/pango.mk                   |    5 +----
 package/psmisc/psmisc.mk                 |    5 -----
 package/x11r7/xlib_libX11/xlib_libX11.mk |    1 -
 21 files changed, 6 insertions(+), 99 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index b5a7a8e..7c009bb 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -303,20 +303,6 @@ else
 BR2_AC_CV_C_BIGENDIAN=ac_cv_c_bigendian=no
 endif
 
-# XXX: FIXME: We would need to grab MALLOC_GLIBC_COMPAT from the uClibc.config
-# Including it doesn't seem wise, grepping is ugly.. Suggestions?
-# Does malloc return live pointer for malloc(0) ?
-ifeq ($(MALLOC_GLIBC_COMPAT),y)
-BR2_AC_CV_FUNC_MALLOC_0_NONNULL=ac_cv_func_malloc_0_nonnull=yes \
-				gl_cv_func_malloc_0_nonnull=yes \
-				ac_cv_func_realloc_0_nonnull=yes
-else
-BR2_AC_CV_FUNC_MALLOC_0_NONNULL=ac_cv_func_malloc_0_nonnull=no \
-				gl_cv_func_malloc_0_nonnull=no \
-				ac_cv_func_realloc_0_nonnull=no
-endif
-
-
 TARGET_CONFIGURE_ARGS= \
 	$(BR2_AC_CV_TRAP_CHECK) \
 	ac_cv_func_mmap_fixed_mapped=yes \
diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index df8039e..93b9e9e 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -28,8 +28,6 @@ ATK_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes \
 		ac_cv_func_getdelim=yes ac_cv_func_mkstemp=yes \
 		utils_cv_func_mkstemp_limitations=no utils_cv_func_mkdir_trailing_slash_bug=no \
 		ac_cv_func_memcmp_working=yes ac_cv_have_decl_malloc=yes \
-		gl_cv_func_malloc_0_nonnull=yes ac_cv_func_malloc_0_nonnull=yes \
-		ac_cv_func_calloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes \
 		jm_cv_func_gettimeofday_clobber=no gl_cv_func_working_readdir=yes \
 		jm_ac_cv_func_link_follows_symlink=no utils_cv_localtime_cache=no \
 		ac_cv_struct_st_mtim_nsec=no gl_cv_func_tzset_clobber=no \
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 7c463b6..0c9d11e 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -46,12 +46,6 @@ AVAHI_CONF_ENV = ac_cv_func_strtod=yes \
 		ac_cv_func_mkstemp=yes \
 		utils_cv_func_mkstemp_limitations=no \
 		utils_cv_func_mkdir_trailing_slash_bug=no \
-		ac_cv_func_memcmp_working=yes \
-		ac_cv_have_decl_malloc=yes \
-		gl_cv_func_malloc_0_nonnull=yes \
-		ac_cv_func_malloc_0_nonnull=yes \
-		ac_cv_func_calloc_0_nonnull=yes \
-		ac_cv_func_realloc_0_nonnull=yes \
 		jm_cv_func_gettimeofday_clobber=no \
 		am_cv_func_working_getline=yes \
 		gl_cv_func_working_readdir=yes \
diff --git a/package/bootutils/bootutils.mk b/package/bootutils/bootutils.mk
index 3c4459e..fda0a4d 100644
--- a/package/bootutils/bootutils.mk
+++ b/package/bootutils/bootutils.mk
@@ -6,8 +6,6 @@
 BOOTUTILS_VERSION = 0.0.9
 BOOTUTILS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/bootutils
 
-BOOTUTILS_CONF_ENV = ac_cv_func_malloc_0_nonnull=yes
-
 BOOTUTILS_CONF_OPT = --prefix=/ --exec-prefix=/
 
 BOOTUTILS_INSTALL_TARGET_OPT=DESTDIR=$(TARGET_DIR) install
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 2f3687f..e160bf9 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -26,10 +26,7 @@ CAIRO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		ac_cv_func_strerror_r_char_p=no jm_cv_func_svid_putenv=yes \
 		ac_cv_func_getcwd_null=yes ac_cv_func_getdelim=yes \
 		ac_cv_func_mkstemp=yes utils_cv_func_mkstemp_limitations=no \
-		utils_cv_func_mkdir_trailing_slash_bug=no ac_cv_func_memcmp_working=yes \
-		ac_cv_have_decl_malloc=yes gl_cv_func_malloc_0_nonnull=yes \
-		ac_cv_func_malloc_0_nonnull=yes ac_cv_func_calloc_0_nonnull=yes \
-		ac_cv_func_realloc_0_nonnull=yes jm_cv_func_gettimeofday_clobber=no \
+		utils_cv_func_mkdir_trailing_slash_bug=no jm_cv_func_gettimeofday_clobber=no \
 		gl_cv_func_working_readdir=yes jm_ac_cv_func_link_follows_symlink=no \
 		utils_cv_localtime_cache=no ac_cv_struct_st_mtim_nsec=no \
 		gl_cv_func_tzset_clobber=no gl_cv_func_getcwd_null=yes \
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 0dcb62b..85a5491 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -63,12 +63,6 @@ $(COREUTILS_DIR)/.configured: $(COREUTILS_DIR)/.unpacked
 		utils_cv_func_mkstemp_limitations=no \
 		utils_cv_func_mkdir_trailing_slash_bug=no \
 		gl_cv_func_rename_dest_exists_bug=no \
-		ac_cv_func_memcmp_working=yes \
-		ac_cv_have_decl_malloc=yes \
-		gl_cv_func_malloc_0_nonnull=yes \
-		ac_cv_func_malloc_0_nonnull=yes \
-		ac_cv_func_calloc_0_nonnull=yes \
-		ac_cv_func_realloc_0_nonnull=yes \
 		jm_cv_func_gettimeofday_clobber=no \
 		am_cv_func_working_getline=yes \
 		gl_cv_func_working_readdir=yes \
diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
index 773913b..fe1bab8 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -55,12 +55,6 @@ $(DIFFUTILS_DIR)/.configured: $(DIFFUTILS_DIR)/.unpacked
 		ac_cv_func_mkstemp=yes \
 		utils_cv_func_mkstemp_limitations=no \
 		utils_cv_func_mkdir_trailing_slash_bug=no \
-		ac_cv_func_memcmp_working=yes \
-		ac_cv_have_decl_malloc=yes \
-		gl_cv_func_malloc_0_nonnull=yes \
-		ac_cv_func_malloc_0_nonnull=yes \
-		ac_cv_func_calloc_0_nonnull=yes \
-		ac_cv_func_realloc_0_nonnull=yes \
 		jm_cv_func_gettimeofday_clobber=no \
 		am_cv_func_working_getline=yes \
 		gl_cv_func_working_readdir=yes \
diff --git a/package/fbdump/fbdump.mk b/package/fbdump/fbdump.mk
index 9dcb7cd..521b0fd 100644
--- a/package/fbdump/fbdump.mk
+++ b/package/fbdump/fbdump.mk
@@ -7,8 +7,6 @@ FBDUMP_VERSION:=0.4.2
 FBDUMP_SOURCE:=fbdump-$(FBDUMP_VERSION).tar.gz
 FBDUMP_SITE:=http://www.rcdrummond.net/fbdump
 FBDUMP_AUTORECONF = NO
-FBDUMP_CONF_ENV = ac_cv_func_malloc_0_nonnull=yes
-FBDUMP_INSTALL_TARGET = YES
 
 $(eval $(call AUTOTARGETS,package,fbdump))
 
diff --git a/package/games/gnuchess/gnuchess.mk b/package/games/gnuchess/gnuchess.mk
index 921d0fd..d5a8dd6 100644
--- a/package/games/gnuchess/gnuchess.mk
+++ b/package/games/gnuchess/gnuchess.mk
@@ -6,10 +6,6 @@
 GNUCHESS_VERSION = 5.07
 GNUCHESS_SOURCE = gnuchess-$(GNUCHESS_VERSION).tar.gz
 GNUCHESS_SITE = $(BR2_GNU_MIRROR)/chess
-GNUCHESS_INSTALL_STAGING = NO
-GNUCHESS_INSTALL_TARGET = YES
-
-GNUCHESS_CONF_ENV = ac_cv_func_realloc_0_nonnull=yes ac_cv_func_malloc_0_nonnull=yes
 
 $(eval $(call AUTOTARGETS,package/games,gnuchess))
 
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index fb83d5b..a0955c1 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -67,12 +67,6 @@ $(GETTEXT_DIR)/.configured: $(GETTEXT_DIR)/.unpacked
 		ac_cv_func_mkstemp=yes \
 		utils_cv_func_mkstemp_limitations=no \
 		utils_cv_func_mkdir_trailing_slash_bug=no \
-		ac_cv_func_memcmp_working=yes \
-		ac_cv_have_decl_malloc=yes \
-		gl_cv_func_malloc_0_nonnull=yes \
-		ac_cv_func_malloc_0_nonnull=yes \
-		ac_cv_func_calloc_0_nonnull=yes \
-		ac_cv_func_realloc_0_nonnull=yes \
 		jm_cv_func_gettimeofday_clobber=no \
 		gl_cv_func_working_readdir=yes \
 		jm_ac_cv_func_link_follows_symlink=no \
diff --git a/package/gtk2-engines/gtk2-engines.mk b/package/gtk2-engines/gtk2-engines.mk
index 2ffce75..4c7776e 100644
--- a/package/gtk2-engines/gtk2-engines.mk
+++ b/package/gtk2-engines/gtk2-engines.mk
@@ -46,12 +46,6 @@ GTK2_ENGINES_BUILD_ENV= \
 		ac_cv_func_mkstemp=yes \
 		utils_cv_func_mkstemp_limitations=no \
 		utils_cv_func_mkdir_trailing_slash_bug=no \
-		ac_cv_func_memcmp_working=yes \
-		ac_cv_have_decl_malloc=yes \
-		gl_cv_func_malloc_0_nonnull=yes \
-		ac_cv_func_malloc_0_nonnull=yes \
-		ac_cv_func_calloc_0_nonnull=yes \
-		ac_cv_func_realloc_0_nonnull=yes \
 		jm_cv_func_gettimeofday_clobber=no \
 		gl_cv_func_working_readdir=yes \
 		jm_ac_cv_func_link_follows_symlink=no \
diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index 27c8e53..d18d7e5 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -8,9 +8,6 @@ IPERF_VERSION:=2.0.3
 IPERF_SOURCE:=iperf-$(IPERF_VERSION).tar.gz
 IPERF_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/iperf
 IPERF_AUTORECONF:=NO
-IPERF_INSTALL_STAGING:=NO
-IPERF_INSTALL_TARGET:=YES
-IPERF_CONF_ENV:=ac_cv_func_malloc_0_nonnull=yes
-IPERF_CONF_OPT:=--disable-dependency-tracking --disable-web100 $(DISABLE_IPV6)
+IPERF_CONF_OPT:=--disable-dependency-tracking --disable-web100
 
 $(eval $(call AUTOTARGETS,package,iperf))
diff --git a/package/java/classpath/classpath.mk b/package/java/classpath/classpath.mk
index 3cd21eb..c63837b 100644
--- a/package/java/classpath/classpath.mk
+++ b/package/java/classpath/classpath.mk
@@ -30,9 +30,7 @@ CLASSPATH_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		ac_cv_func_getcwd_null=yes ac_cv_func_getdelim=yes \
 		ac_cv_func_mkstemp=yes utils_cv_func_mkstemp_limitations=no \
 		utils_cv_func_mkdir_trailing_slash_bug=no \
-		ac_cv_have_decl_malloc=yes gl_cv_func_malloc_0_nonnull=yes \
-		ac_cv_func_malloc_0_nonnull=yes ac_cv_func_calloc_0_nonnull=yes \
-		ac_cv_func_realloc_0_nonnull=yes jm_cv_func_gettimeofday_clobber=no \
+		jm_cv_func_gettimeofday_clobber=no \
 		gl_cv_func_working_readdir=yes jm_ac_cv_func_link_follows_symlink=no \
 		utils_cv_localtime_cache=no ac_cv_struct_st_mtim_nsec=no \
 		gl_cv_func_tzset_clobber=no gl_cv_func_getcwd_null=yes \
diff --git a/package/java/jamvm/jamvm.mk b/package/java/jamvm/jamvm.mk
index bd66e42..65ba096 100644
--- a/package/java/jamvm/jamvm.mk
+++ b/package/java/jamvm/jamvm.mk
@@ -28,9 +28,7 @@ JAMVM_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		ac_cv_func_getcwd_null=yes ac_cv_func_getdelim=yes \
 		ac_cv_func_mkstemp=yes utils_cv_func_mkstemp_limitations=no \
 		utils_cv_func_mkdir_trailing_slash_bug=no \
-		ac_cv_have_decl_malloc=yes gl_cv_func_malloc_0_nonnull=yes \
-		ac_cv_func_malloc_0_nonnull=yes ac_cv_func_calloc_0_nonnull=yes \
-		ac_cv_func_realloc_0_nonnull=yes jm_cv_func_gettimeofday_clobber=no \
+		jm_cv_func_gettimeofday_clobber=no \
 		gl_cv_func_working_readdir=yes jm_ac_cv_func_link_follows_symlink=no \
 		utils_cv_localtime_cache=no ac_cv_struct_st_mtim_nsec=no \
 		gl_cv_func_tzset_clobber=no gl_cv_func_getcwd_null=yes \
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 7100800..2d02b9b 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -33,9 +33,7 @@ LIBGLIB2_CONF_ENV =	\
 		ac_cv_func_getcwd_null=yes ac_cv_func_getdelim=yes \
 		ac_cv_func_mkstemp=yes utils_cv_func_mkstemp_limitations=no \
 		utils_cv_func_mkdir_trailing_slash_bug=no \
-		ac_cv_have_decl_malloc=yes gl_cv_func_malloc_0_nonnull=yes \
-		ac_cv_func_malloc_0_nonnull=yes ac_cv_func_calloc_0_nonnull=yes \
-		ac_cv_func_realloc_0_nonnull=yes jm_cv_func_gettimeofday_clobber=no \
+		jm_cv_func_gettimeofday_clobber=no \
 		gl_cv_func_working_readdir=yes jm_ac_cv_func_link_follows_symlink=no \
 		utils_cv_localtime_cache=no ac_cv_struct_st_mtim_nsec=no \
 		gl_cv_func_tzset_clobber=no gl_cv_func_getcwd_null=yes \
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 0855fbf..83eab38 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -45,12 +45,6 @@ LIBGTK2_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		ac_cv_func_mkstemp=yes \
 		utils_cv_func_mkstemp_limitations=no \
 		utils_cv_func_mkdir_trailing_slash_bug=no \
-		ac_cv_func_memcmp_working=yes \
-		ac_cv_have_decl_malloc=yes \
-		gl_cv_func_malloc_0_nonnull=yes \
-		ac_cv_func_malloc_0_nonnull=yes \
-		ac_cv_func_calloc_0_nonnull=yes \
-		ac_cv_func_realloc_0_nonnull=yes \
 		jm_cv_func_gettimeofday_clobber=no \
 		gl_cv_func_working_readdir=yes \
 		jm_ac_cv_func_link_follows_symlink=no \
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index f49a9a5..3cb03a6 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -8,13 +8,6 @@ LIBPNG_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/li
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.bz2
 LIBPNG_LIBTOOL_PATCH = NO
 LIBPNG_INSTALL_STAGING = YES
-LIBPNG_INSTALL_TARGET = YES
-LIBPNG_CONF_ENV = \
-		ac_cv_have_decl_malloc=yes \
-		gl_cv_func_malloc_0_nonnull=yes \
-		ac_cv_func_malloc_0_nonnull=yes \
-		ac_cv_func_calloc_0_nonnull=yes \
-		ac_cv_func_realloc_0_nonnull=yes
 LIBPNG_CONF_OPT = --without-libpng-compat
 LIBPNG_DEPENDENCIES = host-pkgconfig zlib
 
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index f3802a4..d190be2 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -61,11 +61,6 @@ $(LVM2_DIR)/.configured: $(LVM2_DIR)/.unpacked
 	(cd $(LVM2_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
-		ac_cv_have_decl_malloc=yes \
-		gl_cv_func_malloc_0_nonnull=yes \
-		ac_cv_func_malloc_0_nonnull=yes \
-		ac_cv_func_calloc_0_nonnull=yes \
-		ac_cv_func_realloc_0_nonnull=yes \
 		./configure $(QUIET) \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 3d4b7a0..f7bf0aa 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -26,10 +26,7 @@ PANGO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		ac_cv_func_strerror_r_char_p=no jm_cv_func_svid_putenv=yes \
 		ac_cv_func_getcwd_null=yes ac_cv_func_getdelim=yes \
 		ac_cv_func_mkstemp=yes utils_cv_func_mkstemp_limitations=no \
-		utils_cv_func_mkdir_trailing_slash_bug=no ac_cv_func_memcmp_working=yes \
-		ac_cv_have_decl_malloc=yes gl_cv_func_malloc_0_nonnull=yes \
-		ac_cv_func_malloc_0_nonnull=yes ac_cv_func_calloc_0_nonnull=yes \
-		ac_cv_func_realloc_0_nonnull=yes jm_cv_func_gettimeofday_clobber=no \
+		utils_cv_func_mkdir_trailing_slash_bug=no jm_cv_func_gettimeofday_clobber=no \
 		gl_cv_func_working_readdir=yes jm_ac_cv_func_link_follows_symlink=no \
 		utils_cv_localtime_cache=no ac_cv_struct_st_mtim_nsec=no \
 		gl_cv_func_tzset_clobber=no gl_cv_func_getcwd_null=yes \
diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
index 9276b08..e04923d 100644
--- a/package/psmisc/psmisc.mk
+++ b/package/psmisc/psmisc.mk
@@ -7,11 +7,6 @@ PSMISC_VERSION:=22.8
 PSMISC_SOURCE:=psmisc-$(PSMISC_VERSION).tar.gz
 PSMISC_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/psmisc
 PSMISC_AUTORECONF:=NO
-PSMISC_INSTALL_STAGING:=NO
-PSMISC_INSTALL_TARGET:=YES
-PSMISC_CONF_ENV:=ac_cv_func_malloc_0_nonnull=yes \
-		 ac_cv_func_realloc_0_nonnull=yes
-PSMISC_CONF_OPT:= $(DISABLE_IPV6)
 PSMISC_DEPENDENCIES:=ncurses
 
 ifeq ($(BR2_ENABLE_LOCALE),y)
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index 270e5ec..e2f7e9a 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -10,7 +10,6 @@ XLIB_LIBX11_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBX11_AUTORECONF = YES
 XLIB_LIBX11_INSTALL_STAGING = YES
 XLIB_LIBX11_DEPENDENCIES = libxcb xutil_util-macros xlib_xtrans xlib_libXau xlib_libXdmcp xproto_kbproto xproto_xproto xproto_xextproto xproto_inputproto xproto_xf86bigfontproto xproto_bigreqsproto xproto_xcmiscproto
-XLIB_LIBX11_CONF_ENV = ac_cv_func_mmap_fixed_mapped=yes
 XLIB_LIBX11_CONF_OPT = --disable-malloc0returnsnull --with-xcb --enable-shared --disable-static --with-keysymdef=$(STAGING_DIR)/usr/include/X11/keysymdef.h
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libX11))
-- 
1.6.3.3
