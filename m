From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 5 Feb 2014 12:10:00 +0100
Subject: [Buildroot] [git commit] infra: remove variable FOO_DIR_PREFIX
Message-ID: <20140205123039.8EAE59C783@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=604d261fb05ba1cc43a9630c3ce944c54ebb97b6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Variable FOO_DIR_PREFIX in inner-generic-package isn't really needed. The
contents of this variable are 'package' for normal packages, 'boot' for
bootloaders, and 'linux' for the linux kernel.
When patching a package, all you need to know is the directory where
patches can reside, which is already returned by $(pkgdir). In order to be
able to use this variable outside of inner-generic-package, we introduce a
target-specific variable PKGDIR that equals to this $(pkgdir).

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index eea530f..e04a93e 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -137,7 +137,7 @@ endif
 #
 # For BR2_GLOBAL_PATCH_DIR, only generate if it is defined
 $(BUILD_DIR)/%/.stamp_patched: NAMEVER = $(RAWNAME)-$($(PKG)_VERSION)
-$(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS =  $($(PKG)_DIR_PREFIX)/$(RAWNAME)
+$(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS =  $(PKGDIR)
 $(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS += $(addsuffix /$(RAWNAME),$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)))
 $(BUILD_DIR)/%/.stamp_patched:
 	@$(call step_start,patch)
@@ -358,7 +358,6 @@ $(2)_DEPENDENCIES ?= $(filter-out $(1),$(patsubst host-host-%,host-%,$(addprefix
 $(2)_INSTALL_STAGING		?= NO
 $(2)_INSTALL_IMAGES		?= NO
 $(2)_INSTALL_TARGET		?= YES
-$(2)_DIR_PREFIX			= $(4)
 
 # define sub-target stamps
 $(2)_TARGET_INSTALL_TARGET =	$$($(2)_DIR)/.stamp_target_installed
@@ -507,6 +506,7 @@ $$($(2)_TARGET_RSYNC_SOURCE):		SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
 $$($(2)_TARGET_RSYNC_SOURCE):		PKG=$(2)
 $$($(2)_TARGET_PATCH):			PKG=$(2)
 $$($(2)_TARGET_PATCH):			RAWNAME=$(patsubst host-%,%,$(1))
+$$($(2)_TARGET_PATCH):			PKGDIR=$(pkgdir)
 $$($(2)_TARGET_EXTRACT):		PKG=$(2)
 $$($(2)_TARGET_SOURCE):			PKG=$(2)
 $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
