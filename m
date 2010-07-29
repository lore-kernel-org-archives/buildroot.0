From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Jul 2010 23:48:56 +0200
Subject: [Buildroot] [PATCH 13/19] u-boot: fix custom patch handling
In-Reply-To: <cover.1280440124.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280440124.git.thomas.petazzoni@free-electrons.com>
Message-ID: <af0a3d1cde4a65ee2487c5e042dc40fd346c5340.1280440124.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When U-Boot is enabled and no custom patch directory has been set,
then the current test:

  ifneq ($(strip $(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR)),"")

works. However, when U-Boot is not enabled, but still gets compiled
because mkimage is needed to build the kernel,
BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR is completely empty. It does not
even have quotes. So the test in fact needs to be:

 ifneq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR)),)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/u-boot/u-boot.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
index 9eeea1d..7b6b2ce 100644
--- a/boot/u-boot/u-boot.mk
+++ b/boot/u-boot/u-boot.mk
@@ -77,7 +77,7 @@ $(U_BOOT_DIR)/.patched: $(U_BOOT_DIR)/.unpacked
 	toolchain/patch-kernel.sh $(U_BOOT_DIR) boot/u-boot \
 		u-boot-$(U_BOOT_VERSION)-\*.patch \
 		u-boot-$(U_BOOT_VERSION)-\*.patch.$(ARCH)
-ifneq ($(strip $(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR)),"")
+ifneq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR)),)
 	toolchain/patch-kernel.sh $(U_BOOT_DIR) $(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR) u-boot-$(U_BOOT_VERSION)-\*.patch
 endif
 	touch $@
-- 
1.7.0.4
