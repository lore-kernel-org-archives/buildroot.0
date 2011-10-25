From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 25 Oct 2011 12:05:39 +0200
Subject: [Buildroot] [git commit] manual: refactor the targets into GENDOC
	macro.
Message-ID: <20111025102334.7381C8EF75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=22c547fba97d4733f047c2d8bf753adc63e3ad90
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add a clean target, give absolute path to a2x, add a dependency
on the output file, and add to .PHONY.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Peter: build in docs/manual/<format>, fix clean targets]
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |   85 ++++++++++++++++++++++++++++++++++++++------------------------
 1 files changed, 52 insertions(+), 33 deletions(-)

diff --git a/Makefile b/Makefile
index be90f47..d95aa3a 100644
--- a/Makefile
+++ b/Makefile
@@ -699,39 +699,58 @@ release: OUT=buildroot-$(BR2_VERSION)
 release:
 	git archive --format=tar --prefix=$(OUT)/ master|gzip -9 >$(OUT).tar.gz
 
-MANUAL_SOURCES = $(wildcard docs/manual/*.txt)
-
-manual: manual-html manual-split-html manual-pdf manual-txt manual-epub
-
-manual-html: $(MANUAL_SOURCES)
-	@echo "HTML manual..."
-	$(Q)mkdir -p $(O)/docs/manual
-	$(Q)a2x -f xhtml -d book -L -r docs/images -D $(O)/docs/manual/ \
-		docs/manual/manual.txt
-
-manual-split-html: $(MANUAL_SOURCES)
-	@echo "Split HTML manual..."
-	$(Q)mkdir -p $(O)/docs/manual
-	$(Q)a2x -f chunked -d book -L -r docs/images -D $(O)/docs/manual/ \
-		docs/manual/manual.txt
-
-manual-pdf: $(MANUAL_SOURCES)
-	@echo "PDF manual..."
-	$(Q)mkdir -p $(O)/docs/manual
-	$(Q)a2x --dblatex-opts "-P latex.output.revhistory=0" -f pdf -d book -L -D $(O)/docs/manual/ \
-		docs/manual/manual.txt
-
-manual-txt: $(MANUAL_SOURCES)
-	@echo "Text manual..."
-	$(Q)mkdir -p $(O)/docs/manual
-	$(Q)a2x -f text -d book -L -D $(O)/docs/manual/ \
-		docs/manual/manual.txt
-
-manual-epub: $(MANUAL_SOURCES)
-	@echo "EPUB manual..."
-	$(Q)mkdir -p $(O)/docs/manual
-	$(Q)a2x -f epub -d book -L -r docs/images/ -D $(O)/docs/manual/ \
-		docs/manual/manual.txt
+################################################################################
+# GENDOC -- generates the make targets needed to build a specific type of
+#           asciidoc documentation.
+#
+#  argument 1 is the name of the document and must be a subdirectory of docs/;
+#             the top-level asciidoc file must have the same name
+#  argument 2 is the type of document to generate (-f argument of a2x)
+#  argument 3 is the document type as used in the make target
+#  argument 4 is the output file extension for the document type
+#  argument 5 is the human text for the document type
+#  argument 6 (optional) are extra arguments for a2x
+#
+# The variable <DOCUMENT_NAME>_SOURCES defines the dependencies.
+################################################################################
+define GENDOC_INNER
+$(1): $(1)-$(3)
+.PHONY: $(1)-$(3)
+$(1)-$(3): $$(O)/docs/$(1)/$(2)/$(1).$(4)
+
+$$(O)/docs/$(1)/$(2)/$(1).$(4): docs/$(1)/$(1).txt $$($(call UPPERCASE,$(1))_SOURCES)
+	@echo "Generating $(5) $(1)..."
+	$(Q)mkdir -p $$(O)/docs/$(1)/$(2)
+	$(Q)a2x $(6) -f $(2) -d book -L -r $(TOPDIR)/docs/images \
+	  -D $$(@D) $$<
+
+clean-$(1): clean-$(1)-$(3)
+.PHONY: clean-$(1)-$(3)
+clean-$(1)-$(3):
+	$(Q)$(RM) -rf $(O)/docs/$(1)/$(2)
+
+endef
+
+################################################################################
+# GENDOC -- generates the make targets needed to build asciidoc documentation.
+#
+#  argument 1 is the name of the document and must be a subdirectory of docs/;
+#             the top-level asciidoc file must have the same name
+#
+# The variable <DOCUMENT_NAME>_SOURCES defines the dependencies.
+################################################################################
+define GENDOC
+$(call GENDOC_INNER,$(1),xhtml,html,html,HTML)
+$(call GENDOC_INNER,$(1),chunked,split-html,chunked,Split HTML)
+$(call GENDOC_INNER,$(1),pdf,pdf,pdf,PDF,--dblatex-opts "-P latex.output.revhistory=0")
+$(call GENDOC_INNER,$(1),text,txt,text,Text)
+$(call GENDOC_INNER,$(1),epub,epub,epub,EPUB)
+clean: clean-$(1)
+.PHONY: $(1) clean-$(1)
+endef
+
+MANUAL_SOURCES = $(wildcard docs/manual/*.txt) $(wildcard docs/images/*)
+$(eval $(call GENDOC,manual))
 
 .PHONY: $(noconfig_targets)
 
