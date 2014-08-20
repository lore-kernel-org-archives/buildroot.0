From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 20 Aug 2014 12:03:20 +0200
Subject: [Buildroot] [PATCH 2/6] gendoc infra: move manual build location
	into $(BUILD_DIR)/manual
In-Reply-To: <1408529004-18632-1-git-send-email-s.martin49@gmail.com>
References: <1408529004-18632-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1408529004-18632-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch reworks the mannual source preparetion by:
- moving the build directory under $(BUILD_DIR)/, this keeps consistency
  with the other Buildroot infrastructure;
- adding a couple of targets: 'manual-rsync' and 'manual-prepare-sources',
  to deal more efficiently the manual sources and avoid rsync-ing them on
  every single manual-* target.

The 'manual-rsync' target only copy the manual sources under git, while
the 'manual-prepare-sources' also takes care of the generated ones. These
targets are now run only once,  and the manual build is no longer cleaned
after each manual format generation.

Now, the 'manual-clean' target only remove the manual build directory, but
keep the output one $(O)/output/doc/manual unchanged.

Doing so (moving the manual build directory and keeping it between 2
manual format generation) ensures that all generated sources are taking
in account when generating the manual [1].

[1] http://lists.busybox.net/pipermail/buildroot/2014-August/104421.html

Cc: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/manual.mk | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index 13ed0b4..634a2cb 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -1,11 +1,20 @@
+$(BUILD_DIR)/$(pkgname):
+	$(Q)mkdir -p $@
+
+manual-rsync: $(BUILD_DIR)/$(pkgname)
+	$(Q)$(call MESSAGE,"Preparing the manual sources...")
+	$(Q)rsync -au docs/$(pkgname)/ $(BUILD_DIR)/$(pkgname)
+
 # Packages included in BR2_EXTERNAL are not part of buildroot, so they
 # should not be included in the manual.
-manual-update-lists: manual-check-dependencies-lists
+manual-update-lists: manual-check-dependencies-lists $(BUILD_DIR)/$(pkgname)
 	$(Q)$(call MESSAGE,"Updating the manual lists...")
-	$(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) O=$(O)/docs/manual/.build \
+	$(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) O=$(BUILD_DIR)/$(pkgname) \
 		BR2_EXTERNAL=$(TOPDIR)/support/dummy-external \
 		python -B $(TOPDIR)/support/scripts/gen-manual-lists.py
 
+manual-prepare-sources: manual-rsync manual-update-lists
+
 # we can't use suitable-host-package here because that's not available in
 # the context of 'make release'
 manual-check-dependencies:
@@ -65,14 +74,13 @@ $$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt \
 			   $$($$(call UPPERCASE,$(1))_SOURCES) \
 			   manual-check-dependencies \
 			   manual-check-dependencies-$(3) \
-			   manual-update-lists
+			   manual-prepare-sources
 	$$(Q)$$(call MESSAGE,"Generating $(5) $(1)...")
-	$$(Q)mkdir -p $$(@D)/.build
-	$$(Q)rsync -au docs/$(1)/*.txt $$(@D)/.build
+	$$(Q)mkdir -p $$(@D)
 	$$(Q)a2x $(6) -f $(2) -d book -L -r $$(TOPDIR)/docs/images \
-	        -D $$(@D) $$(@D)/.build/$(1).txt \
-	-$$(Q)rm -rf $$(@D)/.build
-		--asciidoc-opts="$$(MANUAL_$(2)_ASCIIDOC_OPTS)"
+		--asciidoc-opts="$$(MANUAL_$(2)_ASCIIDOC_OPTS)" \
+		-D $$(@D) \
+		$$(BUILD_DIR)/$(1)/$(1).txt \
 endef
 
 ################################################################################
@@ -94,7 +102,7 @@ $(call GENDOC_INNER,$(pkgname),text,text,text,text)
 $(call GENDOC_INNER,$(pkgname),epub,epub,epub,ePUB)
 clean: $(pkgname)-clean
 $(pkgname)-clean:
-	$$(Q)$$(RM) -rf $$(O)/docs/$(pkgname)
+	$$(Q)$$(RM) -rf $$(BUILD_DIR)/$(pkgname)
 .PHONY: $(pkgname) $(pkgname)-clean manual-update-lists
 endef
 
-- 
2.0.4
