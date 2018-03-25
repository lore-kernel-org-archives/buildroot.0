From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Mar 2018 17:34:54 +0200
Subject: [Buildroot] [git commit] Makefile,
 skeleton: move the host skeleton logic to host-skeleton package
Message-ID: <20180325155335.A669283AEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3ff90c8888dbc910665a8d76cc996cb3cb10c77d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As part of the per-package SDK work, we want to avoid having logic
that installs files to the global HOST_DIR, and instead do it inside
packages. One thing that gets installed to the global HOST_DIR is the
minimal "skeleton" that we create in host:

 - the "usr" symbolic link for backward compatibility

 - the "lib" directory, and its lib64 or lib32 symbolic links

This commit moves this logic to a new host-skeleton package, and makes
all packages (except itself) depend on it.

While at it, use $(Q) instead of @ in the HOST_SKELETON_INSTALL_CMDS.

[Peter: drop host-patchelf reference in commit message]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile                     | 13 +------------
 package/pkg-generic.mk       |  4 ++++
 package/skeleton/skeleton.mk | 12 ++++++++++++
 3 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/Makefile b/Makefile
index 1b34818fc8..33c87b5ebb 100644
--- a/Makefile
+++ b/Makefile
@@ -560,7 +560,7 @@ endif
 
 .PHONY: dirs
 dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
-	$(HOST_DIR) $(HOST_DIR)/usr $(HOST_DIR)/lib $(BINARIES_DIR)
+	$(HOST_DIR) $(BINARIES_DIR)
 
 $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
 	$(MAKE1) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig
@@ -579,17 +579,6 @@ sdk: world
 	$(INSTALL) -m 755 $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR)/relocate-sdk.sh
 	echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
 
-# Compatibility symlink in case a post-build script still uses $(HOST_DIR)/usr
-$(HOST_DIR)/usr: $(HOST_DIR)
-	@ln -snf . $@
-
-$(HOST_DIR)/lib: $(HOST_DIR)
-	@mkdir -p $@
-	@case $(HOSTARCH) in \
-		(*64) ln -snf lib $(@D)/lib64;; \
-		(*)   ln -snf lib $(@D)/lib32;; \
-	esac
-
 # Populating the staging with the base directories is handled by the skeleton package
 $(STAGING_DIR):
 	@mkdir -p $(STAGING_DIR)
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 5edb4b0838..3cadb28595 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -551,6 +551,10 @@ $(2)_DEPENDENCIES += toolchain
 endif
 endif
 
+ifneq ($(1),host-skeleton)
+$(2)_DEPENDENCIES += host-skeleton
+endif
+
 # Eliminate duplicates in dependencies
 $(2)_FINAL_DEPENDENCIES = $$(sort $$($(2)_DEPENDENCIES))
 $(2)_FINAL_PATCH_DEPENDENCIES = $$(sort $$($(2)_PATCH_DEPENDENCIES))
diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index d380f41649..efcf420d72 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -11,4 +11,16 @@
 SKELETON_ADD_TOOLCHAIN_DEPENDENCY = NO
 SKELETON_ADD_SKELETON_DEPENDENCY = NO
 
+# We create a compatibility symlink in case a post-build script still
+# uses $(HOST_DIR)/usr
+define HOST_SKELETON_INSTALL_CMDS
+	$(Q)ln -snf . $(HOST_DIR)/usr
+	$(Q)mkdir -p $(HOST_DIR)/lib
+	$(Q)case $(HOSTARCH) in \
+		(*64) ln -snf lib $(HOST_DIR)/lib64;; \
+		(*)   ln -snf lib $(HOST_DIR)/lib32;; \
+	esac
+endef
+
 $(eval $(virtual-package))
+$(eval $(host-generic-package))
