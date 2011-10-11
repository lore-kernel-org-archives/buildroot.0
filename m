From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 11 Oct 2011 22:59:52 +0200
Subject: [Buildroot] [PATCH] manual: refactor the targets into GENDOC macro.
In-Reply-To: <201110112257.11996.arnout@mind.be>
References: <201110112257.11996.arnout@mind.be>
Message-ID: <1318366792-13507-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Also add a clean target, give absolute path to a2x, add a dependency
on the output file, and add to .PHONY.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile |   81 ++++++++++++++++++++++++++++++++++++-------------------------
 1 files changed, 48 insertions(+), 33 deletions(-)

diff --git a/Makefile b/Makefile
index d0f947d..2e57442 100644
--- a/Makefile
+++ b/Makefile
@@ -700,39 +700,54 @@ release: OUT=buildroot-$(BR2_VERSION)
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
+$(1)-$(3): $$(O)/docs/$(1)/$(1).$(4)
+
+$$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt $$($(call UPPERCASE,$(1))_SOURCES)
+	@echo "Generating $(5) $(1)..."
+	$(Q)mkdir -p $$(O)/docs/$(1)
+	$(Q)a2x $(6) -f $(2) -d book -L -r $(TOPDIR)/docs/images \
+	  -D $$(@D) $$<
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
+clean-$(1):
+	$(Q)$(RM) -r $(O)/docs/$(1)
+.PHONY: $(1) clean-$(1)
+endef
+
+MANUAL_SOURCES = $(wildcard docs/manual/*.txt) $(wildcard docs/images/*)
+$(eval $(call GENDOC,manual))
 
 .PHONY: $(noconfig_targets)
 
-- 
1.7.6.3
