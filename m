From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 16:22:40 +0100
Subject: [Buildroot] [git commit] linux: Add kernel compression selection.
Message-ID: <20151213213348.EA58880ADD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3ea133c9710b7d479c7828a59a99f3d10f74be35
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This selection will ensure that the correct host tools
will be build used for the kernel compression method used.

[Maxime: Select the compression opts in the kernel config too ]

Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/Config.in | 28 ++++++++++++++++++++++++++++
 linux/linux.mk  | 22 +++++++++++++++++++++-
 2 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 432cba4..57b3490 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -262,6 +262,34 @@ config BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM
 
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
index 9507837..dd2cc49 100644
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
@@ -181,6 +197,10 @@ LINUX_KCONFIG_OPTS = $(LINUX_MAKE_FLAGS)
 define LINUX_KCONFIG_FIXUP_CMDS
 	$(if $(LINUX_NEEDS_MODULES),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_MODULES,$(@D)/.config))
+	$(call KCONFIG_ENABLE_OPT,$(LINUX_COMPRESSION_OPT_y),$(@D)/.config)
+	$(foreach opt, $(LINUX_COMPRESSION_OPT_),
+		$(call KCONFIG_DISABLE_OPT,$(opt),$(@D)/.config)
+	)
 	$(if $(BR2_arm)$(BR2_armeb),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config))
 	$(if $(BR2_TARGET_ROOTFS_CPIO),
