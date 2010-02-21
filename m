From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2010 18:47:13 +0100
Subject: [Buildroot] [PATCH 35/38] webkit: several build fixes
In-Reply-To: <cover.1266774432.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266774432.git.thomas.petazzoni@free-electrons.com>
Message-ID: <d0059d092a19245b2ce5631d328dad17ec70852f.1266774432.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch fixes different problems:

 * The autogen script of Webkit did not find autoconf, automake and
   aclocal since they are not installed in the host, but in
   $(HOST_DIR). Therefore we pass HOST_CONFIGURE_OPTS to autogen.sh so
   that the PATH is correct.

 * The autogen script was complaining that gtk-doc.make could not be
   find. As compiling gtk-doc completely is a pain (depends on
   Docbook), we just include gtk-doc.make into package/webkit/, and
   copy it to the source directory.

 * The autogen script was complaining about macros used in
   gtk-doc.make that did not exist. This is because aclocal was not
   run with $(STAGING_DIR)/usr/share/aclocal/ in the include
   path. Therefore, we fix ACLOCAL_FLAGS of Webkit's autogen script
   before running it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/webkit/gtk-doc.make |  173 +++++++++++++++++++++++++++++++++++++++++++
 package/webkit/webkit.mk    |    4 +-
 2 files changed, 176 insertions(+), 1 deletions(-)
 create mode 100644 package/webkit/gtk-doc.make

