From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2016 22:33:08 +0200
Subject: [Buildroot] [git commit] cbootimage: new package
Message-ID: <20160419203323.A708881E21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b467c6b952ba8088eedbc529e8d877301e61c93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add package for cbootimage host utility that is able to compile bct
files and generate flashable images out of a bct and an image for
tegra processors.

Signed-off-by: Julian Scheel <julian@jusst.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in.host             |  1 +
 package/cbootimage/Config.in.host  |  9 +++++++++
 package/cbootimage/cbootimage.hash |  2 ++
 package/cbootimage/cbootimage.mk   | 13 +++++++++++++
 4 files changed, 25 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index ccded79..c1d40f4 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -1,6 +1,7 @@
 menu "Host utilities"
 
 	source "package/aespipe/Config.in.host"
+	source "package/cbootimage/Config.in.host"
 	source "package/checkpolicy/Config.in.host"
 	source "package/cramfs/Config.in.host"
 	source "package/dfu-util/Config.in.host"
diff --git a/package/cbootimage/Config.in.host b/package/cbootimage/Config.in.host
new file mode 100644
index 0000000..1913afa
--- /dev/null
+++ b/package/cbootimage/Config.in.host
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HOST_CBOOTIMAGE
+	bool "host cbootimage"
+	depends on BR2_arm || BR2_armeb
+	help
+	  This project provides a tool which compiles BCT (Boot
+	  Configuration Table) images to place into the boot flash of
+	  a Tegra-based device.
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
