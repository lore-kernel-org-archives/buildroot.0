From: Mamatha <mamatha4@linux.vnet.ibm.com>
Date: Mon, 11 Jan 2016 15:37:41 +0530
Subject: [Buildroot] [PATCH V2] Adding support for NVME utils
Message-ID: <20160111095719.19626.17062.stgit@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is to add support for NVME utils.
After enabling NVME device and tool in op-build this will increase the size
of rootfs.tar by 92KB and zImage.epapr by 41KB.

Changes from V1:
===============
* Updated NVME_VERSION = 0.1
* updated the subject description

Signed-off-by: Mamatha <mamatha4@linux.vnet.ibm.com>
---
 package/Config.in      |    1 +
 package/nvme/Config.in |    6 ++++++
 package/nvme/nvme.mk   |   23 +++++++++++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100755 package/nvme/Config.in
 create mode 100755 package/nvme/nvme.mk

diff --git a/package/Config.in b/package/Config.in
index e0c2e2a..014debd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1399,6 +1399,7 @@ endif
 	source "package/openvmtools/Config.in"
 	source "package/polkit/Config.in"
 	source "package/powerpc-utils/Config.in"
+	source "package/nvme/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/procps-ng/Config.in"
 	source "package/psmisc/Config.in"
diff --git a/package/nvme/Config.in b/package/nvme/Config.in
new file mode 100755
index 0000000..8b5d37d
--- /dev/null
+++ b/package/nvme/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_NVME
+	bool "nvme"
+	help
+	  System utilities for IBM Power NVME devices
+
+	  https://github.com/linux-nvme/nvme-cli
diff --git a/package/nvme/nvme.mk b/package/nvme/nvme.mk
new file mode 100755
index 0000000..43bec67
--- /dev/null
+++ b/package/nvme/nvme.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# nvme
+#
+################################################################################
+
+NVME_VERSION = 0.1
+NVME_SITE = https://github.com/linux-nvme/nvme-cli.git
+NVME_SITE_METHOD = git
+NVME_LICENSE = GPLv2
+NVME_LICENSE_FILES = COPYING
+
+define NVME_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+		INCLUDEDIR="-I." all
+endef
+
+define NVME_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/nvme $(TARGET_DIR)/sbin/nvme
+endef
+
+$(eval $(generic-package))
+
