From: Atul Singh <atul.singh.mandla@rockwellcollins.com>
Date: Thu, 24 Mar 2016 12:03:06 +0530
Subject: [Buildroot] [PATCH 3/3] aufs: new kernel extension
Message-ID: <1458801186-24700-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Christian Stewart <christian@paral.in>

Adding a kernel extension that patches the kernel with the correct
version of aufs-standalone. This relies on the user ensuring the
correct version is set in the configs.

Signed-off-by: Atul Singh <atul.singh.mandla@rockwellcollins.com>
---
 linux/Config.ext.in     | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 linux/linux-ext-aufs.mk | 23 +++++++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 linux/linux-ext-aufs.mk

diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 755c23b..83e8831 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -64,4 +64,50 @@ config BR2_LINUX_KERNEL_EXT_FBTFT
 
 	  https://github.com/notro/fbtft
 
+# aufs-standalone
+config BR2_LINUX_KERNEL_EXT_AUFS
+	bool "Aufs Filesystem Module patch"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_AUFS
+	help
+	  Aufs is split in two parts: a kernel part and a userspace
+	  part. Enabling this option automatically selects the aufs
+	  standalone (module) package and patches the Linux kernel
+	  built by Buildroot with the aufs kernel part (ie fs/aufs).
+
+	  It is important to use the correct branch of aufs-standalone.
+
+comment "aufs needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+if BR2_LINUX_KERNEL_EXT_AUFS
+
+choice
+	prompt "aufs major version"
+	default BR2_PACKAGE_AUFS_4X
+
+config BR2_PACKAGE_AUFS_4X
+	bool "4.x"
+
+config BR2_PACKAGE_AUFS_3X
+	bool "3.x"
+
+endchoice
+
+config BR2_PACKAGE_AUFS_STANDALONE_VERSION
+	string "aufs-standalone branch"
+	default "see_help_to define_this"
+	help
+	  Aufs-standalone repository branch must be selected and
+	  must match the current kernel version.  Review the
+	  following pages to determine what branch number is valid
+	  depending on which major version that was selected.
+
+	  https://sourceforge.net/p/aufs/aufs3-standalone/ref/master/branches/
+	  https://github.com/sfjro/aufs4-standalone/branches/all
+
+endif
+
 endmenu
diff --git a/linux/linux-ext-aufs.mk b/linux/linux-ext-aufs.mk
new file mode 100644
index 0000000..5c1fd73
--- /dev/null
+++ b/linux/linux-ext-aufs.mk
@@ -0,0 +1,23 @@
+################################################################################
+# Linux Aufs extensions
+#
+# Patch the linux kernel with aufs extension
+################################################################################
+
+LINUX_EXTENSIONS += aufs
+
+define AUFS_PREPARE_KERNEL
+	if test -d $(LINUX_DIR)/fs/aufs/; then \
+		echo "Your kernel already supports AUFS. Not patching."; \
+	else \
+		$(APPLY_PATCHES) $(LINUX_DIR) $(AUFS_SRCDIR) \
+			$(AUFS_MAJOR_VERSION)-kbuild.patch \
+			$(AUFS_MAJOR_VERSION)-base.patch \
+			$(AUFS_MAJOR_VERSION)-mmap.patch \
+			$(AUFS_MAJOR_VERSION)-standalone.patch ; \
+	fi
+	cp $(AUFS_SRCDIR)/Documentation/ABI/testing/* $(LINUX_DIR)/Documentation/ABI/testing/
+	cp -r $(AUFS_SRCDIR)/Documentation/filesystems/aufs/ $(LINUX_DIR)/Documentation/filesystems/aufs/
+	cp -r $(AUFS_SRCDIR)/fs/aufs/ $(LINUX_DIR)/fs/
+	cp $(AUFS_SRCDIR)/include/uapi/linux/aufs_type.h $(LINUX_DIR)/include/uapi/linux/
+endef
-- 
2.5.0
