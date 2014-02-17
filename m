From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 17 Feb 2014 11:22:16 +0100
Subject: [Buildroot] [PATCH 2/2] systemd: enable required kernel features.
In-Reply-To: <1392632536-16714-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1392632536-16714-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1392632536-16714-3-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When systemd is chosen as init system, the required kernel features are
enabled.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 linux/linux.mk            |    6 +++++-
 package/systemd/Config.in |   12 ++++++++++--
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index d7f51b3..f948e6c 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -195,7 +195,11 @@ define LINUX_CONFIGURE_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_FUNCTION_TRACER,$(@D)/.config))
 	$(if $(BR2_PACKAGE_SYSTEMD),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS,$(@D)/.config)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER,$(@D)/.config))
+		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_FHANDLE,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_AUTOFS4_FS,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_POSIX_ACL,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_POSIX_XATTR,$(@D)/.config))
 	$(if $(BR2_LINUX_KERNEL_APPENDED_DTB),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_ARM_APPENDED_DTB,$(@D)/.config))
 	yes '' | $(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) oldconfig
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index eacc23c..716da2c 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -26,8 +26,16 @@ config BR2_PACKAGE_SYSTEMD
 	  elaborate transactional dependency-based service control logic.
 	  It can work as a drop-in replacement for sysvinit.
 
-	  Systemd requires a Linux kernel >= 3.0, with inotify, devtmpfs,
-	  tmpfs vfs and tmpfs POSIX ACL enabled.
+	  Systemd requires a Linux kernel >= 3.0.
+
+	  The following features will be enabled in the kernel:
+
+	  - CONFIG_CGROUPS
+	  - CONFIG_INOTIFY_USER
+	  - CONFIG_FHANDLE
+	  - CONFIG_AUTOFS4_FS
+	  - CONFIG_TMPFS_POSIX_ACL
+	  - CONFIG_TMPFS_XATTR
 
 	  Systemd also provides udev, the userspace device daemon.
 
-- 
1.7.9.5
