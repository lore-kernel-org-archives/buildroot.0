From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 11:04:59 +0200
Subject: [Buildroot] [git commit] packages: apply custom patches using
	*.patch instead of <pkg>-*.patch
Message-ID: <20150406093206.9EEB081963@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0eba4759fab9d093afacac77a0ac31f1f0b3cceb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Several packages have some logic to apply custom patches that existed
before the BR2_GLOBAL_PATCH_DIR mechanism: at91bootstrap,
at91bootstrap3, barebox, uboot and linux. Currently, the logic of
those packages to apply custom patches is to match
<package-name>-*.patch, which is not consistent with what we've done
for patches stored in the package directory, and for patches stored in
BR2_GLOBAL_PATCH_DIR: in such cases, we simply apply *.patch.

Therefore, for consistency reasons, this commit changes these packages
to also apply *.patch.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 boot/at91bootstrap/at91bootstrap.mk   |    3 +--
 boot/at91bootstrap3/at91bootstrap3.mk |    3 +--
 boot/barebox/barebox.mk               |    5 ++---
 boot/uboot/uboot.mk                   |    3 +--
 linux/Config.in                       |    2 +-
 linux/linux.mk                        |    2 +-
 6 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index 50bbc26..802e85e 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -24,8 +24,7 @@ endef
 
 ifneq ($(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_CUSTOM_PATCH_DIR)),)
 define AT91BOOTSTRAP_APPLY_CUSTOM_PATCHES
-	$(APPLY_PATCHES) $(@D) $(BR2_TARGET_AT91BOOTSTRAP_CUSTOM_PATCH_DIR) \
-		at91bootstrap-$(AT91BOOTSTRAP_VERSION)-\*.patch
+	$(APPLY_PATCHES) $(@D) $(BR2_TARGET_AT91BOOTSTRAP_CUSTOM_PATCH_DIR) \*.patch
 endef
 
 AT91BOOTSTRAP_POST_PATCH_HOOKS += AT91BOOTSTRAP_APPLY_CUSTOM_PATCHES
diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index 098e7bf..b780617 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -21,8 +21,7 @@ AT91BOOTSTRAP3_MAKE_OPTS = CROSS_COMPILE=$(TARGET_CROSS) DESTDIR=$(BINARIES_DIR)
 
 ifneq ($(AT91BOOTSTRAP3_CUSTOM_PATCH_DIR),)
 define AT91BOOTSTRAP3_APPLY_CUSTOM_PATCHES
-	$(APPLY_PATCHES) $(@D) $(AT91BOOTSTRAP3_CUSTOM_PATCH_DIR) \
-		at91bootstrap3-\*.patch
+	$(APPLY_PATCHES) $(@D) $(AT91BOOTSTRAP3_CUSTOM_PATCH_DIR) \*.patch
 endef
 
 AT91BOOTSTRAP3_POST_PATCH_HOOKS += AT91BOOTSTRAP3_APPLY_CUSTOM_PATCHES
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 5809fb0..98cb04e 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -26,9 +26,8 @@ BAREBOX_LICENSE_FILES = COPYING
 
 ifneq ($(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR)),)
 define BAREBOX_APPLY_CUSTOM_PATCHES
-	$(APPLY_PATCHES) $(@D) \
-		$(BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR) \
-		barebox-$(BAREBOX_VERSION)-\*.patch
+	$(APPLY_PATCHES) $(@D)
+		$(BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR) \*.patch
 endef
 
 BAREBOX_POST_PATCH_HOOKS += BAREBOX_APPLY_CUSTOM_PATCHES
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 630619a..df991e7 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -91,8 +91,7 @@ UBOOT_POST_EXTRACT_HOOKS += UBOOT_COPY_OLD_LICENSE_FILE
 
 ifneq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR)),)
 define UBOOT_APPLY_CUSTOM_PATCHES
-	$(APPLY_PATCHES) $(@D) $(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR) \
-		uboot-\*.patch
+	$(APPLY_PATCHES) $(@D) $(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR) \*.patch
 endef
 
 UBOOT_POST_PATCH_HOOKS += UBOOT_APPLY_CUSTOM_PATCHES
diff --git a/linux/Config.in b/linux/Config.in
index a1113dd..c83a3f5 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -129,7 +129,7 @@ config BR2_LINUX_KERNEL_PATCH
 	  A space-separated list of patches to apply to the
 	  kernel. Each patch can be described as an URL, a local file
 	  path, or a directory. In the case of a directory, all files
-	  matching linux-*.patch in the directory will be applied.
+	  matching *.patch in the directory will be applied.
 
 #
 # Configuration selection
diff --git a/linux/linux.mk b/linux/linux.mk
index 22fce35..21eb3c9 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -159,7 +159,7 @@ endif # BR2_LINUX_KERNEL_VMLINUX
 define LINUX_APPLY_LOCAL_PATCHES
 	for p in $(filter-out ftp://% http://% https://%,$(LINUX_PATCHES)) ; do \
 		if test -d $$p ; then \
-			$(APPLY_PATCHES) $(@D) $$p linux-\*.patch || exit 1 ; \
+			$(APPLY_PATCHES) $(@D) $$p \*.patch || exit 1 ; \
 		else \
 			$(APPLY_PATCHES) $(@D) `dirname $$p` `basename $$p` || exit 1; \
 		fi \
