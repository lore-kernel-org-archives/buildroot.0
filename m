From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Mar 2017 15:49:45 +0200
Subject: [Buildroot] [git commit] package/gcc: use the Xtensa variables
Message-ID: <20170326135524.7C8C6819C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=725f05967d61cc42cbb8d11401b43c479c5d7c2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

... instead of re-computing them over-and-over-again.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc-final/gcc-final.mk     | 2 +-
 package/gcc/gcc-initial/gcc-initial.mk | 2 +-
 package/gcc/gcc.mk                     | 7 ++-----
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index c9ee476..a15d837 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -15,7 +15,7 @@ HOST_GCC_FINAL_DEPENDENCIES = \
 HOST_GCC_FINAL_EXCLUDES = $(HOST_GCC_EXCLUDES)
 HOST_GCC_FINAL_POST_EXTRACT_HOOKS += HOST_GCC_FAKE_TESTSUITE
 
-ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
+ifneq ($(ARCH_XTENSA_CORE_NAME),)
 HOST_GCC_FINAL_POST_EXTRACT_HOOKS += HOST_GCC_XTENSA_OVERLAY_EXTRACT
 endif
 
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index a51e29c..e1a2241 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -13,7 +13,7 @@ HOST_GCC_INITIAL_DEPENDENCIES = $(HOST_GCC_COMMON_DEPENDENCIES)
 HOST_GCC_INITIAL_EXCLUDES = $(HOST_GCC_EXCLUDES)
 HOST_GCC_INITIAL_POST_EXTRACT_HOOKS += HOST_GCC_FAKE_TESTSUITE
 
-ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
+ifneq ($(ARCH_XTENSA_CORE_NAME),)
 HOST_GCC_INITIAL_POST_EXTRACT_HOOKS += HOST_GCC_XTENSA_OVERLAY_EXTRACT
 endif
 
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 241f357..e50e1e0 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -24,11 +24,8 @@ endif
 #
 # Xtensa special hook
 #
-
-HOST_GCC_XTENSA_OVERLAY_TAR = $(BR2_XTENSA_OVERLAY_DIR)/xtensa_$(call qstrip,$(BR2_XTENSA_CORE_NAME)).tar
-
 define HOST_GCC_XTENSA_OVERLAY_EXTRACT
-	tar xf $(HOST_GCC_XTENSA_OVERLAY_TAR) -C $(@D) --strip-components=1 gcc
+	tar xf $(ARCH_XTENSA_OVERLAY_TAR) -C $(@D) --strip-components=1 gcc
 endef
 
 #
@@ -307,7 +304,7 @@ HOST_GCC_COMMON_CCACHE_HASH_FILES += \
 		$(addsuffix /gcc/$(GCC_VERSION)/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))) \
 		$(addsuffix /gcc/*.patch,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)))))
 ifeq ($(BR2_xtensa),y)
-HOST_GCC_COMMON_CCACHE_HASH_FILES += $(HOST_GCC_XTENSA_OVERLAY_TAR)
+HOST_GCC_COMMON_CCACHE_HASH_FILES += $(ARCH_XTENSA_OVERLAY_TAR)
 endif
 ifeq ($(ARCH),powerpc)
 ifneq ($(BR2_SOFT_FLOAT),)
