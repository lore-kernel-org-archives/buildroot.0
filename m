From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Fri, 17 Apr 2015 16:26:13 -0400
Subject: [Buildroot] [PATCH 1/3] uboot: add support for patch files and URLs
Message-ID: <1429302375-12275-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The existing u-boot patch option only allowed directories to be
specified. As suggested by Arnout Vandecappelle, hooking into the
generic patch framework enables files and URLs to be specified. The
downside is that patch directories need to be converted to lists of
files to use this approach.

This change is useful for Intel Edison support, so that Intel's u-boot
patch can be downloaded rather than stored in the Buildroot source tree.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 boot/uboot/Config.in | 8 ++++++++
 boot/uboot/uboot.mk  | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 3f39ee8..32fcb21 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -79,6 +79,14 @@ config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
 
 	  Most users may leave this empty
 
+config BR2_TARGET_UBOOT_PATCHES
+	string "custom patches"
+	help
+	  If your board requires custom patches, add a list of patches
+	  here.
+
+	  Most users may leave this empty
+
 choice
 	prompt "U-Boot binary format"
 	default BR2_TARGET_UBOOT_FORMAT_BIN
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 6b152ca..e9f90a2 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -101,6 +101,8 @@ endef
 UBOOT_POST_PATCH_HOOKS += UBOOT_APPLY_CUSTOM_PATCHES
 endif
 
+UBOOT_PATCH += $(call qstrip,$(BR2_TARGET_UBOOT_PATCHES))
+
 define UBOOT_CONFIGURE_CMDS
 	$(TARGET_CONFIGURE_OPTS) 	\
 		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS)		\
-- 
1.9.1
