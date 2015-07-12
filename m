From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 12 Jul 2015 13:43:32 +0200
Subject: [Buildroot] [PATCH] linux: Add kernel compression selection.
Message-ID: <1436701412-25930-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Johan Sagaert <sagaert.johan@proximus.be>

This selection will ensure that the correct host tools
will be build used for the kernel compression method used.

[Maxime: Select the compression opts in the kernel config too ]

Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
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
 linux/linux.mk  | 23 ++++++++++++++++++++++-
 2 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 8c86a1a..73ae0b9 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -254,6 +254,34 @@ config BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM
 
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
index eca1450..3d94a36 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -56,7 +56,23 @@ LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
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
+LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_GZIP) = CONFIG_KERNEL_GZIP
+LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_LZ4) = CONFIG_KERNEL_LZ4
+LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_LZMA) = CONFIG_KERNEL_LZMA
+LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_LZO) = CONFIG_KERNEL_LZO
+LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_XZ) = CONFIG_KERNEL_XZ
 
 ifeq ($(BR2_LINUX_KERNEL_UBOOT_IMAGE),y)
 LINUX_DEPENDENCIES += host-uboot-tools
@@ -187,6 +203,11 @@ LINUX_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 LINUX_KCONFIG_OPTS = $(LINUX_MAKE_FLAGS)
 
 define LINUX_KCONFIG_FIXUP_CMDS
+	$(call KCONFIG_ENABLE_OPT,$(LINUX_COMPRESSION_OPT_y),$(@D)/.config)
+	$(foreach opt, $(LINUX_COMPRESSION_OPT_),
+		$(call KCONFIG_DISABLE_OPT,$(opt),$(@D)/.config)
+	)
+
 	$(if $(BR2_arm)$(BR2_armeb),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config))
 	$(if $(BR2_TARGET_ROOTFS_CPIO),
-- 
2.1.4
