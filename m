From: andersen at uclibc.org <andersen@uclibc.org>
Date: Tue,  9 Jan 2007 22:54:05 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  libglib2
Message-ID: <20070110065405.6C493485A8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-09 22:54:04 -0800 (Tue, 09 Jan 2007)
New Revision: 17218

Log:
add in glib2


Added:
   trunk/buildroot/package/libglib2/
   trunk/buildroot/package/libglib2/Config.in
   trunk/buildroot/package/libglib2/configure-libtool.patch
   trunk/buildroot/package/libglib2/glib-gettextize-dir.patch
   trunk/buildroot/package/libglib2/glib-mkenums-nowarn.patch
   trunk/buildroot/package/libglib2/glibconfig-sysdefs.h
   trunk/buildroot/package/libglib2/glibinclude.patch
   trunk/buildroot/package/libglib2/gtk-doc.patch
   trunk/buildroot/package/libglib2/libglib2.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-01-10 06:05:18 UTC (rev 17217)
+++ trunk/buildroot/package/Config.in	2007-01-10 06:54:04 UTC (rev 17218)
@@ -74,6 +74,7 @@
 source "package/libelf/Config.in"
 source "package/libfloat/Config.in"
 source "package/libglib12/Config.in"
+source "package/libglib2/Config.in"
 source "package/libgtk12/Config.in"
 source "package/libmad/Config.in"
 source "package/libpcap/Config.in"

Added: trunk/buildroot/package/libglib2/Config.in
===================================================================
--- trunk/buildroot/package/libglib2/Config.in	                        (rev 0)
+++ trunk/buildroot/package/libglib2/Config.in	2007-01-10 06:54:04 UTC (rev 17218)
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBGLIB2
+	bool "libglib2"
+	default n
+	select BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_LIBINTL
+	help
+	  Low-level core library that forms the basis of GTK+ and GNOME.
+
+	  http://www.gtk.org/

Added: trunk/buildroot/package/libglib2/configure-libtool.patch
===================================================================
--- trunk/buildroot/package/libglib2/configure-libtool.patch	                        (rev 0)
+++ trunk/buildroot/package/libglib2/configure-libtool.patch	2007-01-10 06:54:04 UTC (rev 17218)
@@ -0,0 +1,11 @@
+--- glib-2.8.4/configure.in.orig	2006-06-05 13:34:08.000000000 +0100
++++ glib-2.8.4/configure.in	2006-06-05 13:34:36.000000000 +0100
+@@ -1106,7 +1106,7 @@
+   dnl No use for this on Win32
+   G_MODULE_LDFLAGS=
+ else
+-  G_MODULE_LDFLAGS=`(./libtool --config; echo eval echo \\$export_dynamic_flag_spec) | sh`
++  G_MODULE_LDFLAGS=`(./$host_alias-libtool --config; echo eval echo \\$export_dynamic_flag_spec) | sh`
+ fi
+ dnl G_MODULE_IMPL= don't reset, so cmd-line can override
+ G_MODULE_NEED_USCORE=0

Added: trunk/buildroot/package/libglib2/glib-gettextize-dir.patch
===================================================================
--- trunk/buildroot/package/libglib2/glib-gettextize-dir.patch	                        (rev 0)
+++ trunk/buildroot/package/libglib2/glib-gettextize-dir.patch	2007-01-10 06:54:04 UTC (rev 17218)
@@ -0,0 +1,11 @@
+--- glib-2.12.3/glib-gettextize.in.orig	2005-12-06 20:57:14.000000000 -0700
++++ glib-2.12.3/glib-gettextize.in	2007-01-09 21:21:41.000000000 -0700
+@@ -49,7 +49,7 @@
+     ;;
+ esac
+ 
+-gettext_dir=$prefix/share/glib-2.0/gettext
++gettext_dir=@datadir@/glib-2.0/gettext
+ 
+ while test $# -gt 0; do
+   case "$1" in

