From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 May 2011 22:22:54 +0200
Subject: [Buildroot] [PATCH 03/26] linux: make it possible to install the
	kernel in /boot
In-Reply-To: <cover.1306782275.git.thomas.petazzoni@free-electrons.com>
References: <cover.1306782275.git.thomas.petazzoni@free-electrons.com>
Message-ID: <d8edb7d215a430e3bd8494091ab04b5e2b2fa280.1306782275.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/Config.in |    8 ++++++++
 linux/linux.mk  |    3 +++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index e7d1bd8..291f9e0 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -153,6 +153,14 @@ config BR2_LINUX_KERNEL_IMAGE_TARGET_NAME
 	  Specify the kernel make target to build the kernel that you
 	  need.
 
+config BR2_LINUX_KERNEL_INSTALL_TARGET
+	bool "Install kernel image to /boot in target"
+	depends on BR2_i386 || BR_x86_64
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
1.7.1
