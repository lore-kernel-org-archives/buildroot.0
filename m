From: Atul Singh <atul.singh.mandla@rockwellcollins.com>
Date: Fri, 29 Apr 2016 19:01:51 +0530
Subject: [Buildroot] [PATCH v2 2/3] aufs: new kernel extension
Message-ID: <1461936711-1432-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Christian Stewart <christian@paral.in>

Adding a kernel extension that patches the kernel with the correct
version of aufs-standalone. This relies on the user ensuring the
correct version is set in the configs.

Signed-off-by: Christian Stewart <christian@paral.in>
[Atul:
 - Removed the depends on.
 - Changed the name of the variable BR2_PACKAGE_AUFS_STANDALONE_VERSION.
 - Removed the comment  "aufs needs a toolchain w/ threads".
 - Removed the choice BR2_PACKAGE_AUFS_3X or BR2_PACKAGE_AUFS_4X.
 - Default left to empty rather than some text.
 - Used AUFS_DIR instead of AUFS_SRCDIR.
 - Used $(@D) instead of $(LINUX_DIR).
]
Signed-off-by: Atul Singh <atul.singh.mandla@rockwellcollins.com>
---
 linux/Config.ext.in     | 28 ++++++++++++++++++++++++++++
 linux/linux-ext-aufs.mk | 23 +++++++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 linux/linux-ext-aufs.mk

diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 755c23b..7fa1156 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -64,4 +64,32 @@ config BR2_LINUX_KERNEL_EXT_FBTFT
 
 	  https://github.com/notro/fbtft
 
+# aufs-standalone
+config BR2_LINUX_KERNEL_EXT_AUFS
+	bool "Aufs Filesystem Module patch"
+	select BR2_PACKAGE_AUFS
+	help
+	  Aufs is split in two parts: a kernel part and a userspace
+	  part. Enabling this option automatically selects the aufs
+	  standalone (module) package and patches the Linux kernel
+	  built by Buildroot with the aufs kernel part (ie fs/aufs).
+
+	  It is important to use the correct branch of aufs-standalone.
+
+if BR2_LINUX_KERNEL_EXT_AUFS
+
+config BR2_LINUX_KERNEL_EXT_AUFS_VERSION
+	string "aufs-standalone branch"
+	default ""
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
index 0000000..7d48745
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
+	if test -d $(@D)/fs/aufs/; then \
+		echo "Your kernel already supports AUFS. Not patching."; \
+	else \
+		$(APPLY_PATCHES) $(@D) $(AUFS_DIR) \
+			$(AUFS_MAJOR_VERSION)-kbuild.patch \
+			$(AUFS_MAJOR_VERSION)-base.patch \
+			$(AUFS_MAJOR_VERSION)-mmap.patch \
+			$(AUFS_MAJOR_VERSION)-standalone.patch ; \
+	fi
+	cp $(AUFS_DIR)/Documentation/ABI/testing/* $(@D)/Documentation/ABI/testing/
+	cp -r $(AUFS_DIR)/Documentation/filesystems/aufs/ $(@D)/Documentation/filesystems/aufs/
+	cp -r $(AUFS_DIR)/fs/aufs/ $(@D)/fs/
+	cp $(AUFS_DIR)/include/uapi/linux/aufs_type.h $(@D)/include/uapi/linux/
+endef
-- 
2.5.0
