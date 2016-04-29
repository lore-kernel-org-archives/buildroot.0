From: Atul Singh <atul.singh.mandla@rockwellcollins.com>
Date: Fri, 29 Apr 2016 19:01:30 +0530
Subject: [Buildroot] [PATCH v2 1/3] aufs: new package
Message-ID: <1461936690-1389-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Christian Stewart <christian@paral.in>

aufs is a dummy package that downloads the correct
aufs-standalone sources for patching the kernel with the aufs
filesystem. The package is not selectable because it does nothing but
download the sources on default. It is a dependency of the Aufs kernel
extension.

Signed-off-by: Christian Stewart <christian@paral.in>
[Atul:
 - Removed the duplicate conditional block.
 - Updated the license to GPLv2.
 - Removed the visibilty of package from menuconfig.
 - Removed dependencies.
 - Removed the comment.
 - Changed the name of variable from BR2_PACKAGE_AUFS_STANDALONE_VERSION to BR2_LINUX_KERNEL_EXT_AUFS_VERSION.
 - Removed the AUFS_INSTALL_STAGING  and AUFS_INSTALL_TARGET  variables.
 - Removed the BR2_PACKAGE_AUFS_3X and BR2_PACKAGE_AUFS_4X variables.
]
Signed-off-by: Atul Singh <atul.singh.mandla@rockwellcollins.com>
---
 package/Config.in      |  1 +
 package/aufs/Config.in |  2 ++
 package/aufs/aufs.mk   | 24 ++++++++++++++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/aufs/Config.in
 create mode 100644 package/aufs/aufs.mk

diff --git a/package/Config.in b/package/Config.in
index 27db639..54166b1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -160,6 +160,7 @@ endif
 endmenu
 
 menu "Filesystem and flash utilities"
+	source "package/aufs/Config.in"
 	source "package/autofs/Config.in"
 	source "package/btrfs-progs/Config.in"
 	source "package/cifs-utils/Config.in"
diff --git a/package/aufs/Config.in b/package/aufs/Config.in
new file mode 100644
index 0000000..3ff4691
--- /dev/null
+++ b/package/aufs/Config.in
@@ -0,0 +1,2 @@
+config BR2_PACKAGE_AUFS
+	bool
diff --git a/package/aufs/aufs.mk b/package/aufs/aufs.mk
new file mode 100644
index 0000000..a139547
--- /dev/null
+++ b/package/aufs/aufs.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# aufs
+#
+# patches for the linux kernel, used by the extension.
+#
+################################################################################
+
+AUFS_VERSION = aufs$(call qstrip,$(BR2_LINUX_KERNEL_EXT_AUFS_VERSION))
+AUFS_VERSION_MAJOR = $(firstword $(subst .,$(space),$(call qstrip,$(BR2_LINUX_KERNEL_EXT_AUFS_VERSION))))
+AUFS_SITE = $(call github,sfjro,aufs4-standalone,$(AUFS_VERSION))
+AUFS_LICENSE = GPLv2
+AUFS_LICENSE_FILES = COPYING
+
+ifeq ($(AUFS_VERSION_MAJOR),3)
+AUFS_SITE = http://git.code.sf.net/p/aufs/aufs3-standalone
+AUFS_SITE_METHOD = git
+else ifeq ($(AUFS_VERSION_MAJOR),4)
+AUFS_SITE = $(call github,sfjro,aufs4-standalone,$(AUFS_VERSION))
+else
+$(error Unknown aufs major version)
+endif
+
+$(eval $(generic-package))
-- 
2.5.0
