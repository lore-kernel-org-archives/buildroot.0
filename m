From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  8 Feb 2014 17:26:05 +0100
Subject: [Buildroot] [PATCH 2/3] linux: only depend on host-lzop if needed
In-Reply-To: <cover.1391876537.git.yann.morin.1998@free.fr>
References: <cover.1391876537.git.yann.morin.1998@free.fr>
Message-ID: <5a709a1b48e38bf5cc9c7aeaa45a6a4fe5813d6e.1391876537.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

There is no reason to always depend on host-lzop, even when the kernel
compression is not LZO.

Since LZO is not the default compression option in the kernel (and there
is not sign that will change in the foreseeable future), it will always
appear in a config file, whether it is a complete config file or it is
only a defconfig.

So, only depend on host-lzop if the LZO compression is enabled in the
kernel config file (either the defconfig or the custom config file).
This includes:
  - kernel compression itself
  - initrd compression
  - initramfs compression

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes v1 -> v2:
  - also select if initrd or initramfs compression is lzo  (Peter)
---
 linux/linux.mk | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 1a81f77..e8c007d 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -41,7 +41,7 @@ endif
 LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
 
 LINUX_INSTALL_IMAGES = YES
-LINUX_DEPENDENCIES  += host-kmod host-lzop
+LINUX_DEPENDENCIES  += host-kmod
 
 ifeq ($(BR2_LINUX_KERNEL_UBOOT_IMAGE),y)
 	LINUX_DEPENDENCIES += host-uboot-tools
@@ -163,7 +163,14 @@ LINUX_POST_PATCH_HOOKS += LINUX_APPLY_PATCHES
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
 KERNEL_SOURCE_CONFIG = $(KERNEL_ARCH_PATH)/configs/$(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
 else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
-KERNEL_SOURCE_CONFIG = $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
+KERNEL_SOURCE_CONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE))
+endif
+
+ifeq ($(call KCONFIG_GET_OPT,CONFIG_KERNEL_LZO,$(KERNEL_SOURCE_CONFIG)),y)
+LINUX_DEPENDENCIES += host-lzop
+endif
+ifeq ($(call KCONFIG_GET_OPT,CONFIG_RD_LZO,$(KERNEL_SOURCE_CONFIG)),y)
+LINUX_DEPENDENCIES += host-lzop
 endif
 
 define LINUX_CONFIGURE_CMDS
-- 
1.8.1.2
