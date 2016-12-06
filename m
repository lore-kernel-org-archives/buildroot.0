From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue,  6 Dec 2016 20:08:15 +0100
Subject: [Buildroot] [PATCH] linux: Adding customizable linux logo
Message-ID: <1481051295-1190-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a custom linux logo to the generated kernel image.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 linux/Config.ext.in           | 26 ++++++++++++++++++++++++++
 linux/linux-ext-customlogo.mk | 19 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 linux/linux-ext-customlogo.mk

diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 011dffb..da63109 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -1,5 +1,31 @@
 menu "Linux Kernel Extensions"
 
+# Custom logo
+config BR2_LINUX_KERNEL_EXT_CUSTOMLOGO
+	bool "Custom logo"
+	select BR2_PACKAGE_CUSTOMLOGO
+	help
+	  Change linux boot logo with your own graphics. 
+	  Can be used as an early bootsplash.
+	  The file should be in kernel ppm format if the
+	  option BR2_PACKAGE_CUSTOMLOGO_CONVERT is not
+	  selected.
+
+config BR2_PACKAGE_CUSTOMLOGO_PATH
+	string "Image file path"
+	depends on BR2_LINUX_KERNEL_EXT_CUSTOMLOGO
+	help
+	  This image will be used as custom logo.
+
+config BR2_PACKAGE_CUSTOMLOGO_CONVERT
+	bool "Convert custom logo to kernel format"
+	depends on BR2_LINUX_KERNEL_EXT_CUSTOMLOGO
+	help
+	  If checked, the convert command will be run on the source
+	  image file to obtain a kernel compatible ppm image file.
+	  *REQUIRES* a pre installed imagemagick on the host system
+	  to convert the image.
+
 #-------------------------------------------------------------------------------
 # Xenomai
 config BR2_LINUX_KERNEL_EXT_XENOMAI
diff --git a/linux/linux-ext-customlogo.mk b/linux/linux-ext-customlogo.mk
new file mode 100644
index 0000000..99e3ab1
--- /dev/null
+++ b/linux/linux-ext-customlogo.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# Custom logo
+#
+################################################################################
+
+LINUX_EXTENSIONS += customlogo
+
+ifeq ($(BR2_PACKAGE_CUSTOMLOGO_CONVERT),)
+define CUSTOMLOGO_PREPARE_KERNEL
+	cp $(BR2_PACKAGE_CUSTOMLOGO_PATH) $(LINUX_DIR)/drivers/video/logo/logo_linux_clut224.ppm
+endef
+else
+define CUSTOMLOGO_PREPARE_KERNEL
+	convert $(BR2_PACKAGE_CUSTOMLOGO_PATH) \
+			-dither None -colors 224 -compress none \
+			$(LINUX_DIR)/drivers/video/logo/logo_linux_clut224.ppm
+endef
+endif
-- 
2.7.4
