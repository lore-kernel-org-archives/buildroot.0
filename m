From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:48:16 +0100
Subject: [Buildroot] [PATCH 46/51] package/gcc: use the Xtensa macro
	generators
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <db13925828e9e262fec6bcee0ea9e226e0dd27fc.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
CcL: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc-common.mk              |  7 -------
 package/gcc/gcc-initial/gcc-initial.mk |  5 ++---
 package/gcc/gcc/gcc.mk                 | 12 ++----------
 3 files changed, 4 insertions(+), 20 deletions(-)

diff --git a/package/gcc/gcc-common.mk b/package/gcc/gcc-common.mk
index 35f33e5..5f343a5 100644
--- a/package/gcc/gcc-common.mk
+++ b/package/gcc/gcc-common.mk
@@ -22,13 +22,6 @@ HOST_GCC_COMMON_SOURCE = gcc-$(HOST_GCC_COMMON_VERSION).tar.bz2
 endif
 
 #
-# Xtensa special hook
-#
-define HOST_GCC_COMMON_XTENSA_OVERLAY_EXTRACT
-	$(call arch-xtensa-overlay-extract,$(@D),gcc)
-endef
-
-#
 # Apply patches
 #
 
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 709b6a7..d2d2d4b 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -15,9 +15,8 @@ HOST_GCC_INITIAL_DEPENDENCIES = $(HOST_GCC_COMMON_DEPENDENCIES)
 HOST_GCC_INITIAL_EXCLUDES = $(HOST_GCC_COMMON_EXCLUDES)
 HOST_GCC_INITIAL_POST_EXTRACT_HOOKS += HOST_GCC_COMMON_FAKE_TESTSUITE
 
-ifneq ($(ARCH_XTENSA_CORE_NAME),)
-HOST_GCC_INITIAL_POST_EXTRACT_HOOKS += HOST_GCC_COMMON_XTENSA_OVERLAY_EXTRACT
-endif
+HOST_GCC_INITIAL_ARCH_XTENSA_OVERLAY_COMPONENT = gcc
+$(eval $(host-arch-xtensa-overlay))
 
 HOST_GCC_INITIAL_POST_PATCH_HOOKS += HOST_GCC_COMMON_APPLY_POWERPC_PATCH
 
diff --git a/package/gcc/gcc/gcc.mk b/package/gcc/gcc/gcc.mk
index ce6402a..ee56f47 100644
--- a/package/gcc/gcc/gcc.mk
+++ b/package/gcc/gcc/gcc.mk
@@ -25,16 +25,8 @@ HOST_GCC_DEPENDENCIES = \
 HOST_GCC_EXCLUDES = $(HOST_GCC_COMMON_EXCLUDES)
 HOST_GCC_POST_EXTRACT_HOOKS += HOST_GCC_COMMON_FAKE_TESTSUITE
 
-ifneq ($(ARCH_XTENSA_CORE_NAME),)
-
-HOST_GCC_POST_EXTRACT_HOOKS += HOST_GCC_COMMON_XTENSA_OVERLAY_EXTRACT
-
-define HOST_GCC_XTENSA_OVERLAY_LEGAL_INFO
-	$(Q)$(call arch-xtensa-overlay-legal-info,$(HOST_GCC_REDIST_SOURCES_DIR))
-endef
-HOST_GCC_POST_LEGAL_INFO_HOOKS += HOST_GCC_XTENSA_OVERLAY_LEGAL_INFO
-
-endif
+HOST_GCC_ARCH_XTENSA_OVERLAY_COMPONENT = gcc
+$(eval $(host-arch-xtensa-overlay))
 
 HOST_GCC_POST_PATCH_HOOKS += HOST_GCC_COMMON_APPLY_POWERPC_PATCH
 
-- 
1.9.1
