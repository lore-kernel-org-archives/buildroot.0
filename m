From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Jan 2014 00:44:44 +0100
Subject: [Buildroot] [PATCH 1/6] Makefile: rename USER_HOOKS_EXTRA_ENV to
	EXTRA_ENV
In-Reply-To: <cover.1389569992.git.yann.morin.1998@free.fr>
References: <cover.1389569992.git.yann.morin.1998@free.fr>
Message-ID: <75d9eefa9b8ce7e393b6283b80fe7f1e6129db42.1389569992.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

This variable contains extra envirnoment variables that we can not export
since they are clashing with some build systems (eg. BUILD_DIR with
u-boot).

So, we may need these variables for other ueses than the user's hooks
for instrumentation. For example, we'll use them later on to export
BUILD_DIR to the download helper scripts.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile               | 4 ++--
 package/Makefile.in    | 2 +-
 package/pkg-generic.mk | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 7624f59..e22f1e4 100644
--- a/Makefile
+++ b/Makefile
@@ -552,7 +552,7 @@ endif
 
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
 		$(call MESSAGE,"Executing post-build script $(s)"); \
-		$(USER_HOOKS_EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
+		$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
 ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
 LOCALE_WHITELIST=$(BUILD_DIR)/locales.nopurge
@@ -598,7 +598,7 @@ endif
 target-post-image:
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
 		$(call MESSAGE,"Executing post-image script $(s)"); \
-		$(USER_HOOKS_EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
+		$(EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
 toolchain-eclipse-register:
 	./support/scripts/eclipse-register-toolchain `readlink -f $(O)` $(notdir $(TARGET_CROSS)) $(BR2_ARCH)
diff --git a/package/Makefile.in b/package/Makefile.in
index f5d6289..b089f32 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -281,7 +281,7 @@ HOST_MAKE_ENV=PATH=$(HOST_PATH) \
 # packages use that variable internally, eg. uboot), so we have to
 # explicitly pass it to user-supplied external hooks (eg. post-build,
 # post-images)
-USER_HOOKS_EXTRA_ENV=\
+EXTRA_ENV=\
 	BUILD_DIR=$(BUILD_DIR)
 
 ################################################################################
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 1b99c2a..e6fc558 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -58,7 +58,7 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
 # User-supplied script
 define step_user
 	@$(foreach user_hook, $(BR2_INSTRUMENTATION_SCRIPTS), \
-		$(USER_HOOKS_EXTRA_ENV) $(user_hook) "$(1)" "$(2)" "$(3)"$(sep))
+		$(EXTRA_ENV) $(user_hook) "$(1)" "$(2)" "$(3)"$(sep))
 endef
 ifneq ($(BR2_INSTRUMENTATION_SCRIPTS),)
 GLOBAL_INSTRUMENTATION_HOOKS += step_user
-- 
1.8.1.2
