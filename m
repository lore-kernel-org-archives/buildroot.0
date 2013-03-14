From: Vinicius Tinti <viniciustinti@gmail.com>
Date: Thu, 14 Mar 2013 18:47:19 -0300
Subject: [Buildroot] [PATCH v3 1/1] python-thrift: new package
In-Reply-To: <CALD9WKwqdDxRH5ZSQfLMeuj=C7JTGsseQZUEYRXoRhik32ab2w@mail.gmail.com>
References: <CALD9WKwqdDxRH5ZSQfLMeuj=C7JTGsseQZUEYRXoRhik32ab2w@mail.gmail.com>
Message-ID: <1363297640-2321-1-git-send-email-viniciustinti@gmail.com>
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
Changes since v2:
1. Remove empty line in Config.in
2. Change to Apache-2.0
3. Solve python-thrift, python-protobuf and python-netifaces conflict
---
 package/Config.in                      |    1 +
 package/python-thrift/Config.in        |    7 +++++++
 package/python-thrift/python-thrift.mk |   27 +++++++++++++++++++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 package/python-thrift/Config.in
 create mode 100644 package/python-thrift/python-thrift.mk

diff --git a/package/Config.in b/package/Config.in
index b8b1e60..fc50465 100644
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
index 0000000..94a7590
--- /dev/null
+++ b/package/python-thrift/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_THRIFT
+	bool "python-thrift"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  python-thrift is a Python bindings for the Apache Thrift RPC system.
+
+	  http://thrift.apache.org/
diff --git a/package/python-thrift/python-thrift.mk b/package/python-thrift/python-thrift.mk
new file mode 100644
index 0000000..5d9831e
--- /dev/null
+++ b/package/python-thrift/python-thrift.mk
@@ -0,0 +1,27 @@
+#############################################################
+#
+# python-thrift
+#
+#############################################################
+
+PYTHON_THRIFT_VERSION = 0.9.0
+PYTHON_THRIFT_SOURCE = thrift-$(PYTHON_THRIFT_VERSION).tar.gz
+PYTHON_THRIFT_SITE = https://pypi.python.org/packages/source/t/thrift/
+PYTHON_THRIFT_LICENSE = Apache-2.0
+PYTHON_THRIFT_LICENSE_FILES = README
+
+PYTHON_THRIFT_DEPENDENCIES = python
+
+define PYTHON_THRIFT_BUILD_CMDS
+	(cd $(@D); \
+		PYTHONXCPREFIX="$(STAGING_DIR)/usr/" \
+		LDFLAGS="-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib" \
+	$(HOST_DIR)/usr/bin/python setup.py build)
+endef
+
+define PYTHON_THRIFT_INSTALL_TARGET_CMDS
+	(cd $(@D); PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
