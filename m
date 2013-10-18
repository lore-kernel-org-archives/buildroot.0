From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 18 Oct 2013 22:31:28 +0200
Subject: [Buildroot] [PATCH 04/12] manual: move the manual rsync directory
	under $(O)/build/
In-Reply-To: <cover.1382127504.git.s.martin49@gmail.com>
References: <cover.1382127504.git.s.martin49@gmail.com>
Message-ID: <a7a58968731742621a354b6d0b212ae3921f5a65.1382127504.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch just moves the manual source/build directory in $(O)/build/
(currently this location is $(O)/docs/manual/.build/, which is removed
at this end of the manual generation).

This location is used to:
- generate the package list files
- rsync the *.txt source from docs/manual/

The output manuals are still generated in $(O)/docs/manual/, so the release
target is unchanged.

Moving the manual source/build directory is more consistent with the rest
of how Buildroot works.
This also avoid to remove the *.txt that are generated and are actually
used by a2x, this is very helpful for investigating
asdciidoc/dblatex/texlive related issues.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
Changes v1 -> v2:
- rebase on top of ThomasDS' patches
- split patch content
- detail a bit more the commit message

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/manual.mk | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index aeafd10..ffc4e9a 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -1,6 +1,8 @@
+MANUAL_BUILDDIR = $(BUILD_DIR)/buildroot-manual
 manual-update-lists: manual-check-dependencies-lists
 	$(Q)$(call MESSAGE,"Updating the manual lists...")
-	$(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) O=$(O)/docs/manual/.build \
+	$(Q)mkdir -p $(MANUAL_BUILDDIR)
+	$(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) O=$(MANUAL_BUILDDIR) \
 		$(TOPDIR)/support/scripts/gen-manual-lists.py
 
 # we can't use suitable-host-package here because that's not available in
@@ -56,11 +58,10 @@ $$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt \
 			   manual-check-dependencies-$(3) \
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
@@ -79,7 +80,7 @@ $(call GENDOC_INNER,$(1),text,text,text,text)
 $(call GENDOC_INNER,$(1),epub,epub,epub,ePUB)
 clean: $(1)-clean
 $(1)-clean:
-	$(Q)$(RM) -rf $(O)/docs/$(1)
+	$(Q)$(RM) -rf $(O)/docs/$(1) $(MANUAL_BUILDDIR)
 .PHONY: $(1) $(1)-clean manual-update-lists
 endef
 
-- 
1.8.4.1
