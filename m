From: Cam Hutchison <camh@xdna.net>
Date: Thu, 19 Oct 2017 21:59:17 +1100
Subject: [Buildroot] [PATCH 1/1] linux: Deselect all unconfigured
	compression options
Message-ID: <20171019105917.11803-1-camh@xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The LINUX_KCONFIG_FIXUP_CMDS are meant to deselect any compression
option that are not selected in the buildroot configuration. But it only
deselects the last one in the list instead of all of them because it
overwrites the LINUX_COMPRESSION_OPT_ variable instead of appending to
it. Only the last option set to that variable gets deselected.

This produces the warning:

.config:2216:warning: override: KERNEL_GZIP changes choice state

is emitted when buildroot runs olddefconfig when buildroot configures a
kernel with a custom config that has a different kernel compression
option set to what is configured in buildroot.

Accumulate all the deselected compression options instead of overwriting
them to ensure all non-selected options get deselected..

Signed-off-by: Cam Hutchison <camh@xdna.net>
---
 linux/linux.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 9c2aa77a10..bd5589bae0 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -74,11 +74,11 @@ LINUX_DEPENDENCIES += host-lzop
 else ifeq ($(BR2_LINUX_KERNEL_XZ),y)
 LINUX_DEPENDENCIES += host-xz
 endif
-LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_GZIP) = CONFIG_KERNEL_GZIP
-LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_LZ4) = CONFIG_KERNEL_LZ4
-LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_LZMA) = CONFIG_KERNEL_LZMA
-LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_LZO) = CONFIG_KERNEL_LZO
-LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_XZ) = CONFIG_KERNEL_XZ
+LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_GZIP) += CONFIG_KERNEL_GZIP
+LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_LZ4) += CONFIG_KERNEL_LZ4
+LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_LZMA) += CONFIG_KERNEL_LZMA
+LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_LZO) += CONFIG_KERNEL_LZO
+LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_XZ) += CONFIG_KERNEL_XZ
 
 # If host-uboot-tools is selected by the user, assume it is needed to
 # create a custom image
@@ -252,7 +252,7 @@ endif
 define LINUX_KCONFIG_FIXUP_CMDS
 	$(if $(LINUX_NEEDS_MODULES),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_MODULES,$(@D)/.config))
-	$(call KCONFIG_ENABLE_OPT,$(LINUX_COMPRESSION_OPT_y),$(@D)/.config)
+	$(call KCONFIG_ENABLE_OPT,$(strip $(LINUX_COMPRESSION_OPT_y)),$(@D)/.config)
 	$(foreach opt, $(LINUX_COMPRESSION_OPT_),
 		$(call KCONFIG_DISABLE_OPT,$(opt),$(@D)/.config)
 	)
-- 
2.11.0
