From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 21 Mar 2013 22:04:36 +0100
Subject: [Buildroot] [PATCH 5/7] manual: add a make target
	'manual-update-lists'
In-Reply-To: <cover.1363899518.git.s.martin49@gmail.com>
References: <cover.1363899518.git.s.martin49@gmail.com>
Message-ID: <be233b7b6bb3b1250159f5273fddf148486d4cc1.1363899518.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The generated lists are automatically updated when building the manual.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
Changes since v4:
* systematically update the generated lists when building the manual

Changes since v2:
* remove PYTHONPATH stuff since the kconfiglib module is next to
  gen-manual-lists.py (Arnout)

Changes since v1:
* add manual-update-lists target to the .PHONY one (Arnout)
* misc. fixes/updates
---
 docs/manual/manual.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index aa20534..95ccc7c 100644
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
+	manual-update-lists
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
1.8.2
