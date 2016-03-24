From: Atul Singh <atul.singh.mandla@rockwellcollins.com>
Date: Thu, 24 Mar 2016 12:01:45 +0530
Subject: [Buildroot] [PATCH 1/3] aufs: new package
Message-ID: <1458801105-24612-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Christian Stewart <christian@paral.in>

aufs is a metapackage that downloads the correct
aufs-standalone sources for patching the kernel with the aufs
filesystem. The package is not selectable because it does nothing but
download the sources on default. It is a dependency of the Aufs kernel
extension.

Signed-off-by: Atul Singh <atul.singh.mandla@rockwellcollins.com>
---
 package/Config.in      |  1 +
 package/aufs/Config.in |  4 ++++
 package/aufs/aufs.mk   | 27 +++++++++++++++++++++++++++
 3 files changed, 32 insertions(+)
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
index 0000000..51f2c91
--- /dev/null
+++ b/package/aufs/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_AUFS
+	bool "aufs"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/aufs/aufs.mk b/package/aufs/aufs.mk
new file mode 100644
index 0000000..3cdbffc
--- /dev/null
+++ b/package/aufs/aufs.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# aufs
+#
+# patches for the linux kernel, used by the extension.
+#
+################################################################################
+
+# linux-headers default to a 4.x
+AUFS_VERSION = aufs$(call qstrip,$(BR2_PACKAGE_AUFS_STANDALONE_VERSION))
+AUFS_SITE = $(call github,sfjro,aufs4-standalone,$(AUFS_VERSION))
+AUFS_LICENSE = GPLv2
+AUFS_LICENSE_FILES = COPYING
+AUFS_INSTALL_STAGING = YES
+AUFS_INSTALL_TARGET = NO
+
+ifeq ($(BR2_PACKAGE_AUFS_3X),y)
+AUFS_MAJOR_VERSION = aufs3
+AUFS_SITE = http://git.code.sf.net/p/aufs/aufs3-standalone
+AUFS_SITE_METHOD = git
+endif
+
+ifeq ($(BR2_PACKAGE_AUFS_4X),y)
+AUFS_MAJOR_VERSION = aufs4
+endif
+
+$(eval $(generic-package))
-- 
2.5.0
