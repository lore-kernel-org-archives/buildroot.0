From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 16 Mar 2009 15:49:03 +0000 (UTC)
Subject: [Buildroot] svn commit: [25685] trunk/buildroot/package: atk cairo
	gtk2-engines java/jamvm libgli etc...
Message-ID: <20090316154903.E6E5C7643C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-16 15:49:03 +0000 (Mon, 16 Mar 2009)
New Revision: 25685

Log:
libglib2: build host version for build-time binaries

Build host version of glib in HOST_DIR and use the build-time binaries
from there instead of relying on what is installed on the host.

Modified:
   trunk/buildroot/package/atk/atk.mk
   trunk/buildroot/package/cairo/cairo.mk
   trunk/buildroot/package/gtk2-engines/gtk2-engines.mk
   trunk/buildroot/package/java/jamvm/jamvm.mk
   trunk/buildroot/package/libglib2/libglib2-pkgconfig-cc.patch
   trunk/buildroot/package/libglib2/libglib2.mk
   trunk/buildroot/package/libgtk2/libgtk2.mk
   trunk/buildroot/package/metacity/metacity.mk
   trunk/buildroot/package/pango/pango.mk
   trunk/buildroot/package/webkit/webkit.mk


Changeset:
Modified: trunk/buildroot/package/atk/atk.mk
===================================================================
--- trunk/buildroot/package/atk/atk.mk	2009-03-16 15:48:52 UTC (rev 25684)
+++ trunk/buildroot/package/atk/atk.mk	2009-03-16 15:49:03 UTC (rev 25685)
@@ -38,8 +38,7 @@
 		am_cv_func_working_getline=yes gl_cv_func_mkdir_trailing_slash_bug=no \
 		gl_cv_func_mkstemp_limitations=no ac_cv_func_working_mktime=yes \
 		jm_cv_func_working_re_compile_pattern=yes ac_use_included_regex=no \
-		gl_cv_c_restrict=no ac_cv_path_GLIB_GENMARSHAL=$(HOST_GLIB)/bin/glib-genmarshal \
-		ac_cv_prog_F77=no
+		gl_cv_c_restrict=no ac_cv_prog_F77=no
 
 ifneq ($(BR2_PACKAGE_XSERVER_none),y)
 ATK_CONF_OPT_X = --with-x \
@@ -54,8 +53,6 @@
 		--disable-glibtest --enable-explicit-deps=no \
 		--disable-debug
 
-ATK_MAKE_OPT = GLIB_GENMARSHAL=$(HOST_GLIB)/bin/glib-genmarshal GLIB_MKENUMS=$(HOST_GLIB)/bin/glib-mkenums
-
 ATK_DEPENDENCIES = libglib2 pkgconfig
 
 $(eval $(call AUTOTARGETS,package,atk))

Modified: trunk/buildroot/package/cairo/cairo.mk
===================================================================
--- trunk/buildroot/package/cairo/cairo.mk	2009-03-16 15:48:52 UTC (rev 25684)
+++ trunk/buildroot/package/cairo/cairo.mk	2009-03-16 15:49:03 UTC (rev 25685)
@@ -38,10 +38,8 @@
 		am_getline_needs_run_time_check=no am_cv_func_working_getline=yes \
 		gl_cv_func_mkdir_trailing_slash_bug=no gl_cv_func_mkstemp_limitations=no \
 		ac_cv_func_working_mktime=yes jm_cv_func_working_re_compile_pattern=yes \
-		ac_use_included_regex=no gl_cv_c_restrict=no \
-		ac_cv_path_GLIB_GENMARSHAL=$(HOST_GLIB)/bin/glib-genmarshal
+		ac_use_included_regex=no gl_cv_c_restrict=no
 
-
 CAIRO_DEPENDENCIES = uclibc pkgconfig fontconfig pixman
 
 ifeq ($(BR2_PACKAGE_DIRECTFB),y)

