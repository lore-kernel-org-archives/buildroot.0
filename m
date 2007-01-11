From: andersen at uclibc.org <andersen@uclibc.org>
Date: Wed, 10 Jan 2007 22:17:24 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  pango
Message-ID: <20070111061724.9A28A48581@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-10 22:17:24 -0800 (Wed, 10 Jan 2007)
New Revision: 17239

Log:
Add pango


Added:
   trunk/buildroot/package/pango/
   trunk/buildroot/package/pango/Config.in
   trunk/buildroot/package/pango/gtk-doc.patch
   trunk/buildroot/package/pango/no-tests.patch
   trunk/buildroot/package/pango/pango.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-01-11 06:17:04 UTC (rev 17238)
+++ trunk/buildroot/package/Config.in	2007-01-11 06:17:24 UTC (rev 17239)
@@ -121,6 +121,7 @@
 source "package/openssl/Config.in"
 source "package/openvpn/Config.in"
 source "package/openswan/Config.in"
+source "package/pango/Config.in"
 source "package/pciutils/Config.in"
 source "package/pcmcia/Config.in"
 source "package/pkgconfig/Config.in"

Added: trunk/buildroot/package/pango/Config.in
===================================================================
--- trunk/buildroot/package/pango/Config.in	                        (rev 0)
+++ trunk/buildroot/package/pango/Config.in	2007-01-11 06:17:24 UTC (rev 17239)
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_PANGO
+	bool "pango"
+	default n
+	select BR2_PACKAGE_PKGCONFIG
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_CAIRO
+	help
+	  Pango is a library for laying out and rendering of text, with an
+	  emphasis on internationalization. Pango can be used anywhere that
+	  text layout is needed, though most of the work on Pango so far has
+	  been done in the context of the GTK+ widget toolkit. Pango forms the
+	  core of text and font handling for GTK+-2.x.
+
+	  http://www.pango.org/

Added: trunk/buildroot/package/pango/gtk-doc.patch
===================================================================
--- trunk/buildroot/package/pango/gtk-doc.patch	                        (rev 0)
+++ trunk/buildroot/package/pango/gtk-doc.patch	2007-01-11 06:17:24 UTC (rev 17239)
@@ -0,0 +1,59 @@
+--- pango/acinclude.m4.old	2004-05-08 11:31:48.000000000 +0100
++++ pango/acinclude.m4	2004-05-08 11:31:58.000000000 +0100
+@@ -55,3 +55,56 @@
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

Added: trunk/buildroot/package/pango/no-tests.patch
===================================================================
--- trunk/buildroot/package/pango/no-tests.patch	                        (rev 0)
+++ trunk/buildroot/package/pango/no-tests.patch	2007-01-11 06:17:24 UTC (rev 17239)
@@ -0,0 +1,15 @@
+
+#
+# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
+#
+
+--- pango-1.2.5/Makefile.am~no-tests	2003-01-30 22:43:47.000000000 +0100
++++ pango-1.2.5/Makefile.am	2004-03-11 11:31:25.000000000 +0100
+@@ -1,6 +1,6 @@
+ ## Process this file with automake to create Makefile.in.
+ 
+-SUBDIRS= pango modules examples docs tools tests
++SUBDIRS= pango modules examples docs tools 
+ 
+ EXTRA_DIST = 		\
+ 	pango.pc.in	\

