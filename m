From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Tue, 17 Jul 2012 14:27:19 +0200
Subject: [Buildroot] [PATCH 3/6] Factorize the u-boot images code
In-Reply-To: <1342528042-10038-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1342528042-10038-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <1342528042-10038-4-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch introduces the BR2_LINUX_KERNEL_UBOOT_IMAGE boolean to
factorize more code that will be shared in the next patches that
introduces other uImage-like targets.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 linux/Config.in |    4 ++++
 linux/linux.mk  |    5 ++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 9b63ab3..6da50f5 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -187,12 +187,16 @@ endif
 # Binary format
 #
 
+config BR2_LINUX_KERNEL_UBOOT_IMAGE
+       bool
+
 choice
 	prompt "Kernel binary format"
 
 config BR2_LINUX_KERNEL_UIMAGE
 	bool "uImage"
 	depends on BR2_arm || BR2_armeb || BR2_bfin || BR2_powerpc || BR2_avr32 || BR2_sh || BR2_sh64
+	select BR2_LINUX_KERNEL_UBOOT_IMAGE
 
 config BR2_LINUX_KERNEL_BZIMAGE
 	bool "bzImage"
diff --git a/linux/linux.mk b/linux/linux.mk
index 9b4abf1..7d632f6 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -34,6 +34,10 @@ LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
 LINUX_INSTALL_IMAGES = YES
 LINUX_DEPENDENCIES  += host-module-init-tools
 
+ifeq ($(BR2_LINUX_KERNEL_UBOOT_IMAGE),y)
+	LINUX_DEPENDENCIES += host-uboot-tools
+endif
+
 LINUX_MAKE_FLAGS = \
 	HOSTCC="$(HOSTCC)" \
 	HOSTCFLAGS="$(HOSTCFLAGS)" \
@@ -62,7 +66,6 @@ LINUX_IMAGE_NAME=vmImage
 else
 LINUX_IMAGE_NAME=uImage
 endif
-LINUX_DEPENDENCIES+=host-uboot-tools
 else ifeq ($(BR2_LINUX_KERNEL_BZIMAGE),y)
 LINUX_IMAGE_NAME=bzImage
 else ifeq ($(BR2_LINUX_KERNEL_ZIMAGE),y)
-- 
1.7.9.5
