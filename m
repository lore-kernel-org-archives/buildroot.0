From: Allan W. Nielsen <a@awn.dk>
Date: Thu,  7 Apr 2011 14:52:16 +0200
Subject: [Buildroot] [PATCH 1/2] Makefile.package.in: Makes it possible to
	override the default extract commands
In-Reply-To: <1302180737-18612-1-git-send-email-a@awn.dk>
References: <1302180737-18612-1-git-send-email-a@awn.dk>
Message-ID: <1302180737-18612-2-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Allan W. Nielsen <a@awn.dk>
---
 package/Makefile.package.in |   22 +++++++++++++++++++---
 1 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index bf4e1b4..2597f85 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -79,6 +79,8 @@ GIT:=$(call qstrip,$(BR2_GIT)) $(QUIET)
 # external-deps target.
 DL_MODE=DOWNLOAD
 
+EX_MODE=DEFAULT
+
 DL_DIR=$(call qstrip,$(BR2_DL_DIR))
 ifeq ($(DL_DIR),)
 DL_DIR:=$(TOPDIR)/dl
@@ -239,9 +241,17 @@ ifeq ($(DL_MODE),DOWNLOAD)
 	$(Q)touch $@
 endif
 
-# Unpack the archive
+# Unpack the archive using custom commands
+$(BUILD_DIR)/%/.stamp_custom_extracted:
+	@$(call MESSAGE,"Extracting - custom")
+	$(Q)mkdir -p $(@D)
+	$($(PKG)_EXTRACT_CMDS)
+	$(foreach hook,$($(PKG)_POST_EXTRACT_HOOKS),$(call $(hook))$(sep))
+	$(Q)touch $@
+
+# Unpack the archive using default commands
 $(BUILD_DIR)/%/.stamp_extracted:
-	@$(call MESSAGE,"Extracting")
+	@$(call MESSAGE,"Extracting - default")
 	$(Q)mkdir -p $(@D)
 	$(Q)$(if $($(PKG)_SOURCE),$(INFLATE$(suffix $($(PKG)_SOURCE))) $(DL_DIR)/$($(PKG)_SOURCE) | \
 	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -)
@@ -261,7 +271,7 @@ $(BUILD_DIR)/%/.stamp_patched: NAMEVER = $($(NOHOSTPKG)_NAME)-$($(PKG)_VERSION)
 $(BUILD_DIR)/%/.stamp_patched:
 	@$(call MESSAGE,"Patching $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME)")
 	$(if $($(PKG)_PATCH),toolchain/patch-kernel.sh $(@D) $(DL_DIR) $($(PKG)_PATCH))
-	$(Q)( \
+	( \
 	if test -d $($(PKG)_DIR_PREFIX)/$($(NOHOSTPKG)_NAME); then \
 	  if test "$(wildcard $($(PKG)_DIR_PREFIX)/$($(NOHOSTPKG)_NAME)/$(NAMEVER)*.patch*)"; then \
 	    toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$($(NOHOSTPKG)_NAME) $(NAMEVER)\*.patch $(NAMEVER)\*.patch.$(ARCH) || exit 1; \
@@ -419,7 +429,13 @@ $(2)_TARGET_INSTALL_HOST =      $$($(2)_DIR)/.stamp_host_installed
 $(2)_TARGET_BUILD =		$$($(2)_DIR)/.stamp_built
 $(2)_TARGET_CONFIGURE =		$$($(2)_DIR)/.stamp_configured
 $(2)_TARGET_PATCH =		$$($(2)_DIR)/.stamp_patched
+
+ifdef $(2)_EXTRACT_CMDS
+$(2)_TARGET_EXTRACT =		$$($(2)_DIR)/.stamp_custom_extracted
+else
 $(2)_TARGET_EXTRACT =		$$($(2)_DIR)/.stamp_extracted
+endif
+
 $(2)_TARGET_SOURCE =		$$($(2)_DIR)/.stamp_downloaded
 $(2)_TARGET_UNINSTALL =		$$($(2)_DIR)/.stamp_uninstalled
 $(2)_TARGET_CLEAN =		$$($(2)_DIR)/.stamp_cleaned
-- 
1.7.3.4
