From: Allan W. Nielsen <a@awn.dk>
Date: Tue, 10 May 2011 11:58:48 +0200
Subject: [Buildroot] [PATCH] Makefile.package.in: Makes it possible to
	override the default extract commands
In-Reply-To: <1305021528-30585-1-git-send-email-a@awn.dk>
References: <1305021528-30585-1-git-send-email-a@awn.dk>
Message-ID: <1305021528-30585-4-git-send-email-a@awn.dk>
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
 package/Makefile.package.in |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index bf4e1b4..d308c33 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -84,6 +84,12 @@ ifeq ($(DL_DIR),)
 DL_DIR:=$(TOPDIR)/dl
 endif
 
+# Default extract command to be used
+define DEFAULT_EXTRACT_COMMENT
+	$(Q)$(if $($(PKG)_SOURCE),$(INFLATE$(suffix $($(PKG)_SOURCE))) $(DL_DIR)/$($(PKG)_SOURCE) | \
+	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -)
+endef
+
 ################################################################################
 # The DOWNLOAD_{GIT,SVN,BZR} helpers are in charge of getting a
 # working copy of the source repository for their corresponding SCM,
@@ -243,8 +249,7 @@ endif
 $(BUILD_DIR)/%/.stamp_extracted:
 	@$(call MESSAGE,"Extracting")
 	$(Q)mkdir -p $(@D)
-	$(Q)$(if $($(PKG)_SOURCE),$(INFLATE$(suffix $($(PKG)_SOURCE))) $(DL_DIR)/$($(PKG)_SOURCE) | \
-	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -)
+	$($(PKG)_EXTRACT_CMDS)
 # some packages have messed up permissions inside
 	$(Q)chmod -R ug+rw $(@D)
 	$(foreach hook,$($(PKG)_POST_EXTRACT_HOOKS),$(call $(hook))$(sep))
@@ -425,6 +430,9 @@ $(2)_TARGET_UNINSTALL =		$$($(2)_DIR)/.stamp_uninstalled
 $(2)_TARGET_CLEAN =		$$($(2)_DIR)/.stamp_cleaned
 $(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
 
+# default extract command
+$(2)_EXTRACT_CMDS ?= DEFAULT_EXTRACT_COMMENT
+
 # post-steps hooks
 $(2)_POST_EXTRACT_HOOKS         ?=
 $(2)_POST_PATCH_HOOKS           ?=
-- 
1.7.3.4