Modified: trunk/buildroot/package/gtk2-engines/gtk2-engines.mk
===================================================================
--- trunk/buildroot/package/gtk2-engines/gtk2-engines.mk	2009-03-16 15:48:52 UTC (rev 25684)
+++ trunk/buildroot/package/gtk2-engines/gtk2-engines.mk	2009-03-16 15:49:03 UTC (rev 25685)
@@ -69,7 +69,6 @@
 		jm_cv_func_working_re_compile_pattern=yes \
 		ac_use_included_regex=no \
 		gl_cv_c_restrict=no \
-		ac_cv_path_GLIB_GENMARSHAL=$(HOST_GLIB)/bin/glib-genmarshal \
 		ac_cv_path_CUPS_CONFIG=no
 
 

Modified: trunk/buildroot/package/java/jamvm/jamvm.mk
===================================================================
--- trunk/buildroot/package/java/jamvm/jamvm.mk	2009-03-16 15:48:52 UTC (rev 25684)
+++ trunk/buildroot/package/java/jamvm/jamvm.mk	2009-03-16 15:49:03 UTC (rev 25685)
@@ -39,7 +39,6 @@
 		gl_cv_func_mkdir_trailing_slash_bug=no gl_cv_func_mkstemp_limitations=no \
 		ac_cv_func_working_mktime=yes jm_cv_func_working_re_compile_pattern=yes \
 		ac_use_included_regex=no gl_cv_c_restrict=no \
-		ac_cv_path_GLIB_GENMARSHAL=$(HOST_GLIB)/glib-genmarshal \
 		ac_cv_prog_F77=no ac_cv_prog_CXX=no ac_cv_path_CUPS_CONFIG=no
 
 JAMVM_CONF_OPT = \

Modified: trunk/buildroot/package/libglib2/libglib2-pkgconfig-cc.patch
===================================================================
--- trunk/buildroot/package/libglib2/libglib2-pkgconfig-cc.patch	2009-03-16 15:48:52 UTC (rev 25684)
+++ trunk/buildroot/package/libglib2/libglib2-pkgconfig-cc.patch	2009-03-16 15:49:03 UTC (rev 25685)
@@ -1,15 +1,27 @@
---- a/glib-2.0.pc.in	2007-01-16 18:24:39.000000000 -0500
-+++ b/glib-2.0.pc.in	2008-02-09 09:25:28.000000000 -0500
-@@ -3,9 +3,9 @@ exec_prefix=@exec_prefix@
+glib2: prefix glib binaries in pkgconfig file with BIN_DIR
+
+Make sure the host versions of the glib binaries are used.
+---
+ glib-2.0.pc.in |    7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+Index: glib-2.18.4/glib-2.0.pc.in
+===================================================================
+--- glib-2.18.4.orig/glib-2.0.pc.in
++++ glib-2.18.4/glib-2.0.pc.in
+@@ -1,11 +1,12 @@
++BIN_DIR=
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
  libdir=@libdir@
  includedir=@includedir@
  
 -glib_genmarshal=glib-genmarshal
 -gobject_query=gobject-query
 -glib_mkenums=glib-mkenums
-+glib_genmarshal=/usr/bin/glib-genmarshal
-+gobject_query=/usr/bin/gobject-query
-+glib_mkenums=/usr/bin/glib-mkenums
++glib_genmarshal=${BIN_DIR}glib-genmarshal
++gobject_query=$(BIN_DIR}gobject-query
++glib_mkenums=${BIN_DIR}glib-mkenums
  
  Name: GLib
  Description: C Utility Library

Modified: trunk/buildroot/package/libglib2/libglib2.mk
===================================================================
--- trunk/buildroot/package/libglib2/libglib2.mk	2009-03-16 15:48:52 UTC (rev 25684)
+++ trunk/buildroot/package/libglib2/libglib2.mk	2009-03-16 15:49:03 UTC (rev 25685)
@@ -15,10 +15,6 @@
 LIBGLIB2_INSTALL_TARGET = YES
 LIBGLIB2_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 
-# detect install prefix of host glib development stuff
-HOST_GLIB_BIN:=`dirname $(shell which glib-genmarshal || echo /usr/bin/glib-genmarshal)`
-HOST_GLIB:=$(shell dirname $(HOST_GLIB_BIN) || echo /usr)
-
 LIBGLIB2_CONF_ENV =	\
 		ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		glib_cv_uscore=no ac_cv_func_strtod=yes \