Added: trunk/buildroot/package/pango/pango.mk
===================================================================
--- trunk/buildroot/package/pango/pango.mk	                        (rev 0)
+++ trunk/buildroot/package/pango/pango.mk	2007-01-11 06:17:24 UTC (rev 17239)
@@ -0,0 +1,179 @@
+#############################################################
+#
+# pango
+#
+#############################################################
+PANGO_VERSION:=1.13.5
+#PANGO_VERSION:=1.14.8
+PANGO_SOURCE:=pango-$(PANGO_VERSION).tar.bz2
+#PANGO_SITE:=ftp://ftp.gtk.org/pub/pango/1.14
+PANGO_SITE:=ftp://ftp.gtk.org/pub/pango/1.13
+PANGO_CAT:=$(BZCAT)
+PANGO_DIR:=$(BUILD_DIR)/pango-$(PANGO_VERSION)
+PANGO_BINARY:=libpango-1.0.a
+
+ifeq ($(BR2_ENDIAN),"BIG")
+PANGO_BE:=yes
+else
+PANGO_BE:=no
+endif
+
+PANGO_BUILD_ENV=$(TARGET_CONFIGURE_OPTS) \
+		PKG_CONFIG=$(STAGING_DIR)/usr/bin/pkg-config \
+		ac_cv_c_bigendian=$(PANGO_BE) \
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
+		ac_cv_path_FREETYPE_CONFIG=$(STAGING_DIR)/bin/freetype-config
+
+$(DL_DIR)/$(PANGO_SOURCE):
+	 $(WGET) -P $(DL_DIR) $(PANGO_SITE)/$(PANGO_SOURCE)
+
+pango-source: $(DL_DIR)/$(PANGO_SOURCE)
+
+$(PANGO_DIR)/.unpacked: $(DL_DIR)/$(PANGO_SOURCE)
+	$(PANGO_CAT) $(DL_DIR)/$(PANGO_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(PANGO_DIR) package/pango/ \*.patch*
+	$(CONFIG_UPDATE) $(PANGO_DIR)
+	touch $(PANGO_DIR)/.unpacked
+
+$(PANGO_DIR)/.configured: $(PANGO_DIR)/.unpacked
+	(cd $(PANGO_DIR); rm -rf config.cache; \
+		 $(PANGO_BUILD_ENV) \
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
+		--with-x \
+		--x-includes=$(STAGING_DIR)/usr/X11R6/include \
+		--x-libraries=$(STAGING_DIR)/usr/X11R6/lib \
+		--disable-glibtest \
+		--enable-explicit-deps=no \
+		--disable-debug \
+	);
+	touch $(PANGO_DIR)/.configured
+
+$(PANGO_DIR)/pango/.libs/$(PANGO_BINARY): $(PANGO_DIR)/.configured
+	$(PANGO_BUILD_ENV) $(MAKE1) CC=$(TARGET_CC) -C $(PANGO_DIR)
+	touch -c $(PANGO_DIR)/pango/.libs/$(PANGO_BINARY)
+
+$(STAGING_DIR)/lib/$(PANGO_BINARY): $(PANGO_DIR)/pango/.libs/$(PANGO_BINARY)
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
+	    -C $(PANGO_DIR) install;
+
+$(TARGET_DIR)/lib/libpango-1.0.so.0.1300.5: $(STAGING_DIR)/lib/$(PANGO_BINARY)
+	cp -a $(STAGING_DIR)/lib/libpango-1.0.so $(TARGET_DIR)/lib/
+	cp -a $(STAGING_DIR)/lib/libpango-1.0.so.0* $(TARGET_DIR)/lib/
+	cp -a $(STAGING_DIR)/lib/libpangox-1.0.so $(TARGET_DIR)/lib/
+	cp -a $(STAGING_DIR)/lib/libpangox-1.0.so.0* $(TARGET_DIR)/lib/
+	cp -a $(STAGING_DIR)/lib/libpangoft2-1.0.so $(TARGET_DIR)/lib/
+	cp -a $(STAGING_DIR)/lib/libpangoft2-1.0.so.0* $(TARGET_DIR)/lib/
+	cp -a $(STAGING_DIR)/lib/libpangoxft-1.0.so $(TARGET_DIR)/lib/
+	cp -a $(STAGING_DIR)/lib/libpangoxft-1.0.so.0* $(TARGET_DIR)/lib/
+	cp -a $(STAGING_DIR)/lib/libpangocairo-1.0.so $(TARGET_DIR)/lib/
+	cp -a $(STAGING_DIR)/lib/libpangocairo-1.0.so.0* $(TARGET_DIR)/lib/
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libpango-2.0.so.0.*
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libgpangox-2.0.so.0.*
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libgoft2-2.0.so.0.*
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libgoxft-2.0.so.0.*
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libgocairo-2.0.so.0.*
+	touch -c $(TARGET_DIR)/lib/libpango-1.0.so.0.1300.5
+
+pango: uclibc gettext libintl pkgconfig libglib2 xorg cairo \
+	$(TARGET_DIR)/lib/libpango-1.0.so.0.1300.5
+
+pango-clean:
+	rm -f $(TARGET_DIR)/lib/$(PANGO_BINARY)
+	-$(MAKE) -C $(PANGO_DIR) clean
+
+pango-dirclean:
+	rm -rf $(PANGO_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_PANGO)),y)
+TARGETS+=pango
+endif
