From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Apr 2013 07:47:54 +0200
Subject: [Buildroot] [git commit] uboot: simplify patch wildcard for
	BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
Message-ID: <20130411055207.B80D39B557@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=964f36fe06a9fdd7be4b5b942176454a6cc052e4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To match the logic we have for BR2_LINUX_KERNEL_PATCH. The user has
already specified a custom patch directory, so we don't need to be
so specific about the what file names we accept, and it becomes quite
cumbersome when a custom git version is used.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/uboot/Config.in |    2 +-
 boot/uboot/uboot.mk  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index bc5ce19..d377fd1 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -73,7 +73,7 @@ config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
 	help
 	  If your board requires custom patches, add the path to the
 	  directory containing the patches here. The patches must be
-	  named uboot-<version>-<something>.patch.
+	  named uboot-<something>.patch.
 
 	  Most users may leave this empty
 
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index c337e75..004bdf2 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -64,7 +64,7 @@ endef
 ifneq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR)),)
 define UBOOT_APPLY_CUSTOM_PATCHES
 	support/scripts/apply-patches.sh $(@D) $(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR) \
-		uboot-$(UBOOT_VERSION)-\*.patch
+		uboot-\*.patch
 endef
 
 UBOOT_POST_PATCH_HOOKS += UBOOT_APPLY_CUSTOM_PATCHES
