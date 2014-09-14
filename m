From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Sep 2014 13:07:50 +0200
Subject: [Buildroot] [PATCH 16/23 v5] docs/manual: use the new hooks instead
	of gendoc rules
In-Reply-To: <cover.1410692670.git.yann.morin.1998@free.fr>
References: <cover.1410692670.git.yann.morin.1998@free.fr>
Message-ID: <9de7780fd9957d06652310686379ef9880578be8.1410692670.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also reorder a bit the definition of the variables, to more ressemble
a package. Yet a bit more...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 docs/manual/manual.mk | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index 52fac0e..f3638a7 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -150,25 +150,26 @@ endef
 # The Buildroot manual
 ################################################################################
 
-# Our manual needs to generate lists
-manual-prepare-sources: manual-update-lists
+MANUAL_SOURCES = $(sort $(wildcard docs/manual/*.txt) $(wildcard docs/images/*))
+MANUAL_RESSOURCES = $(TOPDIR)/docs/images
 
-# Packages included in BR2_EXTERNAL are not part of buildroot, so they
-# should not be included in the manual.
-.PHONY: manual-update-lists
-manual-update-lists: manual-check-dependencies-lists $(BUILD_DIR)/$(pkgname)
+# Our manual needs to generate lists
+define MANUAL_GEN_LISTS
 	$(Q)$(call MESSAGE,"Updating the manual lists...")
 	$(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) O=$(BUILD_DIR)/$(pkgname) \
 		BR2_EXTERNAL=$(TOPDIR)/support/dummy-external \
 		python -B $(TOPDIR)/support/scripts/gen-manual-lists.py
+endef
+MANUAL_POST_EXTRACT_HOOKS += MANUAL_GEN_LISTS
 
-manual-check-dependencies-lists:
+# Our list-generating script requires argparse
+define MANUAL_CHECK_LISTS_DEPS
 	$(Q)if ! python -c "import argparse" >/dev/null 2>&1 ; then \
 		echo "You need python with argparse on your host to generate" \
 			"the list of packages in the manual"; \
 		exit 1; \
 	fi
+endef
+MANUAL_CHECK_EXTRA_DEPENDENCIES_HOOKS += MANUAL_CHECK_LISTS_DEPS
 
-MANUAL_SOURCES = $(sort $(wildcard docs/manual/*.txt) $(wildcard docs/images/*))
-MANUAL_RESSOURCES = $(TOPDIR)/docs/images
 $(eval $(call GENDOC))
-- 
1.9.1
