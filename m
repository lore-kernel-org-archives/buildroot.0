From: Vinicius Tinti <viniciustinti@gmail.com>
Date: Wed, 13 Mar 2013 11:43:28 -0300
Subject: [Buildroot] [PATCH v2 1/1] python-thrift: new package
Message-ID: <1363185808-14279-1-git-send-email-viniciustinti@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add Python bindings for the Apache Thrift RPC.

Thrift is an interface definition language that is used to define and create
services for numerous languages using remote procedure calls (RPC).

This patch does not include the Thrift code generator. It only includes the
Thrift libraries used at runtime.

Signed-off-by: Tiago Maluta <tiagomaluta@gmail.com>
Signed-off-by: Vinicius Tinti <viniciustinti@gmail.com>
---
 package/Config.in                      |    1 +
 package/python-thrift/Config.in        |    7 +++++++
 package/python-thrift/python-thrift.mk |   23 +++++++++++++++++++++++
 3 files changed, 31 insertions(+)
 create mode 100644 package/python-thrift/Config.in
 create mode 100644 package/python-thrift/python-thrift.mk

diff --git a/package/Config.in b/package/Config.in
index a65054c..8467735 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -334,6 +334,7 @@ source "package/python-pygame/Config.in"
 source "package/python-pyparsing/Config.in"
 source "package/python-serial/Config.in"
 source "package/python-setuptools/Config.in"
+source "package/python-thrift/Config.in"
 endmenu
 endif
 source "package/ruby/Config.in"
diff --git a/package/python-thrift/Config.in b/package/python-thrift/Config.in
new file mode 100644
index 0000000..f4ad4ba
--- /dev/null
+++ b/package/python-thrift/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_THRIFT
+	bool "python-thrift"
+	help
+	  python-thrift is a Python bindings for the Apache Thrift RPC system.
+
+	  http://thrift.apache.org/
+
diff --git a/package/python-thrift/python-thrift.mk b/package/python-thrift/python-thrift.mk
new file mode 100644
index 0000000..40ae57b
--- /dev/null
+++ b/package/python-thrift/python-thrift.mk
@@ -0,0 +1,23 @@
+#############################################################
+#
+# python-thrift
+#
+#############################################################
+
+PYTHON_THRIFT_VERSION = 0.9.0
+PYTHON_THRIFT_SOURCE = thrift-$(PYTHON_THRIFT_VERSION).tar.gz
+PYTHON_THRIFT_SITE = https://pypi.python.org/packages/source/t/thrift/
+PYTHON_THRIFT_LICENSE = Apache v2.0
+PYTHON_THRIFT_LICENSE_FILES = README
+
+PYTHON_THRIFT_DEPENDENCIES = python
+
+define PYTHON_THRIFT_BUILD_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
+endef
+
+define PYTHON_THRIFT_INSTALL_TARGET_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
