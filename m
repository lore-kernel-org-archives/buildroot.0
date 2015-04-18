From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Sat, 18 Apr 2015 16:27:42 -0400
Subject: [Buildroot] [PATCH v2 1/3] uboot: add support for patch files and
	URLs
Message-ID: <1429388864-15377-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The existing u-boot patch option only allowed directories to be
specified. This adds support for URLs using similar code as found
in linux/linux.mk. Local files are also handled now.

This change is useful for Intel Edison support, so that Intel's u-boot
patch can be downloaded rather than stored in the Buildroot source tree.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
Changes v1 -> v2:
  - Switch to linux.mk approach to patches (suggested by Thomas Petazzoni)

 boot/uboot/Config.in | 10 ++++++++++
 boot/uboot/uboot.mk  | 20 ++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 3f39ee8..768daa7 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -79,6 +79,16 @@ config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR

 	  Most users may leave this empty

+config BR2_TARGET_UBOOT_PATCH
+	string "Custom U-Boot patches"
+	help
+	  A space-separated list of patches to apply to U-Boot.
+	  Each patch can be described as an URL, a local file path,
+	  or a directory. In the case of a directory, all files
+	  matching *.patch in the directory will be applied.
+
+	  Most users may leave this empty
+
 choice
 	prompt "U-Boot binary format"
 	default BR2_TARGET_UBOOT_FORMAT_BIN
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 6b152ca..ca686ae 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -93,6 +93,8 @@ endef

 UBOOT_POST_EXTRACT_HOOKS += UBOOT_COPY_OLD_LICENSE_FILE

+# Prior to Buildroot 2015.05, only patch directories were supported. New
+# configurations use BR2_TARGET_UBOOT_PATCH instead.
 ifneq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR)),)
 define UBOOT_APPLY_CUSTOM_PATCHES
 	$(APPLY_PATCHES) $(@D) $(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR) \*.patch
@@ -101,6 +103,24 @@ endef
 UBOOT_POST_PATCH_HOOKS += UBOOT_APPLY_CUSTOM_PATCHES
 endif

+# Analogous code exists in linux/linux.mk. Basically, the generic
+# package infrastructure handles downloading and applying remote
+# patches. Local patches are handled depending on whether they are
+# directories or files.
+UBOOT_PATCHES = $(call qstrip,$(BR2_TARGET_UBOOT_PATCH))
+UBOOT_PATCH = $(filter ftp://% http://% https://%,$(UBOOT_PATCHES))
+
+define UBOOT_APPLY_LOCAL_PATCHES
+	for p in $(filter-out ftp://% http://% https://%,$(UBOOT_PATCHES)) ; do \
+		if test -d $$p ; then \
+			$(APPLY_PATCHES) $(@D) $$p \*.patch || exit 1 ; \
+		else \
+			$(APPLY_PATCHES) $(@D) `dirname $$p` `basename $$p` || exit 1; \
+		fi \
+	done
+endef
+UBOOT_POST_PATCH_HOOKS += UBOOT_APPLY_LOCAL_PATCHES
+
 define UBOOT_CONFIGURE_CMDS
 	$(TARGET_CONFIGURE_OPTS) 	\
 		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS)		\
--
1.9.1
