From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 15:46:33 +0200
Subject: [Buildroot] [git commit] gcc: apply patches stored in global
	patches directories
Message-ID: <20160703135149.055B7800CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=930467503af7c4a72750e226e9a15a0e23e2e541
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building host gcc, patches stored in global patches directories are
skipped. This patch fixes the unexpected behavior.

Signed-off-by: Chunhui He <hchunhui@mail.ustc.edu.cn>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Thomas:
 - rename the loop variable from 'D' to 'patchdir'
 - add some additional comments
 - remove final ; at end of loop when applying the patches, since it's
   not needed]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc.mk | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index a796f47..b6a3ac9 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -41,10 +41,18 @@ endef
 endif
 endif
 
+# gcc is a special package, not named gcc, but gcc-initial and
+# gcc-final, but patches are nonetheless stored in package/gcc in the
+# tree, and potentially in BR2_GLOBAL_PATCH_DIR directories as well.
 define HOST_GCC_APPLY_PATCHES
-	if test -d package/gcc/$(GCC_VERSION); then \
-	  $(APPLY_PATCHES) $(@D) package/gcc/$(GCC_VERSION) \*.patch ; \
-	fi;
+	for patchdir in \
+	    package/gcc/$(GCC_VERSION) \
+	    $(addsuffix /gcc/$(GCC_VERSION),$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))) \
+	    $(addsuffix /gcc,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))) ; do \
+		if test -d $${patchdir}; then \
+			$(APPLY_PATCHES) $(@D) $${patchdir} \*.patch || exit 1; \
+		fi; \
+	done
 	$(HOST_GCC_APPLY_POWERPC_PATCH)
 endef
 
@@ -233,13 +241,19 @@ HOST_GCC_COMMON_MAKE_OPTS = \
 
 ifeq ($(BR2_CCACHE),y)
 HOST_GCC_COMMON_CCACHE_HASH_FILES += $(DL_DIR)/$(GCC_SOURCE)
-# Cfr. PATCH_BASE_DIRS in .stamp_patched, but we catch both versioned and
-# unversioned patches unconditionally
+
+# Cfr. PATCH_BASE_DIRS in .stamp_patched, but we catch both versioned
+# and unversioned patches unconditionally. Moreover, to facilitate the
+# addition of gcc patches in BR2_GLOBAL_PATCH_DIR, we allow them to be
+# stored in a sub-directory called 'gcc' even if it's not technically
+# the name of the package.
 HOST_GCC_COMMON_CCACHE_HASH_FILES += \
 	$(sort $(wildcard \
 		package/gcc/$(GCC_VERSION)/*.patch \
 		$(addsuffix /$((PKG)_RAWNAME)/$(GCC_VERSION)/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))) \
-		$(addsuffix /$((PKG)_RAWNAME)/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)))))
+		$(addsuffix /$((PKG)_RAWNAME)/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))) \
+		$(addsuffix /gcc/$(GCC_VERSION)/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))) \
+		$(addsuffix /gcc/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)))))
 ifeq ($(BR2_xtensa),y)
 HOST_GCC_COMMON_CCACHE_HASH_FILES += $(HOST_GCC_XTENSA_OVERLAY_TAR)
 endif
