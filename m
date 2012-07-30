From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 30 Jul 2012 14:32:48 +0200
Subject: [Buildroot] [PATCH 5/6] Add cuImage(powerpc) and
	simpleImage(microblaze) as Linux kernel images variants
In-Reply-To: <1343651569-6450-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1343651569-6450-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <1343651569-6450-6-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 linux/Config.in |   14 ++++++++++++++
 linux/linux.mk  |    4 ++++
 2 files changed, 18 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 37aef74..79a303c 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -160,6 +160,20 @@ config BR2_LINUX_KERNEL_APPENDED_ZIMAGE
 	select BR2_LINUX_KERNEL_DTS_SUPPORT
 	select BR2_LINUX_KERNEL_APPENDED_DTB
 
+config BR2_LINUX_KERNEL_CUIMAGE
+	bool "cuImage"
+	depends on BR2_powerpc
+	select BR2_LINUX_KERNEL_UBOOT_IMAGE
+	select BR2_LINUX_KERNEL_DTS_SUPPORT
+	select BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT
+
+config BR2_LINUX_KERNEL_SIMPLEIMAGE
+	bool "simpleImage"
+	depends on BR2_microblaze
+	select BR2_LINUX_KERNEL_UBOOT_IMAGE
+	select BR2_LINUX_KERNEL_DTS_SUPPORT
+	select BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT
+
 config BR2_LINUX_KERNEL_VMLINUX_BIN
 	bool "vmlinux.bin"
 	depends on BR2_mips || BR2_mipsel || BR2_sh || BR2_sh64
diff --git a/linux/linux.mk b/linux/linux.mk
index d24a11a..cd359ce 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -81,6 +81,10 @@ else ifeq ($(BR2_LINUX_KERNEL_ZIMAGE),y)
 LINUX_IMAGE_NAME=zImage
 else ifeq ($(BR2_LINUX_KERNEL_APPENDED_ZIMAGE),y)
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
