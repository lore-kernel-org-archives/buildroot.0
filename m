From: Samuel Martin <s.martin49@gmail.com>
Date: Sat,  5 Oct 2013 21:49:06 +0200
Subject: [Buildroot] [PATCH 1/9] manual: minor update in manual generation
In-Reply-To: <cover.1381002281.git.s.martin49@gmail.com>
References: <cover.1381002281.git.s.martin49@gmail.com>
Message-ID: <3a4cb5eca332c3449a7c2a9a0d316f2ace16bc99.1381002281.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* minor refactoring in gen-manual-list.py
* generate manual in the build tree

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/manual.mk               | 13 +++++++------
 support/scripts/gen-manual-lists.py |  9 ++++-----
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index d092d3f..84acaae 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -1,6 +1,8 @@
+MANUAL_BUILDDIR = $(BUILD_DIR)/buildroot-manual
 manual-update-lists:
 	$(Q)$(call MESSAGE,"Updating the manual lists...")
-	$(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) O=$(O)/docs/manual/.build \
+	$(Q)mkdir -p $(MANUAL_BUILDDIR)
+	$(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) O=$(MANUAL_BUILDDIR) \
 		$(TOPDIR)/support/scripts/gen-manual-lists.py
 
 ################################################################################
@@ -26,11 +28,10 @@ $$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt \
 			   $$($(call UPPERCASE,$(1))_SOURCES) \
 			   manual-update-lists
 	$(Q)$(call MESSAGE,"Generating $(5) $(1)...")
-	$(Q)mkdir -p $$(@D)/.build
-	$(Q)rsync -au docs/$(1)/*.txt $$(@D)/.build
+	$(Q)mkdir -p $$(@D) $(MANUAL_BUILDDIR)
+	$(Q)rsync -au docs/$(1)/*.txt $(MANUAL_BUILDDIR)
 	$(Q)a2x $(6) -f $(2) -d book -L -r $(TOPDIR)/docs/images \
-	        -D $$(@D) $$(@D)/.build/$(1).txt
-	-$(Q)rm -rf $$(@D)/.build
+		-D $$(@D) $(MANUAL_BUILDDIR)/$(1).txt
 endef
 
 ################################################################################
@@ -49,7 +50,7 @@ $(call GENDOC_INNER,$(1),text,txt,text,text)
 $(call GENDOC_INNER,$(1),epub,epub,epub,ePUB)
 clean: $(1)-clean
 $(1)-clean:
-	$(Q)$(RM) -rf $(O)/docs/$(1)
+	$(Q)$(RM) -rf $(O)/docs/$(1) $(MANUAL_BUILDDIR)
 .PHONY: $(1) $(1)-clean manual-update-lists
 endef
 
diff --git a/support/scripts/gen-manual-lists.py b/support/scripts/gen-manual-lists.py
index 3568843..5c81e1d 100755
--- a/support/scripts/gen-manual-lists.py
+++ b/support/scripts/gen-manual-lists.py
@@ -107,7 +107,7 @@ def get_symbol_parents(item, root=None, enable_choice=False):
         parent = parent.get_parent()
     if isinstance(root, kconfiglib.Menu) or \
             (enable_choice and isinstance(root, kconfiglib.Choice)):
-        parents.append("") # Dummy empty parrent to get a leading arrow ->
+        parents.append("") # Dummy empty parent to get a leading arrow ->
     parents.reverse()
     return parents
 
@@ -126,15 +126,14 @@ def format_asciidoc_table(root, get_label_func, filter_func=lambda x: True,
     :param sub_menu:       Output the column with the sub-menu path
 
     """
-    def _format_entry(label, parents, sub_menu):
+    def _format_entry(item, parents, sub_menu):
         """ Format an asciidoc table entry.
 
         """
         if sub_menu:
-            return "| {0:<40} <| {1}\n".format(label, " -> ".join(parents))
+            return "| {0:<40} <| {1}\n".format(item, " -> ".join(parents))
         else:
-            return "| {0:<40}\n".format(label)
-
+            return "| {0:<40}\n".format(item)
     lines = []
     for item in get_symbol_subset(root, filter_func):
         if not item.is_symbol() or not item.prompts:
-- 
1.8.4
