From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 05 Feb 2014 10:44:01 +0100
Subject: [Buildroot] [PATCH 2 of 5 v3] infra: remove variable FOO_DIR_PREFIX
In-Reply-To: <patchbomb.1391593439@argentina>
References: <patchbomb.1391593439@argentina>
Message-ID: <6019b6eec2d2c3464337.1391593441@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Variable FOO_DIR_PREFIX in inner-generic-package isn't really needed. The
contents of this variable are 'package' for normal packages, 'boot' for
bootloaders, and 'linux' for the linux kernel.
When patching a package, all you need to know is the directory where
patches can reside, which is already returned by $(pkgdir). In order to be
able to use this variable outside of inner-generic-package, we introduce a
target-specific variable PKGDIR that equals to this $(pkgdir).

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
v3: don't use call on pkgdir (Arnout)

 package/pkg-generic.mk |  4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
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
@@ -358,7 +358,6 @@ endif
 $(2)_INSTALL_STAGING		?= NO
 $(2)_INSTALL_IMAGES		?= NO
 $(2)_INSTALL_TARGET		?= YES
-$(2)_DIR_PREFIX			= $(4)
 
 # define sub-target stamps
 $(2)_TARGET_INSTALL_TARGET =	$$($(2)_DIR)/.stamp_target_installed
@@ -507,6 +506,7 @@ endif
 $$($(2)_TARGET_RSYNC_SOURCE):		PKG=$(2)
 $$($(2)_TARGET_PATCH):			PKG=$(2)
 $$($(2)_TARGET_PATCH):			RAWNAME=$(patsubst host-%,%,$(1))
+$$($(2)_TARGET_PATCH):			PKGDIR=$(pkgdir)
 $$($(2)_TARGET_EXTRACT):		PKG=$(2)
 $$($(2)_TARGET_SOURCE):			PKG=$(2)
 $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
