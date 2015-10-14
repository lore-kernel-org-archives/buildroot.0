From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 14 Oct 2015 23:28:23 +0200
Subject: [Buildroot] [PATCH] package/python-pillow: new package
Message-ID: <1444858103-556-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds python-pillow, the friendly python image library fork.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/Config.in                      |  1 +
 package/python-pillow/Config.in        | 53 ++++++++++++++++++++++++++++++++++
 package/python-pillow/python-pillow.mk | 36 +++++++++++++++++++++++
 3 files changed, 90 insertions(+)
 create mode 100644 package/python-pillow/Config.in
 create mode 100644 package/python-pillow/python-pillow.mk

diff --git a/package/Config.in b/package/Config.in
index f686f13..7ba23f0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -633,6 +633,7 @@ menu "External python modules"
 	source "package/python-nfc/Config.in"
 	source "package/python-numpy/Config.in"
 	source "package/python-pam/Config.in"
+	source "package/python-pillow/Config.in"
 	source "package/python-posix-ipc/Config.in"
 	source "package/python-protobuf/Config.in"
 	source "package/python-psutil/Config.in"
diff --git a/package/python-pillow/Config.in b/package/python-pillow/Config.in
new file mode 100644
index 0000000..7e19aec
--- /dev/null
+++ b/package/python-pillow/Config.in
@@ -0,0 +1,53 @@
+config BR2_PACKAGE_PYTHON_PILLOW
+	bool "python-pillow"
+	help
+	  Pillow is the "friendly" PIL fork by Alex Clark and Contributors. PIL is
+	  the Python Imaging Library by Fredrik Lundh and Contributors.
+
+	  https://pypi.python.org/pypi/Pillow/
+
+if BR2_PACKAGE_PYTHON_PILLOW
+
+config BR2_PACKAGE_PYTHON_PILLOW_JPEG
+	bool "JPEG support"
+	select BR2_PACKAGE_JPEG_LIBRARY
+	default n
+	help
+	  This option provides JPEG functionality.
+
+config BR2_PACKAGE_PYTHON_PILLOW_ZLIB
+	bool "compressed PNGs support"
+	select BR2_PACKAGE_ZLIB
+	default n
+	help
+	  This option provides access to compressed PNGs.
+
+config BR2_PACKAGE_PYTHON_PILLOW_TIFF
+	bool "compressed TIFF support"
+	select BR2_PACKAGE_TIFF
+	default n
+	help
+	  This option provides compressed TIFF functionality.
+
+config BR2_PACKAGE_PYTHON_PILLOW_FREETYPE
+	bool "freetype support"
+	select BR2_PACKAGE_FREETYPE
+	default n
+	help
+	  This option provides type related services.
+
+config BR2_PACKAGE_PYTHON_PILLOW_WEBP
+	bool "WebP format support"
+	select BR2_PACKAGE_WEBP
+	default n
+	help
+	  This option provides the WebP format.
+
+config BR2_PACKAGE_PYTHON_PILLOW_JPEG2000
+	bool "JPEG 2000 support"
+	select BR2_PACKAGE_OPENJPEG
+	default n
+	help
+	  This option provides JPEG 2000 functionality.
+
+endif
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
new file mode 100644
index 0000000..94c234e
--- /dev/null
+++ b/package/python-pillow/python-pillow.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# python-pillow
+#
+################################################################################
+
+PYTHON_PILLOW_VERSION = 3.0.0
+PYTHON_PILLOW_SITE = $(call github,python-pillow,Pillow,$(PYTHON_PILLOW_VERSION))
+PYTHON_PILLOW_DEPENDENCIES = python-setuptools
+PYTHON_PILLOW_SETUP_TYPE = distutils
+
+ifeq ($(BR2_PACKAGE_PYTHON_PILLOW_JPEG),y)
+PYTHON_PILLOW_DEPENDENCIES += jpeg
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON_PILLOW_ZLIB),y)
+PYTHON_PILLOW_DEPENDENCIES += zlib
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON_PILLOW_TIFF),y)
+PYTHON_PILLOW_DEPENDENCIES += tiff
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON_PILLOW_FREETYPE),y)
+PYTHON_PILLOW_DEPENDENCIES += freetype
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON_PILLOW_WEBP),y)
+PYTHON_PILLOW_DEPENDENCIES += webp
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON_PILLOW_JPEG2000),y)
+PYTHON_PILLOW_DEPENDENCIES += openjpeg
+endif
+
+$(eval $(python-package))
-- 
1.9.1
