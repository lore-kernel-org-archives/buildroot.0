From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Date: Mon, 18 Apr 2016 14:56:26 +1000
Subject: [Buildroot] [PATCH 1/1] nvme: Allow libudev support
Message-ID: <1460955386-21322-1-git-send-email-sam@mendozajonas.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commands like 'nvme list' require libudev but support for libudev is
decided at compile time, and in buildroot this is hard disabled.
Add a config option which allows libudev support to be enabled for the
nvme package.

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
---
 package/nvme/Config.in |  9 +++++++++
 package/nvme/nvme.mk   | 10 ++++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/nvme/Config.in b/package/nvme/Config.in
index dd8655f..4590fdc 100644
--- a/package/nvme/Config.in
+++ b/package/nvme/Config.in
@@ -5,3 +5,12 @@ config BR2_PACKAGE_NVME
 	  Express (optimized PCI Express SSD interface) devices.
 
 	  https://github.com/linux-nvme/nvme-cli
+
+if BR2_PACKAGE_NVME
+
+config BR2_PACKAGE_NVME_LIBUDEV
+	bool "nvme-udev"
+	help
+	  libudev support for the NVME utility
+
+endif
diff --git a/package/nvme/nvme.mk b/package/nvme/nvme.mk
index 7c4bd8e..72500c5 100755
--- a/package/nvme/nvme.mk
+++ b/package/nvme/nvme.mk
@@ -8,12 +8,22 @@ NVME_VERSION = v0.3
 NVME_SITE = $(call github,linux-nvme,nvme-cli,$(NVME_VERSION))
 NVME_LICENSE = GPLv2+
 NVME_LICENSE_FILES = LICENSE
+ifeq ($(BR2_PACKAGE_NVME_LIBUDEV), y)
+NVME_DEPENDENCIES = udev
+endif
 
 # LIBUDEV=1 means that libudev is _disabled_
+ifeq ($(BR2_PACKAGE_NVME_LIBUDEV), y)
+define NVME_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
+		LIBUDEV=0 -C $(@D)
+endef
+else
 define NVME_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
 		LIBUDEV=1 -C $(@D)
 endef
+endif
 
 define NVME_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) \
-- 
2.8.0
