From: Wojciech M. Zabolotny <wzab01@gmail.com>
Date: Sat, 26 Oct 2013 14:19:41 +0200
Subject: [Buildroot] [PATCH v1 1/1] python-msgpack: new package
Message-ID: <1382789981-4364-1-git-send-email-wzab01@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Wojciech M. Zabolotny <wzab01@gmail.com>
---
 package/Config.in                        |  1 +
 package/python-msgpack/Config.in         | 13 +++++++++++++
 package/python-msgpack/python-msgpack.mk | 29 +++++++++++++++++++++++++++++
 3 files changed, 43 insertions(+)
 create mode 100644 package/python-msgpack/Config.in
 create mode 100644 package/python-msgpack/python-msgpack.mk

diff --git a/package/Config.in b/package/Config.in
index 0e6f86c..f3a707b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -394,6 +394,7 @@ source "package/python-id3/Config.in"
 source "package/python-ipy/Config.in"
 source "package/python-mad/Config.in"
 source "package/python-meld3/Config.in"
+source "package/python-msgpack/Config.in"
 source "package/python-netifaces/Config.in"
 source "package/python-nfc/Config.in"
 source "package/python-protobuf/Config.in"
diff --git a/package/python-msgpack/Config.in b/package/python-msgpack/Config.in
new file mode 100644
index 0000000..39d8925
--- /dev/null
+++ b/package/python-msgpack/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PYTHON_MSGPACK
+	bool "python-msgpack"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS
+	select BR2_PACKAGE_MSGPACK
+	help
+	  MessagePack ( http://msgpack.org/ ) is a fast, compact binary
+	  serialization format, suitable for similar data to JSON.
+	  This package provides CPython bindings for reading and
+	  writing MessagePack data.
+	  
+	  https://pypi.python.org/pypi/msgpack-python/
+
diff --git a/package/python-msgpack/python-msgpack.mk b/package/python-msgpack/python-msgpack.mk
new file mode 100644
index 0000000..2a16932
--- /dev/null
+++ b/package/python-msgpack/python-msgpack.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# python-msgpack
+#
+################################################################################
+
+PYTHON_MSGPACK_VERSION = 0.4.0
+PYTHON_MSGPACK_SOURCE = msgpack-python-$(PYTHON_MSGPACK_VERSION).tar.gz
+PYTHON_MSGPACK_SITE = https://pypi.python.org/packages/source/m/msgpack-python/
+PYTHON_MSGPACK_LICENSE = Apache License, Version 2.0
+PYTHON_MSGPACK_LICENSE_FILES = COPYING
+
+PYTHON_MSGPACK_DEPENDENCIES = python msgpack host-python-setuptools host-python-distutilscross
+
+# Build commands based on python-protobuf package
+define PYTHON_MSGPACK_BUILD_CMDS
+	(cd $(@D); \
+		PYTHONXCPREFIX="$(STAGING_DIR)/usr/" \
+		PATH=$(HOST_PATH) \
+	$(HOST_DIR)/usr/bin/python setup.py build -x)
+endef
+
+define PYTHON_MSGPACK_INSTALL_TARGET_CMDS
+	(cd $(@D); PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+endef
+
+
+$(eval $(generic-package))
-- 
1.8.4.rc3
