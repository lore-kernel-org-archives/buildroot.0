From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 7 Jul 2011 23:48:41 +0200
Subject: [Buildroot] [git commit] package: fix patching procedure for host
	packages
Message-ID: <20110707220518.52D788A3F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7a41cbf938d6a189109b8b15dc2cef8638c5a0c2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patching procedure was using $($(NOHOSTPKG)_NAME) to find the name
of the package without the host- prefix for host packages, which is
needed to find the package directory and the prefix of the patches.

However, this $($(NOHOSTPKG)_NAME) variable is empty when there is
only an host variant for the package and no target variant for it.

Therefore, instead of using this $($(NOHOSTPKG)_NAME) variable, we now
use a new $(RAWNAME) variable, which is always the name of the package
without the host- prefix, even for host packages.

Thanks to Yann E. Morin for providing the tip on using patsubst
instead of subst.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.package.in |   26 ++++++++++++--------------
 1 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index f79359a..8b5657b 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -251,23 +251,21 @@ $(BUILD_DIR)/%/.stamp_extracted:
 
 # Patch
 #
-# The NOHOSTPKG variable is the uppercased package name, without the
-# HOST_ prefix, even for host packages. This allows to find the
-# patches in the package directory, because $($(NOHOSTPKG)_NAME)
-# expands to the package directory name.
-#
-$(BUILD_DIR)/%/.stamp_patched: NAMEVER = $($(NOHOSTPKG)_NAME)-$($(PKG)_VERSION)
+# The RAWNAME variable is the lowercased package name, which allows to
+# find the package directory (typically package/<pkgname>) and the
+# prefix of the patches
+$(BUILD_DIR)/%/.stamp_patched: NAMEVER = $(RAWNAME)-$($(PKG)_VERSION)
 $(BUILD_DIR)/%/.stamp_patched:
-	@$(call MESSAGE,"Patching $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME)")
+	@$(call MESSAGE,"Patching $($(PKG)_DIR_PREFIX)/$(RAWNAME)")
 	$(if $($(PKG)_PATCH),toolchain/patch-kernel.sh $(@D) $(DL_DIR) $($(PKG)_PATCH))
 	$(Q)( \
-	if test -d $($(PKG)_DIR_PREFIX)/$($(NOHOSTPKG)_NAME); then \
-	  if test "$(wildcard $($(PKG)_DIR_PREFIX)/$($(NOHOSTPKG)_NAME)/$(NAMEVER)*.patch*)"; then \
-	    toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$($(NOHOSTPKG)_NAME) $(NAMEVER)\*.patch $(NAMEVER)\*.patch.$(ARCH) || exit 1; \
+	if test -d $($(PKG)_DIR_PREFIX)/$(RAWNAME); then \
+	  if test "$(wildcard $($(PKG)_DIR_PREFIX)/$(RAWNAME)/$(NAMEVER)*.patch*)"; then \
+	    toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$(RAWNAME) $(NAMEVER)\*.patch $(NAMEVER)\*.patch.$(ARCH) || exit 1; \
 	  else \
-	    toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$($(NOHOSTPKG)_NAME) $($(NOHOSTPKG)_NAME)\*.patch $($(NOHOSTPKG)_NAME)\*.patch.$(ARCH) || exit 1; \
-	    if test -d $($(PKG)_DIR_PREFIX)/$($(NOHOSTPKG)_NAME)/$(NAMEVER); then \
-	      toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$($(NOHOSTPKG)_NAME)/$(NAMEVER) \*.patch \*.patch.$(ARCH) || exit 1; \
+	    toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$(RAWNAME) $(RAWNAME)\*.patch $(RAWNAME)\*.patch.$(ARCH) || exit 1; \
+	    if test -d $($(PKG)_DIR_PREFIX)/$(RAWNAME)/$(NAMEVER); then \
+	      toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$(RAWNAME)/$(NAMEVER) \*.patch \*.patch.$(ARCH) || exit 1; \
 	    fi; \
 	  fi; \
 	fi; \
@@ -515,7 +513,7 @@ $$($(2)_TARGET_INSTALL_HOST):           PKG=$(2)
 $$($(2)_TARGET_BUILD):			PKG=$(2)
 $$($(2)_TARGET_CONFIGURE):		PKG=$(2)
 $$($(2)_TARGET_PATCH):			PKG=$(2)
-$$($(2)_TARGET_PATCH):			NOHOSTPKG=$(3)
+$$($(2)_TARGET_PATCH):			RAWNAME=$(patsubst host-%,%,$(1))
 $$($(2)_TARGET_EXTRACT):		PKG=$(2)
 $$($(2)_TARGET_SOURCE):			PKG=$(2)
 $$($(2)_TARGET_UNINSTALL):		PKG=$(2)
-- 
1.7.3.4
