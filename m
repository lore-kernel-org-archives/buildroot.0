From: a at awn.dk <a@awn.dk>
Date: Thu, 19 May 2011 08:25:42 +0200
Subject: [Buildroot] [PATCH] Makefile.package.in: Makes it possible to
	override the default extract commands
Message-ID: <1305786342-20367-1-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Allan W. Nielsen <a@awn.dk>

When using GENTARGETS (or macroes depending on it), there is no way of
specifying a custom extraction procedure. When using the patch one can
simply define $(PACKAGE_NAME)_EXTRACT_CMDS which will override the
default. If non is defined it will fall back to the default extract
procedure.

An example could look like this:

FGLRX_VERSION=11-3
FGLRX_SOURCE:=ati-driver-installer-$(FGLRX_VERSION)-x86.x86_64.run
FGLRX_SITE:=http://www2.ati.com/drivers/linux/

define FGLRX_EXTRACT_CMDS
	sh $(DL_DIR)/$(FGLRX_SOURCE) --extract $(@D)
endef

$(eval $(call GENTARGETS,package,fglrx))

Signed-off-by: Allan W. Nielsen <a@awn.dk>
---
 package/Makefile.package.in |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index bf4e1b4..16981b7 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -243,8 +243,7 @@ endif
 $(BUILD_DIR)/%/.stamp_extracted:
 	@$(call MESSAGE,"Extracting")
 	$(Q)mkdir -p $(@D)
-	$(Q)$(if $($(PKG)_SOURCE),$(INFLATE$(suffix $($(PKG)_SOURCE))) $(DL_DIR)/$($(PKG)_SOURCE) | \
-	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -)
+	$($(PKG)_EXTRACT_CMDS)
 # some packages have messed up permissions inside
 	$(Q)chmod -R ug+rw $(@D)
 	$(foreach hook,$($(PKG)_POST_EXTRACT_HOOKS),$(call $(hook))$(sep))
@@ -425,6 +424,10 @@ $(2)_TARGET_UNINSTALL =		$$($(2)_DIR)/.stamp_uninstalled
 $(2)_TARGET_CLEAN =		$$($(2)_DIR)/.stamp_cleaned
 $(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
 
+# default extract command
+$(2)_EXTRACT_CMDS ?= $(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE))) $(DL_DIR)/$$($(2)_SOURCE) | \
+	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $$($(2)_DIR) $(TAR_OPTIONS) -)
+
 # post-steps hooks
 $(2)_POST_EXTRACT_HOOKS         ?=
 $(2)_POST_PATCH_HOOKS           ?=
-- 
1.7.3.4
