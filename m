From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed,  3 Feb 2016 00:05:42 +0100
Subject: [Buildroot] [PATCH] RFC: adding customizable linux logo
Message-ID: <1454454342-27717-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a custom linux logo to the generated kernel image.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---

I often use the linux kernel logo as an early full screen bootsplash.
For such a reason I wrote this patch and I'm looking for comments.

 linux/Config.ext.in              |  8 ++++++++
 linux/linux-ext-customlogo.mk    | 11 +++++++++++
 package/Config.in                |  1 +
 package/customlogo/Config.in     | 16 ++++++++++++++++
 package/customlogo/customlogo.mk | 15 +++++++++++++++
 5 files changed, 51 insertions(+)
 create mode 100644 linux/linux-ext-customlogo.mk
 create mode 100644 package/customlogo/Config.in
 create mode 100644 package/customlogo/customlogo.mk

diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 755c23b..b752c9c 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -1,5 +1,13 @@
 menu "Linux Kernel Extensions"
 
+# Custom logo
+config BR2_LINUX_KERNEL_EXT_CUSTOMLOGO
+	select BR2_PACKAGE_CUSTOMLOGO
+	bool "Custom logo"
+	help
+	  change linux boot logo with your own graphics. 
+	  Can be used as an early bootsplash.
+
 # Xenomai
 config BR2_LINUX_KERNEL_EXT_XENOMAI
 	bool "Adeos/Xenomai Real-time patch"
diff --git a/linux/linux-ext-customlogo.mk b/linux/linux-ext-customlogo.mk
new file mode 100644
index 0000000..68c613a
--- /dev/null
+++ b/linux/linux-ext-customlogo.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# Custom logo
+#
+################################################################################
+
+LINUX_EXTENSIONS += customlogo
+
+define CUSTOMLOGO_PREPARE_KERNEL
+	cp $(CUSTOMLOGO_DIR)/logo_linux_clut224.ppm $(LINUX_DIR)/drivers/video/logo/logo_linux_clut224.ppm
+endef
diff --git a/package/Config.in b/package/Config.in
index 7ced9d4..1552f32 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -214,6 +214,7 @@ comment "Sounds"
 
 comment "Themes"
 	source "package/gtk2-engines/Config.in"
+	source "package/customlogo/Config.in"
 
 endmenu
 
diff --git a/package/customlogo/Config.in b/package/customlogo/Config.in
new file mode 100644
index 0000000..f8502da
--- /dev/null
+++ b/package/customlogo/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_CUSTOMLOGO
+	bool "Custom logo"
+	help
+	  Change linux boot logo with your own graphics. 
+	  Can be used as an early bootsplash.
+
+	  *REQUIRES* a pre installed imagemagick on the host system.
+
+if BR2_PACKAGE_CUSTOMLOGO
+
+config BR2_PACKAGE_CUSTOMLOGO_PATH
+	string "image file path"
+	help
+	  This image will be used as custom logo.
+
+endif
diff --git a/package/customlogo/customlogo.mk b/package/customlogo/customlogo.mk
new file mode 100644
index 0000000..4f11522
--- /dev/null
+++ b/package/customlogo/customlogo.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# customlogo
+#
+################################################################################
+
+CUSTOMLOGO_SOURCE =
+
+define CUSTOMLOGO_BUILD_CMDS
+	convert $(BR2_PACKAGE_CUSTOMLOGO_PATH) \
+		-dither None -colors 224 -compress none \
+		$(@D)/logo_linux_clut224.ppm
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
