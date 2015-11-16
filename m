From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Nov 2015 23:47:09 +0100
Subject: [Buildroot] [PATCH 14/21 RFC] core: add a global variable with
	already-unquoted global patch dir
In-Reply-To: <cover.1447713615.git.yann.morin.1998@free.fr>
References: <cover.1447713615.git.yann.morin.1998@free.fr>
Message-ID: <fbee6dbbb53ef66ff5b1c97dbc5f9317494416ff.1447713615.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... and use it instead of duplicating the qstrip everywhere it is
needed.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile               | 2 ++
 package/gcc/gcc.mk     | 4 ++--
 package/pkg-generic.mk | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 80c264f..033020d 100644
--- a/Makefile
+++ b/Makefile
@@ -187,6 +187,8 @@ ifneq ($(BR2_CCACHE_DIR),)
 BR_CACHE_DIR := $(BR2_CCACHE_DIR)
 endif
 
+BR_GLOBAL_PATCH_DIR := $(call qstrip,$(BR2_GLOBAL_PATCH_DIR))
+
 # Need that early, before we scan packages
 # Avoids doing the $(or...) everytime
 BR_GRAPH_OUT := $(or $(BR2_GRAPH_OUT),pdf)
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 53aaf5c..f1f06d2 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -257,8 +257,8 @@ HOST_GCC_COMMON_CCACHE_HASH_FILES += $(DL_DIR)/$(HOST_GCC_SOURCE)
 HOST_GCC_COMMON_CCACHE_HASH_FILES += \
 	$(sort $(wildcard \
 		package/gcc/$(HOST_GCC_VERSION)/*.patch \
-		$(addsuffix $((PKG)_RAWNAME)/$(HOST_GCC_VERSION)/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))) \
-		$(addsuffix $((PKG)_RAWNAME)/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)))))
+		$(addsuffix $((PKG)_RAWNAME)/$(HOST_GCC_VERSION)/*.patch,$(BR_GLOBAL_PATCH_DIR)) \
+		$(addsuffix $((PKG)_RAWNAME)/*.patch,$(BR_GLOBAL_PATCH_DIR))))
 ifeq ($(BR2_xtensa),y)
 HOST_GCC_COMMON_CCACHE_HASH_FILES += $(HOST_GCC_XTENSA_OVERLAY_TAR)
 endif
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 91c8fea..544ae5c 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -147,7 +147,7 @@ $(BUILD_DIR)/%/.stamp_rsynced:
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
