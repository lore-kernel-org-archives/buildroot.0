From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Feb 2014 21:28:05 +0100
Subject: [Buildroot] [git commit branch/next] systemd: enable required
	kernel features.
Message-ID: <20140225203135.611B59BA89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4c10eedc103ba9648f73439f1ab5d801da9d2ed7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

When systemd is chosen as init system, the required kernel features are
enabled.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk            |    6 +++++-
 package/systemd/Config.in |   16 ++++++++++++++--
 2 files changed, 19 insertions(+), 3 deletions(-)

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
index eacc23c..4f180a1 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -26,8 +26,20 @@ config BR2_PACKAGE_SYSTEMD
 	  elaborate transactional dependency-based service control logic.
 	  It can work as a drop-in replacement for sysvinit.
 
-	  Systemd requires a Linux kernel >= 3.0, with inotify, devtmpfs,
-	  tmpfs vfs and tmpfs POSIX ACL enabled.
+	  Systemd requires a Linux kernel >= 3.0 with the following options
+	  enabled:
+
+	  - CONFIG_CGROUPS
+	  - CONFIG_INOTIFY_USER
+	  - CONFIG_FHANDLE
+	  - CONFIG_AUTOFS4_FS
+	  - CONFIG_TMPFS_POSIX_ACL
+	  - CONFIG_TMPFS_XATTR
+
+	  These options will be automatically enabled by Buildroot if
+	  it is responsible for building the kernel. Otherwise, if you
+	  are building your kernel outside of Buildroot, make sure
+	  these options are enabled.
 
 	  Systemd also provides udev, the userspace device daemon.
 
