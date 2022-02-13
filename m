Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C581C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 11:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 396E081762;
	Sun, 13 Feb 2022 11:30:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7p08K3P_brTd; Sun, 13 Feb 2022 11:30:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 109FB81758;
	Sun, 13 Feb 2022 11:30:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B944C1BF842
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A617F8148D
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:29:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j_y5swzUWg-q for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 11:29:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5782581461
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 11:29:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4203E82287; Sun, 13 Feb 2022 11:21:33 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 12:24:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c2e26681724085106df18b382f591b47fe43141
X-Git-Newrev: 4f59ababc018ee2a41b11b4f0723b2d54fa6b91b
X-Patchwork-Hint: ignore
Message-Id: <20220213112133.4203E82287@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/doc-asciidoc: fix build for
 out-of-tree documents
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4f59ababc018ee2a41b11b4f0723b2d54fa6b91b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The doc-asciidoc infra allows document to define sources and resources,
and those can only be local (there is no download support for documents).
The currently documented way to specify those is to use the $(pkgdir)
macro to point to the document sources and resources when they are along
the .mk.

However, this works only for sources and not for resources.

Indeed, sources are used to generate Makefile dependency rules, so
$(pkgdir) is expanded and evaluated during the call to $(doc-asciidoc),
while resources are expanded and evaluated when the rules are executed,
which always happen after all the parsing has be done, at which point
$(pkgdir) expands to the last Makefile that was parsed, which is always
Buildroot's own manual.

This went unnoticed so far because Buildroot's manual is 1) the last to
be parsed, and 2) not using $(pkgdir) anyway.

Additionally, $(pkgdir) is mostly an internal macro, that is, as this
change demonstrates, difficult to use, and thus should not be used, in
packages or in documents.

We fix that by introducing $(FOO_DOCDIR), similar to $(FOO_PKGDIR),
which points to the document directory. We choose not to name the
variable FOO_PKGDIR, because it semantically is not a package.

As a consequence, the last argument to the doc-asciidoc macro is now
superfluous, so it is removed, which causes a little bit of churn in
the main macro. As a further consequence, the third argument in the
inner macro is no longer needed either, so it too is removed, which
causes a bit more churn yet in the inner macro.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Frederic GARDES <frederic.gardes@orange.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 docs/manual/adding-packages-asciidoc.txt | 17 ++++--
 package/doc-asciidoc.mk                  | 90 ++++++++++++++++----------------
 2 files changed, 59 insertions(+), 48 deletions(-)

diff --git a/docs/manual/adding-packages-asciidoc.txt b/docs/manual/adding-packages-asciidoc.txt
index f9688b36c7..0bfe99d22e 100644
--- a/docs/manual/adding-packages-asciidoc.txt
+++ b/docs/manual/adding-packages-asciidoc.txt
@@ -39,7 +39,7 @@ Here is an example to render a simple AsciiDoc document.
 04: #
 05: ################################################################################
 06:
