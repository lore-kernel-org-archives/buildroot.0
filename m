From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 23:07:58 +0200
Subject: [Buildroot] [git commit] Makefile: rename USER_HOOKS_EXTRA_ENV to
	EXTRA_ENV
Message-ID: <20140417210807.AA5B59C845@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9806bf5a9a2705a17b574ac4d376fba9a148b8bb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile               |    4 ++--
 package/Makefile.in    |    4 ++--
 package/pkg-generic.mk |    2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 0f8ca72..42adf7c 100644
--- a/Makefile
+++ b/Makefile
@@ -573,7 +573,7 @@ endif
 
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
 		$(call MESSAGE,"Executing post-build script $(s)"); \
-		$(USER_HOOKS_EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
+		$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
 ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
 LOCALE_WHITELIST=$(BUILD_DIR)/locales.nopurge
@@ -619,7 +619,7 @@ endif
 target-post-image: $(TARGETS_ROOTFS) target-finalize
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
 		$(call MESSAGE,"Executing post-image script $(s)"); \
-		$(USER_HOOKS_EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
+		$(EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
 toolchain-eclipse-register:
 	./support/scripts/eclipse-register-toolchain `readlink -f $(O)` $(notdir $(TARGET_CROSS)) $(BR2_ARCH)
diff --git a/package/Makefile.in b/package/Makefile.in
index 31eaaf2..c34a3bf 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -297,11 +297,11 @@ HOST_MAKE_ENV=PATH=$(BR_PATH) \
 		PKG_CONFIG_SYSROOT_DIR="/" \
 		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig"
 
-# This extra environment we can not export ourselves (eg. because some
+# This is extra environment we can not export ourselves (eg. because some
 # packages use that variable internally, eg. uboot), so we have to
 # explicitly pass it to user-supplied external hooks (eg. post-build,
 # post-images)
-USER_HOOKS_EXTRA_ENV=\
+EXTRA_ENV=\
 	PATH=$(BR_PATH) \
 	BUILD_DIR=$(BUILD_DIR)
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index c162902..8a62d4c 100644
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
