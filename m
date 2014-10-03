From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  3 Oct 2014 19:01:52 +0200
Subject: [Buildroot] [PATCH 18/25 v7] docs: rename the GENDOC infrastructure
In-Reply-To: <cover.1412355549.git.yann.morin.1998@free.fr>
References: <cover.1412355549.git.yann.morin.1998@free.fr>
Message-ID: <ace0885ac465887017f98eb0836d1e708ab77d1c.1412355549.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rename the GENDOC infrastructure so that it more closely matches the way
we handle the packages infras.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
Chamges v5 -> v6:
  - fix typo: s/asiciidoc/asciidoc/
---
 Makefile                               |  2 +-
 docs/manual/manual.mk                  |  2 +-
 package/{gendoc.mk => doc-asciidoc.mk} | 36 ++++++++++++++++++++--------------
 3 files changed, 23 insertions(+), 17 deletions(-)
 rename package/{gendoc.mk => doc-asciidoc.mk} (81%)

diff --git a/Makefile b/Makefile
index 5a1bbbd..3146525 100644
--- a/Makefile
+++ b/Makefile
@@ -272,7 +272,7 @@ unexport DESTDIR
 unexport RUBYOPT
 
 include package/pkg-utils.mk
-include package/gendoc.mk
+include package/doc-asciidoc.mk
 
 ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index a896119..a3011c6 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -28,4 +28,4 @@ define MANUAL_CHECK_LISTS_DEPS
 endef
 MANUAL_CHECK_DEPENDENCIES_HOOKS += MANUAL_CHECK_LISTS_DEPS
 
-$(eval $(call GENDOC))
+$(eval $(call asciidoc-document))
diff --git a/package/gendoc.mk b/package/doc-asciidoc.mk
similarity index 81%
rename from package/gendoc.mk
rename to package/doc-asciidoc.mk
index d7c85cb..fb9a62e 100644
--- a/package/gendoc.mk
+++ b/package/doc-asciidoc.mk
@@ -1,6 +1,6 @@
 # we can't use suitable-host-package here because that's not available in
 # the context of 'make release'
-gendoc-check-dependencies:
+asciidoc-check-dependencies:
 	$(Q)if [ -z "$(shell support/dependencies/check-host-asciidoc.sh)" ]; then \
 		echo "You need a sufficiently recent asciidoc on your host" \
 			"to generate documents"; \
@@ -11,7 +11,7 @@ gendoc-check-dependencies:
 		exit 1; \
 	fi
 
-gendoc-check-dependencies-pdf:
+asciidoc-check-dependencies-pdf:
 	$(Q)if [ -z "`which dblatex 2>/dev/null`" ]; then \
 		echo "You need dblatex on your host to generate PDF documents"; \
 		exit 1; \
@@ -32,8 +32,8 @@ GENDOC_XSLTPROC_IS_BROKEN = \
 	$(shell xsltproc --maxvars 0 >/dev/null 2>/dev/null || echo y)
 
 ################################################################################
-# GENDOC_INNER -- generates the make targets needed to build a specific type of
-#                 asciidoc documentation.
+# ASCIIDOC_INNER -- generates the make targets needed to build a specific type of
+#                   asciidoc documentation.
 #
 #  argument 1 is the name of the document and the top-level asciidoc file must
 #             have the same name
@@ -50,14 +50,14 @@ GENDOC_XSLTPROC_IS_BROKEN = \
 # Since this function will be called from within an $(eval ...)
 # all variable references except the arguments must be $$-quoted.
 ################################################################################
-define GENDOC_INNER
+define ASCIIDOC_INNER
 $(1): $(1)-$(5)
 .PHONY: $(1)-$(5)
 $(1)-$(5): $$(O)/docs/$(1)/$(1).$(6)
 
 # Single line, because splitting a foreach is not easy...
