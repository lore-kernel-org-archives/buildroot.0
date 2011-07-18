From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Mon, 18 Jul 2011 10:45:09 +0100
Subject: [Buildroot] [PATCH] Generate a package-specific tree of installed
	components for all generic targets.
Message-ID: <1310982309-20930-1-git-send-email-quotientvremainder@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to clarify which parts of the file system have been installed by which package
this patch introduces an "output/package/" directory under which each generic/autotools
packae has a directory containing the tree of components it has added to the
"output/target/" directory.

Signed-off-by: Quotient Remainder <quotientvremainder@gmail.com>
---
 Makefile                    |    3 ++-
 package/Makefile.package.in |   14 +++++++++++++-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 2f3802c..caf0a74 100644
--- a/Makefile
+++ b/Makefile
@@ -274,6 +274,7 @@ STAMP_DIR:=$(BASE_DIR)/stamps
 
 BINARIES_DIR:=$(BASE_DIR)/images
 TARGET_DIR:=$(BASE_DIR)/target
+PACKAGE_DIR:=$(BASE_DIR)/package
 TOOLCHAIN_DIR=$(BASE_DIR)/toolchain
 TARGET_SKELETON=$(TOPDIR)/fs/skeleton
 
@@ -352,7 +353,7 @@ HOST_SOURCE += $(addsuffix -source,$(sort $(TARGETS_HOST_DEPS) $(HOST_DEPS)))
 $(TARGETS_ALL): __real_tgt_%: $(BASE_TARGETS) %
 
 dirs: $(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
-	$(HOST_DIR) $(BR2_DEPENDS_DIR) $(BINARIES_DIR) $(STAMP_DIR)
+	$(HOST_DIR) $(BR2_DEPENDS_DIR) $(BINARIES_DIR) $(STAMP_DIR) $(PACKAGE_DIR)
 
 $(BASE_TARGETS): dirs $(O)/toolchainfile.cmake
 
diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index f4d54fe..d4e4452 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -318,6 +318,13 @@ $(BUILD_DIR)/%/.stamp_target_installed:
 	$(foreach hook,$($(PKG)_POST_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
 
+# Package content install
+$(BUILD_DIR)/%/.stamp_package_installed:
+	@$(call MESSAGE,"Installing package standalone")
+	$($(PKG)_INSTALL_TARGET_CMDS)
+	$(foreach hook,$($(PKG)_POST_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
+	$(Q)touch $@
+
 # Clean package
 $(BUILD_DIR)/%/.stamp_cleaned:
 	@$(call MESSAGE,"Cleaning up")
@@ -425,6 +432,7 @@ $(2)_TARGET_INSTALL_TARGET =	$$($(2)_DIR)/.stamp_target_installed
 $(2)_TARGET_INSTALL_STAGING =	$$($(2)_DIR)/.stamp_staging_installed
 $(2)_TARGET_INSTALL_IMAGES =	$$($(2)_DIR)/.stamp_images_installed
 $(2)_TARGET_INSTALL_HOST =      $$($(2)_DIR)/.stamp_host_installed
+$(2)_TARGET_INSTALL_PACKAGE = $$($(2)_DIR)/.stamp_package_installed
 $(2)_TARGET_BUILD =		$$($(2)_DIR)/.stamp_built
 $(2)_TARGET_CONFIGURE =		$$($(2)_DIR)/.stamp_configured
 $(2)_TARGET_PATCH =		$$($(2)_DIR)/.stamp_patched
@@ -457,7 +465,7 @@ $(1):			$(1)-install
 ifeq ($$($(2)_TYPE),host)
 $(1)-install:	        $(1)-install-host
 else
-$(1)-install:		$(1)-install-staging $(1)-install-target $(1)-install-images
+$(1)-install: $(1)-install-staging $(1)-install-target $(1)-install-images $(1)-install-package
 endif
 
 ifeq ($$($(2)_INSTALL_TARGET),YES)
@@ -483,6 +491,8 @@ endif
 
 $(1)-install-host:      $(1)-build $$($(2)_TARGET_INSTALL_HOST)
 
+$(1)-install-package: $$($(2)_TARGET_INSTALL_PACKAGE)
+
 $(1)-build:		$(1)-configure \
 			$$($(2)_TARGET_BUILD)
 
@@ -514,6 +524,8 @@ $$($(2)_TARGET_INSTALL_TARGET):		PKG=$(2)
 $$($(2)_TARGET_INSTALL_STAGING):	PKG=$(2)
 $$($(2)_TARGET_INSTALL_IMAGES):		PKG=$(2)
 $$($(2)_TARGET_INSTALL_HOST):           PKG=$(2)
+$$($(2)_TARGET_INSTALL_PACKAGE):	PKG=$(2)
+$$($(2)_TARGET_INSTALL_PACKAGE):	TARGET_DIR=$(PACKAGE_DIR)/$(1)
 $$($(2)_TARGET_BUILD):			PKG=$(2)
 $$($(2)_TARGET_CONFIGURE):		PKG=$(2)
 $$($(2)_TARGET_PATCH):			PKG=$(2)
-- 
1.7.6
