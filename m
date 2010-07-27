From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 23:01:29 +0200
Subject: [Buildroot] [git commit master 1/1] webkit: bump to webkitgtk 1.2.3
Message-ID: <20100727210246.3B5F9835A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=760c2d172628fbc03c6e0cd06c831d141907b223
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/webkit/Config.in                           |    5 +-
 package/webkit/gtk-doc.make                        |  173 --------------------
 ...webkit-1.2.3-fix-build-issue-with-old-gtk.patch |   22 +++
 package/webkit/webkit-r30267-trunc.patch           |   11 --
 package/webkit/webkit.mk                           |   20 +--
 5 files changed, 29 insertions(+), 202 deletions(-)
 delete mode 100644 package/webkit/gtk-doc.make
 create mode 100644 package/webkit/webkit-1.2.3-fix-build-issue-with-old-gtk.patch
 delete mode 100644 package/webkit/webkit-r30267-trunc.patch

diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index b0d69d7..c1ade50 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_WEBKIT
 	select BR2_PACKAGE_ENCHANT
 	select BR2_PACKAGE_LIBSOUP
 	select BR2_PACKAGE_CAIRO_PNG
+	select BR2_PACKAGE_LIBGAIL
 	help
 	  WebKit is an open source, standards compliant web browser engine.
 
@@ -19,5 +20,5 @@ config BR2_PACKAGE_WEBKIT
 
 	  http://webkit.org/
 