diff --git a/package/webkit/gtk-doc.make b/package/webkit/gtk-doc.make
new file mode 100644
index 0000000..354ffb7
--- /dev/null
+++ b/package/webkit/gtk-doc.make
@@ -0,0 +1,173 @@
+# -*- mode: makefile -*-
+
+####################################
+# Everything below here is generic #
+####################################
+
+if GTK_DOC_USE_LIBTOOL
+GTKDOC_CC = $(LIBTOOL) --mode=compile $(CC) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
+GTKDOC_LD = $(LIBTOOL) --mode=link $(CC) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS)
+else
+GTKDOC_CC = $(CC) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
+GTKDOC_LD = $(CC) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS)
+endif
+
+# We set GPATH here; this gives us semantics for GNU make
+# which are more like other make's VPATH, when it comes to
+# whether a source that is a target of one rule is then
+# searched for in VPATH/GPATH.
+#
+GPATH = $(srcdir)
+
+TARGET_DIR=$(HTML_DIR)/$(DOC_MODULE)
+
+EXTRA_DIST = 				\
+	$(content_files)		\
+	$(HTML_IMAGES)			\
+	$(DOC_MAIN_SGML_FILE)		\
+	$(DOC_MODULE)-sections.txt	\
+	$(DOC_MODULE)-overrides.txt
+
+DOC_STAMPS=scan-build.stamp tmpl-build.stamp sgml-build.stamp html-build.stamp \
+	   $(srcdir)/tmpl.stamp $(srcdir)/sgml.stamp $(srcdir)/html.stamp
+
+SCANOBJ_FILES = 		 \
+	$(DOC_MODULE).args 	 \
+	$(DOC_MODULE).hierarchy  \
+	$(DOC_MODULE).interfaces \
+	$(DOC_MODULE).prerequisites \
+	$(DOC_MODULE).signals
+
+REPORT_FILES = \
+	$(DOC_MODULE)-undocumented.txt \
+	$(DOC_MODULE)-undeclared.txt \
+	$(DOC_MODULE)-unused.txt
+
+CLEANFILES = $(SCANOBJ_FILES) $(REPORT_FILES) $(DOC_STAMPS)
+
+if ENABLE_GTK_DOC
+all-local: html-build.stamp
+else
+all-local:
+endif
+
+docs: html-build.stamp
+
+#### scan ####
+
+scan-build.stamp: $(HFILE_GLOB) $(CFILE_GLOB)
+	@echo 'gtk-doc: Scanning header files'
+	@-chmod -R u+w $(srcdir)
+	cd $(srcdir) && \
+	  gtkdoc-scan --module=$(DOC_MODULE) --source-dir=$(DOC_SOURCE_DIR) --ignore-headers="$(IGNORE_HFILES)" $(SCAN_OPTIONS) $(EXTRA_HFILES)
+	if grep -l '^..*$$' $(srcdir)/$(DOC_MODULE).types > /dev/null 2>&1 ; then \
+	    CC="$(GTKDOC_CC)" LD="$(GTKDOC_LD)" CFLAGS="$(GTKDOC_CFLAGS)" LDFLAGS="$(GTKDOC_LIBS)" gtkdoc-scangobj $(SCANGOBJ_OPTIONS) --module=$(DOC_MODULE) --output-dir=$(srcdir) ; \
+	else \
+	    cd $(srcdir) ; \
+	    for i in $(SCANOBJ_FILES) ; do \
+               test -f $$i || touch $$i ; \
+	    done \
+	fi
+	touch scan-build.stamp
+
+$(DOC_MODULE)-decl.txt $(SCANOBJ_FILES) $(DOC_MODULE)-sections.txt $(DOC_MODULE)-overrides.txt: scan-build.stamp
+	@true
+
+#### templates ####
+
+tmpl-build.stamp: $(DOC_MODULE)-decl.txt $(SCANOBJ_FILES) $(DOC_MODULE)-sections.txt $(DOC_MODULE)-overrides.txt
+	@echo 'gtk-doc: Rebuilding template files'
+	@-chmod -R u+w $(srcdir)
+	cd $(srcdir) && gtkdoc-mktmpl --module=$(DOC_MODULE) $(MKTMPL_OPTIONS)
+	touch tmpl-build.stamp
+
+tmpl.stamp: tmpl-build.stamp
+	@true
+
+tmpl/*.sgml:
+	@true
+
+
+#### xml ####
+
+sgml-build.stamp: tmpl.stamp $(HFILE_GLOB) $(CFILE_GLOB) $(DOC_MODULE)-sections.txt $(srcdir)/tmpl/*.sgml $(expand_content_files)
+	@echo 'gtk-doc: Building XML'
+	@-chmod -R u+w $(srcdir)
+	cd $(srcdir) && \
+	gtkdoc-mkdb --module=$(DOC_MODULE) --source-dir=$(DOC_SOURCE_DIR) --output-format=xml --expand-content-files="$(expand_content_files)" --main-sgml-file=$(DOC_MAIN_SGML_FILE) $(MKDB_OPTIONS)
+	touch sgml-build.stamp
+
+sgml.stamp: sgml-build.stamp
+	@true
+
+#### html ####
+
+html-build.stamp: sgml.stamp $(DOC_MAIN_SGML_FILE) $(content_files)
+	@echo 'gtk-doc: Building HTML'
+	@-chmod -R u+w $(srcdir)
+	rm -rf $(srcdir)/html
+	mkdir $(srcdir)/html
+	cd $(srcdir)/html && gtkdoc-mkhtml $(DOC_MODULE) ../$(DOC_MAIN_SGML_FILE)
+	test "x$(HTML_IMAGES)" = "x" || ( cd $(srcdir) && cp $(HTML_IMAGES) html )
+	@echo 'gtk-doc: Fixing cross-references'
+	cd $(srcdir) && gtkdoc-fixxref --module-dir=html --html-dir=$(HTML_DIR) $(FIXXREF_OPTIONS)
+	touch html-build.stamp
+
+##############
+
+clean-local:
+	rm -f *~ *.bak
+	rm -rf .libs
+
+distclean-local:
+	cd $(srcdir) && \
+	  rm -rf xml $(REPORT_FILES) \
+	         $(DOC_MODULE)-decl-list.txt $(DOC_MODULE)-decl.txt
+
+maintainer-clean-local: clean
+	cd $(srcdir) && rm -rf xml html
+
+install-data-local:
+	-installfiles=`echo $(srcdir)/html/*`; \
+	if test "$$installfiles" = '$(srcdir)/html/*'; \
+	then echo '-- Nothing to install' ; \
+	else \
+	  $(mkinstalldirs) $(DESTDIR)$(TARGET_DIR); \
+	  for i in $$installfiles; do \
+	    echo '-- Installing '$$i ; \
+	    $(INSTALL_DATA) $$i $(DESTDIR)$(TARGET_DIR); \
+	  done; \
+	  echo '-- Installing $(srcdir)/html/index.sgml' ; \
+	  $(INSTALL_DATA) $(srcdir)/html/index.sgml $(DESTDIR)$(TARGET_DIR) || :; \
+	  which gtkdoc-rebase >/dev/null && \
+	    gtkdoc-rebase --relative --dest-dir=$(DESTDIR) --html-dir=$(DESTDIR)$(TARGET_DIR) ; \
+	fi
+	
+
+uninstall-local:
+	rm -f $(DESTDIR)$(TARGET_DIR)/*
+
+#
+# Require gtk-doc when making dist
+#
+if ENABLE_GTK_DOC
+dist-check-gtkdoc:
+else
+dist-check-gtkdoc:
+	@echo "*** gtk-doc must be installed and enabled in order to make dist"
+	@false
+endif
+
+dist-hook: dist-check-gtkdoc dist-hook-local
+	mkdir $(distdir)/tmpl
+	mkdir $(distdir)/xml
+	mkdir $(distdir)/html
+	-cp $(srcdir)/tmpl/*.sgml $(distdir)/tmpl
+	-cp $(srcdir)/xml/*.xml $(distdir)/xml
+	cp $(srcdir)/html/* $(distdir)/html
+	-cp $(srcdir)/$(DOC_MODULE).types $(distdir)/
+	-cp $(srcdir)/$(DOC_MODULE)-sections.txt $(distdir)/
+	cd $(distdir) && rm -f $(DISTCLEANFILES)
+	-gtkdoc-rebase --online --relative --html-dir=$(distdir)/html
+
+.PHONY : dist-hook-local docs
diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index 389a5fc..2121f4b 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -25,10 +25,12 @@ endif
 WEBKIT_CONF_OPT += --disable-video
 
 define WEBKIT_AUTOGEN_PATCH
+$(SED) 's%ACLOCAL_FLAGS=.*%ACLOCAL_FLAGS="-I autotools -I $(STAGING_DIR)/usr/share/aclocal"%' $(WEBKIT_DIR)/autogen.sh
 $(SED) 's/AUTOMAKE_FLAGS=.*/AUTOMAKE_FLAGS="--foreign --add-missing --copy"/' $(WEBKIT_DIR)/autogen.sh
 $(SED) 's/LIBTOOLIZE_FLAGS=.*/LIBTOOLIZE_FLAGS="--force --automake --copy"/' $(WEBKIT_DIR)/autogen.sh
+cp package/webkit/gtk-doc.make $(WEBKIT_DIR)/
 # Don't run the configure step yet
-cd $(WEBKIT_DIR); AUTOGEN_CONFIGURE_ARGS=--version ./autogen.sh
+cd $(WEBKIT_DIR); $(HOST_CONFIGURE_OPTS) AUTOGEN_CONFIGURE_ARGS=--version ./autogen.sh
 endef
 
 WEBKIT_POST_EXTRACT_HOOKS += WEBKIT_AUTOGEN_PATCH
-- 
1.6.3.3
