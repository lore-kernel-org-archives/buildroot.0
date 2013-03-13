From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Wed, 13 Mar 2013 22:13:24 +0100
Subject: [Buildroot] [PATCH v1] Add a load address option for building
	uImage on 3.7+ multi-platform kernels.
Message-ID: <1363209204-3604-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Boibessot <julien.boibessot@armadeus.com>

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
---
Changes since RFC:
 * Took Daniel Price and Arnout Vandecappelle remarks into account to be more
   explicit in the description of the option + add ARM dependancy.
 * Changed the way option is used in linux.mk to prevent empty LOADADDR=

 linux/Config.in |   13 +++++++++++++
 linux/linux.mk  |    5 +++++
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 94ce951..a44880f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -213,6 +213,19 @@ config BR2_LINUX_KERNEL_IMAGE_TARGET_NAME
 	  Specify the kernel make target to build the kernel that you
 	  need.
 
+config BR2_LINUX_KERNEL_UIMAGE_LOADADDR
+	string "load address (for 3.7+ multi-platform image)"
+	depends on BR2_arm || BR2_armeb
+	depends on BR2_LINUX_KERNEL_UIMAGE || BR2_LINUX_KERNEL_APPENDED_UIMAGE
+	help
+	  If your ARM system's Linux kernel is configured with the new (3.7+)
+	  multi-architecture support (CONFIG_ARCH_MULTIPLATFORM=y in your
+	  kernel config), then it is necessary to specify a kernel load address
+	  when building the uImage. This should be a hexadecimal string
+	  beginning with 0x, for example: 0x00008000.
+
+	  If unsure, let this option empty.
+
 config BR2_LINUX_KERNEL_DTS_SUPPORT
 	bool "Device tree support"
 	help
diff --git a/linux/linux.mk b/linux/linux.mk
index 0352acd..c8f7b57 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -95,6 +95,11 @@ LINUX_IMAGE_NAME=vmlinuz
 endif
 endif
 
+LINUX_KERNEL_UIMAGE_LOADADDR=$(call qstrip,$(BR2_LINUX_KERNEL_UIMAGE_LOADADDR))
+ifneq ($(LINUX_KERNEL_UIMAGE_LOADADDR),)
+LINUX_MAKE_FLAGS+=LOADADDR=$(LINUX_KERNEL_UIMAGE_LOADADDR)
+endif
+
 ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
 LINUX_IMAGE_TARGET=zImage
 else
-- 
1.7.5.4
