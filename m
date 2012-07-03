From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Tue,  3 Jul 2012 12:01:16 +0200
Subject: [Buildroot] [PATCH 4/4] Add cuImage(powerpc) and
	simpleImage(microblaze) as Linux kernel images variants
In-Reply-To: <1341309676-18681-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1341309676-18681-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <1341309676-18681-5-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 linux/Config.in |   12 ++++++++++++
 linux/linux.mk  |    4 ++++
 2 files changed, 16 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index c5488e8..80870ab 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -195,6 +195,18 @@ config BR2_LINUX_KERNEL_ZIMAGE
 	bool "zImage"
 	depends on BR2_arm || BR2_armeb || BR2_powerpc || BR2_sparc || BR2_sh || BR2_sh64 || BR2_xtensa
 
+config BR2_LINUX_KERNEL_CUIMAGE
+	bool "cuImage"
+	depends on BR2_powerpc
+	select BR2_LINUX_KERNEL_UBOOT_IMAGE
+	select BR2_LINUX_KERNEL_DTS_SUPPORT
+
+config BR2_LINUX_KERNEL_SIMPLEIMAGE
+	bool "simpleImage"
+	depends on BR2_microblaze
+	select BR2_LINUX_KERNEL_UBOOT_IMAGE
+	select BR2_LINUX_KERNEL_DTS_SUPPORT
+
 config BR2_LINUX_KERNEL_VMLINUX_BIN
 	bool "vmlinux.bin"
 	depends on BR2_mips || BR2_mipsel || BR2_sh || BR2_sh64
diff --git a/linux/linux.mk b/linux/linux.mk
index 8517d2f..687c1a9 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -77,6 +77,10 @@ else ifeq ($(BR2_LINUX_KERNEL_BZIMAGE),y)
 LINUX_IMAGE_NAME=bzImage
 else ifeq ($(BR2_LINUX_KERNEL_ZIMAGE),y)
 LINUX_IMAGE_NAME=zImage
+else ifeq ($(BR2_LINUX_KERNEL_CUIMAGE),y)
+LINUX_IMAGE_NAME=cuImage.$(KERNEL_DTS_NAME)
+else ifeq ($(BR2_LINUX_KERNEL_SIMPLEIMAGE),y)
+LINUX_IMAGE_NAME=simpleImage.$(KERNEL_DTS_NAME)
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUX_BIN),y)
 LINUX_IMAGE_NAME=vmlinux.bin
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
-- 
1.7.9.5
