From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Feb 2016 22:56:19 +0100
Subject: [Buildroot] [git commit branch/next] package/nvme: new package
Message-ID: <20160216215638.8226180480@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3ad518b61d896a5f61d05ef8d878708bd7be3f94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add support for building NVME utility - a utility for interacting with
standard NVM Express (optimized PCI Express SSD interface) devices.

Signed-off-by: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in      |  1 +
 package/nvme/Config.in |  7 +++++++
 package/nvme/nvme.hash |  2 ++
 package/nvme/nvme.mk   | 23 +++++++++++++++++++++++
 4 files changed, 33 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 529ad33..21be9f6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -407,6 +407,7 @@ endif
 	source "package/neard/Config.in"
 	source "package/nvidia-driver/Config.in"
 	source "package/nvidia-tegra23/Config.in"
+	source "package/nvme/Config.in"
 	source "package/ofono/Config.in"
 	source "package/ola/Config.in"
 	source "package/on2-8170-modules/Config.in"
diff --git a/package/nvme/Config.in b/package/nvme/Config.in
new file mode 100644
index 0000000..dd8655f
--- /dev/null
+++ b/package/nvme/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_NVME
+	bool "nvme"
+	help
+	  NVME utility, a utility for interacting with standard NVM
+	  Express (optimized PCI Express SSD interface) devices.
+
+	  https://github.com/linux-nvme/nvme-cli
diff --git a/package/nvme/nvme.hash b/package/nvme/nvme.hash
new file mode 100644
index 0000000..b299041
--- /dev/null
+++ b/package/nvme/nvme.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 c631e90dd4d411cdb618b26bc36b06706e6f1f2d3db38874bcfe48f4bc15aac4 nvme-v0.3.tar.gz
diff --git a/package/nvme/nvme.mk b/package/nvme/nvme.mk
new file mode 100755
index 0000000..8cb8863
--- /dev/null
+++ b/package/nvme/nvme.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# nvme
+#
+################################################################################
+
+NVME_VERSION = v0.3
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
