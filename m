From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Date: Tue,  8 Jul 2014 15:57:09 +0200
Subject: [Buildroot] [RFC 6/9] libgtk3: new package
In-Reply-To: <1404827832-1101-1-git-send-email-hadrien.boutteville@gmail.com>
References: <1404827832-1101-1-git-send-email-hadrien.boutteville@gmail.com>
Message-ID: <1404827832-1101-7-git-send-email-hadrien.boutteville@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in                                  |   1 +
 package/libgtk3/Config.in                          |  47 ++++++
 package/libgtk3/libgtk3-0001-no-gtk-doc.patch      |  11 ++
 .../libgtk3-0002-add-file-introspection-m4.patch   | 100 +++++++++++
 package/libgtk3/libgtk3.mk                         | 184 +++++++++++++++++++++
 5 files changed, 343 insertions(+)
 create mode 100644 package/libgtk3/Config.in
 create mode 100644 package/libgtk3/libgtk3-0001-no-gtk-doc.patch
 create mode 100644 package/libgtk3/libgtk3-0002-add-file-introspection-m4.patch
 create mode 100644 package/libgtk3/libgtk3.mk

diff --git a/package/Config.in b/package/Config.in
index b700ed1..caa3fa6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -612,6 +612,7 @@ menu "Graphics"
 	source "package/libgeotiff/Config.in"
 	source "package/libglade/Config.in"
 	source "package/libgtk2/Config.in"
+	source "package/libgtk3/Config.in"
 	source "package/libpng/Config.in"
 	source "package/libqrencode/Config.in"
 	source "package/libraw/Config.in"
diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
new file mode 100644
index 0000000..4a2eb82
--- /dev/null
+++ b/package/libgtk3/Config.in
@@ -0,0 +1,47 @@
+config BR2_PACKAGE_LIBGTK3
+	bool "libgtk3"
+	select BR2_PACKAGE_ATK
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_CAIRO_PS
+	select BR2_PACKAGE_CAIRO_PDF
+	select BR2_PACKAGE_CAIRO_SVG
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_PANGO
+	select BR2_PACKAGE_GDK_PIXBUF
+	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXRENDER
+	select BR2_PACKAGE_XLIB_LIBXI # required for building X11 backend
+	select BR2_PACKAGE_AT_SPI2_ATK
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
+	depends on BR2_INSTALL_LIBSTDCPP # pango
+	help
+	  The GTK+ version 3 graphical user interface library
+
+	  http://www.gtk.org/
+
+if BR2_PACKAGE_LIBGTK3
+
+config BR2_PACKAGE_LIBGTK3_DEMO
+	bool "Install libgtk3 demo program"
+	help
+	  The GTK+ source base contains demo programs. This
+	  option allows to install this program to the target.
+
+config BR2_PACKAGE_LIBGTK3_TESTS
+	bool "Install libgtk3 tests"
+	help
+	  The GTK+ source base contains tests. This option
+	  allows to install them to the target.
+
+endif
+
+comment "libgtk3 needs a toolchain w/ wchar, threads, C++"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_XORG7
+	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libgtk3/libgtk3-0001-no-gtk-doc.patch b/package/libgtk3/libgtk3-0001-no-gtk-doc.patch
new file mode 100644
index 0000000..0c12ee4
--- /dev/null
+++ b/package/libgtk3/libgtk3-0001-no-gtk-doc.patch
@@ -0,0 +1,11 @@
+--- a/gtk-doc.make
++++ b/gtk-doc.make
+@@ -267,7 +267,7 @@
+ #
+ # Require gtk-doc when making dist
+ #
+-if HAVE_GTK_DOC
++if ENABLE_GTK_DOC
+ dist-check-gtkdoc: docs
+ else
+ dist-check-gtkdoc:
diff --git a/package/libgtk3/libgtk3-0002-add-file-introspection-m4.patch b/package/libgtk3/libgtk3-0002-add-file-introspection-m4.patch
new file mode 100644
index 0000000..3cd0569
--- /dev/null
+++ b/package/libgtk3/libgtk3-0002-add-file-introspection-m4.patch
@@ -0,0 +1,100 @@
+diff -Naur gtk+-3.12.2.orig/m4/introspection.m4 gtk+-3.12.2/m4/introspection.m4
+--- gtk+-3.12.2.orig/m4/introspection.m4	1970-01-01 01:00:00.000000000 +0100
++++ gtk+-3.12.2/m4/introspection.m4	2014-06-17 17:26:34.731847165 +0200
+@@ -0,0 +1,96 @@
++dnl -*- mode: autoconf -*-
++dnl Copyright 2009 Johan Dahlin
++dnl
++dnl This file is free software; the author(s) gives unlimited
++dnl permission to copy and/or distribute it, with or without
++dnl modifications, as long as this notice is preserved.
++dnl
++
++# serial 1
++
++m4_define([_GOBJECT_INTROSPECTION_CHECK_INTERNAL],
++[
++    AC_BEFORE([AC_PROG_LIBTOOL],[$0])dnl setup libtool first
++    AC_BEFORE([AM_PROG_LIBTOOL],[$0])dnl setup libtool first
++    AC_BEFORE([LT_INIT],[$0])dnl setup libtool first
++
++    dnl enable/disable introspection
++    m4_if([$2], [require],
++    [dnl
++        enable_introspection=yes
++    ],[dnl
++        AC_ARG_ENABLE(introspection,
++                  AS_HELP_STRING([--enable-introspection[=@<:@no/auto/yes@:>@]],
++                                 [Enable introspection for this build]),, 
++                                 [enable_introspection=auto])
++    ])dnl
++
++    AC_MSG_CHECKING([for gobject-introspection])
++
++    dnl presence/version checking
++    AS_CASE([$enable_introspection],
++    [no], [dnl
++        found_introspection="no (disabled, use --enable-introspection to enable)"
++    ],dnl
++    [yes],[dnl
++        PKG_CHECK_EXISTS([gobject-introspection-1.0],,
++                         AC_MSG_ERROR([gobject-introspection-1.0 is not installed]))
++        PKG_CHECK_EXISTS([gobject-introspection-1.0 >= $1],
++                         found_introspection=yes,
++                         AC_MSG_ERROR([You need to have gobject-introspection >= $1 installed to build AC_PACKAGE_NAME]))
++    ],dnl
++    [auto],[dnl
++        PKG_CHECK_EXISTS([gobject-introspection-1.0 >= $1], found_introspection=yes, found_introspection=no)
++	dnl Canonicalize enable_introspection
++	enable_introspection=$found_introspection
++    ],dnl
++    [dnl	
++        AC_MSG_ERROR([invalid argument passed to --enable-introspection, should be one of @<:@no/auto/yes@:>@])
++    ])dnl
++
++    AC_MSG_RESULT([$found_introspection])
++
++    INTROSPECTION_SCANNER=
++    INTROSPECTION_COMPILER=
++    INTROSPECTION_GENERATE=
++    INTROSPECTION_GIRDIR=
++    INTROSPECTION_TYPELIBDIR=
++    if test "x$found_introspection" = "xyes"; then
++       INTROSPECTION_SCANNER=`$PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0`
++       INTROSPECTION_COMPILER=`$PKG_CONFIG --variable=g_ir_compiler gobject-introspection-1.0`
++       INTROSPECTION_GENERATE=`$PKG_CONFIG --variable=g_ir_generate gobject-introspection-1.0`
++       INTROSPECTION_GIRDIR=`$PKG_CONFIG --variable=girdir gobject-introspection-1.0`
++       INTROSPECTION_TYPELIBDIR="$($PKG_CONFIG --variable=typelibdir gobject-introspection-1.0)"
++       INTROSPECTION_CFLAGS=`$PKG_CONFIG --cflags gobject-introspection-1.0`
++       INTROSPECTION_LIBS=`$PKG_CONFIG --libs gobject-introspection-1.0`
++       INTROSPECTION_MAKEFILE=`$PKG_CONFIG --variable=datadir gobject-introspection-1.0`/gobject-introspection-1.0/Makefile.introspection
++    fi
++    AC_SUBST(INTROSPECTION_SCANNER)
++    AC_SUBST(INTROSPECTION_COMPILER)
++    AC_SUBST(INTROSPECTION_GENERATE)
++    AC_SUBST(INTROSPECTION_GIRDIR)
++    AC_SUBST(INTROSPECTION_TYPELIBDIR)
++    AC_SUBST(INTROSPECTION_CFLAGS)
++    AC_SUBST(INTROSPECTION_LIBS)
++    AC_SUBST(INTROSPECTION_MAKEFILE)
++
++    AM_CONDITIONAL(HAVE_INTROSPECTION, test "x$found_introspection" = "xyes")
++])
++
++
++dnl Usage:
++dnl   GOBJECT_INTROSPECTION_CHECK([minimum-g-i-version])
++
++AC_DEFUN([GOBJECT_INTROSPECTION_CHECK],
++[
++  _GOBJECT_INTROSPECTION_CHECK_INTERNAL([$1])
++])
++
++dnl Usage:
++dnl   GOBJECT_INTROSPECTION_REQUIRE([minimum-g-i-version])
++
++
++AC_DEFUN([GOBJECT_INTROSPECTION_REQUIRE],
++[
++  _GOBJECT_INTROSPECTION_CHECK_INTERNAL([$1], [require])
++])
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
new file mode 100644
index 0000000..0b61e25
--- /dev/null
+++ b/package/libgtk3/libgtk3.mk
@@ -0,0 +1,184 @@
+################################################################################
+#
+# libgtk3
+#
+################################################################################
+
+LIBGTK3_VERSION_MAJOR = 3.12
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).2
+
+LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
+LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
+LIBGTK3_LICENSE = LGPLv2+
+LIBGTK3_LICENSE_FILES = COPYING
+LIBGTK3_INSTALL_STAGING = YES
+LIBGTK3_INSTALL_TARGET = YES
+
+LIBGTK3_AUTORECONF = YES
+
+LIBGTK3_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
+		glib_cv_uscore=no \
+		ac_cv_func_strtod=yes \
+		ac_fsusage_space=yes \
+		fu_cv_sys_stat_statfs2_bsize=yes \
+		ac_cv_func_closedir_void=no \
+		ac_cv_func_getloadavg=no \
+		ac_cv_lib_util_getloadavg=no \
+		ac_cv_lib_getloadavg_getloadavg=no \
+		ac_cv_func_getgroups=yes \
+		ac_cv_func_getgroups_works=yes \
+		ac_cv_func_chown_works=yes \
+		ac_cv_have_decl_euidaccess=no \
+		ac_cv_func_euidaccess=no \
+		ac_cv_have_decl_strnlen=yes \
+		ac_cv_func_strnlen_working=yes \
+		ac_cv_func_lstat_dereferences_slashed_symlink=yes \
+		ac_cv_func_lstat_empty_string_bug=no \
+		ac_cv_func_stat_empty_string_bug=no \
+		vb_cv_func_rename_trailing_slash_bug=no \
+		ac_cv_have_decl_nanosleep=yes \
+		jm_cv_func_nanosleep_works=yes \
+		gl_cv_func_working_utimes=yes \
+		ac_cv_func_utime_null=yes \
+		ac_cv_have_decl_strerror_r=yes \
+		ac_cv_func_strerror_r_char_p=no \
+		jm_cv_func_svid_putenv=yes \
+		ac_cv_func_getcwd_null=yes \
+		ac_cv_func_getdelim=yes \
+		ac_cv_func_mkstemp=yes \
+		utils_cv_func_mkstemp_limitations=no \
+		utils_cv_func_mkdir_trailing_slash_bug=no \
+		jm_cv_func_gettimeofday_clobber=no \
+		gl_cv_func_working_readdir=yes \
+		jm_ac_cv_func_link_follows_symlink=no \
+		utils_cv_localtime_cache=no \
+		ac_cv_struct_st_mtim_nsec=no \
+		gl_cv_func_tzset_clobber=no \
+		gl_cv_func_getcwd_null=yes \
+		gl_cv_func_getcwd_path_max=yes \
+		ac_cv_func_fnmatch_gnu=yes \
+		am_getline_needs_run_time_check=no \
+		am_cv_func_working_getline=yes \
+		gl_cv_func_mkdir_trailing_slash_bug=no \
+		gl_cv_func_mkstemp_limitations=no \
+		ac_cv_func_working_mktime=yes \
+		jm_cv_func_working_re_compile_pattern=yes \
+		ac_use_included_regex=no gl_cv_c_restrict=no \
+		ac_cv_path_GTK_UPDATE_ICON_CACHE=$(HOST_DIR)/usr/bin/gtk-update-icon-cache \
+		ac_cv_path_GDK_PIXBUF_CSOURCE=$(HOST_DIR)/usr/bin/gdk-pixbuf-csource \
+		ac_cv_prog_F77=no \
+		ac_cv_path_CUPS_CONFIG=no
+
+LIBGTK3_CONF_OPT = --disable-glibtest \
+		--enable-explicit-deps=no \
+		--enable-gtk2-dependency \
+		--disable-debug
+
+LIBGTK3_DEPENDENCIES = host-pkgconf host-libgtk3 libglib2 cairo pango atk \
+		gdk-pixbuf
+
+# Xorg dependencies
+LIBGTK3_CONF_OPT += --with-x \
+	--enable-x11-backend \
+	--x-includes=$(STAGING_DIR)/usr/include/X11 \
+	--x-libraries=$(STAGING_DIR)/usr/lib
+LIBGTK3_DEPENDENCIES += fontconfig xlib_libX11 xlib_libXext xlib_libXrender \
+		xlib_libXi at-spi2-atk
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
+LIBGTK3_CONF_OPT += --enable-xinerama
+LIBGTK3_DEPENDENCIES += xlib_libXinerama
+else
+LIBGTK3_CONF_OPT += --disable-xinerama
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
+LIBGTK3_CONF_OPT += --enable-xrandr
+LIBGTK3_DEPENDENCIES += xlib_libXrandr
+else
+LIBGTK3_CONF_OPT += --disable-xrandr
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
+LIBGTK3_DEPENDENCIES += xlib_libXcursor
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXFIXES),y)
+LIBGTK3_CONF_OPT += --enable-xfixes
+LIBGTK3_DEPENDENCIES += xlib_libXfixes
+else
+LIBGTK3_CONF_OPT += --disable-xfixes
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXCOMPOSITE),y)
+LIBGTK3_CONF_OPT += --enable-xcomposite
+LIBGTK3_DEPENDENCIES += xlib_libXcomposite
+else
+LIBGTK3_CONF_OPT += --disable-xcomposite
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXDAMAGE),y)
+LIBGTK3_CONF_OPT += --enable-xdamage
+LIBGTK3_DEPENDENCIES += xlib_libXdamage
+else
+LIBGTK3_CONF_OPT += --disable-xdamage
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXKBFILE),y)
+LIBGTK3_CONF_OPT += --enable-xkb
+LIBGTK3_DEPENDENCIES += xlib_libxkbfile
+endif
+
+ifeq ($(BR2_PACKAGE_CUPS),y)
+LIBGTK3_CONF_OPT += --enable-cups
+LIBGTK3_DEPENDENCIES += cups
+else
+LIBGTK3_CONF_OPT += --disable-cups
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGTK3_DEMO),)
+define LIBGTK3_POST_INSTALL_TWEAKS
+	rm -rf $(TARGET_DIR)/usr/bin/gtk3-demo \
+		$(TARGET_DIR)/usr/bin/gtk3-demo-application 
+endef
+
+LIBGTK3_POST_INSTALL_TARGET_HOOKS += LIBGTK3_POST_INSTALL_TWEAKS
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGTK3_TESTS),y)
+LIBGTK3_DEPENDENCIES += --enable-installed-tests
+else
+LIBGTK3_CONF_OPT += --disable-installed-tests
+endif
+
+# We do not build a full version of libgtk3 for the host, because that
+# requires compiling Cairo, Pango, ATK and X.org for the
+# host. Therefore, we patch it to remove dependencies, and we hack the
+# build to only build gdk-pixbuf-from-source and
+# gtk-update-icon-cache, which are the host tools needed to build Gtk
+# for the target.
+
+HOST_LIBGTK3_DEPENDENCIES = host-libglib2 host-libpng host-gdk-pixbuf
+
+HOST_LIBGTK3_CFLAGS = $(shell $(HOST_DIR)/usr/bin/pkg-config \
+	--cflags --libs gdk-pixbuf-2.0)
+
+define HOST_LIBGTK3_CONFIGURE_CMDS
+	echo "#define GETTEXT_PACKAGE \"gtk30\"" >> $(@D)/gtk/config.h
+	echo "#define HAVE_UNISTD_H 1" >> $(@D)/gtk/config.h
+	echo "#define HAVE_FTW_H 1" >> $(@D)/gtk/config.h
+endef
+
+define HOST_LIBGTK3_BUILD_CMDS
+	$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) \
+		$(@D)/gtk/updateiconcache.c \
+		$(HOST_LIBGTK3_CFLAGS) \
+		-o $(@D)/gtk/gtk-update-icon-cache
+endef
+
+define HOST_LIBGTK3_INSTALL_CMDS
+	cp $(@D)/gtk/gtk-update-icon-cache $(HOST_DIR)/usr/bin
+endef
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.0.1
