From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue, 14 Oct 2014 11:23:47 +0200
Subject: [Buildroot] [PATCH 2/2] Change deps between $(TARGET_DIRS) and
	rootfs-dirs
In-Reply-To: <1413278627-8063-1-git-send-email-jezz@sysmic.org>
References: <1413278627-8063-1-git-send-email-jezz@sysmic.org>
Message-ID: <1413278627-8063-2-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently dependencies are:

  rootfs-dirs <- $(TARGET_DIR) <- toolchain and everything
        |             ^
         `------------'

This patch fix dependencies:

  $(TARGET_DIR) <- rootfs-dirs <- toolchain <- everything else

There is no more special handling for $(TARGET_DIR) in "dirs" target.

Test cases:

$ make clean && make rootfs-dirs
 -> OK

$ make clean && make rootfs-dirs-build
 -> OK

$ make clean && make toolchain
 -> OK

$ make rootfs-dirs-rebuild
 -> OK

$ rm output/build/rootfs-dirs-undefined/.stamp_target_installed && make toolchain
rootfs-dirs is reinstalled, but toolchain isn't

$ rm -r target && make toolchain
Do nothing

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 Makefile                                             | 4 +---
 system/rootfs-dirs/rootfs-dirs.mk                    | 1 -
 toolchain/toolchain-buildroot/toolchain-buildroot.mk | 2 +-
 toolchain/toolchain-external/toolchain-external.mk   | 2 ++
 4 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 828981c..da5f413 100644
--- a/Makefile
+++ b/Makefile
@@ -439,7 +439,7 @@ world: target-post-image
 # dependencies anywhere else
 #
 ################################################################################
-$(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
+$(BUILD_DIR) $(HOST_DIR) $(TARGET_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
 	@mkdir -p $@
 
 # We make a symlink lib32->lib or lib64->lib as appropriate
@@ -464,8 +464,6 @@ RSYNC_VCS_EXCLUSIONS = \
 	--exclude .svn --exclude .git --exclude .hg --exclude .bzr \
 	--exclude CVS
 
-$(TARGET_DIR): rootfs-dirs
-
 STRIP_FIND_CMD = find $(TARGET_DIR)
 ifneq (,$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS)))
 STRIP_FIND_CMD += \( $(call finddirclauses,$(TARGET_DIR),$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS))) \) -prune -o
diff --git a/system/rootfs-dirs/rootfs-dirs.mk b/system/rootfs-dirs/rootfs-dirs.mk
index 4a85dff..98f4606 100644
--- a/system/rootfs-dirs/rootfs-dirs.mk
+++ b/system/rootfs-dirs/rootfs-dirs.mk
@@ -18,7 +18,6 @@ endif
 TARGET_DIR_WARNING_FILE=$(TARGET_DIR)/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
 
 define ROOTFS_DIRS_INSTALL_ROOTFS_DIRS
-	@mkdir -p $(TARGET_DIR)
 	rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
 	   --chmod=Du+w --exclude .empty --exclude '*~' \
 	   $(TARGET_ROOTFS_DIRS)/ $(TARGET_DIR)/
diff --git a/toolchain/toolchain-buildroot/toolchain-buildroot.mk b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
index b30cc33..2984e91 100644
--- a/toolchain/toolchain-buildroot/toolchain-buildroot.mk
+++ b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
@@ -10,7 +10,7 @@ BR_LIBC = $(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_LIBC))
 # build of binutils, uClibc, kernel headers and all the intermediate
 # gcc steps.
 
-TOOLCHAIN_BUILDROOT_DEPENDENCIES = host-gcc-final
+TOOLCHAIN_BUILDROOT_DEPENDENCIES = host-gcc-final tootfs-dirs
 
 TOOLCHAIN_BUILDROOT_ADD_TOOLCHAIN_DEPENDENCY = NO
 
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index b7a0e60..ec3cb99 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -407,6 +407,8 @@ endif
 
 TOOLCHAIN_EXTERNAL_ADD_TOOLCHAIN_DEPENDENCY = NO
 
+TOOLCHAIN_EXTERNAL_DEPENDENCIES = rootfs-dirs
+
 TOOLCHAIN_EXTERNAL_INSTALL_STAGING = YES
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1),y)
-- 
1.9.1
