From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Fri, 4 Oct 2013 11:25:33 -0500
Subject: [Buildroot] [PATCH 1/1] python-tornado: new package
Message-ID: <1380903933-11960-1-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
Note: This one is pretty straight forward since it is all python based
scripts.
---
 package/Config.in                        |    1 +
 package/python-tornado/Config.in         |    8 ++++++++
 package/python-tornado/python-tornado.mk |   26 ++++++++++++++++++++++++++
 3 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 package/python-tornado/Config.in
 create mode 100644 package/python-tornado/python-tornado.mk

diff --git a/package/Config.in b/package/Config.in
index b7fdb89..3a4f60a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -403,6 +403,7 @@ source "package/python-pyzmq/Config.in"
 source "package/python-serial/Config.in"
 source "package/python-setuptools/Config.in"
 source "package/python-thrift/Config.in"
+source "package/python-tornado/Config.in"
 endmenu
 endif
 source "package/python3/Config.in"
diff --git a/package/python-tornado/Config.in b/package/python-tornado/Config.in
new file mode 100644
index 0000000..c127d0e
--- /dev/null
+++ b/package/python-tornado/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_TORNADO
+	bool "python-tornado"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  Tornado is a Python web framework and asynchronous networking
+	  library, originally developed at FriendFeed.
+
+	  http://www.tornadoweb.org
diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
new file mode 100644
index 0000000..f228a7c
--- /dev/null
+++ b/package/python-tornado/python-tornado.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# python-tornado
+#
+################################################################################
+
+PYTHON_TORNADO_VERSION = 3.1.1
+PYTHON_TORNADO_SOURCE  = tornado-$(PYTHON_TORNADO_VERSION).tar.gz
+PYTHON_TORNADO_SITE    = https://pypi.python.org/packages/source/t/tornado
+PYTHON_TORNADO_LICENSE = Apache-v2
+
+PYTHON_TORNADO_DEPENDENCIES = python
+
+define PYTHON_TORNADO_BUILD_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build --executable=/usr/bin/python)
+endef
+
+# PYTHONPATH definition is need for install since an error could
+# be thrown about installing to location that isn't in PYTHONPATH
+define PYTHON_TORNADO_INSTALL_TARGET_CMDS
+	(cd $(@D); \
+		PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+endef
+
+$(eval $(generic-package))
--
1.7.1