-07: FOO_SOURCES = $(sort $(wildcard $(pkgdir)/*))
+07: FOO_SOURCES = $(sort $(wildcard $(FOO_DOCDIR)/*))
 08: $(eval $(call asciidoc-document))
 ----
 
@@ -85,6 +85,17 @@ various steps:
 * +FOO_CHECK_DEPENDENCIES_<FMT>_HOOKS+, to run additional tests for
   the specified format +<FMT>+ (see the list of rendered formats, above).
 
+Buildroot sets the following variable that can be used in the definitions
+above:
+
+* +$(FOO_DOCDIR)+, similar to +$(FOO_PKGDIR)+, contains the path to the
+  directory containing +foo.mk+. It can be used to refer to the document
+  sources, and can be used in the hooks, especially the post-rsync hook
+  if parts of the documentation needs to be generated.
+
+* +$(@D)+, as for traditional packages, contains the path to the directory
+  where the document will be copied and built.
+
 Here is a complete example that uses all variables and all hooks:
 
 ----
@@ -94,8 +105,8 @@ Here is a complete example that uses all variables and all hooks:
 04: #
 05: ################################################################################
 06:
-07: FOO_SOURCES = $(sort $(wildcard $(pkgdir)/*))
-08: FOO_RESOURCES = $(sort $(wildcard $(pkgdir)/ressources))
+07: FOO_SOURCES = $(sort $(wildcard $(FOO_DOCDIR)/*))
+08: FOO_RESOURCES = $(sort $(wildcard $(FOO_DOCDIR)/ressources))
 09:
 10: define FOO_GEN_EXTRA_DOC
 11:     /path/to/generate-script --outdir=$(@D)
diff --git a/package/doc-asciidoc.mk b/package/doc-asciidoc.mk
index be92496c2e..2bd761edfb 100644
--- a/package/doc-asciidoc.mk
+++ b/package/doc-asciidoc.mk
@@ -42,12 +42,11 @@ BR_ASCIIDOC_CONF = docs/conf/asciidoc.conf
 #  argument 1 is the name of the document and the top-level asciidoc file must
 #             have the same name
 #  argument 2 is the uppercase name of the document
-#  argument 3 is the directory containing the document
-#  argument 4 is the type of document to generate (-f argument of a2x)
-#  argument 5 is the document type as used in the make target
-#  argument 6 is the output file extension for the document type
-#  argument 7 is the human text for the document type
-#  argument 8 (optional) are extra arguments for a2x
+#  argument 3 is the type of document to generate (-f argument of a2x)
+#  argument 4 is the document type as used in the make target
+#  argument 5 is the output file extension for the document type
+#  argument 6 is the human text for the document type
+#  argument 7 (optional) are extra arguments for a2x
 #
 # The variable <DOCUMENT_NAME>_SOURCES defines the dependencies.
 #
@@ -55,55 +54,55 @@ BR_ASCIIDOC_CONF = docs/conf/asciidoc.conf
 # all variable references except the arguments must be $$-quoted.
 ################################################################################
 define ASCIIDOC_INNER
-$(1): $(1)-$(5)
-.PHONY: $(1)-$(5)
-$(1)-$(5): $$(O)/docs/$(1)/$(1).$(6)
+$(1): $(1)-$(4)
+.PHONY: $(1)-$(4)
+$(1)-$(4): $$(O)/docs/$(1)/$(1).$(5)
 
-asciidoc-check-dependencies-$(5):
-.PHONY: $(1)-check-dependencies-$(5)
+asciidoc-check-dependencies-$(4):
+.PHONY: $(1)-check-dependencies-$(4)
 # Single line, because splitting a foreach is not easy...
-$(1)-check-dependencies-$(5): asciidoc-check-dependencies-$(5)
-	$$(Q)$$(foreach hook,$$($(2)_CHECK_DEPENDENCIES_$$(call UPPERCASE,$(5))_HOOKS),$$(call $$(hook))$$(sep))
+$(1)-check-dependencies-$(4): asciidoc-check-dependencies-$(4)
+	$$(Q)$$(foreach hook,$$($(2)_CHECK_DEPENDENCIES_$$(call UPPERCASE,$(4))_HOOKS),$$(call $$(hook))$$(sep))
 
 # Include Buildroot's AsciiDoc configuration first:
 #  - generic configuration,
 #  - then output-specific configuration
 ifneq ($$(wildcard $$(BR_ASCIIDOC_CONF)),)
-$(2)_$(4)_ASCIIDOC_OPTS += -f $$(BR_ASCIIDOC_CONF)
+$(2)_$(3)_ASCIIDOC_OPTS += -f $$(BR_ASCIIDOC_CONF)
 endif
-BR_$(4)_ASCIIDOC_CONF = docs/conf/asciidoc-$(4).conf
-ifneq ($$(wildcard $$(BR_$(4)_ASCIIDOC_CONF)),)
-$(2)_$(4)_ASCIIDOC_OPTS += -f $$(BR_$(4)_ASCIIDOC_CONF)
+BR_$(3)_ASCIIDOC_CONF = docs/conf/asciidoc-$(3).conf
+ifneq ($$(wildcard $$(BR_$(3)_ASCIIDOC_CONF)),)
+$(2)_$(3)_ASCIIDOC_OPTS += -f $$(BR_$(3)_ASCIIDOC_CONF)
 endif
 
 # Then include the document's AsciiDoc configuration:
 #  - generic configuration,
 #  - then output-specific configuration
 ifneq ($$(wildcard $$($(2)_ASCIIDOC_CONF)),)
-$(2)_$(4)_ASCIIDOC_OPTS += -f $$($(2)_ASCIIDOC_CONF)
+$(2)_$(3)_ASCIIDOC_OPTS += -f $$($(2)_ASCIIDOC_CONF)
 endif
-$(2)_$(4)_ASCIIDOC_CONF = $(3)/asciidoc-$(4).conf
-ifneq ($$(wildcard $$($(2)_$(4)_ASCIIDOC_CONF)),)
-$(2)_$(4)_ASCIIDOC_OPTS += -f $$($(2)_$(4)_ASCIIDOC_CONF)
+$(2)_$(3)_ASCIIDOC_CONF = $$($(2)_DOCDIR)/asciidoc-$(3).conf
+ifneq ($$(wildcard $$($(2)_$(3)_ASCIIDOC_CONF)),)
+$(2)_$(3)_ASCIIDOC_OPTS += -f $$($(2)_$(3)_ASCIIDOC_CONF)
 endif
 
 # Handle a2x warning about --destination-dir option only applicable to HTML
 # based outputs. So:
 # - use the --destination-dir option if possible (html and split-html),
 # - otherwise copy the generated document to the output directory
-$(2)_$(4)_A2X_OPTS =
-ifneq ($$(filter $(5),html split-html),)
-$(2)_$(4)_A2X_OPTS += --destination-dir="$$(@D)"
+$(2)_$(3)_A2X_OPTS =
+ifneq ($$(filter $(4),html split-html),)
+$(2)_$(3)_A2X_OPTS += --destination-dir="$$(@D)"
 else
-define $(2)_$(4)_INSTALL_CMDS
-	$$(Q)cp -f $$(BUILD_DIR)/docs/$(1)/$(1).$(6) $$(@D)
+define $(2)_$(3)_INSTALL_CMDS
+	$$(Q)cp -f $$(BUILD_DIR)/docs/$(1)/$(1).$(5) $$(@D)
 endef
 endif
 
-$$(O)/docs/$(1)/$(1).$(6): export TZ=UTC
+$$(O)/docs/$(1)/$(1).$(5): export TZ=UTC
 
-ifeq ($(6)-$$(GENDOC_XSLTPROC_IS_BROKEN),pdf-y)
-$$(O)/docs/$(1)/$(1).$(6):
+ifeq ($(5)-$$(GENDOC_XSLTPROC_IS_BROKEN),pdf-y)
+$$(O)/docs/$(1)/$(1).$(5):
 	$$(warning PDF generation is disabled because of a bug in \
 		xsltproc. To be able to generate a PDF, you should \
 		build xsltproc from the libxslt sources >=1.1.29 and pass it \
@@ -112,20 +111,20 @@ $$(O)/docs/$(1)/$(1).$(6):
 else
 # -r $(@D) is there for documents that use external filters; those filters
 # generate code at the same location it finds the document's source files.
-$$(O)/docs/$(1)/$(1).$(6): $$($(2)_SOURCES) \
+$$(O)/docs/$(1)/$(1).$(5): $$($(2)_SOURCES) \
 			   $(1)-check-dependencies \
-			   $(1)-check-dependencies-$(5) \
+			   $(1)-check-dependencies-$(4) \
 			   $(1)-prepare-sources
-	$$(Q)$$(call MESSAGE,"Generating $(7) $(1)...")
+	$$(Q)$$(call MESSAGE,"Generating $(6) $(1)...")
 	$$(Q)mkdir -p $$(@D)
-	$$(Q)a2x $(8) -f $(4) -d book -L \
+	$$(Q)a2x $(7) -f $(3) -d book -L \
 		$$(foreach r,$$($(2)_RESOURCES) $$(@D), \
 			--resource="$$(abspath $$(r))") \
-		$$($(2)_$(4)_A2X_OPTS) \
-		--asciidoc-opts="$$($(2)_$(4)_ASCIIDOC_OPTS)" \
+		$$($(2)_$(3)_A2X_OPTS) \
+		--asciidoc-opts="$$($(2)_$(3)_ASCIIDOC_OPTS)" \
 		$$(BUILD_DIR)/docs/$(1)/$(1).txt
 # install the generated document
-	$$($(2)_$(4)_INSTALL_CMDS)
+	$$($(2)_$(3)_INSTALL_CMDS)
 endif
 endef
 
@@ -135,13 +134,14 @@ endef
 # argument 1 is the lowercase name of the document; the document's main file
 #            must have the same name, with the .txt extension
 # argument 2 is the uppercase name of the document
-# argument 3 is the directory containing the document's sources
 #
 # The variable <DOCUMENT_NAME>_SOURCES defines the dependencies.
 # The variable <DOCUMENT_NAME>_RESOURCES defines where the document's
 # resources, such as images, are located; must be an absolute path.
 ################################################################################
 define ASCIIDOC
+$(2)_DOCDIR = $(pkgdir)
+
 # Single line, because splitting a foreach is not easy...
 .PHONY: $(1)-check-dependencies
 $(1)-check-dependencies: asciidoc-check-dependencies $$($(2)_DEPENDENCIES)
@@ -153,29 +153,29 @@ $(1)-check-dependencies: asciidoc-check-dependencies $$($(2)_DEPENDENCIES)
 $$(BUILD_DIR)/docs/$(1)/.stamp_doc_rsynced:
 	$$(Q)$$(call MESSAGE,"Preparing the $(1) sources...")
 	$$(Q)mkdir -p $$(@D)
-	$$(Q)rsync -a $(3) $$(@D)
+	$$(Q)rsync -a $$($(2)_DOCDIR) $$(@D)
 	$$(Q)$$(foreach hook,$$($(2)_POST_RSYNC_HOOKS),$$(call $$(hook))$$(sep))
 
 .PHONY: $(1)-prepare-sources
 $(1)-prepare-sources: $$(BUILD_DIR)/docs/$(1)/.stamp_doc_rsynced
 
-$(2)_ASCIIDOC_CONF = $(3)/asciidoc.conf
+$(2)_ASCIIDOC_CONF = $$($(2)_DOCDIR)/asciidoc.conf
 
-$(call ASCIIDOC_INNER,$(1),$(2),$(3),xhtml,html,html,HTML,\
+$(call ASCIIDOC_INNER,$(1),$(2),xhtml,html,html,HTML,\
 	--xsltproc-opts "--stringparam toc.section.depth 1")
 
-$(call ASCIIDOC_INNER,$(1),$(2),$(3),chunked,split-html,chunked,split HTML,\
+$(call ASCIIDOC_INNER,$(1),$(2),chunked,split-html,chunked,split HTML,\
 	--xsltproc-opts "--stringparam toc.section.depth 1")
 
 # dblatex needs to pass the '--maxvars ...' option to xsltproc to prevent it
 # from reaching the template recursion limit when processing the (long) target
 # package table and bailing out.
-$(call ASCIIDOC_INNER,$(1),$(2),$(3),pdf,pdf,pdf,PDF,\
+$(call ASCIIDOC_INNER,$(1),$(2),pdf,pdf,pdf,PDF,\
 	--dblatex-opts "-P latex.output.revhistory=0 -x '--maxvars 100000'")
 
-$(call ASCIIDOC_INNER,$(1),$(2),$(3),text,text,text,text)
+$(call ASCIIDOC_INNER,$(1),$(2),text,text,text,text)
 
-$(call ASCIIDOC_INNER,$(1),$(2),$(3),epub,epub,epub,ePUB)
+$(call ASCIIDOC_INNER,$(1),$(2),epub,epub,epub,ePUB)
 
 clean: $(1)-clean
 $(1)-clean:
@@ -187,4 +187,4 @@ endef
 # asciidoc-document -- the target generator macro for asciidoc documents
 ################################################################################
 
-asciidoc-document = $(call ASCIIDOC,$(pkgname),$(call UPPERCASE,$(pkgname)),$(pkgdir))
+asciidoc-document = $(call ASCIIDOC,$(pkgname),$(call UPPERCASE,$(pkgname)))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
