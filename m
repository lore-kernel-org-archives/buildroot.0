From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  4 Jul 2011 23:33:20 +0200
Subject: [Buildroot] [PATCH 03/28] linux: make it possible to install the
	kernel in /boot
In-Reply-To: <cover.1309815048.git.thomas.petazzoni@free-electrons.com>
References: <cover.1309815048.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8f2cdc43b7b0efaf09e1f1be70019f9cdc0cb8ec.1309815048.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/Config.in |    7 +++++++
 linux/linux.mk  |    3 +++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 1f1a69c..c9229a5 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -153,6 +153,13 @@ config BR2_LINUX_KERNEL_IMAGE_TARGET_NAME
 	  Specify the kernel make target to build the kernel that you
 	  need.
 
+config BR2_LINUX_KERNEL_INSTALL_TARGET
+	bool "Install kernel image to /boot in target"
+	help
+	  Select this option to have the kernel image installed to
+	  /boot in the target root filesystem, as is typically done on
+	  x86/x86_64 systems.
+
 endif # BR2_LINUX_KERNEL
 
 endmenu
diff --git a/linux/linux.mk b/linux/linux.mk
index 43ca87b..2bb32cb 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -158,6 +158,9 @@ $(LINUX26_DIR)/.stamp_compiled: $(LINUX26_DIR)/.stamp_configured $(LINUX26_DIR)/
 $(LINUX26_DIR)/.stamp_installed: $(LINUX26_DIR)/.stamp_compiled
 	@$(call MESSAGE,"Installing kernel")
 	cp $(LINUX26_IMAGE_PATH) $(BINARIES_DIR)
+ifeq ($(BR2_LINUX_KERNEL_INSTALL_TARGET),y)
+	install -m 0644 -D $(LINUX26_IMAGE_PATH) $(TARGET_DIR)/boot/$(LINUX26_IMAGE_NAME)
+endif
 	# Install modules and remove symbolic links pointing to build
 	# directories, not relevant on the target
 	@if [ $(shell grep -c "CONFIG_MODULES=y" $(LINUX26_DIR)/.config) != 0 ] ; then 	\
-- 
1.7.4.1
