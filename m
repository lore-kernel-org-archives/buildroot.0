From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 12 Mar 2013 05:47:15 +0100
Subject: [Buildroot] [PATCH 2/5] manual: add a make target
	'manual-update-lists'
In-Reply-To: <cover.1363063387.git.s.martin49@gmail.com>
References: <cover.1363063387.git.s.martin49@gmail.com>
Message-ID: <da0b536e458646ecade2fd7d2a8cee2e04148e66.1363063387.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
Changes since v2:
* remove PYTHONPATH stuff since the kconfiglib module is next to
  gen-manual-lists.py (Arnout)

Changes since v1:
* add manual-update-lists target to the .PHONY one (Arnout)
* misc. fixes/updates
---
 docs/manual/manual.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index aa20534..012d0e7 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -24,6 +24,11 @@ $$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt $$($(call UPPERCASE,$(1))_SOURCES)
 	  -D $$(@D) $$<
 endef
 
+manual-update-lists:
+	@$(call MESSAGE,"Updating the manual lists...")
+	$(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) \
+		$(TOPDIR)/support/scripts/gen-manual-lists.py
+
 ################################################################################
 # GENDOC -- generates the make targets needed to build asciidoc documentation.
 #
@@ -41,8 +46,9 @@ $(call GENDOC_INNER,$(1),epub,epub,epub,EPUB)
 clean: $(1)-clean
 $(1)-clean:
 	$(Q)$(RM) -rf $(O)/docs/$(1)
-.PHONY: $(1) $(1)-clean
+.PHONY: $(1) $(1)-clean manual-update-lists
 endef
 
 MANUAL_SOURCES = $(wildcard docs/manual/*.txt) $(wildcard docs/images/*)
 $(eval $(call GENDOC,manual))
+
-- 
1.8.1.5
