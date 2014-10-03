From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  3 Oct 2014 19:01:43 +0200
Subject: [Buildroot] [PATCH 09/25 v7] docs/manual: do not hardcode name of
	the generated document
In-Reply-To: <cover.1412355549.git.yann.morin.1998@free.fr>
References: <cover.1412355549.git.yann.morin.1998@free.fr>
Message-ID: <2de04679865aba8d9ec62795295534b42200868b.1412355549.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, GENDOC_INNER hard-codes some variables to have the name of the
document in them:
    MANUAL_$(2)_ASCIIDOC_CONF
    MANUAL_$(2)_ASCIIDOC_OPTS
    MANUAL_$(2)_A2X_OPTS
    MANUAL_$(2)_INSTALL_CMDS
    ...

Also, it defines some dependency on the generation rule, onto:
    manual-check-dependencies
    manual-check-dependencies-$(3)
    manual-prepare-sources

This is problematic, as it is not possible to have another document
generated with the GENDOC infra, or it would trigger the rules, and use
the variables for our own document, 'manual'.

Add a new argument to GENDOC_INNER to be the uppercase name of the
document, much like it is done for the PKG_*_INNER functions. Replace
any reference to 'manual' with the currently passed named of the current
document, $(1).

The remaining references to 'manual' are on purpose, as they really
pertain to our manual.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>

---
Changes v6-> v7:
  - restore $$ when calling UPPERCASE  (Thomas DS, me)
  - use $(2) (uppercase name, now that we have it as an arg), instead
    of $(call UPPERCASE,$(1)) in _INNER

Note: we restored the use of $$, as GENDOC will eventually be an inner
macro itself, to be added later in the series. Thomas DS and I discussed
this on IRC, and concluded it was better to get it straight right now,
even if it only makes sense later, because: (1) it works as-is right
now, (2) making it a $$ only when really needed would make for a complex
patch. So, $$ it is from the start.

Changes v5 -> v6:
  - do not use $$ when calling UPPERCASE  (Thomas DS)
  - also rename the variable with the xsltproc check  (Samuel)
  - s/manual/document/g in the comments, too  (Thomas DS)
  - typo in commit log  (Samuel)
---
 docs/manual/manual.mk | 93 ++++++++++++++++++++++++++-------------------------
 1 file changed, 47 insertions(+), 46 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index c40f371..40bb1b1 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -14,17 +14,17 @@ manual-prepare-sources: manual-update-lists
 manual-check-dependencies:
 	$(Q)if [ -z "$(shell support/dependencies/check-host-asciidoc.sh)" ]; then \
 		echo "You need a sufficiently recent asciidoc on your host" \
-			"to generate the manual"; \
+			"to generate documents"; \
 		exit 1; \
 	fi
 	$(Q)if [ -z "`which w3m 2>/dev/null`" ]; then \
-		echo "You need w3m on your host to generate the manual"; \
+		echo "You need w3m on your host to generate documents"; \
 		exit 1; \
 	fi
 
 manual-check-dependencies-pdf:
 	$(Q)if [ -z "`which dblatex 2>/dev/null`" ]; then \
-		echo "You need dblatex on your host to generate the pdf manual"; \
+		echo "You need dblatex on your host to generate PDF documents"; \
 		exit 1; \
 	fi
 
@@ -35,18 +35,18 @@ manual-check-dependencies-lists:
 		exit 1; \
 	fi
 
-# PDF manual generation is broken because of a bug in xsltproc program provided
+# PDF generation is broken because of a bug in xsltproc program provided
 # by libxslt <=1.1.28, which does not honor an option we need to set.
 # Fortunately, this bug is already fixed upstream:
 #   https://gitorious.org/libxslt/libxslt/commit/5af7ad745323004984287e48b42712e7305de35c
 #
-# So, bail out when trying to build the pdf manual using a buggy version of the
+# So, bail out when trying to build a PDF using a buggy version of the
 # xsltproc program.
 #
