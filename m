From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 19:50:58 +0200
Subject: [Buildroot] [git commit] Makefile: move source-check outside of
	noconfig_targets
Message-ID: <20150426202108.342CC81734@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7800b9619df31e9ff6ec65065a8d569260969157
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

make source-check is here to check whether the remote sources for the
current selection of packages are still available. In its current
implementation, since it simply calls recursively a sub-make with the
source target, it can be a noconfig_targets. However, a follow-up
change will make source-check not use a sub-make, which will require
it to no longer be a noconfig_targets.

Therefore, as a preparation, this commit moves source-check outside of
noconfig_targets.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 7649e4c..a442325 100644
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
@@ -422,7 +422,7 @@ world: target-post-image
 
 .PHONY: all world toolchain dirs clean distclean source outputmakefile \
 	legal-info legal-info-prepare legal-info-clean printvars help \
-	list-defconfigs target-finalize target-post-image
+	list-defconfigs target-finalize target-post-image source-check
 
 ################################################################################
 #
@@ -618,6 +618,10 @@ _external-deps: $(foreach p,$(PACKAGES),$(p)-all-external-deps)
 external-deps:
 	@$(MAKE1) -Bs $(EXTRAMAKEARGS) _external-deps | sort -u
 
+# check if download URLs are outdated
+source-check:
+	$(MAKE1) DL_MODE=SOURCE_CHECK $(EXTRAMAKEARGS) source
+
 legal-info-clean:
 	@rm -fr $(LEGAL_INFO_DIR)
 
@@ -778,10 +782,6 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 		--savedefconfig=$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) \
 		$(CONFIG_CONFIG_IN)
 
-# check if download URLs are outdated
-source-check:
-	$(MAKE1) DL_MODE=SOURCE_CHECK $(EXTRAMAKEARGS) source
-
 .PHONY: defconfig savedefconfig
 
 ################################################################################
