From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  4 Apr 2020 14:10:23 +0200
Subject: [Buildroot] [PATCH 11/22] package/intel-micro-code: bear the kernel
 options munging
In-Reply-To: <cover.1586002215.git.yann.morin.1998@free.fr>
References: <cover.1586002215.git.yann.morin.1998@free.fr>
Message-ID: <b9da188bfe92a27b8b797b7af395d97699d9c008.1586002215.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Carlos Santos <unixmania@gmail.com>
---
 linux/linux.mk                             | 3 ---
 package/intel-microcode/intel-microcode.mk | 5 +++++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index ea65286308..65cfa5d7ad 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -355,9 +355,6 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER))
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NET))
-	$(if $(BR2_PACKAGE_INTEL_MICROCODE),
-		$(call KCONFIG_ENABLE_OPT,CONFIG_MICROCODE)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_MICROCODE_INTEL))
 	$(if $(BR2_PACKAGE_KTAP),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEBUG_FS)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_ENABLE_DEFAULT_TRACERS)
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index 0492ace69e..f3d05d5f58 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -27,4 +27,9 @@ else
 INTEL_MICROCODE_INSTALL_TARGET = NO
 endif
 
+define INTEL_MICROCODE_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MICROCODE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MICROCODE_INTEL)
+endef
+
 $(eval $(generic-package))
-- 
2.20.1
