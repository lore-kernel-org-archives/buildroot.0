From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 07:46:27 +0200
Subject: [Buildroot] [git commit] docs/manual: use the new hooks instead of
	gendoc rules
Message-ID: <20141012072419.EE1AEB1909@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=05d11e19c574c11851c75a53ba0d5f655778679d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also reorder a bit the definition of the variables, to more resemble
a package. Yet a bit more...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/manual.mk |   17 ++++++++++-------
 1 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index ee7887c..e9e0516 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -151,25 +151,28 @@ endef
 # The Buildroot manual
 ################################################################################
 
-# Our manual needs to generate lists
-manual-prepare-sources: manual-update-lists
+MANUAL_SOURCES = $(sort $(wildcard docs/manual/*.txt) $(wildcard docs/images/*))
+MANUAL_RESOURCES = $(TOPDIR)/docs/images
 
+# Our manual needs to generate lists
 # Packages included in BR2_EXTERNAL are not part of buildroot, so they
 # should not be included in the manual.
-.PHONY: manual-update-lists
-manual-update-lists: manual-check-dependencies-lists $(BUILD_DIR)/docs/$(pkgname)
+define MANUAL_GEN_LISTS
 	$(Q)$(call MESSAGE,"Updating the manual lists...")
 	$(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) O=$(BUILD_DIR)/docs/$(pkgname) \
 		BR2_EXTERNAL=$(TOPDIR)/support/dummy-external \
 		python -B $(TOPDIR)/support/scripts/gen-manual-lists.py
+endef
+MANUAL_POST_RSYNC_HOOKS += MANUAL_GEN_LISTS
 
-manual-check-dependencies-lists:
+# Our list-generating script requires argparse
+define MANUAL_CHECK_LISTS_DEPS
 	$(Q)if ! python -c "import argparse" >/dev/null 2>&1 ; then \
 		echo "You need python with argparse on your host to generate" \
 			"the list of packages in the manual"; \
 		exit 1; \
 	fi
+endef
+MANUAL_CHECK_DEPENDENCIES_HOOKS += MANUAL_CHECK_LISTS_DEPS
 
-MANUAL_SOURCES = $(sort $(wildcard docs/manual/*.txt) $(wildcard docs/images/*))
-MANUAL_RESOURCES = $(TOPDIR)/docs/images
 $(eval $(call GENDOC))