-# So, to overcome this issue and being able to build the pdf manual, you can
-# build xsltproc from it source repository, then run:
+# So, to overcome this issue and being able to build a PDF, you can
+# build xsltproc from its source repository, then run:
 #   $ PATH=/path/to/custom-xsltproc/bin:${PATH} make manual
-MANUAL_XSLTPROC_IS_BROKEN = \
+GENDOC_XSLTPROC_IS_BROKEN = \
 	$(shell xsltproc --maxvars 0 >/dev/null 2>/dev/null || echo y)
 
 ################################################################################
@@ -55,11 +55,12 @@ MANUAL_XSLTPROC_IS_BROKEN = \
 #
 #  argument 1 is the name of the document and must be a subdirectory of docs/;
 #             the top-level asciidoc file must have the same name
-#  argument 2 is the type of document to generate (-f argument of a2x)
-#  argument 3 is the document type as used in the make target
-#  argument 4 is the output file extension for the document type
-#  argument 5 is the human text for the document type
-#  argument 6 (optional) are extra arguments for a2x
+#  argument 2 is the uppercase name of the document
+#  argument 3 is the type of document to generate (-f argument of a2x)
+#  argument 4 is the document type as used in the make target
+#  argument 5 is the output file extension for the document type
+#  argument 6 is the human text for the document type
+#  argument 7 (optional) are extra arguments for a2x
 #
 # The variable <DOCUMENT_NAME>_SOURCES defines the dependencies.
 #
@@ -67,50 +68,50 @@ MANUAL_XSLTPROC_IS_BROKEN = \
 # all variable references except the arguments must be $$-quoted.
 ################################################################################
 define GENDOC_INNER
-$(1): $(1)-$(3)
-.PHONY: $(1)-$(3)
-$(1)-$(3): $$(O)/docs/$(1)/$(1).$(4)
+$(1): $(1)-$(4)
+.PHONY: $(1)-$(4)
+$(1)-$(4): $$(O)/docs/$(1)/$(1).$(5)
 
-manual-check-dependencies-$(3):
+$(1)-check-dependencies-$(4):
 
-MANUAL_$(2)_ASCIIDOC_CONF = docs/$(1)/asciidoc-$(2).conf
-ifneq ($$(wildcard $$(MANUAL_$(2)_ASCIIDOC_CONF)),)
-MANUAL_$(2)_ASCIIDOC_OPTS += -f $$(MANUAL_$(2)_ASCIIDOC_CONF)
+$(2)_$(3)_ASCIIDOC_CONF = docs/$(1)/asciidoc-$(3).conf
+ifneq ($$(wildcard $$($(2)_$(3)_ASCIIDOC_CONF)),)
+$(2)_$(3)_ASCIIDOC_OPTS += -f $$($(2)_$(3)_ASCIIDOC_CONF)
 endif
 
 # Handle a2x warning about --destination-dir option only applicable to HTML
 # based outputs. So:
 # - use the --destination-dir option if possible (html and split-html),
-# - otherwise copy the generated manual to the output directory
-MANUAL_$(2)_A2X_OPTS =
-ifneq ($$(filter $(3),html split-html),)
-MANUAL_$(2)_A2X_OPTS += --destination-dir="$$(@D)"
+# - otherwise copy the generated document to the output directory
+$(2)_$(3)_A2X_OPTS =
+ifneq ($$(filter $(4),html split-html),)
+$(2)_$(3)_A2X_OPTS += --destination-dir="$$(@D)"
 else
-define MANUAL_$(2)_INSTALL_CMDS
-	$$(Q)cp -f $$(BUILD_DIR)/docs/$(1)/$(1).$(4) $$(@D)
+define $(2)_$(3)_INSTALL_CMDS
+	$$(Q)cp -f $$(BUILD_DIR)/docs/$(1)/$(1).$(5) $$(@D)
 endef
 endif
 
