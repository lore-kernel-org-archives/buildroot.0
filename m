From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 19:33:15 +0200
Subject: [Buildroot] [PATCH 01/35] linux: use the package infrastructure to
	download patches
In-Reply-To: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1427650429-9293-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The linux package has a special handling of patches, with quite a bit
of legacy in it. A problem caused by this special handling is that the
linux package calls directly the DOWNLOAD_WGET macro, which means that
the package infrastructure isn't aware of which patches get
downloaded, and it prevents doing changes inside the package download
infrastructure.

This commit changes the handling of patches in the linux package in
the following way:

 * The LINUX_PATCHES variable is kept as is: it lists all the patches
   mentioned in the Config.in option BR2_LINUX_KERNEL_PATCH. This
   option can contain http://, ftp://, https:// URLs, path to local
   files or local directories.

   This variable is *not* used by the generic package infrastructure,
   so it is purely internal to the Linux package.

 * The LINUX_PATCH variable is now filled in with the list of patches
   that should be downloaded. It is derived from LINUX_PATCHES by
   filtering the patches that have http://, ftp:// or https:// in
   their path. Since <pkg>_PATCH is handled by the package
   infrastructure, it means that those patches are now automatically
   downloaded and applied by the package infrastructure.

 * The LINUX_APPLY_PATCHES hook is renamed to
   LINUX_APPLY_LOCAL_PATCHES, because it is now only responsible of
   applying local patches: remote patches are handled by
   LINUX_PATCH. The implementation of the hook is changed to filter
   out the patches that have already taken care of by LINUX_PATCH, so
   that we only iterate through the list of local patches or local
   patch directories.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
---
 linux/linux.mk | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 5a0ba01..c25d106 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -42,6 +42,11 @@ endif
 
 LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
 
+# We rely on the generic package infrastructure to download and apply
+# remote patches (downloaded from ftp, http or https). For local
+# patches, we have a custom post-patch hook below.
+LINUX_PATCH = $(filter ftp://% http://% https://%,$(LINUX_PATCHES))
+
 LINUX_INSTALL_IMAGES = YES
 LINUX_DEPENDENCIES += host-kmod host-lzop
 
@@ -150,29 +155,17 @@ else
 LINUX_IMAGE_PATH = $(KERNEL_ARCH_PATH)/boot/$(LINUX_IMAGE_NAME)
 endif # BR2_LINUX_KERNEL_VMLINUX
 
-define LINUX_DOWNLOAD_PATCHES
-	$(if $(LINUX_PATCHES),
-		@$(call MESSAGE,"Download additional patches"))
-	$(foreach patch,$(filter ftp://% http://% https://%,$(LINUX_PATCHES)),\
-		$(call DOWNLOAD_WGET,$(patch),$(notdir $(patch)))$(sep))
-endef
-
-LINUX_POST_DOWNLOAD_HOOKS += LINUX_DOWNLOAD_PATCHES
-
-define LINUX_APPLY_PATCHES
-	for p in $(LINUX_PATCHES) ; do \
-		if echo $$p | grep -q -E "^ftp://|^http://|^https://" ; then \
-			$(APPLY_PATCHES) $(@D) $(DL_DIR) `basename $$p` || exit 1; \
-		elif test -d $$p ; then \
-			$(APPLY_PATCHES) $(@D) $$p linux-\*.patch || exit 1; \
+define LINUX_APPLY_LOCAL_PATCHES
+	for p in $(filter-out ftp://% http://% https://%,$(LINUX_PATCHES)) ; do \
+		if test -d $$p ; then \
+			$(APPLY_PATCHES) $(@D) $$p linux-\*.patch || exit 1 ; \
 		else \
 			$(APPLY_PATCHES) $(@D) `dirname $$p` `basename $$p` || exit 1; \
 		fi \
 	done
 endef
 
-LINUX_POST_PATCH_HOOKS += LINUX_APPLY_PATCHES
-
+LINUX_POST_PATCH_HOOKS += LINUX_APPLY_LOCAL_PATCHES
 
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
 KERNEL_SOURCE_CONFIG = $(KERNEL_ARCH_PATH)/configs/$(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
-- 
2.1.0
