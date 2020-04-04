From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  4 Apr 2020 14:10:27 +0200
Subject: [Buildroot] [PATCH 15/22] package/systemd: bear the kernel options
 munging
In-Reply-To: <cover.1586002215.git.yann.morin.1998@free.fr>
References: <cover.1586002215.git.yann.morin.1998@free.fr>
Message-ID: <fc9f563675e70191e70d106e156ef99dd33829ff.1586002215.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 linux/linux.mk             | 7 -------
 package/systemd/systemd.mk | 9 +++++++++
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 60fefd0eba..0a504dc615 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -355,13 +355,6 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER))
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NET))
-	$(if $(BR2_PACKAGE_SYSTEMD),
-		$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_FHANDLE)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_AUTOFS4_FS)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_POSIX_ACL)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_XATTR))
 	$(if $(BR2_PACKAGE_SMACK),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_SMACK)
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 56459947c4..f058c94040 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -519,6 +519,15 @@ SYSTEMD_TARGET_FINALIZE_HOOKS += SYSTEMD_PRESET_ALL
 SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
 SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
 
+define SYSTEMD_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FHANDLE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_AUTOFS4_FS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_POSIX_ACL)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_XATTR)
+endef
+
 # We need a very minimal host variant, so we disable as much as possible.
 HOST_SYSTEMD_CONF_OPTS = \
 	-Dsplit-bin=true \
-- 
2.20.1
