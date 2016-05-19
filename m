From: oferh at marvell.com <oferh@marvell.com>
Date: Thu, 19 May 2016 16:17:03 +0300
Subject: [Buildroot] [PATCH 1/1] linux: align endiness based on BR config
Message-ID: <1463663823-7308-1-git-send-email-oferh@marvell.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ofer Heifetz <oferh@marvell.com>

Linux endiness should be based on BR2_ENDIAN,
this commit alignes linux endian with BR.

Signed-off-by: Ofer Heifetz <oferh@marvell.com>
---
 linux/linux.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index d88060e..58af369 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -209,6 +209,16 @@ LINUX_KCONFIG_OPTS = $(LINUX_MAKE_FLAGS)
 # If no package has yet set it, set it from the Kconfig option
 LINUX_NEEDS_MODULES ?= $(BR2_LINUX_NEEDS_MODULES)
 
+ifeq ($(BR2_ENDIAN),"BIG")
+define LINUX_FIXUP_CONFIG_ENDIANNESS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CPU_BIG_ENDIAN,$(@D)/.config)
+endef
+else
+define LINUX_FIXUP_CONFIG_ENDIANNESS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CPU_LITTLE_ENDIAN,$(@D)/.config)
+endef
+endif
+
 define LINUX_KCONFIG_FIXUP_CMDS
 	$(if $(LINUX_NEEDS_MODULES),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_MODULES,$(@D)/.config))
@@ -216,6 +226,7 @@ define LINUX_KCONFIG_FIXUP_CMDS
 	$(foreach opt, $(LINUX_COMPRESSION_OPT_),
 		$(call KCONFIG_DISABLE_OPT,$(opt),$(@D)/.config)
 	)
+	$(LINUX_FIXUP_CONFIG_ENDIANNESS)
 	$(if $(BR2_arm)$(BR2_armeb),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config))
 	$(if $(BR2_TARGET_ROOTFS_CPIO),
-- 
2.8.2