@@ -48,14 +44,14 @@
 		gl_cv_func_mkdir_trailing_slash_bug=no gl_cv_func_mkstemp_limitations=no \
 		ac_cv_func_working_mktime=yes jm_cv_func_working_re_compile_pattern=yes \
 		ac_use_included_regex=no gl_cv_c_restrict=no \
-		ac_cv_path_GLIB_GENMARSHAL=$(HOST_GLIB)/bin/glib-genmarshal ac_cv_prog_F77=no \
+		ac_cv_path_GLIB_GENMARSHAL=$(HOST_DIR)/usr/bin/glib-genmarshal ac_cv_prog_F77=no \
 		ac_cv_func_posix_getgrgid_r=no \
 		gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no)
 
 LIBGLIB2_CONF_OPT = --enable-shared \
 		--enable-static
 
-LIBGLIB2_DEPENDENCIES = uclibc gettext libintl pkgconfig
+LIBGLIB2_DEPENDENCIES = uclibc gettext libintl pkgconfig host-libglib2
 
 ifneq ($(BR2_ENABLE_LOCALE),y)
 LIBGLIB2_DEPENDENCIES+=libiconv
@@ -68,9 +64,51 @@
 
 $(eval $(call AUTOTARGETS,package,libglib2))
 
-# we NEED a host glib-genmarshal
-ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
-ifeq ($(wildcard $(HOST_GLIB)/bin/glib-genmarshal),)
-$(error Host glib-genmarshal not found. Please install glib development package on your host (something like libglib2.0-dev))
-endif
-endif
+$(LIBGLIB2_HOOK_POST_INSTALL): $(LIBGLIB2_TARGET_INSTALL_STAGING)
+	$(SED) 's~^BIN_DIR=.*~BIN_DIR=$(HOST_DIR)/usr/bin/~' \
+		$(STAGING_DIR)/usr/lib/pkgconfig/glib-2.0.pc
+	touch $@
+
+# libglib2 for the host
+LIBGLIB2_HOST_DIR:=$(BUILD_DIR)/libglib2-$(LIBGLIB2_VERSION)-host
+LIBGLIB2_HOST_BINARY:=$(HOST_DIR)/usr/bin/glib-genmarshal
+
+$(LIBGLIB2_HOST_DIR)/.unpacked: $(DL_DIR)/$(LIBGLIB2_SOURCE)
+	mkdir -p $(@D)
+	$(INFLATE$(suffix $(LIBGLIB2_SOURCE))) $< | \
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
+	touch $@
+
+$(LIBGLIB2_HOST_DIR)/.configured: $(LIBGLIB2_HOST_DIR)/.unpacked
+	(cd $(@D); rm -rf config.cache; \
+		$(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(HOST_CFLAGS)" \
+		LDFLAGS="$(HOST_LDFLAGS)" \
+		$(@D)/configure \
+		--prefix=$(HOST_DIR)/usr \
+		--sysconfdir=$(HOST_DIR)/etc \
+		--enable-shared \
+		--disable-static \
+		--disable-gtk-doc \
+		--enable-debug=no \
+	)
+	touch $@
+
+$(LIBGLIB2_HOST_DIR)/.compiled: $(LIBGLIB2_HOST_DIR)/.configured
+	$(MAKE) -C $(@D)
+	touch $@
+
+$(LIBGLIB2_HOST_BINARY): $(LIBGLIB2_HOST_DIR)/.compiled
+	$(MAKE) -C $(<D) install
+
+host-libglib2: $(LIBGLIB2_HOST_BINARY)
+
+host-libglib2-source: libglib2-source
+
+host-libglib2-clean:
+	rm -f $(addprefix $(LIBGLIB2_HOST_DIR)/,.unpacked .configured .compiled)
+	$(MAKE) -C $(LIBGLIB2_HOST_DIR) uninstall
+	$(MAKE) -C $(LIBGLIB2_HOST_DIR) clean
+
+host-libglib2-dirclean:
+	rm -rf $(LIBGLIB2_HOST_DIR)

Modified: trunk/buildroot/package/libgtk2/libgtk2.mk
===================================================================
--- trunk/buildroot/package/libgtk2/libgtk2.mk	2009-03-16 15:48:52 UTC (rev 25684)
+++ trunk/buildroot/package/libgtk2/libgtk2.mk	2009-03-16 15:49:03 UTC (rev 25685)
@@ -68,9 +68,8 @@
 		ac_cv_func_working_mktime=yes \
 		jm_cv_func_working_re_compile_pattern=yes \
 		ac_use_included_regex=no gl_cv_c_restrict=no \
-		ac_cv_path_GLIB_GENMARSHAL=$(HOST_GLIB)/bin/glib-genmarshal \
-		ac_cv_path_GTK_UPDATE_ICON_CACHE=$(HOST_GLIB)/bin/gtk-update-icon-cache \
-		ac_cv_path_GDK_PIXBUF_CSOURCE=$(HOST_GLIB)/bin/gdk-pixbuf-csource \
+		ac_cv_path_GTK_UPDATE_ICON_CACHE=/usr/bin/gtk-update-icon-cache \
+		ac_cv_path_GDK_PIXBUF_CSOURCE=/usr/bin/gdk-pixbuf-csource \
 		ac_cv_prog_F77=no \
 		ac_cv_path_CUPS_CONFIG=no
 
@@ -129,8 +128,6 @@
 LIBGTK2_CONF_OPT += --disable-cups
 endif
 
-LIBGTK2_MAKE_OPT = GLIB_GENMARSHAL=$(HOST_GLIB)/bin/glib-genmarshal GLIB_MKENUMS=$(HOST_GLIB)/bin/glib-mkenums
-
 $(eval $(call AUTOTARGETS,package,libgtk2))
 
 $(LIBGTK2_HOOK_POST_INSTALL):

Modified: trunk/buildroot/package/metacity/metacity.mk
===================================================================
--- trunk/buildroot/package/metacity/metacity.mk	2009-03-16 15:48:52 UTC (rev 25684)
+++ trunk/buildroot/package/metacity/metacity.mk	2009-03-16 15:49:03 UTC (rev 25685)
@@ -95,7 +95,6 @@
 		jm_cv_func_working_re_compile_pattern=yes \
 		ac_use_included_regex=no \
 		gl_cv_c_restrict=no \
-		ac_cv_path_GLIB_GENMARSHAL=$(HOST_GLIB)/bin/glib-genmarshal \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \

Modified: trunk/buildroot/package/pango/pango.mk
===================================================================
--- trunk/buildroot/package/pango/pango.mk	2009-03-16 15:48:52 UTC (rev 25684)
+++ trunk/buildroot/package/pango/pango.mk	2009-03-16 15:49:03 UTC (rev 25685)
@@ -38,7 +38,7 @@
 		gl_cv_func_mkdir_trailing_slash_bug=no gl_cv_func_mkstemp_limitations=no \
 		ac_cv_func_working_mktime=yes jm_cv_func_working_re_compile_pattern=yes \
 		ac_use_included_regex=no gl_cv_c_restrict=no \
-		ac_cv_path_GLIB_GENMARSHAL=$(HOST_GLIB)/bin/glib-genmarshal ac_cv_path_FREETYPE_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
+		ac_cv_path_FREETYPE_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
 
 ifneq ($(BR2_PACKAGE_XSERVER_none),y)
         PANGO_CONF_OPT_X = --with-x \

Modified: trunk/buildroot/package/webkit/webkit.mk
===================================================================
--- trunk/buildroot/package/webkit/webkit.mk	2009-03-16 15:48:52 UTC (rev 25684)
+++ trunk/buildroot/package/webkit/webkit.mk	2009-03-16 15:49:03 UTC (rev 25685)
@@ -13,7 +13,5 @@
 
 WEBKIT_AUTORECONF = YES
 WEBKIT_DEPENDENCIES = icu curl libxml2 libxslt libgtk2 sqlite
-WEBKIT_MAKE_OPT = GLIB_GENMARSHAL=$(HOST_GLIB)/bin/glib-genmarshal GLIB_MKENUMS=$(HOST_GLIB)/bin/glib-mkenums
 
 $(eval $(call AUTOTARGETS,package,webkit))
-
