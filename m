From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Mar 2013 00:28:08 +0100
Subject: [Buildroot] [PATCH 13/15] manual: add a make target
	'manual-update-lists'
In-Reply-To: <cover.1364253936.git.yann.morin.1998@free.fr>
References: <cover.1364253936.git.yann.morin.1998@free.fr>
Message-ID: <329066ec07dfd91785b949d8f96cca81c2743f0c.1364253936.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Samuel Martin <s.martin49@gmail.com>

The generated lists are automatically updated when building the manual.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
[yann.morin.1998 at free.fr: indentation, remove temp dir, intro to host utils]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes since v5:
* Generate lists in $(O)

Changes since v4:
* systematically update the generated lists when building the manual

Changes since v2:
* remove PYTHONPATH stuff since the kconfiglib module is next to
  gen-manual-lists.py (Arnout)

Changes since v1:
* add manual-update-lists target to the .PHONY one (Arnout)
* misc. fixes/updates
---
 docs/manual/appendix.txt |    2 ++
 docs/manual/manual.mk    |   19 ++++++++++++++-----
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/docs/manual/appendix.txt b/docs/manual/appendix.txt
index ffde7e4..779fd2e 100644
--- a/docs/manual/appendix.txt
+++ b/docs/manual/appendix.txt
@@ -19,6 +19,8 @@ include::package-list.txt[]
 Host utilities
 --------------
 
+The folowing packages are all availabel in the menu +Host utilities+.
+
 include::host-package-list.txt[]
 
 [[deprecated-list]]
diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index aa20534..4906bc8 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -1,3 +1,8 @@
+manual-update-lists:
+	$(Q)$(call MESSAGE,"Updating the manual lists...")
+	$(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) O=$(O)/docs/manual/.build \
+		$(TOPDIR)/support/scripts/gen-manual-lists.py
+
 ################################################################################
 # GENDOC -- generates the make targets needed to build a specific type of
 #           asciidoc documentation.
@@ -17,11 +22,15 @@ $(1): $(1)-$(3)
 .PHONY: $(1)-$(3)
 $(1)-$(3): $$(O)/docs/$(1)/$(1).$(4)
 
-$$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt $$($(call UPPERCASE,$(1))_SOURCES)
-	@$(call MESSAGE,"Generating $(5) $(1)...")
-	$(Q)mkdir -p $$(@D)
+$$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt \
+			   $$($(call UPPERCASE,$(1))_SOURCES) \
+			   manual-update-lists
+	$(Q)$(call MESSAGE,"Generating $(5) $(1)...")
+	$(Q)mkdir -p $$(@D)/.build
+	$(Q)rsync -au docs/$(1)/*.txt $$(@D)/.build
 	$(Q)a2x $(6) -f $(2) -d book -L -r $(TOPDIR)/docs/images \
-	  -D $$(@D) $$<
+	        -D $$(@D) $$(@D)/.build/$(1).txt
+	-$(Q)rm -rf $$(@D)/.build
 endef
 
 ################################################################################
@@ -41,7 +50,7 @@ $(call GENDOC_INNER,$(1),epub,epub,epub,EPUB)
 clean: $(1)-clean
 $(1)-clean:
 	$(Q)$(RM) -rf $(O)/docs/$(1)
-.PHONY: $(1) $(1)-clean
+.PHONY: $(1) $(1)-clean manual-update-lists
 endef
 
 MANUAL_SOURCES = $(wildcard docs/manual/*.txt) $(wildcard docs/images/*)
-- 
1.7.2.5
