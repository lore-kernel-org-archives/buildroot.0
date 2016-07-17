From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jul 2016 14:50:37 +0200
Subject: [Buildroot] [PATCH 1/3 v3] aufs: new kernel extension
In-Reply-To: <cover.1468759218.git.yann.morin.1998@free.fr>
References: <cover.1468759218.git.yann.morin.1998@free.fr>
Message-ID: <c275f2001114fdf18419d7ef23d24b038d2d0599.1468759218.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Christian Stewart <christian@paral.in>

Signed-off-by: Christian Stewart <christian@paral.in>
[Atul:
 - Removed the duplicate conditional block.
 - Updated the license to GPLv2.
 - Removed the visibilty of package from menuconfig.
 - Removed dependencies.
 - Removed the comment.
 - Changed the name of variable from BR2_PACKAGE_AUFS_STANDALONE_VERSION
   to BR2_LINUX_KERNEL_EXT_AUFS_VERSION.
 - Removed the AUFS_INSTALL_STAGING  and AUFS_INSTALL_TARGET  variables.
 - Removed the BR2_PACKAGE_AUFS_3X and BR2_PACKAGE_AUFS_4X variables.
]
Signed-off-by: Atul Singh <atul.singh.mandla@rockwellcollins.com>
[yann.morin.1998 at free.fr:
  - do not fail on version check if aufs ext is disabled
  - check for empty version
  - squash aufs package and linux extension in one patch
  - fail if the kernel already has aufs support
  - simplify handling of version
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 linux/Config.ext.in     | 52 +++++++++++++++++++++++++++++++++++++++++++++++++
 linux/linux-ext-aufs.mk | 21 ++++++++++++++++++++
 package/Config.in       |  1 +
 package/aufs/Config.in  | 16 +++++++++++++++
 package/aufs/aufs.mk    | 28 ++++++++++++++++++++++++++
 5 files changed, 118 insertions(+)
 create mode 100644 linux/linux-ext-aufs.mk
 create mode 100644 package/aufs/Config.in
 create mode 100644 package/aufs/aufs.mk

diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 755c23b..b88cfdb 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -64,4 +64,56 @@ config BR2_LINUX_KERNEL_EXT_FBTFT
 
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
+choice
+	bool "aufs-standalone series"
+	help
+	  Select the major series of this version. This must match the
+	  major version of your kernel (e.g. for kernels 3.x, select
+	  aufs3.x; for kernels 4.x, select aufs4.x).
+
+	  Note: neither aufs1.x nor aufs2.x (both for kernels older than
+	  3.x) are supported.
+
+config BR2_LINUX_KERNEL_EXT_AUFS_SERIES_3
+	bool "aufs3.x"
+
+config BR2_LINUX_KERNEL_EXT_AUFS_SERIES_4
+	bool "aufs4.x"
+
+endchoice
+
+config BR2_LINUX_KERNEL_EXT_AUFS_SERIES
+	int
+	default 3 if BR2_LINUX_KERNEL_EXT_AUFS_SERIES_3
+	default 4 if BR2_LINUX_KERNEL_EXT_AUFS_SERIES_4
+
+config BR2_LINUX_KERNEL_EXT_AUFS_VERSION
+	string "aufs-standalone version"
+	default ""
+	help
+	  The version you choose must match that of your kernel. Usually,
+	  the sha1 of the cset you want to use; avoid using a branch name
+	  as this yields non-reproducible builds.
+
+	  See the following resources to see what versions are available:
+
+	  For aufs3.x: https://sourceforge.net/p/aufs/aufs3-standalone/ref/master/branches/
+	  For aufs4.x: https://github.com/sfjro/aufs4-standalone/branches/all
+
+endif # aufs
+
 endmenu
diff --git a/linux/linux-ext-aufs.mk b/linux/linux-ext-aufs.mk
new file mode 100644
index 0000000..f71e172
--- /dev/null
+++ b/linux/linux-ext-aufs.mk
@@ -0,0 +1,21 @@
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
+		echo "Your kernel already supports AUFS."; \
+		exit 1; \
+	fi
+	$(APPLY_PATCHES) $(@D) $(AUFS_DIR) \
+		aufs$(AUFS_VERSION_MAJOR)-kbuild.patch \
+		aufs$(AUFS_VERSION_MAJOR)-base.patch \
+		aufs$(AUFS_VERSION_MAJOR)-mmap.patch \
+		aufs$(AUFS_VERSION_MAJOR)-standalone.patch
+	cp -r $(AUFS_DIR)/fs/aufs/ $(@D)/fs/
+	cp $(AUFS_DIR)/include/uapi/linux/aufs_type.h $(@D)/include/uapi/linux/
+endef
diff --git a/package/Config.in b/package/Config.in
index 009b828..a9b004b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -147,6 +147,7 @@ menu "Development tools"
 endmenu
 
 menu "Filesystem and flash utilities"
+	source "package/aufs/Config.in"
 	source "package/autofs/Config.in"
 	source "package/btrfs-progs/Config.in"
 	source "package/cifs-utils/Config.in"
diff --git a/package/aufs/Config.in b/package/aufs/Config.in
new file mode 100644
index 0000000..0a2aa0e
--- /dev/null
+++ b/package/aufs/Config.in
@@ -0,0 +1,16 @@
+# Automatically selected by the corresponding linux extension
+config BR2_PACKAGE_AUFS
+	bool
+
+if BR2_PACKAGE_AUFS
+
+# Both come from the seclection of the linux extension.
+config BR2_PACKAGE_AUFS_SERIES
+	int
+	default BR2_LINUX_KERNEL_EXT_AUFS_SERIES
+
+config BR2_PACKAGE_AUFS_VERSION
+	string
+	default BR2_LINUX_KERNEL_EXT_AUFS_VERSION
+
+endif
diff --git a/package/aufs/aufs.mk b/package/aufs/aufs.mk
new file mode 100644
index 0000000..cbb6635
--- /dev/null
+++ b/package/aufs/aufs.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# aufs
+#
+# patches for the linux kernel, used by the extension.
+#
+################################################################################
+
+AUFS_VERSION = $(call qstrip,$(BR2_PACKAGE_AUFS_VERSION))
+AUFS_LICENSE = GPLv2
+AUFS_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_PACKAGE_AUFS),y)
+
+ifeq ($(BR2_PACKAGE_AUFS_SERIES),3)
+AUFS_SITE = http://git.code.sf.net/p/aufs/aufs3-standalone
+AUFS_SITE_METHOD = git
+else ifeq ($(BR2_PACKAGE_AUFS_SERIES),4)
+AUFS_SITE = $(call github,sfjro,aufs4-standalone,$(AUFS_VERSION))
+endif
+
+ifeq ($(BR_BUILDING):$(AUFS_VERSION),y:)
+$(error No aufs version specified)
+endif
+
+endif # BR2_PACKAGE_AUFS
+
+$(eval $(generic-package))
-- 
2.7.4
