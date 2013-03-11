From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Mon, 11 Mar 2013 11:35:34 +0100
Subject: [Buildroot] [PATCH] [RFC] Add a LOADADDR= option when building
	uImage
Message-ID: <1362998134-4614-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Boibessot <julien.boibessot@armadeus.com>

This seems mandatory in recent Linux kernels configured with ARCH_MULTIPLATFORM
(well at least on ARM/i.MX).
If LOADADDR variable is not set when building multi-arch uImage then a dummy
loadaddr is used, that prevent this image to boot in U-Boot (2012.04 in my
case).
Anyone else who need the same fix ?

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
---
 linux/Config.in |    8 ++++++++
 linux/linux.mk  |    4 ++++
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 94ce951..c582439 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -213,6 +213,14 @@ config BR2_LINUX_KERNEL_IMAGE_TARGET_NAME
 	  Specify the kernel make target to build the kernel that you
 	  need.
 
+config BR2_LINUX_KERNEL_UIMAGE_LOADADDR
+	string "loadaddr for uImage"
+	depends on BR2_LINUX_KERNEL_UIMAGE || BR2_LINUX_KERNEL_APPENDED_UIMAGE
+	help
+	  When configured for multi-arch support, it is mandatory to define
+	  LOADADDR=0x... when asking recent kernels to generate a uImage.
+	  Let this option empty if your kernel is single-arch only.
+
 config BR2_LINUX_KERNEL_DTS_SUPPORT
 	bool "Device tree support"
 	help
diff --git a/linux/linux.mk b/linux/linux.mk
index 0352acd..361ce3c 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -95,6 +95,10 @@ LINUX_IMAGE_NAME=vmlinuz
 endif
 endif
 
+ifeq ($(LINUX_IMAGE_NAME),uImage)
+LINUX_MAKE_FLAGS+=LOADADDR=$(call qstrip,$(BR2_LINUX_KERNEL_UIMAGE_LOADADDR))
+endif
+
 ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
 LINUX_IMAGE_TARGET=zImage
 else
-- 
1.7.5.4
