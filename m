From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 10 Jun 2014 19:19:44 -0700
Subject: [Buildroot] [PATCH v2 1/1] simicsfs: new package
Message-ID: <1402453184-4851-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---

Changes v1 -> v2:
   - Added comment if Linux kernel isn't selected (Thomas P)
   - Added depend on Linux kernel being selected (Thomas P)
---
 package/Config.in            |    1 +
 package/simicsfs/Config.in   |   11 +++++++++++
 package/simicsfs/simicsfs.mk |   21 +++++++++++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 package/simicsfs/Config.in
 create mode 100644 package/simicsfs/simicsfs.mk

diff --git a/package/Config.in b/package/Config.in
index f874eaf..138d674 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -151,6 +151,7 @@ source "package/mtd/Config.in"
 source "package/mtools/Config.in"
 source "package/nfs-utils/Config.in"
 source "package/ntfs-3g/Config.in"
+source "package/simicsfs/Config.in"
 source "package/squashfs/Config.in"
 source "package/sshfs/Config.in"
 source "package/sunxi-tools/Config.in"
diff --git a/package/simicsfs/Config.in b/package/simicsfs/Config.in
new file mode 100644
index 0000000..12b05c1
--- /dev/null
+++ b/package/simicsfs/Config.in
@@ -0,0 +1,11 @@
+comment "simicsfs needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_SIMICSFS
+	bool "simicsfs"
+	depends on BR2_LINUX_KERNEL
+	help
+	  A kernel driver that provides access to a host computer's local
+	  filesystem when the target is executing within a SIMICS simulation.
+
+	  http://www.cs.sfu.ca/~fedorova/Tech/simics-guides-3.0.26/simics-user-guide-unix/topic33.html
diff --git a/package/simicsfs/simicsfs.mk b/package/simicsfs/simicsfs.mk
new file mode 100644
index 0000000..c266f68
--- /dev/null
+++ b/package/simicsfs/simicsfs.mk
@@ -0,0 +1,21 @@
+###############################################################################
+#
+# simicsfs
+#
+###############################################################################
+
+SIMICSFS_VERSION = 1.17
+SIMICSFS_SITE = https://download.simics.net/pub/
+SIMICSFS_LICENSE = GPLv2+
+SIMICSFS_LICENSE_FILES = hostfs.h
+SIMICSFS_DEPENDENCIES = linux
+
+define SIMICSFS_BUILD_CMDS
+        $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) modules
+endef
+
+define SIMICSFS_INSTALL_TARGET_CMDS
+        $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