-ifeq ($(4)-$$(MANUAL_XSLTPROC_IS_BROKEN),pdf-y)
-$$(O)/docs/$(1)/$(1).$(4):
-	$$(warning PDF manual generation is disabled because of a bug in \
-		xsltproc. To be able to generate the PDF manual, you should \
+ifeq ($(5)-$$(GENDOC_XSLTPROC_IS_BROKEN),pdf-y)
+$$(O)/docs/$(1)/$(1).$(5):
+	$$(warning PDF generation is disabled because of a bug in \
+		xsltproc. To be able to generate a PDF, you should \
 		build xsltproc from the libxslt sources >=1.1.29 and pass it \
 		to make through the command line: \
-		'PATH=/path/to/custom-xsltproc/bin:$$$${PATH} make manual-pdf')
+		'PATH=/path/to/custom-xsltproc/bin:$$$${PATH} make $(1)-pdf')
 else
-$$(O)/docs/$(1)/$(1).$(4): $$($$(call UPPERCASE,$(1))_SOURCES) \
-			   manual-check-dependencies \
-			   manual-check-dependencies-$(3) \
-			   manual-prepare-sources
-	$$(Q)$$(call MESSAGE,"Generating $(5) $(1)...")
+$$(O)/docs/$(1)/$(1).$(5): $$($(2)_SOURCES) \
+			   $(1)-check-dependencies \
+			   $(1)-check-dependencies-$(4) \
+			   $(1)-prepare-sources
+	$$(Q)$$(call MESSAGE,"Generating $(6) $(1)...")
 	$$(Q)mkdir -p $$(@D)
-	$$(Q)a2x $(6) -f $(2) -d book -L -r $$(TOPDIR)/docs/images \
-		$$(MANUAL_$(2)_A2X_OPTS) \
-		--asciidoc-opts="$$(MANUAL_$(2)_ASCIIDOC_OPTS)" \
+	$$(Q)a2x $(7) -f $(3) -d book -L -r $$(TOPDIR)/docs/images \
+		$$($(2)_$(3)_A2X_OPTS) \
+		--asciidoc-opts="$$($(2)_$(3)_ASCIIDOC_OPTS)" \
 		$$(BUILD_DIR)/docs/$(1)/$(1).txt
-# install the generated manual
-	$$(MANUAL_$(2)_INSTALL_CMDS)
+# install the generated document
+	$$($(2)_$(3)_INSTALL_CMDS)
 endif
 endef
 
@@ -129,17 +130,17 @@ $(pkgname)-rsync: $$(BUILD_DIR)/docs/$(pkgname)
 
 $(pkgname)-prepare-sources: $(pkgname)-rsync
 
-$(call GENDOC_INNER,$(pkgname),xhtml,html,html,HTML,\
+$(call GENDOC_INNER,$(pkgname),$$(call UPPERCASE,$(pkgname)),xhtml,html,html,HTML,\
 	--xsltproc-opts "--stringparam toc.section.depth 1")
-$(call GENDOC_INNER,$(pkgname),chunked,split-html,chunked,split HTML,\
+$(call GENDOC_INNER,$(pkgname),$$(call UPPERCASE,$(pkgname)),chunked,split-html,chunked,split HTML,\
 	--xsltproc-opts "--stringparam toc.section.depth 1")
 # dblatex needs to pass the '--maxvars ...' option to xsltproc to prevent it
 # from reaching the template recursion limit when processing the (long) target
 # package table and bailing out.
-$(call GENDOC_INNER,$(pkgname),pdf,pdf,pdf,PDF,\
+$(call GENDOC_INNER,$(pkgname),$$(call UPPERCASE,$(pkgname)),pdf,pdf,pdf,PDF,\
 	--dblatex-opts "-P latex.output.revhistory=0 -x '--maxvars 100000'")
-$(call GENDOC_INNER,$(pkgname),text,text,text,text)
-$(call GENDOC_INNER,$(pkgname),epub,epub,epub,ePUB)
+$(call GENDOC_INNER,$(pkgname),$$(call UPPERCASE,$(pkgname)),text,text,text,text)
+$(call GENDOC_INNER,$(pkgname),$$(call UPPERCASE,$(pkgname)),epub,epub,epub,ePUB)
 clean: $(pkgname)-clean
 $(pkgname)-clean:
 	$$(Q)$$(RM) -rf $$(BUILD_DIR)/docs/$(pkgname)
-- 
1.9.1
