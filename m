From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:47:37 +0100
Subject: [Buildroot] [PATCH 07/51] core: add a global variable with
	already-unquoted global patch dir
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <6fdfa014a8ab2bd00ae19074e82a6c91fdeb71de.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... and use it instead of duplicating the qstrip everywhere it is
needed.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile               | 3 +++
 package/gcc/gcc.mk     | 4 ++--
 package/pkg-generic.mk | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 71c6836..5e62275 100644
--- a/Makefile
+++ b/Makefile
@@ -218,6 +218,9 @@ ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
 -include $(BR2_CONFIG)
 endif
 
+# Needs to be after we parse the .config
+BR_GLOBAL_PATCH_DIR := $(call qstrip,$(BR2_GLOBAL_PATCH_DIR))
+
 # To put more focus on warnings, be less verbose as default
 # Use 'make V=1' to see the full commands
 ifeq ("$(origin V)", "command line")
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index b9551e8..51e8378 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -248,8 +248,8 @@ HOST_GCC_COMMON_CCACHE_HASH_FILES += $(DL_DIR)/$(GCC_SOURCE)
 HOST_GCC_COMMON_CCACHE_HASH_FILES += \
 	$(sort $(wildcard \
 		package/gcc/$(GCC_VERSION)/*.patch \
-		$(addsuffix $((PKG)_RAWNAME)/$(GCC_VERSION)/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))) \
-		$(addsuffix $((PKG)_RAWNAME)/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)))))
+		$(addsuffix $((PKG)_RAWNAME)/$(GCC_VERSION)/*.patch,$(BR2_GLOBAL_PATCH_DIR)) \
+		$(addsuffix $((PKG)_RAWNAME)/*.patch,$(BR2_GLOBAL_PATCH_DIR))))
 ifeq ($(BR2_xtensa),y)
 HOST_GCC_COMMON_CCACHE_HASH_FILES += $(HOST_GCC_XTENSA_OVERLAY_TAR)
 endif
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index e69c970..5414bc6 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -155,7 +155,7 @@ $(BUILD_DIR)/%/.stamp_rsynced:
 # For BR2_GLOBAL_PATCH_DIR, only generate if it is defined
 $(BUILD_DIR)/%/.stamp_patched: NAMEVER = $(RAWNAME)-$($(PKG)_VERSION)
 $(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS =  $(PKGDIR)
-$(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS += $(addsuffix /$(RAWNAME),$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)))
+$(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS += $(addsuffix /$(RAWNAME),$(BR_GLOBAL_PATCH_DIR))
 $(BUILD_DIR)/%/.stamp_patched:
 	@$(call step_start,patch)
 	@$(call MESSAGE,"Patching")
-- 
1.9.1