Added: trunk/buildroot/package/libglib2/glib-mkenums-nowarn.patch
===================================================================
--- trunk/buildroot/package/libglib2/glib-mkenums-nowarn.patch	                        (rev 0)
+++ trunk/buildroot/package/libglib2/glib-mkenums-nowarn.patch	2007-01-10 06:54:04 UTC (rev 17218)
@@ -0,0 +1,8 @@
+--- glib-2.6.5/gobject/glib-mkenums.in.orig	2006-06-15 21:28:23.436946024 -0600
++++ glib-2.6.5/gobject/glib-mkenums.in	2006-06-15 21:28:35.417124760 -0600
+@@ -1,4 +1,4 @@
+-#!@PERL_PATH@ -w
++#!@PERL_PATH@
+ 
+ # glib-mkenums.pl 
+ # Information about the current enumeration

Added: trunk/buildroot/package/libglib2/glibconfig-sysdefs.h
===================================================================
--- trunk/buildroot/package/libglib2/glibconfig-sysdefs.h	                        (rev 0)
+++ trunk/buildroot/package/libglib2/glibconfig-sysdefs.h	2007-01-10 06:54:04 UTC (rev 17218)
@@ -0,0 +1,6 @@
+#define GLIB_SYSDEF_POLLIN =1
+#define GLIB_SYSDEF_POLLOUT =4
+#define GLIB_SYSDEF_POLLPRI =2
+#define GLIB_SYSDEF_POLLERR =8
+#define GLIB_SYSDEF_POLLHUP =16
+#define GLIB_SYSDEF_POLLNVAL =32

Added: trunk/buildroot/package/libglib2/glibinclude.patch
===================================================================
--- trunk/buildroot/package/libglib2/glibinclude.patch	                        (rev 0)
+++ trunk/buildroot/package/libglib2/glibinclude.patch	2007-01-10 06:54:04 UTC (rev 17218)
@@ -0,0 +1,13 @@
+--- glib-2.12.3/glib/Makefile.am.orig	2006-05-09 18:44:49.000000000 -0600
++++ glib-2.12.3/glib/Makefile.am	2007-01-09 21:25:57.000000000 -0700
+@@ -201,8 +201,8 @@
+ 	gprintf.h
+ 
+ install-data-local: install-ms-lib install-def-file
+-	@if test -f $(glibincludedir)/glist.h ; then					\
+-	  echo "*** Old headers found in $(glibincludedir). You should remove the" ;	\
++	@if test -f $(DESTDIR)$(glibincludedir)/glist.h ; then					\
++	  echo "*** Old headers found in $(DESTDIR)$(glibincludedir). You should remove the" ;	\
+ 	  echo "*** contents of this directory and type 'make install' again." ;	\
+ 	  false ;									\
+         fi

