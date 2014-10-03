From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  3 Oct 2014 19:01:53 +0200
Subject: [Buildroot] [PATCH 19/25 v7] docs/asciidoc: call $(pkgname) and
	$(pkgdir) in a single place
In-Reply-To: <cover.1412355549.git.yann.morin.1998@free.fr>
References: <cover.1412355549.git.yann.morin.1998@free.fr>
Message-ID: <56f2b9108861895ebf1ed959e0f48b35e62c32a8.1412355549.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Like for all the package infrastructures, retrieve the package name and
directory in the front-end macro-variable, rather than everywhere in the
backend macro.

This allows us to clean up the ASCIIDOC macro, by removing all the calls
to $(pkgname) and $(pkgdir), and to UPPERCASE (which made the macro a
bit difficult to read.)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
Chamges v5 -> v6:
  - convert forgotten occurence of $(pkgname)  (Thomas DS)
---
 package/doc-asciidoc.mk | 41 +++++++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/package/doc-asciidoc.mk b/package/doc-asciidoc.mk
index fb9a62e..6b5b2b7 100644
--- a/package/doc-asciidoc.mk
+++ b/package/doc-asciidoc.mk
@@ -107,50 +107,55 @@ endef
 ################################################################################
 # ASCIIDOC -- generates the make targets needed to build asciidoc documentation.
 #
+# argument 1 is the lowercase name of the document; the document's main file
+#            must have the same name, with the .txt extension
+# argument 2 is the uppercase name of the document
+# argument 3 is the directory containing the document's sources
+#
 # The variable <DOCUMENT_NAME>_SOURCES defines the dependencies.
 # The variable <DOCUMENT_NAME>_RESOURCES defines where the document's
 # resources, such as images, are located; must be an absolute path.
 ################################################################################
 define ASCIIDOC
 # Single line, because splitting a foreach is not easy...
-$(pkgname)-check-dependencies: asciidoc-check-dependencies
-	$$(Q)$$(foreach hook,$$($$(call UPPERCASE,$(pkgname))_CHECK_DEPENDENCIES_HOOKS),$$(call $$(hook))$$(sep))
+$(1)-check-dependencies: asciidoc-check-dependencies
+	$$(Q)$$(foreach hook,$$($(2)_CHECK_DEPENDENCIES_HOOKS),$$(call $$(hook))$$(sep))
 
-$$(BUILD_DIR)/docs/$(pkgname):
+$$(BUILD_DIR)/docs/$(1):
 	$$(Q)mkdir -p $$@
 
 # Single line, because splitting a foreach is not easy...
-$(pkgname)-rsync: $$(BUILD_DIR)/docs/$(pkgname)
-	$$(Q)$$(call MESSAGE,"Preparing the $(pkgname) sources...")
-	$$(Q)rsync -a $(pkgdir) $$^
-	$$(Q)$$(foreach hook,$$($$(call UPPERCASE,$(pkgname))_POST_RSYNC_HOOKS),$$(call $$(hook))$$(sep))
+$(1)-rsync: $$(BUILD_DIR)/docs/$(1)
+	$$(Q)$$(call MESSAGE,"Preparing the $(1) sources...")
+	$$(Q)rsync -a $(3) $$^
+	$$(Q)$$(foreach hook,$$($(2)_POST_RSYNC_HOOKS),$$(call $$(hook))$$(sep))
 
-$(pkgname)-prepare-sources: $(pkgname)-rsync
+$(1)-prepare-sources: $(1)-rsync
 
-$(call ASCIIDOC_INNER,$(pkgname),$$(call UPPERCASE,$(pkgname)),$(pkgdir),xhtml,html,html,HTML,\
+$(call ASCIIDOC_INNER,$(1),$(2),$(3),xhtml,html,html,HTML,\
 	--xsltproc-opts "--stringparam toc.section.depth 1")
 
-$(call ASCIIDOC_INNER,$(pkgname),$$(call UPPERCASE,$(pkgname)),$(pkgdir),chunked,split-html,chunked,split HTML,\
+$(call ASCIIDOC_INNER,$(1),$(2),$(3),chunked,split-html,chunked,split HTML,\
 	--xsltproc-opts "--stringparam toc.section.depth 1")
 
 # dblatex needs to pass the '--maxvars ...' option to xsltproc to prevent it
 # from reaching the template recursion limit when processing the (long) target
 # package table and bailing out.
-$(call ASCIIDOC_INNER,$(pkgname),$$(call UPPERCASE,$(pkgname)),$(pkgdir),pdf,pdf,pdf,PDF,\
+$(call ASCIIDOC_INNER,$(1),$(2),$(3),pdf,pdf,pdf,PDF,\
 	--dblatex-opts "-P latex.output.revhistory=0 -x '--maxvars 100000'")
 
-$(call ASCIIDOC_INNER,$(pkgname),$$(call UPPERCASE,$(pkgname)),$(pkgdir),text,text,text,text)
+$(call ASCIIDOC_INNER,$(1),$(2),$(3),text,text,text,text)
 
-$(call ASCIIDOC_INNER,$(pkgname),$$(call UPPERCASE,$(pkgname)),$(pkgdir),epub,epub,epub,ePUB)
+$(call ASCIIDOC_INNER,$(1),$(2),$(3),epub,epub,epub,ePUB)
 
-clean: $(pkgname)-clean
-$(pkgname)-clean:
-	$$(Q)$$(RM) -rf $$(BUILD_DIR)/docs/$(pkgname)
-.PHONY: $(pkgname) $(pkgname)-clean
+clean: $(1)-clean
+$(1)-clean:
+	$$(Q)$$(RM) -rf $$(BUILD_DIR)/docs/$(1)
+.PHONY: $(1) $(1)-clean
 endef
 
 ################################################################################
 # asciidoc-document -- the target generator macro for asciidoc documents
 ################################################################################
 
-asciidoc-document = $(call ASCIIDOC)
+asciidoc-document = $(call ASCIIDOC,$(pkgname),$(call UPPERCASE,$(pkgname)),$(pkgdir))
-- 
1.9.1
