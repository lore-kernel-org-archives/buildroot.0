From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Apr 2014 12:15:45 +0200
Subject: [Buildroot] [git commit] smack: new package.
Message-ID: <20140421101655.EFB599C96C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=773ee9797ad4c74e967ad959f6ce0677b6c66677
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SMACK stands for Simplified Mandatory Access Control Kernel. It is a Linux
Security Module which provides a Mandatory Access Control mechanism,
like SELinux, but aiming towards simplicity.

This package provides the tools to load/unload the policy from the
kernel as well as a library allowing applications to interact with
SMACK. The proper kernel options are also set.

[Thomas:
- fixed license to be LGPLv2.1 instead of LGPLv2.1+. Even though the
  debian/copyright file has the "or later" indication, none of the .c
  source files carry it, so I suppose LGPLv2.1 is more correct.
- added !BR2_PREFER_STATIC_LIB dependency.
- added dependency on host-pkgconf, since Smack configure.ac uses
  PKG_CHECK_MODULES.]

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk          |    4 ++++
 package/Config.in       |    1 +
 package/smack/Config.in |   32 ++++++++++++++++++++++++++++++++
 package/smack/smack.mk  |   17 +++++++++++++++++
 4 files changed, 54 insertions(+), 0 deletions(-)

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
index 1361e9f..07fd166 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1106,6 +1106,7 @@ source "package/quota/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/rsyslog/Config.in"
 endif
+source "package/smack/Config.in"
 source "package/supervisor/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/sysklogd/Config.in"
diff --git a/package/smack/Config.in b/package/smack/Config.in
new file mode 100644
index 0000000..618a680
--- /dev/null
+++ b/package/smack/Config.in
@@ -0,0 +1,32 @@
+config BR2_PACKAGE_SMACK
+	bool "smack"
+	depends on !BR2_PREFER_STATIC_LIB # dlfcn.h
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
+
+comment "smack needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
diff --git a/package/smack/smack.mk b/package/smack/smack.mk
new file mode 100644
index 0000000..2858686
--- /dev/null
+++ b/package/smack/smack.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# smack
+#
+################################################################################
+
+SMACK_VERSION = 1.0.4
+SMACK_SITE = $(call github,smack-team,smack,v$(SMACK_VERSION))
+SMACK_LICENSE = LGPLv2.1
+SMACK_LICENSE_FILES = COPYING
+SMACK_INSTALL_STAGING = YES
+SMACK_DEPENDENCIES = host-pkgconf
+
+# Sources from github, no configure script included.
+SMACK_AUTORECONF = YES
+
+$(eval $(autotools-package))
