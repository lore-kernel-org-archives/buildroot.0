From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 27 Dec 2010 22:50:18 +0100
Subject: [Buildroot] [git commit master 1/1] linux: fix linux- aliases
Message-ID: <20101227222052.2E4D48EB81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c1ce30f7f7771440e29a3e6d925afd15080b3a0d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The generic linux-% alias conflicts with the linux-fusion package, so
add explicit aliases instead.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/linux.mk |   12 +++++-------
 1 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index f81ff5c..d3c06db 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -152,10 +152,11 @@ $(LINUX26_DIR)/.stamp_installed: $(LINUX26_DIR)/.stamp_compiled
 	fi
 	$(Q)touch $@
 
-linux26: host-module-init-tools $(LINUX26_DEPENDENCIES) $(LINUX26_DIR)/.stamp_installed
+linux linux26: host-module-init-tools $(LINUX26_DEPENDENCIES) $(LINUX26_DIR)/.stamp_installed
 
-linux26-menuconfig linux26-xconfig linux26-gconfig linux26-nconfig: dirs $(LINUX26_DIR)/.stamp_configured
-	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) $(subst linux26-,,$@)
+linux-menuconfig linux-xconfig linux-gconfig linux-nconfig linux26-menuconfig linux26-xconfig linux26-gconfig linux26-nconfig: dirs $(LINUX26_DIR)/.stamp_configured
+	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) \
+		$(subst linux-,,$(subst linux26-,,$@))
 
 # Support for rebuilding the kernel after the initramfs file list has
 # been generated in $(BINARIES_DIR)/rootfs.initramfs.
@@ -172,7 +173,7 @@ $(LINUX26_DIR)/.stamp_initramfs_rebuilt: $(LINUX26_DIR)/.stamp_installed $(BINAR
 
 # The initramfs building code must make sure this target gets called
 # after it generated the initramfs list of files.
-linux26-rebuild-with-initramfs: $(LINUX26_DIR)/.stamp_initramfs_rebuilt
+linux-rebuild-with-initramfs linux26-rebuild-with-initramfs: $(LINUX26_DIR)/.stamp_initramfs_rebuilt
 
 ifeq ($(BR2_LINUX_KERNEL),y)
 TARGETS+=linux26
@@ -193,6 +194,3 @@ endif
 endif
 
 endif
-
-linux-%:
-	$(MAKE) $(EXTRAMAKEARGS) $(subst linux-,linux26-,$@)
-- 
1.7.2.2
