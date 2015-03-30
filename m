From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 23:38:13 +0200
Subject: [Buildroot] [git commit] linux: use the package infrastructure to
	download patches
Message-ID: <20150330214111.689258181B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7430a41801b2c1785723600ec84e0607e01923b3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

[Thomas: adjust comment in the code according to Yann comments.]

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 linux/linux.mk |   28 +++++++++++-----------------
 1 files changed, 11 insertions(+), 17 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 5a0ba01..3837e8d 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -42,6 +42,12 @@ endif
 
 LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
 
+# We rely on the generic package infrastructure to download and apply
+# remote patches (downloaded from ftp, http or https). For local
+# patches, we can't rely on that infrastructure, because there might
+# be directories in the patch list (unlike for other packages).
+LINUX_PATCH = $(filter ftp://% http://% https://%,$(LINUX_PATCHES))
+
 LINUX_INSTALL_IMAGES = YES
 LINUX_DEPENDENCIES += host-kmod host-lzop
 
@@ -150,29 +156,17 @@ else
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
