From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 Oct 2011 07:52:03 +0200
Subject: [Buildroot] [git commit] Makefile: build all manuals in
	$(O)/docs/manual
Message-ID: <20111026055500.5CA9F8F30B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=67a7d7b7d37c5cbedce75da2de314bdf81f4feb1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Like Arnouts' patch originally did.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |   12 ++++--------
 1 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index d95aa3a..80ca587 100644
--- a/Makefile
+++ b/Makefile
@@ -716,19 +716,13 @@ release:
 define GENDOC_INNER
 $(1): $(1)-$(3)
 .PHONY: $(1)-$(3)
-$(1)-$(3): $$(O)/docs/$(1)/$(2)/$(1).$(4)
+$(1)-$(3): $$(O)/docs/$(1)/$(1).$(4)
 
-$$(O)/docs/$(1)/$(2)/$(1).$(4): docs/$(1)/$(1).txt $$($(call UPPERCASE,$(1))_SOURCES)
+$$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt $$($(call UPPERCASE,$(1))_SOURCES)
 	@echo "Generating $(5) $(1)..."
 	$(Q)mkdir -p $$(O)/docs/$(1)/$(2)
 	$(Q)a2x $(6) -f $(2) -d book -L -r $(TOPDIR)/docs/images \
 	  -D $$(@D) $$<
-
-clean-$(1): clean-$(1)-$(3)
-.PHONY: clean-$(1)-$(3)
-clean-$(1)-$(3):
-	$(Q)$(RM) -rf $(O)/docs/$(1)/$(2)
-
 endef
 
 ################################################################################
@@ -746,6 +740,8 @@ $(call GENDOC_INNER,$(1),pdf,pdf,pdf,PDF,--dblatex-opts "-P latex.output.revhist
 $(call GENDOC_INNER,$(1),text,txt,text,Text)
 $(call GENDOC_INNER,$(1),epub,epub,epub,EPUB)
 clean: clean-$(1)
+clean-$(1):
+	$(Q)$(RM) -rf $(O)/docs/$(1)
 .PHONY: $(1) clean-$(1)
 endef
 