-comment "webkit requires a toolchain with C++ support and WCHAR enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+comment "webkit requires C++, WCHAR in toolchain and libgtk2"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_PACKAGE_LIBGTK2
diff --git a/package/webkit/gtk-doc.make b/package/webkit/gtk-doc.make
deleted file mode 100644
index 354ffb7..0000000
--- a/package/webkit/gtk-doc.make
+++ /dev/null
@@ -1,173 +0,0 @@
-# -*- mode: makefile -*-
-
-####################################
-# Everything below here is generic #
-####################################
-
-if GTK_DOC_USE_LIBTOOL
-GTKDOC_CC = $(LIBTOOL) --mode=compile $(CC) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
-GTKDOC_LD = $(LIBTOOL) --mode=link $(CC) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS)
-else
-GTKDOC_CC = $(CC) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
-GTKDOC_LD = $(CC) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS)
-endif
-
-# We set GPATH here; this gives us semantics for GNU make
-# which are more like other make's VPATH, when it comes to
-# whether a source that is a target of one rule is then
-# searched for in VPATH/GPATH.
-#
-GPATH = $(srcdir)
-
-TARGET_DIR=$(HTML_DIR)/$(DOC_MODULE)
-
-EXTRA_DIST = 				\
-	$(content_files)		\
-	$(HTML_IMAGES)			\
-	$(DOC_MAIN_SGML_FILE)		\
-	$(DOC_MODULE)-sections.txt	\
-	$(DOC_MODULE)-overrides.txt
-
-DOC_STAMPS=scan-build.stamp tmpl-build.stamp sgml-build.stamp html-build.stamp \
-	   $(srcdir)/tmpl.stamp $(srcdir)/sgml.stamp $(srcdir)/html.stamp
-
-SCANOBJ_FILES = 		 \
-	$(DOC_MODULE).args 	 \
-	$(DOC_MODULE).hierarchy  \
-	$(DOC_MODULE).interfaces \
-	$(DOC_MODULE).prerequisites \
-	$(DOC_MODULE).signals
-
-REPORT_FILES = \
-	$(DOC_MODULE)-undocumented.txt \
-	$(DOC_MODULE)-undeclared.txt \
-	$(DOC_MODULE)-unused.txt
-
-CLEANFILES = $(SCANOBJ_FILES) $(REPORT_FILES) $(DOC_STAMPS)
-
-if ENABLE_GTK_DOC
-all-local: html-build.stamp
-else
-all-local:
-endif
-
-docs: html-build.stamp
-
-#### scan ####
-
-scan-build.stamp: $(HFILE_GLOB) $(CFILE_GLOB)
-	@echo 'gtk-doc: Scanning header files'
-	@-chmod -R u+w $(srcdir)
-	cd $(srcdir) && \
-	  gtkdoc-scan --module=$(DOC_MODULE) --source-dir=$(DOC_SOURCE_DIR) --ignore-headers="$(IGNORE_HFILES)" $(SCAN_OPTIONS) $(EXTRA_HFILES)
-	if grep -l '^..*$$' $(srcdir)/$(DOC_MODULE).types > /dev/null 2>&1 ; then \
-	    CC="$(GTKDOC_CC)" LD="$(GTKDOC_LD)" CFLAGS="$(GTKDOC_CFLAGS)" LDFLAGS="$(GTKDOC_LIBS)" gtkdoc-scangobj $(SCANGOBJ_OPTIONS) --module=$(DOC_MODULE) --output-dir=$(srcdir) ; \
-	else \
-	    cd $(srcdir) ; \
-	    for i in $(SCANOBJ_FILES) ; do \
-               test -f $$i || touch $$i ; \
-	    done \
-	fi
-	touch scan-build.stamp
-
-$(DOC_MODULE)-decl.txt $(SCANOBJ_FILES) $(DOC_MODULE)-sections.txt $(DOC_MODULE)-overrides.txt: scan-build.stamp
-	@true
-
-#### templates ####
-
-tmpl-build.stamp: $(DOC_MODULE)-decl.txt $(SCANOBJ_FILES) $(DOC_MODULE)-sections.txt $(DOC_MODULE)-overrides.txt
-	@echo 'gtk-doc: Rebuilding template files'
-	@-chmod -R u+w $(srcdir)
-	cd $(srcdir) && gtkdoc-mktmpl --module=$(DOC_MODULE) $(MKTMPL_OPTIONS)
-	touch tmpl-build.stamp
-
-tmpl.stamp: tmpl-build.stamp
-	@true
-
-tmpl/*.sgml:
-	@true
-
-
-#### xml ####
-
-sgml-build.stamp: tmpl.stamp $(HFILE_GLOB) $(CFILE_GLOB) $(DOC_MODULE)-sections.txt $(srcdir)/tmpl/*.sgml $(expand_content_files)
-	@echo 'gtk-doc: Building XML'
-	@-chmod -R u+w $(srcdir)
-	cd $(srcdir) && \
-	gtkdoc-mkdb --module=$(DOC_MODULE) --source-dir=$(DOC_SOURCE_DIR) --output-format=xml --expand-content-files="$(expand_content_files)" --main-sgml-file=$(DOC_MAIN_SGML_FILE) $(MKDB_OPTIONS)
-	touch sgml-build.stamp
-
-sgml.stamp: sgml-build.stamp
-	@true
-
-#### html ####
-
-html-build.stamp: sgml.stamp $(DOC_MAIN_SGML_FILE) $(content_files)
-	@echo 'gtk-doc: Building HTML'
-	@-chmod -R u+w $(srcdir)
-	rm -rf $(srcdir)/html
-	mkdir $(srcdir)/html
-	cd $(srcdir)/html && gtkdoc-mkhtml $(DOC_MODULE) ../$(DOC_MAIN_SGML_FILE)
-	test "x$(HTML_IMAGES)" = "x" || ( cd $(srcdir) && cp $(HTML_IMAGES) html )
-	@echo 'gtk-doc: Fixing cross-references'
-	cd $(srcdir) && gtkdoc-fixxref --module-dir=html --html-dir=$(HTML_DIR) $(FIXXREF_OPTIONS)
-	touch html-build.stamp
-
-##############
-
-clean-local:
-	rm -f *~ *.bak
-	rm -rf .libs
-
-distclean-local:
-	cd $(srcdir) && \
-	  rm -rf xml $(REPORT_FILES) \
-	         $(DOC_MODULE)-decl-list.txt $(DOC_MODULE)-decl.txt
-
-maintainer-clean-local: clean
-	cd $(srcdir) && rm -rf xml html
-
-install-data-local:
-	-installfiles=`echo $(srcdir)/html/*`; \
-	if test "$$installfiles" = '$(srcdir)/html/*'; \
-	then echo '-- Nothing to install' ; \
-	else \
-	  $(mkinstalldirs) $(DESTDIR)$(TARGET_DIR); \
-	  for i in $$installfiles; do \
-	    echo '-- Installing '$$i ; \
-	    $(INSTALL_DATA) $$i $(DESTDIR)$(TARGET_DIR); \
-	  done; \
-	  echo '-- Installing $(srcdir)/html/index.sgml' ; \
-	  $(INSTALL_DATA) $(srcdir)/html/index.sgml $(DESTDIR)$(TARGET_DIR) || :; \
-	  which gtkdoc-rebase >/dev/null && \
-	    gtkdoc-rebase --relative --dest-dir=$(DESTDIR) --html-dir=$(DESTDIR)$(TARGET_DIR) ; \
-	fi
-	
-
-uninstall-local:
-	rm -f $(DESTDIR)$(TARGET_DIR)/*
-
-#
-# Require gtk-doc when making dist
-#
-if ENABLE_GTK_DOC
-dist-check-gtkdoc:
-else
-dist-check-gtkdoc:
-	@echo "*** gtk-doc must be installed and enabled in order to make dist"
-	@false
-endif
-
-dist-hook: dist-check-gtkdoc dist-hook-local
-	mkdir $(distdir)/tmpl
-	mkdir $(distdir)/xml
-	mkdir $(distdir)/html
-	-cp $(srcdir)/tmpl/*.sgml $(distdir)/tmpl
-	-cp $(srcdir)/xml/*.xml $(distdir)/xml
-	cp $(srcdir)/html/* $(distdir)/html
-	-cp $(srcdir)/$(DOC_MODULE).types $(distdir)/
-	-cp $(srcdir)/$(DOC_MODULE)-sections.txt $(distdir)/
-	cd $(distdir) && rm -f $(DISTCLEANFILES)
-	-gtkdoc-rebase --online --relative --html-dir=$(distdir)/html
-
-.PHONY : dist-hook-local docs
diff --git a/package/webkit/webkit-1.2.3-fix-build-issue-with-old-gtk.patch b/package/webkit/webkit-1.2.3-fix-build-issue-with-old-gtk.patch
new file mode 100644
index 0000000..2b20bae
--- /dev/null
+++ b/package/webkit/webkit-1.2.3-fix-build-issue-with-old-gtk.patch
@@ -0,0 +1,22 @@
+The WebKit code conditionally calls getRootCoords() when the Gtk
+version is old (i.e < 2.17.3), but fails to declare the prototype of
+this function (which is implemented after its call site). This build
+failure has probably been missed due to the fact that not many people
+try to compile recent WebKit versions with old Gtk.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: webkit-1.2.3/WebKitTools/DumpRenderTree/gtk/EventSender.cpp
+===================================================================
+--- webkit-1.2.3.orig/WebKitTools/DumpRenderTree/gtk/EventSender.cpp	2010-07-19 20:42:27.000000000 +0200
++++ webkit-1.2.3/WebKitTools/DumpRenderTree/gtk/EventSender.cpp	2010-07-19 20:42:57.000000000 +0200
+@@ -86,6 +86,9 @@
+ static void sendOrQueueEvent(GdkEvent event);
+ static void dispatchEvent(GdkEvent event);
+ static guint getStateFlags();
++#if !GTK_CHECK_VERSION(2,17,3)
++static void getRootCoords(GtkWidget* view, int* rootX, int* rootY);
++#endif
+ 
+ static JSValueRef getDragModeCallback(JSContextRef context, JSObjectRef object, JSStringRef propertyName, JSValueRef* exception)
+ {
diff --git a/package/webkit/webkit-r30267-trunc.patch b/package/webkit/webkit-r30267-trunc.patch
deleted file mode 100644
index 0cc7ca2..0000000
--- a/package/webkit/webkit-r30267-trunc.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/JavaScriptCore/wtf/MathExtras.h	2008-02-04 21:09:08.000000000 -0500
-+++ b/JavaScriptCore/wtf/MathExtras.h	2008-02-11 13:31:28.000000000 -0500
-@@ -75,6 +75,8 @@ inline bool signbit(double x) { return x
- 
- #endif
- 
-+inline double trunc(double num) { return num > 0 ? floor(num) : ceil(num); }
-+
- #if COMPILER(MSVC)
- 
- inline bool isinf(double num) { return !_finite(num) && !_isnan(num); }
diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index fc355ce..648ba31 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -3,16 +3,15 @@
 # webkit
 #
 #############################################################
-WEBKIT_VERSION = r44552
-WEBKIT_SOURCE = WebKit-$(WEBKIT_VERSION).tar.bz2
-WEBKIT_SITE = http://nightly.webkit.org/files/trunk/src/
+WEBKIT_VERSION = 1.2.3
+WEBKIT_SOURCE = webkit-$(WEBKIT_VERSION).tar.gz
+WEBKIT_SITE = http://www.webkitgtk.org
 
 WEBKIT_INSTALL_STAGING = YES
-WEBKIT_INSTALL_TARGET = YES
 WEBKIT_LIBTOOL_PATCH = NO
 
 WEBKIT_DEPENDENCIES = host-flex host-gperf icu curl libxml2 libxslt	\
-			libgtk2 sqlite enchant libsoup jpeg
+			libgtk2 sqlite enchant libsoup jpeg libgail
 
 WEBKIT_CONF_ENV = ac_cv_path_icu_config=$(STAGING_DIR)/usr/bin/icu-config
 
@@ -28,15 +27,4 @@ endif
 
 WEBKIT_CONF_OPT += --disable-video
 
-define WEBKIT_AUTOGEN_PATCH
-$(SED) 's%ACLOCAL_FLAGS=.*%ACLOCAL_FLAGS="-I autotools -I $(STAGING_DIR)/usr/share/aclocal"%' $(WEBKIT_DIR)/autogen.sh
-$(SED) 's/AUTOMAKE_FLAGS=.*/AUTOMAKE_FLAGS="--foreign --add-missing --copy"/' $(WEBKIT_DIR)/autogen.sh
-$(SED) 's/LIBTOOLIZE_FLAGS=.*/LIBTOOLIZE_FLAGS="--force --automake --copy"/' $(WEBKIT_DIR)/autogen.sh
-cp package/webkit/gtk-doc.make $(WEBKIT_DIR)/
-# Don't run the configure step yet
-cd $(WEBKIT_DIR); $(HOST_CONFIGURE_OPTS) AUTOGEN_CONFIGURE_ARGS=--version ./autogen.sh
-endef
-
-WEBKIT_POST_EXTRACT_HOOKS += WEBKIT_AUTOGEN_PATCH
-
 $(eval $(call AUTOTARGETS,package,webkit))
-- 
1.7.1
