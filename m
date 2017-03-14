From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 14 Mar 2017 11:30:44 -0700
Subject: [Buildroot] [PATCH 15/23] package/gcc: use the Xtensa macro
	generators
In-Reply-To: <1489516252-3803-1-git-send-email-jcmvbkbc@gmail.com>
References: <1489516252-3803-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1489516252-3803-16-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/gcc/gcc-final/gcc-final.mk     | 5 ++---
 package/gcc/gcc-initial/gcc-initial.mk | 5 ++---
 package/gcc/gcc.mk                     | 7 -------
 3 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index a15d837..8eaabb4 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -15,9 +15,8 @@ HOST_GCC_FINAL_DEPENDENCIES = \
 HOST_GCC_FINAL_EXCLUDES = $(HOST_GCC_EXCLUDES)
 HOST_GCC_FINAL_POST_EXTRACT_HOOKS += HOST_GCC_FAKE_TESTSUITE
 
-ifneq ($(ARCH_XTENSA_CORE_NAME),)
-HOST_GCC_FINAL_POST_EXTRACT_HOOKS += HOST_GCC_XTENSA_OVERLAY_EXTRACT
-endif
+HOST_GCC_FINAL_ARCH_XTENSA_OVERLAY_COMPONENT = gcc
+$(eval $(host-arch-xtensa-overlay))
 
 HOST_GCC_FINAL_POST_PATCH_HOOKS += HOST_GCC_APPLY_PATCHES
 
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index e1a2241..48492d7 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -13,9 +13,8 @@ HOST_GCC_INITIAL_DEPENDENCIES = $(HOST_GCC_COMMON_DEPENDENCIES)
 HOST_GCC_INITIAL_EXCLUDES = $(HOST_GCC_EXCLUDES)
 HOST_GCC_INITIAL_POST_EXTRACT_HOOKS += HOST_GCC_FAKE_TESTSUITE
 
-ifneq ($(ARCH_XTENSA_CORE_NAME),)
-HOST_GCC_INITIAL_POST_EXTRACT_HOOKS += HOST_GCC_XTENSA_OVERLAY_EXTRACT
-endif
+HOST_GCC_INITIAL_ARCH_XTENSA_OVERLAY_COMPONENT = gcc
+$(eval $(host-arch-xtensa-overlay))
 
 HOST_GCC_INITIAL_POST_PATCH_HOOKS += HOST_GCC_APPLY_PATCHES
 
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index b52f945..fc54247 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -22,13 +22,6 @@ GCC_SOURCE = gcc-$(GCC_VERSION).tar.bz2
 endif
 
 #
-# Xtensa special hook
-#
-define HOST_GCC_XTENSA_OVERLAY_EXTRACT
-	$(call arch-xtensa-overlay-extract,$(@D),gcc)
-endef
-
-#
 # Apply patches
 #
 
-- 
2.1.4
