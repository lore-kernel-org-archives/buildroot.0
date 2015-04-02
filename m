From: Sagaert Johan <sagaert.johan@proximus.be>
Date: Fri,  3 Apr 2015 01:31:07 +0200
Subject: [Buildroot] [PATCH 1/1 v4] Add kernel compression selection.
Message-ID: <1428017467-856-1-git-send-email-sagaert.johan@proximus.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This selection will ensure that the correct host tools
will be build used for the kernel compression method used.
Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
---
V3->V4
	Add selection menu in the kernel menu section.
	This ensures only things needed are build.
V2->V3
	Unconditionally build lz4.
	The building overhead is negligible.
V1->V2
	Only add the host-lz4 dependency when ARM is selected.
	Don't touch host-lz4 package.
---
 linux/Config.in | 28 ++++++++++++++++++++++++++++
 linux/linux.mk  | 13 ++++++++++++-
 2 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index a1113dd..e5372cb 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -247,6 +247,34 @@ config BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM
 
 endchoice
 
+#
+# Kernel compression format
+#
+
+choice
+	prompt "Kernel compression format"
+	help
+	  This selection will just ensure that the correct host tools are build.
+	  The actual compression for the kernel should be selected in the
+	  kernel configuration menu.
+
+config BR2_LINUX_KERNEL_GZIP
+	bool "gzip compression"
+	
+config BR2_LINUX_KERNEL_LZ4
+	bool "lz4 compression"
+	
+config BR2_LINUX_KERNEL_LZMA
+	bool "lzma compression"
+
+config BR2_LINUX_KERNEL_LZO
+	bool "lzo compression"
+	
+config BR2_LINUX_KERNEL_XZ
+	bool "xz compression"
+
+endchoice
+
 config BR2_LINUX_KERNEL_IMAGE_TARGET_NAME
 	string "Kernel image target name"
 	depends on BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM
diff --git a/linux/linux.mk b/linux/linux.mk
index 22fce35..67ea544 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -49,7 +49,18 @@ LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
 LINUX_PATCH = $(filter ftp://% http://% https://%,$(LINUX_PATCHES))
 
 LINUX_INSTALL_IMAGES = YES
-LINUX_DEPENDENCIES += host-kmod host-lzop
+LINUX_DEPENDENCIES += host-kmod
+
+# host tools needed for kernel compression
+ifeq ($(BR2_LINUX_KERNEL_LZ4),y)
+LINUX_DEPENDENCIES += host-lz4
+else ifeq ($(BR2_LINUX_KERNEL_LZMA),y)
+LINUX_DEPENDENCIES += host-lzma
+else ifeq ($(BR2_LINUX_KERNEL_LZO),y)
+LINUX_DEPENDENCIES += host-lzop
+else ifeq ($(BR2_LINUX_KERNEL_XZ),y)
+LINUX_DEPENDENCIES += host-xz
+endif
 
 ifeq ($(BR2_LINUX_KERNEL_UBOOT_IMAGE),y)
 LINUX_DEPENDENCIES += host-uboot-tools
-- 
2.3.3
