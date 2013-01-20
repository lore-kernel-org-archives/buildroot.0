From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jan 2013 00:52:18 +0100
Subject: [Buildroot] [RFC v1 09/14] barebox: support out of tree build
In-Reply-To: <1358725943-31485-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358725943-31485-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1358725943-31485-10-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For Barebox, a minor patch is needed to make out-of-tree build
possible when the source directory is read-only. This patch can
probably be merged upstream.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-build-when-source-directory-is-read-only.patch |   42 ++++++++++++++++++++
 boot/barebox/barebox.mk                            |    7 ++--
 2 files changed, 46 insertions(+), 3 deletions(-)
 create mode 100644 boot/barebox/barebox-genenv-fix-build-when-source-directory-is-read-only.patch

diff --git a/boot/barebox/barebox-genenv-fix-build-when-source-directory-is-read-only.patch b/boot/barebox/barebox-genenv-fix-build-when-source-directory-is-read-only.patch
new file mode 100644
index 0000000..29cb496
--- /dev/null
+++ b/boot/barebox/barebox-genenv-fix-build-when-source-directory-is-read-only.patch
@@ -0,0 +1,42 @@
+From e4bc9ba958c2aba5b2830724457f3a70f014cfc5 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 20 Jan 2013 17:25:55 +0100
+Subject: [PATCH] genenv: fix build when source directory is read-only
+
+When doing an out-of-tree build where the source directory of Barebox
+is read-only (i.e all files have no write permission), the build of
+Barebox halts in scripts/genenv, because it removes files for which it
+doesn't have write permissions. Those files are being removed from the
+temporary directory .barebox_default_env/ once the environnement is
+generated. However, since the files have been copied from the source
+directory, they carry the permissions without write access. This leads
+a regular rm to wait interactively for the user to confirm the
+suppression, even those removal is possible since we have write access
+to the containing directory.
+
+To solve this, we explicitly re-add write permissions on the copied
+files and directories into this temporary directory.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ scripts/genenv |    4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/scripts/genenv b/scripts/genenv
+index 374db6d..3d79c63 100755
+--- a/scripts/genenv
++++ b/scripts/genenv
+@@ -24,6 +24,10 @@ for i in $*; do
+ done
+ )
+ 
++# Ensure we have write permissions, in case the source directory is
++# read-only.
++chmod +w -R $tempdir
++
+ find $tempdir -name '.svn' -o -name '*~' | xargs --no-run-if-empty rm -r
+ 
+ $objtree/scripts/bareboxenv -s $tempdir $target
+-- 
+1.7.9.5
+
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 143338e..97acac5 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -23,6 +23,7 @@ endif
 BAREBOX_DEPENDENCIES = host-lzop
 BAREBOX_LICENSE = GPLv2 with exceptions
 BAREBOX_LICENSE_FILES = COPYING
+BAREBOX_SUPPORTS_OUT_OF_TREE = YES
 
 ifneq ($(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR)),)
 define BAREBOX_APPLY_CUSTOM_PATCHES
@@ -50,14 +51,14 @@ BAREBOX_MAKE_FLAGS = ARCH=$(BAREBOX_ARCH) CROSS_COMPILE="$(CCACHE) $(TARGET_CROS
 
 
 ifeq ($(BR2_TARGET_BAREBOX_USE_DEFCONFIG),y)
-BAREBOX_SOURCE_CONFIG = $(@D)/arch/$(BAREBOX_ARCH)/configs/$(call qstrip,$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))_defconfig
+BAREBOX_SOURCE_CONFIG = $(BAREBOX_SRCDIR)/arch/$(BAREBOX_ARCH)/configs/$(call qstrip,$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))_defconfig
 else ifeq ($(BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG),y)
 BAREBOX_SOURCE_CONFIG = $(BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE)
 endif
 
 define BAREBOX_CONFIGURE_CMDS
-	cp $(BAREBOX_SOURCE_CONFIG) $(@D)/arch/$(BAREBOX_ARCH)/configs/buildroot_defconfig
-	$(TARGET_MAKE_ENV) $(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(@D) buildroot_defconfig
+	cp $(BAREBOX_SOURCE_CONFIG) $(@D)/.config
+	yes '' | $(TARGET_MAKE_ENV) $(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(BAREBOX_SRCDIR) O=$(@D) oldconfig
 endef
 
 ifeq ($(BR2_TARGET_BAREBOX_BAREBOXENV),y)
-- 
1.7.9.5
