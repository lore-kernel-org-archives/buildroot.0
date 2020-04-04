From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  4 Apr 2020 14:10:22 +0200
Subject: [Buildroot] [PATCH 10/22] package/audit: bear the kernel options
 munging
In-Reply-To: <cover.1586002215.git.yann.morin.1998@free.fr>
References: <cover.1586002215.git.yann.morin.1998@free.fr>
Message-ID: <ab7aa79cc97d2c90acef1312a298e0376c2a2db7.1586002215.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
---
 linux/linux.mk         | 3 ---
 package/audit/audit.mk | 5 +++++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 84c4f5db8d..ea65286308 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -355,9 +355,6 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER))
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NET))
-	$(if $(BR2_PACKAGE_AUDIT),
-		$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_AUDIT))
 	$(if $(BR2_PACKAGE_INTEL_MICROCODE),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_MICROCODE)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_MICROCODE_INTEL))
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 03967ee650..652e0fcd56 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -54,6 +54,11 @@ define AUDIT_INSTALL_CLEANUP
 endef
 AUDIT_POST_INSTALL_TARGET_HOOKS += AUDIT_INSTALL_CLEANUP
 
+define AUDIT_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_AUDIT)
+endef
+
 HOST_AUDIT_CONF_OPTS = \
 	--without-python \
 	--without-python3 \
-- 
2.20.1
