From: Sonic Zhang <sonic.adi@gmail.com>
Date: Tue, 7 Aug 2012 17:09:36 +0800
Subject: [Buildroot] [PATCH 4/5] Linux: Unpatch customer kernel source tree
	before make clean.
In-Reply-To: <1344330577-25159-1-git-send-email-sonic.adi@gmail.com>
References: <1344330577-25159-1-git-send-email-sonic.adi@gmail.com>
Message-ID: <1344330577-25159-4-git-send-email-sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

Unpatch only patches which match current kernel version.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 Makefile       |    2 +-
 linux/linux.mk |   13 +++++++++++++
 2 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index ce81045..e7da18e 100644
--- a/Makefile
+++ b/Makefile
@@ -663,7 +663,7 @@ ifeq ($(NEED_WRAPPER),y)
 	$(Q)$(TOPDIR)/support/scripts/mkmakefile $(TOPDIR) $(O)
 endif
 
-clean:
+clean: linux-unpatch
 	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
 		$(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR) $(BASE_DIR)/staging \
 		$(LEGAL_INFO_DIR)
diff --git a/linux/linux.mk b/linux/linux.mk
index 48021a1..4ad8b49 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -309,6 +309,19 @@ $(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed $(LI
 # after it generated the initramfs list of files.
 linux-rebuild-with-initramfs linux26-rebuild-with-initramfs: $(LINUX_DIR)/.stamp_initramfs_rebuilt
 
+LINUX_PATCH_LIST=$(wildcard $(LINUX_PATCHES)/linux-$(KERNELVERSION)-*.patch)
+linux-unpatch:
+ifeq ($(BR2_LINUX_KERNEL_CUSTOM_TREE),y)
+ifneq ($(wildcard $(BUILD_DIR)/linux-$(LINUX_VERSION)/.stamp_patched),)
+	@echo "unpatch linux kernel...."
+	for p in $(LINUX_PATCH_LIST) ; do \
+		patch -RE -p1 -d $(LINUX_SOURCE_DIR) < $$p; \
+	done
+else
+	@echo "linux kernel didn't patched, skip unpatch...."
+endif
+endif
+
 # Checks to give errors that the user can understand
 ifeq ($(filter source,$(MAKECMDGOALS)),)
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
-- 
1.7.0.4
