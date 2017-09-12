From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Sep 2017 23:34:42 +0200
Subject: [Buildroot] [git commit] fscryptctl: new package
Message-ID: <20170912213541.5CC2F80FE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81bf606d160ecd2479d338e18111e56f4020728c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fscryptctl is a low-level tool written in C that handles raw keys and
manages policies for Linux filesystem encryption.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                  |  1 +
 package/fscryptctl/Config.in       | 12 ++++++++++++
 package/fscryptctl/fscryptctl.hash |  3 +++
 package/fscryptctl/fscryptctl.mk   | 20 ++++++++++++++++++++
 4 files changed, 36 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 7a277d7..4d7d5a2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -180,6 +180,7 @@ menu "Filesystem and flash utilities"
 	source "package/exfat-utils/Config.in"
 	source "package/f2fs-tools/Config.in"
 	source "package/flashbench/Config.in"
+	source "package/fscryptctl/Config.in"
 	source "package/fwup/Config.in"
 	source "package/genext2fs/Config.in"
 	source "package/genpart/Config.in"
diff --git a/package/fscryptctl/Config.in b/package/fscryptctl/Config.in
new file mode 100644
index 0000000..91b9ba8
--- /dev/null
+++ b/package/fscryptctl/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_FSCRYPTCTL
+	bool "fscryptctl"
+	help
+	  fscryptctl is a low-level tool written in C that handles raw
+	  keys and manages policies for Linux filesystem encryption.
+
+	  Notice: Fscrypt support on EXT4 requires a kernel with
+	  CONFIG_EXT4_ENCRYPTION=y and a file system with the
+	  encryption option and block size equal to CPU page size
+	  (BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS="-O encrypt -b 4096")
+
+	  https://github.com/google/fscryptctl
diff --git a/package/fscryptctl/fscryptctl.hash b/package/fscryptctl/fscryptctl.hash
new file mode 100644
index 0000000..ea3a47b
--- /dev/null
+++ b/package/fscryptctl/fscryptctl.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 ad5ca31fa2372d4d9c01439bf5b9717d4b9775630d7947b9c6b69377150e76a1  fscryptctl-18428569e4b23cf33b90046aaed3b5fbdab3b191.tar.gz
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/fscryptctl/fscryptctl.mk b/package/fscryptctl/fscryptctl.mk
new file mode 100644
index 0000000..843cb78
--- /dev/null
+++ b/package/fscryptctl/fscryptctl.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# fscryptctl
+#
+################################################################################
+
+FSCRYPTCTL_VERSION = 18428569e4b23cf33b90046aaed3b5fbdab3b191
+FSCRYPTCTL_SITE = $(call github,google,fscryptctl,$(FSCRYPTCTL_VERSION))
+FSCRYPTCTL_LICENSE = Apache-2.0
+FSCRYPTCTL_LICENSE_FILES = LICENSE
+
+define FSCRYPTCTL_BUILD_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) fscryptctl
+endef
+
+define FSCRYPTCTL_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/fscryptctl $(TARGET_DIR)/usr/bin/fscryptctl
+endef
+
+$(eval $(generic-package))
