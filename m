From: Christian Stewart <christian@paral.in>
Date: Fri, 31 Jul 2015 16:56:55 -0700
Subject: [Buildroot] [PATCH v1 1/3] aufs-standalone: new package
Message-ID: <1438387017-10597-1-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

aufs-standalone is a metapackage that downloads the correct
aufs-standalone sources for patching the kernel with the aufs
filesystem. The package is not selectable because it does nothing but
download the sources on default. It is a dependency of the Aufs kernel
extension.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/aufs-standalone/Config.in          |  5 +++++
 package/aufs-standalone/aufs-standalone.mk | 26 ++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 package/aufs-standalone/Config.in
 create mode 100644 package/aufs-standalone/aufs-standalone.mk

diff --git a/package/aufs-standalone/Config.in b/package/aufs-standalone/Config.in
new file mode 100644
index 0000000..4b48743
--- /dev/null
+++ b/package/aufs-standalone/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_AUFS_STANDALONE
+	bool
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_LINUX_KERNEL
diff --git a/package/aufs-standalone/aufs-standalone.mk b/package/aufs-standalone/aufs-standalone.mk
new file mode 100644
index 0000000..ebf5ab6
--- /dev/null
+++ b/package/aufs-standalone/aufs-standalone.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# aufs-standalone
+#
+# patches for the linux kernel, used by the extension.
+#
+################################################################################
+
+# linux-headers
+AUFS_STANDALONE_VERSION = aufs$(call qstrip,$(BR2_PACKAGE_AUFS_STANDALONE_VERSION))
+ifeq ($(BR2_PACKAGE_AUFS_STANDALONE_3X),y)
+AUFS_STANDALONE_MAJOR_VERSION = aufs3
+endif
+ifeq ($(BR2_PACKAGE_AUFS_STANDALONE_4X),y)
+AUFS_STANDALONE_MAJOR_VERSION = aufs4
+endif
+ifeq ($(BR2_PACKAGE_AUFS_STANDALONE_3X),y)
+AUFS_STANDALONE_SITE = git://git.code.sf.net/p/aufs/aufs3-standalone
+endif
+ifeq ($(BR2_PACKAGE_AUFS_STANDALONE_4X),y)
+AUFS_STANDALONE_SITE = $(call github,sfjro,aufs4-standalone,$(AUFS_STANDALONE_VERSION))
+endif
+AUFS_STANDALONE_LICENSE = GNU
+AUFS_STANDALONE_LICENSE_FILES = COPYING
+
+$(eval $(generic-package))
-- 
2.1.4
