From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Mar 2013 23:50:41 +0100
Subject: [Buildroot] [PATCH 06/14] manual: add a make target
	'manual-update-lists'
In-Reply-To: <cover.1364165310.git.yann.morin.1998@free.fr>
References: <cover.1364165310.git.yann.morin.1998@free.fr>
Message-ID: <6aacb071d888e9f5768a0a1ec6b62476dc7e1d13.1364165310.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Samuel Martin <s.martin49@gmail.com>

The generated lists are automatically updated when building the manual.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
[yann.morin.1998 at free.fr: fix indentation]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 docs/manual/manual.mk |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index aa20534..52a7de0 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -1,3 +1,8 @@
+manual-update-lists:
+	@$(call MESSAGE,"Updating the manual lists...")
+	$(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) \
+		$(TOPDIR)/support/scripts/gen-manual-lists.py
+
 ################################################################################
 # GENDOC -- generates the make targets needed to build a specific type of
 #           asciidoc documentation.
@@ -17,7 +22,8 @@ $(1): $(1)-$(3)
 .PHONY: $(1)-$(3)
 $(1)-$(3): $$(O)/docs/$(1)/$(1).$(4)
 
-$$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt $$($(call UPPERCASE,$(1))_SOURCES)
+$$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt $$($(call UPPERCASE,$(1))_SOURCES) \
+			   manual-update-lists
 	@$(call MESSAGE,"Generating $(5) $(1)...")
 	$(Q)mkdir -p $$(@D)
 	$(Q)a2x $(6) -f $(2) -d book -L -r $(TOPDIR)/docs/images \
@@ -41,7 +47,7 @@ $(call GENDOC_INNER,$(1),epub,epub,epub,EPUB)
 clean: $(1)-clean
 $(1)-clean:
 	$(Q)$(RM) -rf $(O)/docs/$(1)
-.PHONY: $(1) $(1)-clean
+.PHONY: $(1) $(1)-clean manual-update-lists
 endef
 
 MANUAL_SOURCES = $(wildcard docs/manual/*.txt) $(wildcard docs/images/*)
-- 
1.7.2.5
