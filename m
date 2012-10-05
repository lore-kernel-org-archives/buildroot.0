From: Thiago A. Correa <thiago.correa@gmail.com>
Date: Fri, 5 Oct 2012 16:36:03 -0300
Subject: [Buildroot] [PATCHv3] python-protobuf: Add support for Python
 implementation of Google's Protocol Buffers
Message-ID: <20121005193603.GA7975@localhost.comm5.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thiago A. Correa <thiago.correa@gmail.com>
---
 package/Config.in                          |    1 +
 package/python-protobuf/Config.in          |   10 ++++++++++
 package/python-protobuf/python-protobuf.mk |   28 ++++++++++++++++++++++++++++
 3 files changed, 39 insertions(+), 0 deletions(-)
 create mode 100644 package/python-protobuf/Config.in
 create mode 100644 package/python-protobuf/python-protobuf.mk

diff --git a/package/Config.in b/package/Config.in
index e129522..3aff270 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -276,6 +276,7 @@ source "package/python-mad/Config.in"
 source "package/python-meld3/Config.in"
 source "package/python-netifaces/Config.in"
 source "package/python-nfc/Config.in"
+source "package/python-protobuf/Config.in"
 source "package/python-pygame/Config.in"
 source "package/python-serial/Config.in"
 source "package/python-setuptools/Config.in"
diff --git a/package/python-protobuf/Config.in b/package/python-protobuf/Config.in
new file mode 100644
index 0000000..ec22057
--- /dev/null
+++ b/package/python-protobuf/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_PROTOBUF
+	bool "python-protobuf"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  Python implementation of the Google Protocol Buffers.
+
+	  Protocol buffers are Google's language-neutral, platform-neutral,
+	  extensible mechanism for serializing structured data.
+
+	  http://code.google.com/p/protobuf/
diff --git a/package/python-protobuf/python-protobuf.mk b/package/python-protobuf/python-protobuf.mk
new file mode 100644
index 0000000..d853dee
--- /dev/null
+++ b/package/python-protobuf/python-protobuf.mk
@@ -0,0 +1,28 @@
+#############################################################
+#
+# python-protobuf
+#
+#############################################################
+
+PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
+PYTHON_PROTOBUF_SOURCE  = $(PROTOBUF_SOURCE)
+PYTHON_PROTOBUF_SITE    = $(PROTOBUF_SITE)
+PYTHON_PROTOBUF_LICENSE = BSD-3c
+PYTHON_PROTOBUF_LICENSE_FILES = COPYING.txt
+
+PYTHON_PROTOBUF_DEPENDENCIES = python host-python-setuptools \
+        host-python-distutilscross host-protobuf
+
+define PYTHON_PROTOBUF_BUILD_CMDS
+	(cd $(@D)/python; \
+		PYTHONXCPREFIX="$(STAGING_DIR)/usr/" \
+		PATH=$(HOST_PATH) \
+	$(HOST_DIR)/usr/bin/python setup.py build -x)
+endef
+
+define PYTHON_PROTOBUF_INSTALL_TARGET_CMDS
+	(cd $(@D)/python; PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+endef
+
+$(eval $(generic-package))
-- 
1.7.3.4
