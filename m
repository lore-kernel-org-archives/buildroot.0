From: Julian Scheel <julian@jusst.de>
Date: Thu, 17 Mar 2016 16:03:56 +0100
Subject: [Buildroot] [PATCHv2 2/4] Add package tegrarcm
In-Reply-To: <1458227038-16383-1-git-send-email-julian@jusst.de>
References: <1458227038-16383-1-git-send-email-julian@jusst.de>
Message-ID: <1458227038-16383-3-git-send-email-julian@jusst.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add package for the tegrarcm host utility that allows loading data to tegra
processors in recovery mode.

Signed-off-by: Julian Scheel <julian@jusst.de>
---
Changes in v2:
--------------
- Use github helper
- Fix license
- Add cryptopp dependency
- Add patch to fix cryptopp inclusion for cross build
---
 package/Config.in.host                             |  1 +
 ...-cryptopp-include-crosscompile-compatible.patch | 27 ++++++++++++++++++++++
 package/tegrarcm/Config.in.host                    |  8 +++++++
 package/tegrarcm/tegrarcm.hash                     |  2 ++
 package/tegrarcm/tegrarcm.mk                       | 15 ++++++++++++
 5 files changed, 53 insertions(+)
 create mode 100644 package/tegrarcm/0001-Make-cryptopp-include-crosscompile-compatible.patch
 create mode 100644 package/tegrarcm/Config.in.host
 create mode 100644 package/tegrarcm/tegrarcm.hash
 create mode 100644 package/tegrarcm/tegrarcm.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index ce1b6bc..05e0644 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -27,6 +27,7 @@ menu "Host utilities"
 	source "package/sam-ba/Config.in.host"
 	source "package/squashfs/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
+	source "package/tegrarcm/Config.in.host"
 	source "package/uboot-tools/Config.in.host"
 	source "package/util-linux/Config.in.host"
 
diff --git a/package/tegrarcm/0001-Make-cryptopp-include-crosscompile-compatible.patch b/package/tegrarcm/0001-Make-cryptopp-include-crosscompile-compatible.patch
new file mode 100644
index 0000000..ed0d1fc
--- /dev/null
+++ b/package/tegrarcm/0001-Make-cryptopp-include-crosscompile-compatible.patch
@@ -0,0 +1,27 @@
+From 0e60af53fa76aa2f274ade98da7ba543147e82c7 Mon Sep 17 00:00:00 2001
+From: Julian Scheel <julian@jusst.de>
+Date: Thu, 17 Mar 2016 12:37:04 +0100
+Subject: [PATCH] Make cryptopp include crosscompile compatible
+
+Allows user to set a SYSROOT variable for building against a specific root
+filesystem.
+
+Signed-off-by: Julian Scheel <julian@jusst.de>
+---
+ src/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 3dad0e6..7678dd4 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -1,5 +1,5 @@
+ AM_CFLAGS = -Wall -std=c99
+-AM_CPPFLAGS = -isystem /usr/include/$(CRYPTOLIB) $(LIBUSB_CFLAGS)
++AM_CPPFLAGS = -isystem $(SYSROOT)/usr/include/$(CRYPTOLIB) $(LIBUSB_CFLAGS)
+ 
+ bin_PROGRAMS = tegrarcm
+ tegrarcm_SOURCES = \
+-- 
+2.7.3
+
diff --git a/package/tegrarcm/Config.in.host b/package/tegrarcm/Config.in.host
new file mode 100644
index 0000000..47590fa
--- /dev/null
+++ b/package/tegrarcm/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_TEGRARCM
+	bool "host tegrarcm"
+	depends on BR2_arm || BR2_armeb
+	help
+	  This program is used to send code to a Tegra device in recovery
+	  mode.
+
+	  https://github.com/NVIDIA/tegrarcm
diff --git a/package/tegrarcm/tegrarcm.hash b/package/tegrarcm/tegrarcm.hash
new file mode 100644
index 0000000..4194a4c
--- /dev/null
+++ b/package/tegrarcm/tegrarcm.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  538cb0af237ab33e070d3aeb6cc828cd7ef453753ba2ccc21b87ed43faac51bd  tegrarcm-v1.7.tar.gz
diff --git a/package/tegrarcm/tegrarcm.mk b/package/tegrarcm/tegrarcm.mk
new file mode 100644
index 0000000..5dbc483
--- /dev/null
+++ b/package/tegrarcm/tegrarcm.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# tegrarcm
+#
+################################################################################
+
+TEGRARCM_VERSION = v1.7
+TEGRARCM_SITE = $(call github,NVIDIA,tegrarcm,$(TEGRARCM_VERSION))
+TEGRARCM_LICENSE = BSD-3c / NVIDIA Software License (src/miniloader)
+TEGRARCM_LICENSE_FILE = LICENSE
+TEGRARCM_AUTORECONF = YES
+HOST_TEGRARCM_DEPENDENCIES = host-libusb host-pkgconf host-cryptopp
+HOST_TEGRARCM_MAKE_OPTS = SYSROOT=$(HOST_DIR)
+
+$(eval $(host-autotools-package))
-- 
2.7.3
