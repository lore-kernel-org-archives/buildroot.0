From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:48:02 +0100
Subject: [Buildroot] [PATCH 32/51] package/gcc: use the Xtensa variables
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <670a778a9c7e80baef7d29fbf7e4fb97ef314e6b.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... instead of re-computing them over-and-over-again.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc-common.mk              | 7 ++-----
 package/gcc/gcc-initial/gcc-initial.mk | 2 +-
 package/gcc/gcc/gcc.mk                 | 4 ++--
 3 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/package/gcc/gcc-common.mk b/package/gcc/gcc-common.mk
index 73e3b72..b78dd84 100644
--- a/package/gcc/gcc-common.mk
+++ b/package/gcc/gcc-common.mk
@@ -24,11 +24,8 @@ endif
 #
 # Xtensa special hook
 #
-
-HOST_GCC_COMMON_XTENSA_OVERLAY_TAR = $(BR2_XTENSA_OVERLAY_DIR)/xtensa_$(call qstrip,$(BR2_XTENSA_CORE_NAME)).tar
-
 define HOST_GCC_COMMON_XTENSA_OVERLAY_EXTRACT
-	tar xf $(HOST_GCC_COMMON_XTENSA_OVERLAY_TAR) -C $(@D) --strip-components=1 gcc
+	tar xf $(ARCH_XTENSA_OVERLAY_TAR) -C $(@D) --strip-components=1 gcc
 endef
 
 #
@@ -246,7 +243,7 @@ HOST_GCC_COMMON_CCACHE_HASH_FILES += \
 		$(addsuffix $((PKG)_RAWNAME)/$(HOST_GCC_COMMON_VERSION)/*.patch,$(BR2_GLOBAL_PATCH_DIR)) \
 		$(addsuffix $((PKG)_RAWNAME)/*.patch,$(BR2_GLOBAL_PATCH_DIR))))
 ifeq ($(BR2_xtensa),y)
-HOST_GCC_COMMON_CCACHE_HASH_FILES += $(HOST_GCC_COMMON_XTENSA_OVERLAY_TAR)
+HOST_GCC_COMMON_CCACHE_HASH_FILES += $(ARCH_XTENSA_OVERLAY_TAR)
 endif
 ifeq ($(ARCH),powerpc)
 ifneq ($(BR2_SOFT_FLOAT),)
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 6c7ec67..709b6a7 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -15,7 +15,7 @@ HOST_GCC_INITIAL_DEPENDENCIES = $(HOST_GCC_COMMON_DEPENDENCIES)
 HOST_GCC_INITIAL_EXCLUDES = $(HOST_GCC_COMMON_EXCLUDES)
 HOST_GCC_INITIAL_POST_EXTRACT_HOOKS += HOST_GCC_COMMON_FAKE_TESTSUITE
 
-ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
+ifneq ($(ARCH_XTENSA_CORE_NAME),)
 HOST_GCC_INITIAL_POST_EXTRACT_HOOKS += HOST_GCC_COMMON_XTENSA_OVERLAY_EXTRACT
 endif
 
diff --git a/package/gcc/gcc/gcc.mk b/package/gcc/gcc/gcc.mk
index dddd361..57f316b 100644
--- a/package/gcc/gcc/gcc.mk
+++ b/package/gcc/gcc/gcc.mk
@@ -25,12 +25,12 @@ HOST_GCC_DEPENDENCIES = \
 HOST_GCC_EXCLUDES = $(HOST_GCC_COMMON_EXCLUDES)
 HOST_GCC_POST_EXTRACT_HOOKS += HOST_GCC_COMMON_FAKE_TESTSUITE
 
-ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
+ifneq ($(ARCH_XTENSA_CORE_NAME),)
 
 HOST_GCC_POST_EXTRACT_HOOKS += HOST_GCC_COMMON_XTENSA_OVERLAY_EXTRACT
 
 define HOST_GCC_XTENSA_OVERLAY_LEGAL_INFO
-	$(Q)$(call hardlink-copy,$(HOST_GCC_COMMON_XTENSA_OVERLAY_TAR),\
+	$(Q)$(call hardlink-copy,$(ARCH_XTENSA_OVERLAY_TAR),\
 				 $(HOST_GCC_REDIST_SOURCES_DIR))
 endef
 HOST_GCC_POST_LEGAL_INFO_HOOKS += HOST_GCC_XTENSA_OVERLAY_LEGAL_INFO
-- 
1.9.1
