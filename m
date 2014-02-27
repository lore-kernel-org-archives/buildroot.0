From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 27 Feb 2014 09:07:20 +0400
Subject: [Buildroot] [PATCH] gcc: fix xtensa overlay application
Message-ID: <1393477640-14319-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gcc build scripts use wrong variable name to specify xtensa overlay
application command. As a result gcc is built with the default overlay,
which leads to obscure failures later in the build process.

xtensa toolchain needs an additional configuration for a specific core
variant we're building for. This configuration is called 'overlay' and
is an archive with files for binutils, gcc and gdb that replace
corresponding files in toolchain components.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/gcc/gcc-final/gcc-final.mk               | 2 +-
 package/gcc/gcc-initial/gcc-initial.mk           | 2 +-
 package/gcc/gcc-intermediate/gcc-intermediate.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index ecc4068..622dcf2 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -15,7 +15,7 @@ HOST_GCC_FINAL_DEPENDENCIES = \
 HOST_GCC_FINAL_EXTRACT_CMDS = $(HOST_GCC_EXTRACT_CMDS)
 
 ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
-HOST_GCC_FINAL_POST_EXTRACT_CMDS += HOST_GCC_FINAL_XTENSA_OVERLAY_EXTRACT
+HOST_GCC_FINAL_POST_EXTRACT_HOOKS += HOST_GCC_XTENSA_OVERLAY_EXTRACT
 endif
 
 HOST_GCC_FINAL_POST_PATCH_HOOKS += HOST_GCC_APPLY_PATCHES
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 0eb492f..bc5ad26 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -13,7 +13,7 @@ HOST_GCC_INITIAL_DEPENDENCIES = $(HOST_GCC_COMMON_DEPENDENCIES)
 HOST_GCC_INITIAL_EXTRACT_CMDS = $(HOST_GCC_EXTRACT_CMDS)
 
 ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
-HOST_GCC_INITIAL_POST_EXTRACT_CMDS += HOST_GCC_XTENSA_OVERLAY_EXTRACT
+HOST_GCC_INITIAL_POST_EXTRACT_HOOKS += HOST_GCC_XTENSA_OVERLAY_EXTRACT
 endif
 
 HOST_GCC_INITIAL_POST_PATCH_HOOKS += HOST_GCC_APPLY_PATCHES
diff --git a/package/gcc/gcc-intermediate/gcc-intermediate.mk b/package/gcc/gcc-intermediate/gcc-intermediate.mk
index 2105cec..db84d18 100644
--- a/package/gcc/gcc-intermediate/gcc-intermediate.mk
+++ b/package/gcc/gcc-intermediate/gcc-intermediate.mk
@@ -15,7 +15,7 @@ HOST_GCC_INTERMEDIATE_DEPENDENCIES = \
 HOST_GCC_INTERMEDIATE_EXTRACT_CMDS = $(HOST_GCC_EXTRACT_CMDS)
 
 ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
-HOST_GCC_INTERMEDIATE_POST_EXTRACT_CMDS += HOST_GCC_XTENSA_OVERLAY_EXTRACT
+HOST_GCC_INTERMEDIATE_POST_EXTRACT_HOOKS += HOST_GCC_XTENSA_OVERLAY_EXTRACT
 endif
 
 HOST_GCC_INTERMEDIATE_POST_PATCH_HOOKS += HOST_GCC_APPLY_PATCHES
-- 
1.8.1.4
