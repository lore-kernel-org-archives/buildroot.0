From: Allan W. Nielsen <a@awn.dk>
Date: Mon, 11 Apr 2011 13:08:24 +0200
Subject: [Buildroot] [PATCH] Makefile.package.in: Makes it possible to
	override the default extract commands
In-Reply-To: <1302520104-18682-1-git-send-email-a@awn.dk>
References: <1302520104-18682-1-git-send-email-a@awn.dk>
Message-ID: <1302520104-18682-2-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When using GENTARGETS (or macroes depending on it), there is no way of
specifying a custom extraction procedure. When using the patch one can
simply define $(PACKAGE_NAME)_EXTRACT_CMDS which will override the
default. If non is defined it will fall back to the default extract
procedure.

An example could look like this:

--- PACKAGE BEGIN ---
FGLRX_VERSION=11-3
FGLRX_SOURCE:=ati-driver-installer-$(FGLRX_VERSION)-x86.x86_64.run
FGLRX_SITE:=http://www2.ati.com/drivers/linux/

define FGLRX_EXTRACT_CMDS
	sh $(DL_DIR)/$(FGLRX_SOURCE) --extract $(@D)
endef

$(eval $(call GENTARGETS,package,fglrx))
--- PACKAGE END ---

Signed-off-by: Allan W. Nielsen <a@awn.dk>
---
 package/Makefile.package.in |   18 ++++++++++++++++--
 1 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index bf4e1b4..e5dafd1 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -239,9 +239,17 @@ ifeq ($(DL_MODE),DOWNLOAD)
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
@@ -419,7 +427,13 @@ $(2)_TARGET_INSTALL_HOST =      $$($(2)_DIR)/.stamp_host_installed
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
