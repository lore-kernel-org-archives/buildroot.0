From: Floris Bos <bos@je-eigen-domein.nl>
Date: Sun, 15 Feb 2015 14:19:33 +0100
Subject: [Buildroot] [PATCH] linux: add AUFS kernel extension
Message-ID: <1424006373-1663-1-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 linux/Config.ext.in     | 19 +++++++++++++++++++
 linux/linux-ext-aufs.mk | 24 ++++++++++++++++++++++++
 package/aufs/Config.in  | 11 +++++++++++
 package/aufs/aufs.mk    | 15 +++++++++++++++
 4 files changed, 69 insertions(+)
 create mode 100644 linux/linux-ext-aufs.mk
 create mode 100644 package/aufs/Config.in
 create mode 100644 package/aufs/aufs.mk

diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 8f15687..04fe7a1 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -29,6 +29,25 @@ config BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH
 	  Download it at http://download.gna.org/adeos/patches/v2.6/$(ARCH)/
 	  and verify that your kernel version in buildroot matches.
 
+# AUFS
+config BR2_LINUX_KERNEL_EXT_AUFS
+	bool "AUFS patch"
+	select BR2_PACKAGE_AUFS
+	help
+	  AUFS patch
+
+	  This option patches the kernel.
+	  You need to enable CONFIG_AUFS_FS in kernel configuration seperately.
+
+	  http://aufs.sourceforge.net/
+
+config BR2_LINUX_KERNEL_EXT_AUFS_VERSION
+	depends on BR2_LINUX_KERNEL_EXT_AUFS
+	string "AUFS version"
+	help
+	  AUFS git branch, e.g. aufs3.18.1+
+	  Needs to match your kernel version.
+
 # RTAI
 config BR2_LINUX_KERNEL_EXT_RTAI
 	bool "RTAI Real-time patch"
diff --git a/linux/linux-ext-aufs.mk b/linux/linux-ext-aufs.mk
new file mode 100644
index 0000000..c3ff2dc
--- /dev/null
+++ b/linux/linux-ext-aufs.mk
@@ -0,0 +1,24 @@
+################################################################################
+# Linux aufs extension
+#
+# Patch the linux kernel with aufs extension
+################################################################################
+
+ifeq ($(BR2_LINUX_KERNEL_EXT_AUFS),y)
+# Add dependency to aufs package (download helper for the aufs source)
+LINUX_DEPENDENCIES += aufs
+
+AUFS_PATCHES = kbuild base mmap standalone
+
+define AUFS_PREPARE_KERNEL
+	$(foreach p,$(AUFS_PATCHES),./support/scripts/apply-patches.sh $(LINUX_DIR) $(AUFS_DIR) *$(p).patch;)
+	cp -af $(AUFS_DIR)/fs $(AUFS_DIR)/Documentation $(LINUX_DIR)
+	cp -af $(AUFS_DIR)/include/uapi/linux/aufs_type.h \
+		$(LINUX_DIR)/include/uapi/linux
+	cp -af $(AUFS_DIR)/include/uapi/linux/aufs_type.h \
+		$(STAGING_DIR)/usr/include/linux
+endef
+
+LINUX_PRE_PATCH_HOOKS += AUFS_PREPARE_KERNEL
+
+endif #BR2_LINUX_KERNEL_EXT_AUFS
diff --git a/package/aufs/Config.in b/package/aufs/Config.in
new file mode 100644
index 0000000..d924278
--- /dev/null
+++ b/package/aufs/Config.in
@@ -0,0 +1,11 @@
+# Prompt-less option, because this package is not doing anything
+# except downloading the AUFS sources. The real work is done by a
+# Linux extension.
+config BR2_PACKAGE_AUFS
+	bool
+	depends on BR2_LINUX_KERNEL
+	help
+	  AUFS
+	  This is only the download helper for the kernel patch.
+
+	  http://aufs.sourceforge.net/
diff --git a/package/aufs/aufs.mk b/package/aufs/aufs.mk
new file mode 100644
index 0000000..fbee85c
--- /dev/null
+++ b/package/aufs/aufs.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# AUFS download helper
+#
+################################################################################
+
+AUFS_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_EXT_AUFS_VERSION))
+AUFS_SITE = git://git.code.sf.net/p/aufs/aufs3-standalone
+AUFS_LICENSE = GPLv2
+
+ifeq ($(AUFS_VERSION),)
+$(error BR2_LINUX_KERNEL_EXT_AUFS_VERSION must be set to the AUFS branch matching your kernel, e.g. "aufs3.18.1+")
+endif
+
+$(eval $(generic-package))
-- 
1.9.1