Added: trunk/buildroot/package/libglib2/gtk-doc.patch
===================================================================
--- trunk/buildroot/package/libglib2/gtk-doc.patch	                        (rev 0)
+++ trunk/buildroot/package/libglib2/gtk-doc.patch	2007-01-10 06:54:04 UTC (rev 17218)
@@ -0,0 +1,59 @@
+--- glib/acinclude.m4	2004-05-08 11:14:46.000000000 +0100
++++ glib/acinclude.m4	2004-05-08 11:14:55.000000000 +0100
+@@ -446,3 +446,56 @@
+ ])
+ 
+ 
++dnl -*- mode: autoconf -*-
++
++# serial 1
++
++dnl Usage:
++dnl   GTK_DOC_CHECK([minimum-gtk-doc-version])
++AC_DEFUN([GTK_DOC_CHECK],
++[
++  AC_BEFORE([AC_PROG_LIBTOOL],[$0])dnl setup libtool first
++  AC_BEFORE([AM_PROG_LIBTOOL],[$0])dnl setup libtool first
++  dnl for overriding the documentation installation directory
++  AC_ARG_WITH(html-dir,
++    AC_HELP_STRING([--with-html-dir=PATH], [path to installed docs]),,
++    [with_html_dir='${datadir}/gtk-doc/html'])
++  HTML_DIR="$with_html_dir"
++  AC_SUBST(HTML_DIR)
++
++  dnl enable/disable documentation building
++  AC_ARG_ENABLE(gtk-doc,
++    AC_HELP_STRING([--enable-gtk-doc],
++                   [use gtk-doc to build documentation [default=no]]),,
++    enable_gtk_doc=no)
++
++  have_gtk_doc=no
++  if test -z "$PKG_CONFIG"; then
++    AC_PATH_PROG(PKG_CONFIG, pkg-config, no)
++  fi
++  if test "$PKG_CONFIG" != "no" && $PKG_CONFIG --exists gtk-doc; then
++    have_gtk_doc=yes
++  fi
++
++  dnl do we want to do a version check?
++ifelse([$1],[],,
++  [gtk_doc_min_version=$1
++  if test "$have_gtk_doc" = yes; then
++    AC_MSG_CHECKING([gtk-doc version >= $gtk_doc_min_version])
++    if $PKG_CONFIG --atleast-version $gtk_doc_min_version gtk-doc; then
++      AC_MSG_RESULT(yes)
++    else
++      AC_MSG_RESULT(no)
++      have_gtk_doc=no
++    fi
++  fi
++])
++  if test x$enable_gtk_doc = xyes; then
++    if test "$have_gtk_doc" != yes; then
++      enable_gtk_doc=no
++    fi
++  fi
++
++  AM_CONDITIONAL(ENABLE_GTK_DOC, test x$enable_gtk_doc = xyes)
++  AM_CONDITIONAL(GTK_DOC_USE_LIBTOOL, test -n "$LIBTOOL")
++])

