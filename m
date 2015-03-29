From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 19:33:49 +0200
Subject: [Buildroot] [PATCH 35/35] Makefile: remove unneeded variables
In-Reply-To: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1427650429-9293-36-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that all the external-deps, source-check and source targets are
properly implemented based on the package infrastructure, the
PACKAGES_SOURCE, TARGET_HOST_DEPS, HOST_DEPS and HOST_SOURCE variables
are no longer needed. This is a good thing since they were anyway
incorrect, as they were only doing a two level recursion in the
dependencies of host packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/Makefile b/Makefile
index 3e58e09..c47a5a8 100644
--- a/Makefile
+++ b/Makefile
@@ -394,27 +394,6 @@ include fs/common.mk
 
 include $(BR2_EXTERNAL)/external.mk
 
-PACKAGES_SOURCE := $(patsubst %,%-source,$(PACKAGES))
-
-# host-* dependencies have to be handled specially, as those aren't
-# visible in Kconfig and hence not added to a variable like PACKAGES.
-# instead, find all the host-* targets listed in each <PKG>_DEPENDENCIES
-# variable for each enabled target.
-# Notice: this only works for newstyle gentargets/autotargets packages
-TARGETS_HOST_DEPS = $(sort $(filter host-%,$(foreach dep,\
-		$(addsuffix _DEPENDENCIES,\
-			$(call UPPERCASE,$(PACKAGES) $(TARGETS_ROOTFS))),\
-		$($(dep)))))
-# Host packages can in turn have their own dependencies. Likewise find
-# all the package names listed in the HOST_<PKG>_DEPENDENCIES for each
-# host package found above. Ideally this should be done recursively until
-# no more packages are found, but that's hard to do in make, so limit to
-# 1 level for now.
-HOST_DEPS = $(sort $(foreach dep,\
-		$(addsuffix _DEPENDENCIES,$(call UPPERCASE,$(TARGETS_HOST_DEPS))),\
-		$($(dep))))
-HOST_SOURCE += $(addsuffix -source,$(sort $(TARGETS_HOST_DEPS) $(HOST_DEPS)))
-
 dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR)
 
-- 
2.1.0
