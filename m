From: Julian Scheel <julian@jusst.de>
Date: Thu, 11 Feb 2016 10:05:09 -0500
Subject: [Buildroot] [RFC PATCH 2/3] Add package cbootimage
In-Reply-To: <1455203110-16759-1-git-send-email-julian@jusst.de>
References: <1455203110-16759-1-git-send-email-julian@jusst.de>
Message-ID: <1455203110-16759-3-git-send-email-julian@jusst.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add package for cbootimage host utility that is able to compile bct files and
generate flashable images out of a bct and an image for tegra processors.

Signed-off-by: Julian Scheel <julian@jusst.de>
---
 package/Config.in.host             |  1 +
 package/cbootimage/Config.in.host  |  7 +++++++
 package/cbootimage/cbootimage.hash |  2 ++
 package/cbootimage/cbootimage.mk   | 14 ++++++++++++++
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
index 0000000..4cdde38
--- /dev/null
+++ b/package/cbootimage/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_CBOOTIMAGE
+	bool "host cbootimage"
+	help
+	  This project provides a tool which compiles BCT (Boot Configuration
+	  Table) images to place into the boot flash of a Tegra-based device.
+
+	  https://github.com/NVIDIA/cbootimage
diff --git a/package/cbootimage/cbootimage.hash b/package/cbootimage/cbootimage.hash
new file mode 100644
index 0000000..6f23870
--- /dev/null
+++ b/package/cbootimage/cbootimage.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  a15739c9e2ca4f582de56c4c795c057d7b322224edd65228bdd725dfdd3aa78c  v1.6.tar.gz
diff --git a/package/cbootimage/cbootimage.mk b/package/cbootimage/cbootimage.mk
new file mode 100644
index 0000000..3efef36
--- /dev/null
+++ b/package/cbootimage/cbootimage.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# cbootimage
+#
+################################################################################
+
+# Stick with git snapshot as latest release misses bugfixes for signing
+CBOOTIMAGE_VERSION = e7d840c
+CBOOTIMAGE_SITE = https://github.com/NVIDIA/cbootimage.git
+CBOOTIMAGE_SITE_METHOD = git
+CBOOTIMAGE_LICENSE = GPLv2
+CBOOTIMAGE_AUTORECONF = YES
+
+$(eval $(host-autotools-package))
-- 
2.7.0
