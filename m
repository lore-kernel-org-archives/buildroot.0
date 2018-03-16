From: Connor Rigby <connor@farmbot.io>
Date: Fri, 16 Mar 2018 09:56:07 -0700
Subject: [Buildroot] [PATCH] libfreenect: new package.
Message-ID: <20180316165607.17627-1-connor@farmbot.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libfreenect is a userspace driver for the Microsoft Kinect.

Signed-off-by: Connor Rigby <connor@farmbot.io>
---
 package/Config.in                    |  1 +
 package/libfreenect/Config.in        | 32 +++++++++++++++++++++++++++++++
 package/libfreenect/libfreenect.hash |  2 ++
 package/libfreenect/libfreenect.mk   | 37 ++++++++++++++++++++++++++++++++++++
 4 files changed, 72 insertions(+)
 create mode 100644 package/libfreenect/Config.in
 create mode 100644 package/libfreenect/libfreenect.hash
 create mode 100644 package/libfreenect/libfreenect.mk

diff --git a/package/Config.in b/package/Config.in
index 449ffcc47b..22bd7e9c7d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1203,6 +1203,7 @@ menu "Hardware handling"
 	source "package/libatasmart/Config.in"
 	source "package/libcec/Config.in"
 	source "package/libfreefare/Config.in"
+	source "package/libfreenect/Config.in"
 	source "package/libftdi/Config.in"
 	source "package/libftdi1/Config.in"
 	source "package/libgphoto2/Config.in"
diff --git a/package/libfreenect/Config.in b/package/libfreenect/Config.in
new file mode 100644
index 0000000000..f0680980fc
--- /dev/null
+++ b/package/libfreenect/Config.in
@@ -0,0 +1,32 @@
+config BR2_PACKAGE_LIBFREENECT
+	bool "Libfreenect"
+  select BR2_PACKAGE_LIBUSB
+	help
+    libfreenect is a userspace driver for the Microsoft Kinect.
+
+	  https://openkinect.org/wiki/Main_Page
+
+if BR2_PACKAGE_LIBFREENECT
+
+config BR2_PACKAGE_LIBFREENECT_PYTHON2
+  bool "Libfreenect Python Wrapper"
+  depends on BR2_PACKAGE_LIBFREENECT
+  depends on BR2_PACKAGE_PYTHON
+  depends on BR2_PACKAGE_PYTHON_NUMPY
+  help
+    build python wrapper for libfreenect.
+
+config BR2_PACKAGE_LIBFREENECT_EXAMPLES
+  bool "Libfreenect examples"
+  depends on BR2_PACKAGE_LIBFREEGLUT
+  depends on BR2_PACKAGE_LIBGLU
+  help
+    build examples for libfreenect.
+
+config BR2_PACKAGE_LIBFREENECT_OPENCV
+  bool "Libfreenect opencv wrapper"
+  depends on BR2_PACKAGE_OPENCV
+  help
+    build opencv wrapper for Libfreenect.
+
+endif
diff --git a/package/libfreenect/libfreenect.hash b/package/libfreenect/libfreenect.hash
new file mode 100644
index 0000000000..d662ac3225
--- /dev/null
+++ b/package/libfreenect/libfreenect.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 5f22c9a0260efd5a31d8e6465bb06b2b389f61b8f7714e0b42b7b20314e5ef59  libfreenect-v0.5.7.tar.gz
diff --git a/package/libfreenect/libfreenect.mk b/package/libfreenect/libfreenect.mk
new file mode 100644
index 0000000000..53413e1a01
--- /dev/null
+++ b/package/libfreenect/libfreenect.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# libfreenect
+#
+################################################################################
+LIBFREENECT_VERSION = v0.5.7
+LIBFREENECT_SITE = $(call github,OpenKinect,libfreenect,$(LIBFREENECT_VERSION))
+LIBFREENECT_INSTALL_STAGING = YES
+LIBFREENECT_DEPENDENCIES = libusb host-pkgconf
+LIBFREENECT_LICENSE = Apache-2.0, GPL-2.0+
+LIBFREENECT_LICENSE_FILES = APACHE20 GPL2
+
+LIBFREENECT_CONF_OPTS  = -DBUILD_REDIST_PACKAGE=OFF -DBUILD_C_SYNC=ON \
+                         -DBUILD_CPP=ON -DBUILD_OPENNI2_DRIVER=OFF
+
+ifeq ($(BR2_PACKAGE_LIBFREENECT_PYTHON2),y)
+LIBFREENECT_DEPENDENCIES += python python-numpy
+LIBFREENECT_CONF_OPTS += -DBUILD_PYTHON2=ON
+else
+LIBFREENECT_CONF_OPTS += -DBUILD_PYTHON2=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBFREENECT_EXAMPLES),y)
+LIBFREENECT_DEPENDENCIES += libfreeglut libglu
+LIBFREENECT_CONF_OPTS += -DBUILD_EXAMPLES=ON
+else
+LIBFREENECT_CONF_OPTS += -DBUILD_EXAMPLES=OFF
+endif
+
+ifeq ($(BR2BR2_PACKAGE_LIBFREENECT_OPENCV),y)
+LIBFREENECT_DEPENDENCIES += opencv
+LIBFREENECT_CONF_OPTS += -DBUILD_CV=ON
+else
+LIBFREENECT_CONF_OPTS += -DBUILD_CV=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.16.2
