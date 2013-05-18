From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 18 May 2013 16:25:09 -0300
Subject: [Buildroot] [PATCH 1/2] mxs-bootlets: add support for custom patches
Message-ID: <1368905110-23303-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 boot/mxs-bootlets/Config.in       | 9 +++++++++
 boot/mxs-bootlets/mxs-bootlets.mk | 8 ++++++++
 2 files changed, 17 insertions(+)

diff --git a/boot/mxs-bootlets/Config.in b/boot/mxs-bootlets/Config.in
index 2222ff6..9dc2d37 100644
--- a/boot/mxs-bootlets/Config.in
+++ b/boot/mxs-bootlets/Config.in
@@ -37,6 +37,15 @@ config BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT_VERSION
 
 endif
 
+config BR2_TARGET_MXS_BOOTLETS_CUSTOM_PATCH_DIR
+	string "custom patch dir"
+	help
+	  If your board requires custom patches, add the path to the
+	  directory containing the patches here. The patches must be
+	  named mxs-bootlets-<something>.patch.
+
+	  Most users may leave this empty
+
 choice
 	prompt "Bootstream"
 	help
diff --git a/boot/mxs-bootlets/mxs-bootlets.mk b/boot/mxs-bootlets/mxs-bootlets.mk
index f93ff81..6b18fcc 100644
--- a/boot/mxs-bootlets/mxs-bootlets.mk
+++ b/boot/mxs-bootlets/mxs-bootlets.mk
@@ -4,6 +4,14 @@
 #
 #############################################################
 
+ifneq ($(call qstrip,$(BR2_TARGET_MXS_BOOTLETS_CUSTOM_PATCH_DIR)),)
+define MXS_BOOTLETS_APPLY_CUSTOM_PATCHES
+	support/scripts/apply-patches.sh $(@D) $(BR2_TARGET_MXS_BOOTLETS_CUSTOM_PATCH_DIR) \
+		mxs-bootlets-\*.patch
+endef
+MXS_BOOTLETS_POST_PATCH_HOOKS += MXS_BOOTLETS_APPLY_CUSTOM_PATCHES
+endif
+
 ifeq ($(BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL),y)
 	MXS_BOOTLETS_TARBALL = $(call qstrip,$(BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL_URL))
 	MXS_BOOTLETS_SITE = $(patsubst %/,%,$(dir $(MXS_BOOTLETS_TARBALL)))
-- 
1.8.1.5
