From: Ivo Slanina <ivo.slanina@gmail.com>
Date: Sun,  1 Mar 2015 15:51:44 +0100
Subject: [Buildroot] [PATCH 1/1] linux/linux.mk: custom dts path - build dtb
	only from *.dts files
Message-ID: <1425221504-28223-1-git-send-email-ivo.slanina@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building device tree blobs from custom *.dts files, buildroot
initializes KERNEL_DTS_NAME variable from all given file names.
This causes that user can't provide one *.dts file and some other
*.dtsi files as dependencies.

Problem is fixed by adding filter for initializing KERNEL_DTS_NAME
variable with *.dts files only. All user provided files are copied
into kernel source tree, but only file names suffixed with *.dts
are used for building appropriate *.dtb files.

Signed-off-by: Ivo Slanina <ivo.slanina@gmail.com>
---
 linux/linux.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 0b8c912..eaed1f0 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -64,7 +64,7 @@ LINUX_VERSION_PROBED = $(shell $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-
 ifeq ($(BR2_LINUX_KERNEL_USE_INTREE_DTS),y)
 KERNEL_DTS_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
 else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),y)
-KERNEL_DTS_NAME = $(basename $(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH))))
+KERNEL_DTS_NAME = $(basename $(filter %.dts,$(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))))
 endif
 
 ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT)$(KERNEL_DTS_NAME),y)
-- 
1.7.10.4
