From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  3 Oct 2014 19:01:45 +0200
Subject: [Buildroot] [PATCH 11/25 v7] docs/manual: last pass at removing
	hard-coded path in GENDOC_INNER
In-Reply-To: <cover.1412355549.git.yann.morin.1998@free.fr>
References: <cover.1412355549.git.yann.morin.1998@free.fr>
Message-ID: <1c69bd3f6d50656c400d21e142f0a999585b2ef1.1412355549.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GENDOC_INNER still has one hard-coded path to the document's directory:
the asciidoc .conf files.

Add a new argument to GENDOC_INNER to pass the directory of the
document.

Notes:

- this makes for overly-long lines, but splitting is not possible,
otherwise the first argument on the continuation line would get (at
least) a leading space or tab, and that would break either or all of
the variables names, the dependency rules, or the filenames we look
for. A future patch will further clean this up (see: docs/asciidoc: call
$(pkgname) and $(pkgdir) in a single place.)

- this means that another document would be missing our tweaks from
asciidoc-text.conf to not render images and sanely render hyperlinks.
But that was already the case anyway, since we were using docs/$(1)/ to
search for that file. A further patch will allow us to have such
configuration in a common place.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/manual.mk | 74 ++++++++++++++++++++++++++++-----------------------
 1 file changed, 40 insertions(+), 34 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index 7b06d47..cf6f33c 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -53,14 +53,15 @@ GENDOC_XSLTPROC_IS_BROKEN = \
 # GENDOC_INNER -- generates the make targets needed to build a specific type of
 #                 asciidoc documentation.
 #
-#  argument 1 is the name of the document and must be a subdirectory of docs/;
-#             the top-level asciidoc file must have the same name
+#  argument 1 is the name of the document and the top-level asciidoc file must
+#             have the same name
 #  argument 2 is the uppercase name of the document
-#  argument 3 is the type of document to generate (-f argument of a2x)
-#  argument 4 is the document type as used in the make target
-#  argument 5 is the output file extension for the document type
-#  argument 6 is the human text for the document type
-#  argument 7 (optional) are extra arguments for a2x
+#  argument 3 is the directory containing the document
+#  argument 4 is the type of document to generate (-f argument of a2x)
+#  argument 5 is the document type as used in the make target
+#  argument 6 is the output file extension for the document type
+#  argument 7 is the human text for the document type
+#  argument 8 (optional) are extra arguments for a2x
 #
 # The variable <DOCUMENT_NAME>_SOURCES defines the dependencies.
 #
@@ -68,51 +69,51 @@ GENDOC_XSLTPROC_IS_BROKEN = \
 # all variable references except the arguments must be $$-quoted.
 ################################################################################
 define GENDOC_INNER
-$(1): $(1)-$(4)
-.PHONY: $(1)-$(4)
-$(1)-$(4): $$(O)/docs/$(1)/$(1).$(5)
+$(1): $(1)-$(5)
+.PHONY: $(1)-$(5)
+$(1)-$(5): $$(O)/docs/$(1)/$(1).$(6)
 
-$(1)-check-dependencies-$(4):
+$(1)-check-dependencies-$(5):
 
-$(2)_$(3)_ASCIIDOC_CONF = docs/$(1)/asciidoc-$(3).conf
-ifneq ($$(wildcard $$($(2)_$(3)_ASCIIDOC_CONF)),)
-$(2)_$(3)_ASCIIDOC_OPTS += -f $$($(2)_$(3)_ASCIIDOC_CONF)
+$(2)_$(4)_ASCIIDOC_CONF = $(3)/asciidoc-$(4).conf
+ifneq ($$(wildcard $$($(2)_$(4)_ASCIIDOC_CONF)),)
+$(2)_$(4)_ASCIIDOC_OPTS += -f $$($(2)_$(4)_ASCIIDOC_CONF)
 endif
 
 # Handle a2x warning about --destination-dir option only applicable to HTML
 # based outputs. So:
 # - use the --destination-dir option if possible (html and split-html),
 # - otherwise copy the generated document to the output directory
-$(2)_$(3)_A2X_OPTS =
-ifneq ($$(filter $(4),html split-html),)
-$(2)_$(3)_A2X_OPTS += --destination-dir="$$(@D)"
+$(2)_$(4)_A2X_OPTS =
+ifneq ($$(filter $(5),html split-html),)
+$(2)_$(4)_A2X_OPTS += --destination-dir="$$(@D)"
 else
-define $(2)_$(3)_INSTALL_CMDS
-	$$(Q)cp -f $$(BUILD_DIR)/docs/$(1)/$(1).$(5) $$(@D)
+define $(2)_$(4)_INSTALL_CMDS
+	$$(Q)cp -f $$(BUILD_DIR)/docs/$(1)/$(1).$(6) $$(@D)
 endef
 endif
 
