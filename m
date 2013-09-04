From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Wed, 4 Sep 2013 18:09:49 -0500
Subject: [Buildroot] [PATCH 10/17] python-pyxml: new package
In-Reply-To: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <1378336196-27403-11-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
 package/Config.in                  |    1 +
 package/python-pyxml/Config.in     |   11 ++++++
 package/python-pyxml/python-xml.mk |   64 ++++++++++++++++++++++++++++++++++++
 3 files changed, 76 insertions(+), 0 deletions(-)
 create mode 100644 package/python-pyxml/Config.in
 create mode 100644 package/python-pyxml/python-xml.mk

diff --git a/package/Config.in b/package/Config.in
index 2400f15..3760261 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -371,6 +371,7 @@ source "package/python-protobuf/Config.in"
 source "package/python-pygame/Config.in"
 source "package/python-pyparsing/Config.in"
 source "package/python-pyro/Config.in"
+source "package/python-pyxml/Config.in"
 source "package/python-serial/Config.in"
 source "package/python-setuptools/Config.in"
 source "package/python-thrift/Config.in"
diff --git a/package/python-pyxml/Config.in b/package/python-pyxml/Config.in
new file mode 100644
index 0000000..420f3ad
--- /dev/null
+++ b/package/python-pyxml/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_PYXML
+	bool "python-pyxml"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  This is the Python XML package.  The distribution contains a
+	  validating XML parser, an implementation of the SAX and DOM
+	  programming interfaces, an interface to the Expat parser (and the
+	  Expat parser itself), and a C helper module that can speed up
+	  xmllib.py by a factor of 5.  There's even documentation!
+
+	  http://pyxml.sourceforge.net/topics/index.html
diff --git a/package/python-pyxml/python-xml.mk b/package/python-pyxml/python-xml.mk
new file mode 100644
index 0000000..d14f429
--- /dev/null
+++ b/package/python-pyxml/python-xml.mk
@@ -0,0 +1,64 @@
+#############################################################
+#
+# python-pyxml
+#
+#############################################################
+
+PYTHON_PYXML_VERSION = 0.8.4
+PYTHON_PYXML_SOURCE  = PyXML-$(PYTHON_PYXML_VERSION).tar.gz
+PYTHON_PYXML_SITE    = http://sourceforge.net/projects/pyxml/files/pyxml/0.8.4/PyXML-0.8.4.tar.gz/download
+PYTHON_PYXML_LICENSE = BSD-3c
+PYTHON_PYXML_LICENSE_FILES = LICENSE
+
+##############################
+# Target Section
+##############################
+PYTHON_PYXML_DEPENDENCIES = host-python python expat
+PYTHON_PYXML_INSTALL_STAGING = NO
+PYTHON_PYXML_INSTALL_TARGET = YES
+
+define PYTHON_PYXML_BUILD_CMDS
+	(cd $(@D); \
+		CC="$(TARGET_CC)" \
+		CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
+		LDSHARED="$(TARGET_CC) -shared" \
+		LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib" \
+		$(HOST_DIR)/usr/bin/python setup.py build_ext \
+		--include-dirs=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR) \
+		--with-libexpat=$(STAGING_DIR)/usr \
+	)
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
+endef
+
+define PYTHON_PYXML_CLEAN_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py clean -a)
+endef
+
+define PYTHON_PYXML_INSTALL_STAGING_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(STAGING_DIR)/usr)
+endef
+
+define PYTHON_PYXML_INSTALL_TARGET_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+endef
+
+##############################
+# Host Section
+##############################
+HOST_PYTHON_PYXML_DEPENDENCIES = host-python
+
+define HOST_PYTHON_PYXML_BUILD_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build_ext --with-libexpat=$(HOST_DIR)/usr)
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
+endef
+
+define HOST_PYTHON_PYXML_CLEAN_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py clean)
+endef
+
+define HOST_PYTHON_PYXML_INSTALL_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(HOST_DIR)/usr)
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
1.7.1
