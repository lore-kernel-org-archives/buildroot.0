From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Jun 2014 14:38:50 +0200
Subject: [Buildroot] [git commit] simicsfs: new package
Message-ID: <20140613124035.B0D5B99E72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7e867725acf2f5aedca60985ee530d1530792f78
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: use http url as wget complains about certificate]
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in            |    1 +
 package/simicsfs/Config.in   |   11 +++++++++++
 package/simicsfs/simicsfs.mk |   21 +++++++++++++++++++++
 3 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 35e088d..88705f8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -151,6 +151,7 @@ menu "Filesystem and flash utilities"
 	source "package/mtools/Config.in"
 	source "package/nfs-utils/Config.in"
 	source "package/ntfs-3g/Config.in"
+	source "package/simicsfs/Config.in"
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
index 0000000..425f000
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
+SIMICSFS_SITE = http://download.simics.net/pub/
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