-ifeq ($(5)-$$(GENDOC_XSLTPROC_IS_BROKEN),pdf-y)
-$$(O)/docs/$(1)/$(1).$(5):
+ifeq ($(6)-$$(GENDOC_XSLTPROC_IS_BROKEN),pdf-y)
+$$(O)/docs/$(1)/$(1).$(6):
 	$$(warning PDF generation is disabled because of a bug in \
 		xsltproc. To be able to generate a PDF, you should \
 		build xsltproc from the libxslt sources >=1.1.29 and pass it \
 		to make through the command line: \
 		'PATH=/path/to/custom-xsltproc/bin:$$$${PATH} make $(1)-pdf')
 else
-$$(O)/docs/$(1)/$(1).$(5): $$($(2)_SOURCES) \
+$$(O)/docs/$(1)/$(1).$(6): $$($(2)_SOURCES) \
 			   $(1)-check-dependencies \
-			   $(1)-check-dependencies-$(4) \
+			   $(1)-check-dependencies-$(5) \
 			   $(1)-prepare-sources
-	$$(Q)$$(call MESSAGE,"Generating $(6) $(1)...")
+	$$(Q)$$(call MESSAGE,"Generating $(7) $(1)...")
 	$$(Q)mkdir -p $$(@D)
-	$$(Q)a2x $(7) -f $(3) -d book -L \
+	$$(Q)a2x $(8) -f $(4) -d book -L \
 		$$(foreach r,$$($(2)_RESOURCES),-r $$(r)) \
-		$$($(2)_$(3)_A2X_OPTS) \
-		--asciidoc-opts="$$($(2)_$(3)_ASCIIDOC_OPTS)" \
+		$$($(2)_$(4)_A2X_OPTS) \
+		--asciidoc-opts="$$($(2)_$(4)_ASCIIDOC_OPTS)" \
 		$$(BUILD_DIR)/docs/$(1)/$(1).txt
 # install the generated document
-	$$($(2)_$(3)_INSTALL_CMDS)
+	$$($(2)_$(4)_INSTALL_CMDS)
 endif
 endef
 
@@ -129,21 +130,26 @@ $$(BUILD_DIR)/docs/$(pkgname):
 
 $(pkgname)-rsync: $$(BUILD_DIR)/docs/$(pkgname)
 	$$(Q)$$(call MESSAGE,"Preparing the $(pkgname) sources...")
-	$$(Q)rsync -a docs/$(pkgname)/ $$^
+	$$(Q)rsync -a $(pkgdir) $$^
 
 $(pkgname)-prepare-sources: $(pkgname)-rsync
 
-$(call GENDOC_INNER,$(pkgname),$$(call UPPERCASE,$(pkgname)),xhtml,html,html,HTML,\
+$(call GENDOC_INNER,$(pkgname),$$(call UPPERCASE,$(pkgname)),$(pkgdir),xhtml,html,html,HTML,\
 	--xsltproc-opts "--stringparam toc.section.depth 1")
-$(call GENDOC_INNER,$(pkgname),$$(call UPPERCASE,$(pkgname)),chunked,split-html,chunked,split HTML,\
+
+$(call GENDOC_INNER,$(pkgname),$$(call UPPERCASE,$(pkgname)),$(pkgdir),chunked,split-html,chunked,split HTML,\
 	--xsltproc-opts "--stringparam toc.section.depth 1")
+
 # dblatex needs to pass the '--maxvars ...' option to xsltproc to prevent it
 # from reaching the template recursion limit when processing the (long) target
 # package table and bailing out.
-$(call GENDOC_INNER,$(pkgname),$$(call UPPERCASE,$(pkgname)),pdf,pdf,pdf,PDF,\
+$(call GENDOC_INNER,$(pkgname),$$(call UPPERCASE,$(pkgname)),$(pkgdir),pdf,pdf,pdf,PDF,\
 	--dblatex-opts "-P latex.output.revhistory=0 -x '--maxvars 100000'")
-$(call GENDOC_INNER,$(pkgname),$$(call UPPERCASE,$(pkgname)),text,text,text,text)
-$(call GENDOC_INNER,$(pkgname),$$(call UPPERCASE,$(pkgname)),epub,epub,epub,ePUB)
+
+$(call GENDOC_INNER,$(pkgname),$$(call UPPERCASE,$(pkgname)),$(pkgdir),text,text,text,text)
+
+$(call GENDOC_INNER,$(pkgname),$$(call UPPERCASE,$(pkgname)),$(pkgdir),epub,epub,epub,ePUB)
+
 clean: $(pkgname)-clean
 $(pkgname)-clean:
 	$$(Q)$$(RM) -rf $$(BUILD_DIR)/docs/$(pkgname)
-- 
1.9.1
