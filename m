From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun,  2 Oct 2011 01:43:46 +0200
Subject: [Buildroot] [PATCH] Remove / after $(PKG)_DIR_PREFIX
Message-ID: <1317512626-30779-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

With the automatic derivation of the package directory, the $(PKG)_DIR_PREFIX
variable already contains a final /.  Therefore there is no need to have an
additional / after the uses of this variable.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Makefile.package.in    |   16 ++++++++--------
 package/dhrystone/dhrystone.mk |    2 +-
 package/libgtk2/libgtk2.mk     |    2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 353ba72..6f543cc 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -310,17 +310,17 @@ endif
 # prefix of the patches
 $(BUILD_DIR)/%/.stamp_patched: NAMEVER = $(RAWNAME)-$($(PKG)_VERSION)
 $(BUILD_DIR)/%/.stamp_patched:
-	@$(call MESSAGE,"Patching $($(PKG)_DIR_PREFIX)/$(RAWNAME)")
+	@$(call MESSAGE,"Patching $($(PKG)_DIR_PREFIX)$(RAWNAME)")
 	$(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
 	$(if $($(PKG)_PATCH),support/scripts/apply-patches.sh $(@D) $(DL_DIR) $($(PKG)_PATCH))
 	$(Q)( \
-	if test -d $($(PKG)_DIR_PREFIX)/$(RAWNAME); then \
-	  if test "$(wildcard $($(PKG)_DIR_PREFIX)/$(RAWNAME)/$(NAMEVER)*.patch*)"; then \
-	    support/scripts/apply-patches.sh $(@D) $($(PKG)_DIR_PREFIX)/$(RAWNAME) $(NAMEVER)\*.patch $(NAMEVER)\*.patch.$(ARCH) || exit 1; \
+	if test -d $($(PKG)_DIR_PREFIX)$(RAWNAME); then \
+	  if test "$(wildcard $($(PKG)_DIR_PREFIX)$(RAWNAME)/$(NAMEVER)*.patch*)"; then \
+	    support/scripts/apply-patches.sh $(@D) $($(PKG)_DIR_PREFIX)$(RAWNAME) $(NAMEVER)\*.patch $(NAMEVER)\*.patch.$(ARCH) || exit 1; \
 	  else \
-	    support/scripts/apply-patches.sh $(@D) $($(PKG)_DIR_PREFIX)/$(RAWNAME) $(RAWNAME)\*.patch $(RAWNAME)\*.patch.$(ARCH) || exit 1; \
-	    if test -d $($(PKG)_DIR_PREFIX)/$(RAWNAME)/$(NAMEVER); then \
-	      support/scripts/apply-patches.sh $(@D) $($(PKG)_DIR_PREFIX)/$(RAWNAME)/$(NAMEVER) \*.patch \*.patch.$(ARCH) || exit 1; \
+	    support/scripts/apply-patches.sh $(@D) $($(PKG)_DIR_PREFIX)$(RAWNAME) $(RAWNAME)\*.patch $(RAWNAME)\*.patch.$(ARCH) || exit 1; \
+	    if test -d $($(PKG)_DIR_PREFIX)$(RAWNAME)/$(NAMEVER); then \
+	      support/scripts/apply-patches.sh $(@D) $($(PKG)_DIR_PREFIX)$(RAWNAME)/$(NAMEVER) \*.patch \*.patch.$(ARCH) || exit 1; \
 	    fi; \
 	  fi; \
 	fi; \
@@ -482,7 +482,7 @@ $(2)_DEPENDENCIES		?=
 $(2)_INSTALL_STAGING		?= NO
 $(2)_INSTALL_IMAGES		?= NO
 $(2)_INSTALL_TARGET		?= YES
-$(2)_DIR_PREFIX			= $(if $(4),$(4),$(TOP_SRCDIR)/package)
+$(2)_DIR_PREFIX			= $(4)
 
 # define sub-target stamps
 $(2)_TARGET_INSTALL_TARGET =	$$($(2)_DIR)/.stamp_target_installed
diff --git a/package/dhrystone/dhrystone.mk b/package/dhrystone/dhrystone.mk
index 098b9f1..3b78b2f 100644
--- a/package/dhrystone/dhrystone.mk
+++ b/package/dhrystone/dhrystone.mk
@@ -10,7 +10,7 @@ DHRYSTONE_SITE = http://www.netlib.org/benchmark/
 
 define DHRYSTONE_EXTRACT_CMDS
 	(cd $(@D) && $(SHELL) $(DL_DIR)/$($(PKG)_SOURCE))
-	$(Q)cp $($(PKG)_DIR_PREFIX)/dhrystone/Makefile $(@D)/
+	$(Q)cp $($(PKG)_DIR_PREFIX)dhrystone/Makefile $(@D)/
 endef
 
 define DHRYSTONE_BUILD_CMDS
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 9a8c2bb..ac3789a 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -139,7 +139,7 @@ HOST_LIBGTK2_CONF_OPT = \
 		--disable-debug
 
 define HOST_LIBGTK2_PATCH_REDUCE_DEPENDENCIES_HOOK
- support/scripts/apply-patches.sh $(@D) $($(PKG)_DIR_PREFIX)/$(RAWNAME) host-*.patch
+ support/scripts/apply-patches.sh $(@D) $($(PKG)_DIR_PREFIX)$(RAWNAME) host-*.patch
 endef
 
 HOST_LIBGTK2_POST_PATCH_HOOKS += HOST_LIBGTK2_PATCH_REDUCE_DEPENDENCIES_HOOK
-- 
1.7.6.3
