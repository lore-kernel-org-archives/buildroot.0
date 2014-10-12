From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 07:46:27 +0200
Subject: [Buildroot] [git commit] docs/manual: properly separate rules
	specific for our manual
Message-ID: <20141012072419.CFF38B1909@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3789bafc85505baf25e817fd178e3d0b75f8d3ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move the rules specific to our own manual, so that they do not interfere
with the generic rules of GENDOC.

Separate them with a shiny header. ;-)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/manual.mk |   41 +++++++++++++++++++++++------------------
 1 files changed, 23 insertions(+), 18 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index cf6f33c..536f939 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -1,14 +1,3 @@
-# Packages included in BR2_EXTERNAL are not part of buildroot, so they
-# should not be included in the manual.
-.PHONY: manual-update-lists
-manual-update-lists: manual-check-dependencies-lists $(BUILD_DIR)/docs/$(pkgname)
-	$(Q)$(call MESSAGE,"Updating the manual lists...")
-	$(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) O=$(BUILD_DIR)/docs/$(pkgname) \
-		BR2_EXTERNAL=$(TOPDIR)/support/dummy-external \
-		python -B $(TOPDIR)/support/scripts/gen-manual-lists.py
-
-manual-prepare-sources: manual-update-lists
-
 # we can't use suitable-host-package here because that's not available in
 # the context of 'make release'
 manual-check-dependencies:
@@ -28,13 +17,6 @@ manual-check-dependencies-pdf:
 		exit 1; \
 	fi
 
-manual-check-dependencies-lists:
-	$(Q)if ! python -c "import argparse" >/dev/null 2>&1 ; then \
-		echo "You need python with argparse on your host to generate" \
-			"the list of packages in the manual"; \
-		exit 1; \
-	fi
-
 # PDF generation is broken because of a bug in xsltproc program provided
 # by libxslt <=1.1.28, which does not honor an option we need to set.
 # Fortunately, this bug is already fixed upstream:
@@ -156,6 +138,29 @@ $(pkgname)-clean:
 .PHONY: $(pkgname) $(pkgname)-clean
 endef
 
+################################################################################
+# The Buildroot manual
+################################################################################
+
+# Our manual needs to generate lists
+manual-prepare-sources: manual-update-lists
+
+# Packages included in BR2_EXTERNAL are not part of buildroot, so they
+# should not be included in the manual.
+.PHONY: manual-update-lists
+manual-update-lists: manual-check-dependencies-lists $(BUILD_DIR)/docs/$(pkgname)
+	$(Q)$(call MESSAGE,"Updating the manual lists...")
+	$(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) O=$(BUILD_DIR)/docs/$(pkgname) \
+		BR2_EXTERNAL=$(TOPDIR)/support/dummy-external \
+		python -B $(TOPDIR)/support/scripts/gen-manual-lists.py
+
+manual-check-dependencies-lists:
+	$(Q)if ! python -c "import argparse" >/dev/null 2>&1 ; then \
+		echo "You need python with argparse on your host to generate" \
+			"the list of packages in the manual"; \
+		exit 1; \
+	fi
+
 MANUAL_SOURCES = $(sort $(wildcard docs/manual/*.txt) $(wildcard docs/images/*))
 MANUAL_RESOURCES = $(TOPDIR)/docs/images
 $(eval $(call GENDOC))
