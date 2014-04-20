From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 20 Apr 2014 20:54:03 +0200
Subject: [Buildroot] [PATCH 1/2] smack: new package.
In-Reply-To: <1398020044-21021-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1398020044-21021-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1398020044-21021-2-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

SMACK stands for Simplified Mandatory Access Control Kernel. It is a Linux
Security Module which provides a Mandatory Access Control mechanism,
like SELinux, but aiming towards simplicity.

This package provides the tools to load/unload the policy from the
kernel as well as a library allowing applications to interact with
SMACK. The proper kernel options are also set.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 linux/linux.mk          |  4 ++++
 package/Config.in       |  1 +
 package/smack/Config.in | 28 ++++++++++++++++++++++++++++
 package/smack/smack.mk  | 14 ++++++++++++++
 4 files changed, 47 insertions(+)
 create mode 100644 package/smack/Config.in
 create mode 100644 package/smack/smack.mk

diff --git a/linux/linux.mk b/linux/linux.mk
index e270705..bd3f2ac 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -200,6 +200,10 @@ define LINUX_CONFIGURE_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_AUTOFS4_FS,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_POSIX_ACL,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_POSIX_XATTR,$(@D)/.config))
+	$(if $(BR2_PACKAGE_SMACK),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_SMACK,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_NETWORK,$(@D)/.config))
 	$(if $(BR2_LINUX_KERNEL_APPENDED_DTB),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_ARM_APPENDED_DTB,$(@D)/.config))
 	yes '' | $(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) oldconfig
diff --git a/package/Config.in b/package/Config.in
index 44c35ea..323596e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1104,6 +1104,7 @@ source "package/quota/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/rsyslog/Config.in"
 endif
+source "package/smack/Config.in"
 source "package/supervisor/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/sysklogd/Config.in"
diff --git a/package/smack/Config.in b/package/smack/Config.in
new file mode 100644
index 0000000..971b79a
--- /dev/null
+++ b/package/smack/Config.in
@@ -0,0 +1,28 @@
+config BR2_PACKAGE_SMACK
+	bool "smack"
+	help
+	  User space programs and libraries for SMACK.
+
+	  SMACK stands for Simplified Mandatory Access Control Kernel.
+	  It is a Linux Security Module which provides a Mandatory Access
+	  Control mechanism, aimed towards simplicity.
+
+	  This package provides a library which allows applications to work
+	  with SMACK and tools to load/unload rules from the kernel, as well
+	  as query the policy.
+
+	  SMACK requires the following kernel options to be enabled:
+
+	  - CONFIG_SECURITY
+	  - CONFIG_SECURITY_SMACK
+	  - CONFIG_SECURITY_NETWORK
+
+	  These options will be automatically enabled by Buildroot if it is
+	  responsible for building the kernel. Otherwise, if you are building
+	  your kernel outside of Buildroot, make sure these options are
+	  enabled.
+
+	  To activate SMACK, do not forget to add "security=smack" to your
+	  kernel command line.
+
+	  https://github.com/smack-team/smack
diff --git a/package/smack/smack.mk b/package/smack/smack.mk
new file mode 100644
index 0000000..41f71a4
--- /dev/null
+++ b/package/smack/smack.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# smack
+#
+################################################################################
+
+SMACK_VERSION = 1.0.4
+SMACK_SITE = $(call github,smack-team,smack,v$(SMACK_VERSION))
+SMACK_LICENSE = LGPLv2.1+
+SMACK_LICENSE_FILES = COPYING
+SMACK_INSTALL_STAGING = YES
+SMACK_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
1.9.0
