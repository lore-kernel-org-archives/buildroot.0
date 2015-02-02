From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Mon,  2 Feb 2015 05:16:20 +0100
Subject: [Buildroot] [PATCH 1/1] python-smbus: new package
Message-ID: <1422850580-523-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 package/Config.in                    |  1 +
 package/python-smbus/Config.in       |  7 +++++++
 package/python-smbus/python-smbus.mk | 22 ++++++++++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 package/python-smbus/Config.in
 create mode 100644 package/python-smbus/python-smbus.mk

diff --git a/package/Config.in b/package/Config.in
index dd011be..6fd6179 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -550,6 +550,7 @@ menu "external python modules"
 	source "package/python-setuptools/Config.in"
 	source "package/python-simplejson/Config.in"
 	source "package/python-six/Config.in"
+	source "package/python-smbus/Config.in"
 	source "package/python-thrift/Config.in"
 	source "package/python-tornado/Config.in"
 	source "package/python-twisted/Config.in"
diff --git a/package/python-smbus/Config.in b/package/python-smbus/Config.in
new file mode 100644
index 0000000..1edf299
--- /dev/null
+++ b/package/python-smbus/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_SMBUS
+	bool "python-smbus"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  Python bindings for Linux SMBus access through i2c-dev.
+
+	  www.lm-sensors.org/wiki/I2CTools
diff --git a/package/python-smbus/python-smbus.mk b/package/python-smbus/python-smbus.mk
new file mode 100644
index 0000000..bde7f79
--- /dev/null
+++ b/package/python-smbus/python-smbus.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# python-smbus
+#
+################################################################################
+
+PYTHON_SMBUS_VERSION = $(I2C_TOOLS_VERSION)
+PYTHON_SMBUS_SOURCE = $(I2C_TOOLS_SOURCE)
+PYTHON_SMBUS_SITE = $(I2C_TOOLS_SITE)
+PYTHON_SMBUS_LICENSE = GPLv2
+PYTHON_SMBUS_LICENSE_FILES = $(I2C_TOOLS_LICENSE_FILES)
+PYTHON_SMBUS_SETUP_TYPE = distutils
+PYTHON_SMBUS_SUBDIR = py-smbus
+
+# the upstream setup.py doesn't set the needed in-tree include dir
+# so we add it in the setup configuration file
+define PYTHON_SMBUS_CONFIGURE_CMDS
+	echo "[build_ext]" > $(@D)/$(PYTHON_SMBUS_SUBDIR)/setup.cfg
+	echo "include_dirs = ../include" >> $(@D)/$(PYTHON_SMBUS_SUBDIR)/setup.cfg
+endef
+
+$(eval $(python-package))
-- 
2.1.0
