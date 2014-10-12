From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 07:46:28 +0200
Subject: [Buildroot] [git commit] docs/asciidoc: make it possible to use
	$(@D) in hooks
Message-ID: <20141012072420.30A91B1909@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d2a49f78f6e342973b9301fd97097b90464dd43
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, it is not possible to use $(@D) in documents' hooks, because
there is no actual target file for the copying rule.

So, use the same mechanism as for generic-package.

We do not touch the target file, so it is easy to regenerate the manual
without calling the -clean rule first.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/manual.mk   |    2 +-
 package/doc-asciidoc.mk |   12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index a3011c6..d5db2c2 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -12,7 +12,7 @@ MANUAL_RESOURCES = $(TOPDIR)/docs/images
 # should not be included in the manual.
 define MANUAL_GEN_LISTS
 	$(Q)$(call MESSAGE,"Updating the manual lists...")
-	$(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) O=$(BUILD_DIR)/docs/$(pkgname) \
+	$(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) O=$(@D) \
 		BR2_EXTERNAL=$(TOPDIR)/support/dummy-external \
 		python -B $(TOPDIR)/support/scripts/gen-manual-lists.py
 endef
diff --git a/package/doc-asciidoc.mk b/package/doc-asciidoc.mk
index 6b5b2b7..9a18270 100644
--- a/package/doc-asciidoc.mk
+++ b/package/doc-asciidoc.mk
@@ -121,16 +121,16 @@ define ASCIIDOC
 $(1)-check-dependencies: asciidoc-check-dependencies
 	$$(Q)$$(foreach hook,$$($(2)_CHECK_DEPENDENCIES_HOOKS),$$(call $$(hook))$$(sep))
 
-$$(BUILD_DIR)/docs/$(1):
-	$$(Q)mkdir -p $$@
-
 # Single line, because splitting a foreach is not easy...
-$(1)-rsync: $$(BUILD_DIR)/docs/$(1)
+# Do not touch the stamp file, so we get to rsync again every time we build
+# the document.
+$$(BUILD_DIR)/docs/$(1)/.stamp_doc_rsynced:
 	$$(Q)$$(call MESSAGE,"Preparing the $(1) sources...")
-	$$(Q)rsync -a $(3) $$^
+	$$(Q)mkdir -p $$(@D)
+	$$(Q)rsync -a $(3) $$(@D)
 	$$(Q)$$(foreach hook,$$($(2)_POST_RSYNC_HOOKS),$$(call $$(hook))$$(sep))
 
-$(1)-prepare-sources: $(1)-rsync
+$(1)-prepare-sources: $$(BUILD_DIR)/docs/$(1)/.stamp_doc_rsynced
 
 $(call ASCIIDOC_INNER,$(1),$(2),$(3),xhtml,html,html,HTML,\
 	--xsltproc-opts "--stringparam toc.section.depth 1")