-gendoc-check-dependencies-$(5):
-$(1)-check-dependencies-$(5): gendoc-check-dependencies-$(5)
+asciidoc-check-dependencies-$(5):
+$(1)-check-dependencies-$(5): asciidoc-check-dependencies-$(5)
 	$$(Q)$$(foreach hook,$$($(2)_CHECK_DEPENDENCIES_$$(call UPPERCASE,$(5))_HOOKS),$$(call $$(hook))$$(sep))
 
 $(2)_$(4)_ASCIIDOC_CONF = $(3)/asciidoc-$(4).conf
@@ -105,15 +105,15 @@ endif
 endef
 
 ################################################################################
-# GENDOC -- generates the make targets needed to build asciidoc documentation.
+# ASCIIDOC -- generates the make targets needed to build asciidoc documentation.
 #
 # The variable <DOCUMENT_NAME>_SOURCES defines the dependencies.
 # The variable <DOCUMENT_NAME>_RESOURCES defines where the document's
 # resources, such as images, are located; must be an absolute path.
 ################################################################################
-define GENDOC
+define ASCIIDOC
 # Single line, because splitting a foreach is not easy...
-$(pkgname)-check-dependencies: gendoc-check-dependencies
+$(pkgname)-check-dependencies: asciidoc-check-dependencies
 	$$(Q)$$(foreach hook,$$($$(call UPPERCASE,$(pkgname))_CHECK_DEPENDENCIES_HOOKS),$$(call $$(hook))$$(sep))
 
 $$(BUILD_DIR)/docs/$(pkgname):
@@ -127,24 +127,30 @@ $(pkgname)-rsync: $$(BUILD_DIR)/docs/$(pkgname)
 
 $(pkgname)-prepare-sources: $(pkgname)-rsync
 
-$(call GENDOC_INNER,$(pkgname),$$(call UPPERCASE,$(pkgname)),$(pkgdir),xhtml,html,html,HTML,\
+$(call ASCIIDOC_INNER,$(pkgname),$$(call UPPERCASE,$(pkgname)),$(pkgdir),xhtml,html,html,HTML,\
 	--xsltproc-opts "--stringparam toc.section.depth 1")
 
-$(call GENDOC_INNER,$(pkgname),$$(call UPPERCASE,$(pkgname)),$(pkgdir),chunked,split-html,chunked,split HTML,\
+$(call ASCIIDOC_INNER,$(pkgname),$$(call UPPERCASE,$(pkgname)),$(pkgdir),chunked,split-html,chunked,split HTML,\
 	--xsltproc-opts "--stringparam toc.section.depth 1")
 
 # dblatex needs to pass the '--maxvars ...' option to xsltproc to prevent it
 # from reaching the template recursion limit when processing the (long) target
 # package table and bailing out.
-$(call GENDOC_INNER,$(pkgname),$$(call UPPERCASE,$(pkgname)),$(pkgdir),pdf,pdf,pdf,PDF,\
+$(call ASCIIDOC_INNER,$(pkgname),$$(call UPPERCASE,$(pkgname)),$(pkgdir),pdf,pdf,pdf,PDF,\
 	--dblatex-opts "-P latex.output.revhistory=0 -x '--maxvars 100000'")
 
-$(call GENDOC_INNER,$(pkgname),$$(call UPPERCASE,$(pkgname)),$(pkgdir),text,text,text,text)
+$(call ASCIIDOC_INNER,$(pkgname),$$(call UPPERCASE,$(pkgname)),$(pkgdir),text,text,text,text)
 
-$(call GENDOC_INNER,$(pkgname),$$(call UPPERCASE,$(pkgname)),$(pkgdir),epub,epub,epub,ePUB)
+$(call ASCIIDOC_INNER,$(pkgname),$$(call UPPERCASE,$(pkgname)),$(pkgdir),epub,epub,epub,ePUB)
 
 clean: $(pkgname)-clean
 $(pkgname)-clean:
 	$$(Q)$$(RM) -rf $$(BUILD_DIR)/docs/$(pkgname)
 .PHONY: $(pkgname) $(pkgname)-clean
 endef
+
+################################################################################
+# asciidoc-document -- the target generator macro for asciidoc documents
+################################################################################
+
+asciidoc-document = $(call ASCIIDOC)
-- 
1.9.1
