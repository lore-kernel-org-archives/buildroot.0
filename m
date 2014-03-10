From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Mar 2014 21:51:33 +0100
Subject: [Buildroot] [PATCH 01/12] Makefile: rename USER_HOOKS_EXTRA_ENV to
	EXTRA_ENV
In-Reply-To: <cover.1394484283.git.yann.morin.1998@free.fr>
References: <cover.1394484283.git.yann.morin.1998@free.fr>
Message-ID: <d4173f78ac3d7c29a2822bf9f21bee9ef51c5633.1394484283.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

This variable contains extra environment variables that we can not export
since they are clashing with some build systems (eg. BUILD_DIR with
u-boot).

So, we may need these variables for uses other than the user's hooks
for instrumentation. For example, we'll use them later on to export
BUILD_DIR to the download helper scripts.

Fix comment, too.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
---
 Makefile               | 4 ++--
 package/Makefile.in    | 4 ++--
 package/pkg-generic.mk | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 2b13917..c366247 100644
--- a/Makefile
+++ b/Makefile
@@ -575,7 +575,7 @@ endif
 
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
 		$(call MESSAGE,"Executing post-build script $(s)"); \
-		$(USER_HOOKS_EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
+		$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
 ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
 LOCALE_WHITELIST=$(BUILD_DIR)/locales.nopurge
@@ -621,7 +621,7 @@ endif
 target-post-image: $(TARGETS_ROOTFS) target-finalize
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
 		$(call MESSAGE,"Executing post-image script $(s)"); \
-		$(USER_HOOKS_EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
+		$(EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
 toolchain-eclipse-register:
 	./support/scripts/eclipse-register-toolchain `readlink -f $(O)` $(notdir $(TARGET_CROSS)) $(BR2_ARCH)
diff --git a/package/Makefile.in b/package/Makefile.in
index 454f614..2c0b8da 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -277,11 +277,11 @@ HOST_MAKE_ENV=PATH=$(HOST_PATH) \
 		PKG_CONFIG_SYSROOT_DIR="/" \
 		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig"
 
-# This extra environment we can not export ourselves (eg. because some
+# This is extra environment we can not export ourselves (eg. because some
 # packages use that variable internally, eg. uboot), so we have to
 # explicitly pass it to user-supplied external hooks (eg. post-build,
 # post-images)
-USER_HOOKS_EXTRA_ENV=\
+EXTRA_ENV=\
 	BUILD_DIR=$(BUILD_DIR)
 
 ################################################################################
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 339c3eb..3618332 100644
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
1.8.3.2
