From: Vinicius Tinti <viniciustinti@gmail.com>
Date: Thu, 21 Mar 2013 06:59:20 -0300
Subject: [Buildroot] [PATCH v4 1/1] python-thrift: new package
In-Reply-To: <5146BAD8.90208@mind.be>
References: <5146BAD8.90208@mind.be>
Message-ID: <1363859960-4131-1-git-send-email-viniciustinti@gmail.com>
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
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Changes since v2:
1. Remove empty line in Config.in
2. Change to Apache-2.0
3. Solve python-thrift, python-protobuf and python-netifaces conflict
Changes since v3:
1. Add workaround comment. Suggested by Arnout
2. Fix extra / and https in package URL
3. Change indentation
4. Acked by Arnout
5. Tested by Arnout
---
---
 package/Config.in                      |    1 +
 package/python-thrift/Config.in        |    7 +++++++
 package/python-thrift/python-thrift.mk |   30 ++++++++++++++++++++++++++++++
 3 files changed, 38 insertions(+)
 create mode 100644 package/python-thrift/Config.in
 create mode 100644 package/python-thrift/python-thrift.mk

diff --git a/package/Config.in b/package/Config.in
index 94e279b..69ab06e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -332,6 +332,7 @@ source "package/python-pygame/Config.in"
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
index 0000000..c2fc752
--- /dev/null
+++ b/package/python-thrift/python-thrift.mk
@@ -0,0 +1,30 @@
+#############################################################
+#
+# python-thrift
+#
+#############################################################
+
+PYTHON_THRIFT_VERSION = 0.9.0
+PYTHON_THRIFT_SOURCE = thrift-$(PYTHON_THRIFT_VERSION).tar.gz
+PYTHON_THRIFT_SITE = http://pypi.python.org/packages/source/t/thrift
+PYTHON_THRIFT_LICENSE = Apache-2.0
+PYTHON_THRIFT_LICENSE_FILES = README
+
+PYTHON_THRIFT_DEPENDENCIES = python
+
+define PYTHON_THRIFT_BUILD_CMDS
+	(cd $(@D); \
+		PYTHONXCPREFIX="$(STAGING_DIR)/usr/" \
+		LDFLAGS="-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib" \
+		$(HOST_DIR)/usr/bin/python setup.py build)
+endef
+
+# host-distutilscross, if it has been installed before, will check that
+# the installation directory is in python's load path. For host-python,
+# it is not, so add it explicitly while installing to target.
+define PYTHON_THRIFT_INSTALL_TARGET_CMDS
+	(cd $(@D); PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+		$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
