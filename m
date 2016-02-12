From: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
Date: Fri, 12 Feb 2016 16:58:30 +0530
Subject: [Buildroot] [PATCH V8] package/nvme: new package
Message-ID: <20160212105841.13451.45986.stgit@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for building NVME utility - a utility for interacting with
standard NVM Express (optimized PCI Express SSD interface) devices.

Changes in V8:
/package/nvme/Makefile patch not added:
CFLAGS changes in nvme/Makefile is not required because I did not see
any compilation errors after adding "depend on BR2_powerpc64 || BR2_powerpc64le"
line in nvme/Config.in for this I have to enable 64-bit arch in config file.
after enabling 64-bit arch I do not see any compilation errors in nvme code.

Signed-off-by: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
---
 package/Config.in      |    1 +
 package/nvme/Config.in |   10 ++++++++++
 package/nvme/nvme.hash |    2 ++
 package/nvme/nvme.mk   |   23 +++++++++++++++++++++++
 4 files changed, 36 insertions(+)
 create mode 100644 package/nvme/Config.in
 create mode 100644 package/nvme/nvme.hash
 create mode 100755 package/nvme/nvme.mk

diff --git a/package/Config.in b/package/Config.in
index e0c2e2a..4d173d4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -380,6 +380,7 @@ endif
 	source "package/neard/Config.in"
 	source "package/nvidia-driver/Config.in"
 	source "package/nvidia-tegra23/Config.in"
+	source "package/nvme/Config.in"
 	source "package/ofono/Config.in"
 	source "package/ola/Config.in"
 	source "package/on2-8170-modules/Config.in"
diff --git a/package/nvme/Config.in b/package/nvme/Config.in
new file mode 100644
index 0000000..878bed3
--- /dev/null
+++ b/package/nvme/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_NVME
+	bool "nvme"
+	depends on BR2_powerpc64 || BR2_powerpc64le
+
+	help
+	  Add support for building NVME utility - a utility
+	  for interacting with standard NVM Express
+	  (optimized PCI Express SSD interface) devices.
+
+	  https://github.com/linux-nvme/nvme-cli
diff --git a/package/nvme/nvme.hash b/package/nvme/nvme.hash
new file mode 100644
index 0000000..539a2b6
--- /dev/null
+++ b/package/nvme/nvme.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  914319930a51372293c981562b165ae6af0de70f7da37e42da23940fe23aa387 nvme-v0.2.tar.gz
diff --git a/package/nvme/nvme.mk b/package/nvme/nvme.mk
new file mode 100755
index 0000000..7bb4d24
--- /dev/null
+++ b/package/nvme/nvme.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# nvme
+#
+################################################################################
+
+NVME_VERSION = v0.2
+NVME_SITE = $(call github,linux-nvme,nvme-cli,$(NVME_VERSION))
+NVME_LICENSE = GPLv2+
+NVME_LICENSE_FILES = COPYING
+
+# LIBUDEV=1 means that libudev is _disabled_
+define NVME_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
+		LIBUDEV=1 -C $(@D)
+endef
+
+define NVME_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) \
+		PREFIX=/usr install-bin
+endef
+
+$(eval $(generic-package))
