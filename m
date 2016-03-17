From: Julian Scheel <julian@jusst.de>
Date: Thu, 17 Mar 2016 16:03:57 +0100
Subject: [Buildroot] [PATCHv2 3/4] Add package cbootimage
In-Reply-To: <1458227038-16383-1-git-send-email-julian@jusst.de>
References: <1458227038-16383-1-git-send-email-julian@jusst.de>
Message-ID: <1458227038-16383-4-git-send-email-julian@jusst.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add package for cbootimage host utility that is able to compile bct files and
generate flashable images out of a bct and an image for tegra processors.

Signed-off-by: Julian Scheel <julian@jusst.de>
---
Changes in v2:
--------------
- Depend on ARM platform
- Use github helper
- Add license file reference
---
 package/Config.in.host             |  1 +
 package/cbootimage/Config.in.host  |  8 ++++++++
 package/cbootimage/cbootimage.hash |  2 ++
 package/cbootimage/cbootimage.mk   | 13 +++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/cbootimage/Config.in.host
 create mode 100644 package/cbootimage/cbootimage.hash
 create mode 100644 package/cbootimage/cbootimage.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 05e0644..4eb62d6 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -1,5 +1,6 @@
 menu "Host utilities"
 
+	source "package/cbootimage/Config.in.host"
 	source "package/checkpolicy/Config.in.host"
 	source "package/cramfs/Config.in.host"
 	source "package/dfu-util/Config.in.host"
diff --git a/package/cbootimage/Config.in.host b/package/cbootimage/Config.in.host
new file mode 100644
index 0000000..5f6a93d
--- /dev/null
+++ b/package/cbootimage/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_CBOOTIMAGE
+	bool "host cbootimage"
+	depends on BR2_arm || BR2_armeb
+	help
+	  This project provides a tool which compiles BCT (Boot Configuration
+	  Table) images to place into the boot flash of a Tegra-based device.
+
+	  https://github.com/NVIDIA/cbootimage
diff --git a/package/cbootimage/cbootimage.hash b/package/cbootimage/cbootimage.hash
new file mode 100644
index 0000000..96cf172
--- /dev/null
+++ b/package/cbootimage/cbootimage.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 373c108d7b6778c62a33e59ad0cd5ea9ebb379319a0c8b4cf469eaa8bec5521b  cbootimage-v1.7.tar.gz
diff --git a/package/cbootimage/cbootimage.mk b/package/cbootimage/cbootimage.mk
new file mode 100644
index 0000000..20b17dd
--- /dev/null
+++ b/package/cbootimage/cbootimage.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# cbootimage
+#
+################################################################################
+
+CBOOTIMAGE_VERSION = v1.7
+CBOOTIMAGE_SITE = $(call github,NVIDIA,cbootimage,$(CBOOTIMAGE_VERSION))
+CBOOTIMAGE_LICENSE = GPLv2
+CBOOTIMAGE_LICENSE_FILES = COPYING
+CBOOTIMAGE_AUTORECONF = YES
+
+$(eval $(host-autotools-package))
-- 
2.7.3
