From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 19:33:38 +0200
Subject: [Buildroot] [PATCH 24/35] Makefile: move source-check outside of
	noconfig_targets
In-Reply-To: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1427650429-9293-25-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

make source-check is here to check whether the remote sources for the
current selection of packages are still available. So it cannot be a
noconfig_targets, since it depends on a configuration being
available. The very fact that 'source-check' is basically the same as
'source', and one is a noconfig_target and not the other is a clear
indication that the current implementation is wrong.

So this commit moves source-check to no longer be a noconfig_target.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 8fca4b8..9b44181 100644
--- a/Makefile
+++ b/Makefile
@@ -75,7 +75,7 @@ export BR2_VERSION_FULL := $(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setlo
 noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconfig \
 	defconfig %_defconfig allyesconfig allnoconfig silentoldconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
-	source-check print-version olddefconfig
+	print-version olddefconfig
 
 # Strip quotes and then whitespaces
 qstrip = $(strip $(subst ",,$(1)))
@@ -427,7 +427,7 @@ world: target-post-image
 
 .PHONY: all world toolchain dirs clean distclean source outputmakefile \
 	legal-info legal-info-prepare legal-info-clean printvars \
-	target-finalize target-post-image
+	target-finalize target-post-image source-check
 
 ################################################################################
 #
@@ -621,6 +621,10 @@ _external-deps: $(foreach p,$(PACKAGES),$(p)-all-external-deps)
 external-deps:
 	@$(MAKE1) -Bs $(EXTRAMAKEARGS) _external-deps | sort -u
 
+# check if download URLs are outdated
+source-check:
+	$(MAKE1) DL_MODE=SOURCE_CHECK $(EXTRAMAKEARGS) source
+
 legal-info-clean:
 	@rm -fr $(LEGAL_INFO_DIR)
 
@@ -793,10 +797,6 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 		--savedefconfig=$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) \
 		$(CONFIG_CONFIG_IN)
 
-# check if download URLs are outdated
-source-check:
-	$(MAKE1) DL_MODE=SOURCE_CHECK $(EXTRAMAKEARGS) source
-
 .PHONY: defconfig savedefconfig
 
 ################################################################################
-- 
2.1.0
