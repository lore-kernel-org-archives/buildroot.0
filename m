From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Jul 2012 23:08:28 +0200
Subject: [Buildroot] [git commit branch/next] Factorize the u-boot images
	code
Message-ID: <20120802195304.0C383827F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=902609fbb31506dfe04f100c9c8099fbfa8095a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch introduces the BR2_LINUX_KERNEL_UBOOT_IMAGE boolean to
factorize more code that will be shared in the next patches that
introduces other uImage-like targets.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/Config.in |    4 ++++
 linux/linux.mk  |    5 ++++-
 2 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 16c7ea7..84fae91 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -129,12 +129,16 @@ config BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE
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
index 099f8ba..844ce55 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -36,6 +36,10 @@ LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
 LINUX_INSTALL_IMAGES = YES
 LINUX_DEPENDENCIES  += host-module-init-tools
 
+ifeq ($(BR2_LINUX_KERNEL_UBOOT_IMAGE),y)
+	LINUX_DEPENDENCIES += host-uboot-tools
+endif
+
 LINUX_MAKE_FLAGS = \
 	HOSTCC="$(HOSTCC)" \
 	HOSTCFLAGS="$(HOSTCFLAGS)" \
@@ -64,7 +68,6 @@ LINUX_IMAGE_NAME=vmImage
 else
 LINUX_IMAGE_NAME=uImage
 endif
-LINUX_DEPENDENCIES+=host-uboot-tools
 else ifeq ($(BR2_LINUX_KERNEL_BZIMAGE),y)
 LINUX_IMAGE_NAME=bzImage
 else ifeq ($(BR2_LINUX_KERNEL_ZIMAGE),y)