Added: trunk/buildroot/package/libglib2/libglib2.mk
===================================================================
--- trunk/buildroot/package/libglib2/libglib2.mk	                        (rev 0)
+++ trunk/buildroot/package/libglib2/libglib2.mk	2007-01-10 06:54:04 UTC (rev 17218)
@@ -0,0 +1,162 @@
+#############################################################
+#
+# libglib2
+#
+#############################################################
+LIBGLIB2_VERSION:=2.12.3
+LIBGLIB2_SOURCE:=glib-$(LIBGLIB2_VERSION).tar.bz2
+LIBGLIB2_SITE:=http://ftp.gtk.org/pub/glib/2.12
+LIBGLIB2_CAT:=$(BZCAT)
+LIBGLIB2_DIR:=$(BUILD_DIR)/glib-$(LIBGLIB2_VERSION)
+LIBGLIB2_BINARY:=libglib-2.0.a
+
+ifeq ($(BR2_ENDIAN),"BIG")
+LIBGLIB2_BE:=yes
+else
+LIBGLIB2_BE:=no
+endif
+
+$(DL_DIR)/$(LIBGLIB2_SOURCE):
+	 $(WGET) -P $(DL_DIR) $(LIBGLIB2_SITE)/$(LIBGLIB2_SOURCE)
+
+libglib2-source: $(DL_DIR)/$(LIBGLIB2_SOURCE)
+
+$(LIBGLIB2_DIR)/.unpacked: $(DL_DIR)/$(LIBGLIB2_SOURCE)
+	$(LIBGLIB2_CAT) $(DL_DIR)/$(LIBGLIB2_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(LIBGLIB2_DIR) package/libglib2/ \*.patch*
+	$(INSTALL) -m 0644 package/libglib2/glibconfig-sysdefs.h $(LIBGLIB2_DIR)/
+	$(CONFIG_UPDATE) $(LIBGLIB2_DIR)
+	touch $(LIBGLIB2_DIR)/.unpacked
+
+$(LIBGLIB2_DIR)/.configured: $(LIBGLIB2_DIR)/.unpacked
+	(cd $(LIBGLIB2_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		ac_cv_c_bigendian=$(LIBGLIB2_BE) \
+		ac_cv_func_posix_getpwuid_r=yes \
+		glib_cv_stack_grows=no \
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
+		ac_cv_func_memcmp_working=yes \
+		ac_cv_have_decl_malloc=yes \
+		gl_cv_func_malloc_0_nonnull=yes \
+		ac_cv_func_malloc_0_nonnull=yes \
+		ac_cv_func_calloc_0_nonnull=yes \
+		ac_cv_func_realloc_0_nonnull=yes \
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
+		ac_use_included_regex=no \
+		gl_cv_c_restrict=no \
+		ac_cv_path_GLIB_GENMARSHAL=/usr/bin/glib-genmarshal \
+		./configure \
+		--host=$(REAL_GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=$(STAGING_DIR) \
+		--exec_prefix=$(STAGING_DIR) \
+		--libdir=$(STAGING_DIR)/lib \
+		--includedir=$(STAGING_DIR)/include \
+		--bindir=/usr/bin \
+		--sbindir=/usr/sbin \
+		--libexecdir=/usr/lib \
+		--sysconfdir=/etc \
+		--datadir=/usr/share \
+		--localstatedir=/var \
+		--mandir=/usr/man \
+		--infodir=/usr/info \
+		--enable-shared \
+		--enable-static \
+		$(DISABLE_NLS) \
+	);
+	touch $(LIBGLIB2_DIR)/.configured
+
+$(LIBGLIB2_DIR)/glib/.libs/$(LIBGLIB2_BINARY): $(LIBGLIB2_DIR)/.configured
+	$(MAKE) CC=$(TARGET_CC) -C $(LIBGLIB2_DIR)
+	touch -c $(LIBGLIB2_DIR)/glib/.libs/$(LIBGLIB2_BINARY)
+
+$(STAGING_DIR)/lib/$(LIBGLIB2_BINARY): $(LIBGLIB2_DIR)/glib/.libs/$(LIBGLIB2_BINARY)
+	$(MAKE) prefix=$(STAGING_DIR) \
+	    exec_prefix=$(STAGING_DIR) \
+	    bindir=$(STAGING_DIR)/bin \
+	    sbindir=$(STAGING_DIR)/sbin \
+	    libexecdir=$(STAGING_DIR)/libexec \
+	    datadir=$(STAGING_DIR)/share \
+	    sysconfdir=$(STAGING_DIR)/etc \
+	    sharedstatedir=$(STAGING_DIR)/com \
+	    localstatedir=$(STAGING_DIR)/var \
+	    libdir=$(STAGING_DIR)/lib \
+	    includedir=$(STAGING_DIR)/include \
+	    oldincludedir=$(STAGING_DIR)/include \
+	    infodir=$(STAGING_DIR)/info \
+	    mandir=$(STAGING_DIR)/man \
+	    -C $(LIBGLIB2_DIR) install;
+
+$(TARGET_DIR)/lib/libglib-2.0.so.0.1200.3: $(STAGING_DIR)/lib/$(LIBGLIB2_BINARY)
+	cp -a $(STAGING_DIR)/lib/libglib-2.0.so $(TARGET_DIR)/lib/
+	cp -a $(STAGING_DIR)/lib/libglib-2.0.so.0* $(TARGET_DIR)/lib/
+	cp -a $(STAGING_DIR)/lib/libgmodule-2.0.so $(TARGET_DIR)/lib/
+	cp -a $(STAGING_DIR)/lib/libgmodule-2.0.so.0* $(TARGET_DIR)/lib/
+	cp -a $(STAGING_DIR)/lib/libgobject-2.0.so $(TARGET_DIR)/lib/
+	cp -a $(STAGING_DIR)/lib/libgobject-2.0.so.0* $(TARGET_DIR)/lib/
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libglib-2.0.so.0.*
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libgmodule-2.0.so.0.*
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libgobject-2.0.so.0.*
+	touch -c $(TARGET_DIR)/lib/libglib-2.0.so.0.1200.3
+
+libglib2: uclibc gettext libintl $(TARGET_DIR)/lib/libglib-2.0.so.0.1200.3
+
+libglib2-clean:
+	rm -f $(TARGET_DIR)/lib/$(LIBGLIB2_BINARY)
+	-$(MAKE) -C $(LIBGLIB2_DIR) clean
+
+libglib2-dirclean:
+	rm -rf $(LIBGLIB2_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_LIBGLIB2)),y)
+TARGETS+=libglib2
+endif
