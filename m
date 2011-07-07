From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 7 Jul 2011 23:48:41 +0200
Subject: [Buildroot] [git commit] linux: make it possible to install the
	kernel in /boot
Message-ID: <20110707220517.A03E68A3F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=eff25f4cca89d816665de469b7164267aaf52d4b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: always copy to output/images as requested by Luca]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/Config.in |    8 ++++++++
 linux/linux.mk  |    3 +++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 1f1a69c..bdfa5b7 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -153,6 +153,14 @@ config BR2_LINUX_KERNEL_IMAGE_TARGET_NAME
 	  Specify the kernel make target to build the kernel that you
 	  need.
 
+config BR2_LINUX_KERNEL_INSTALL_TARGET
+	bool "Install kernel image to /boot in target"
+	depends on !BR2_TARGET_ROOTFS_INITRAMFS
+	help
+	  Select this option to have the kernel image installed to
+	  /boot in the target root filesystem, as is typically done on
+	  x86/x86_64 systems.
+
 endif # BR2_LINUX_KERNEL
 
 endmenu
diff --git a/linux/linux.mk b/linux/linux.mk
index 43ca87b..a5b9b8e 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -157,6 +157,9 @@ $(LINUX26_DIR)/.stamp_compiled: $(LINUX26_DIR)/.stamp_configured $(LINUX26_DIR)/
 # Installation
 $(LINUX26_DIR)/.stamp_installed: $(LINUX26_DIR)/.stamp_compiled
 	@$(call MESSAGE,"Installing kernel")
+ifeq ($(BR2_LINUX_KERNEL_INSTALL_TARGET),y)
+	install -m 0644 -D $(LINUX26_IMAGE_PATH) $(TARGET_DIR)/boot/$(LINUX26_IMAGE_NAME)
+endif
 	cp $(LINUX26_IMAGE_PATH) $(BINARIES_DIR)
 	# Install modules and remove symbolic links pointing to build
 	# directories, not relevant on the target
-- 
1.7.3.4
