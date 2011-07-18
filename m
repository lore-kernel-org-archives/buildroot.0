From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Mon, 18 Jul 2011 10:15:52 +0100
Subject: [Buildroot] [PATCH 1/2] Allow rebuilding of generic targets.
In-Reply-To: <1310980553-20754-1-git-send-email-quotientvremainder@gmail.com>
References: <1310980553-20754-1-git-send-email-quotientvremainder@gmail.com>
Message-ID: <1310980553-20754-2-git-send-email-quotientvremainder@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Individual packages using the GENTARGETS and AUTOTARGETS infrastructure
can now be rebuilt by issuing "make ${pkg}-rebuild".
Changes can be made in output/build/${pkg}/* and make ${pkg}-rebuild will
run the normal build command for that directory again.

Signed-off-by: Quotient Remainder <quotientvremainder@gmail.com>
---
 package/Makefile.package.in |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 74087cd..27e5721 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -290,6 +290,11 @@ $(BUILD_DIR)/%/.stamp_built::
 	$(foreach hook,$($(PKG)_POST_BUILD_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
 
+# Rebuild
+$(BUILD_DIR)/%/.stamp_rebuilt:
+	@$(call MESSAGE,"Rebuilding")
+	$($(PKG)_REBUILD_CMDS)
+
 # Install to host dir
 $(BUILD_DIR)/%/.stamp_host_installed:
 	@$(call MESSAGE,'Installing to host directory')
@@ -425,6 +430,7 @@ $(2)_TARGET_INSTALL_STAGING =	$$($(2)_DIR)/.stamp_staging_installed
 $(2)_TARGET_INSTALL_IMAGES =	$$($(2)_DIR)/.stamp_images_installed
 $(2)_TARGET_INSTALL_HOST =      $$($(2)_DIR)/.stamp_host_installed
 $(2)_TARGET_BUILD =		$$($(2)_DIR)/.stamp_built
+$(2)_TARGET_REBUILD =		$$($(2)_DIR)/.stamp_rebuilt
 $(2)_TARGET_CONFIGURE =		$$($(2)_DIR)/.stamp_configured
 $(2)_TARGET_PATCH =		$$($(2)_DIR)/.stamp_patched
 $(2)_TARGET_EXTRACT =		$$($(2)_DIR)/.stamp_extracted
@@ -485,6 +491,8 @@ $(1)-install-host:      $(1)-build $$($(2)_TARGET_INSTALL_HOST)
 $(1)-build:		$(1)-configure \
 			$$($(2)_TARGET_BUILD)
 
+$(1)-rebuild:	$$($(2)_TARGET_REBUILD) $(1)
+
 $(1)-configure:		$(1)-patch \
 			$$($(2)_TARGET_CONFIGURE)
 
@@ -514,6 +522,7 @@ $$($(2)_TARGET_INSTALL_STAGING):	PKG=$(2)
 $$($(2)_TARGET_INSTALL_IMAGES):		PKG=$(2)
 $$($(2)_TARGET_INSTALL_HOST):           PKG=$(2)
 $$($(2)_TARGET_BUILD):			PKG=$(2)
+$$($(2)_TARGET_REBUILD):		PKG=$(2)
 $$($(2)_TARGET_CONFIGURE):		PKG=$(2)
 $$($(2)_TARGET_PATCH):			PKG=$(2)
 $$($(2)_TARGET_PATCH):			RAWNAME=$(patsubst host-%,%,$(1))
@@ -534,6 +543,19 @@ else
 $(2)_KCONFIG_VAR = BR2_PACKAGE_$(2)
 endif
 
+ifndef $(2)_REBUILD_CMDS
+ ifeq ($(5),target)
+  define $(2)_REBUILD_CMDS
+	$(Q)rm -f $(2)_TARGET_BUILD $(2)_TARGET_INSTALL_TARGET \
+		$(2)_TARGET_INSTALL_STAGING $(2)_TARGET_INSTALL_IMAGES
+  endef
+ else
+  define $(2)_REBUILD_CMDS
+	$(Q)rm -f $(2)_TARGET_BUILD $(2)_TARGET_INSTALL_HOST
+  endef
+ endif
+endif
+
 # add package to the general list of targets if requested by the buildroot
 # configuration
 ifeq ($$($$($(2)_KCONFIG_VAR)),y)
-- 
1.7.6
