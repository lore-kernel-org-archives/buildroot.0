From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 15 Dec 2014 21:54:03 -0600
Subject: [Buildroot] [PATCH 11/30] python-pyxml: new package
In-Reply-To: <1418702062-61039-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1418702062-61039-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1418702062-61039-12-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Clayton Shotwell <clshotwe@rockwellcollins.com>

Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/Config.in                  |  1 +
 package/python-pyxml/Config.in     | 11 +++++++++
 package/python-pyxml/python-xml.mk | 50 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+)
 create mode 100644 package/python-pyxml/Config.in
 create mode 100644 package/python-pyxml/python-xml.mk

diff --git a/package/Config.in b/package/Config.in
index bf4d772..c02e665 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -531,6 +531,7 @@ menu "external python modules"
 	source "package/python-pysnmp-apps/Config.in"
 	source "package/python-pysnmp-mibs/Config.in"
 	source "package/python-pyusb/Config.in"
+	source "package/python-pyxml/Config.in"
 	source "package/python-pyzmq/Config.in"
 	source "package/python-requests/Config.in"
 	source "package/python-rtslib-fb/Config.in"
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
index 0000000..bdf6a71
--- /dev/null
+++ b/package/python-pyxml/python-xml.mk
@@ -0,0 +1,50 @@
+################################################################################
+#
+# python-pyxml
+#
+################################################################################
+
+PYTHON_PYXML_VERSION = 0.8.4
+PYTHON_PYXML_SOURCE  = PyXML-$(PYTHON_PYXML_VERSION).tar.gz
+PYTHON_PYXML_SITE    = http://downloads.sourceforge.net/project/pyxml/pyxml/0.8.4/
+PYTHON_PYXML_LICENSE = BSD-3c
+PYTHON_PYXML_LICENSE_FILES = LICENSE
+
+PYTHON_PYXML_DEPENDENCIES = host-python python expat
+
+PYTHON_PYXML_INSTALL_STAGING = NO
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
+define PYTHON_PYXML_INSTALL_STAGING_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(STAGING_DIR)/usr)
+endef
+
+define PYTHON_PYXML_INSTALL_TARGET_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+endef
+
+HOST_PYTHON_PYXML_DEPENDENCIES = host-python
+
+define HOST_PYTHON_PYXML_BUILD_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build_ext --with-libexpat=$(HOST_DIR)/usr)
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
+endef
+
+define HOST_PYTHON_PYXML_INSTALL_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(HOST_DIR)/usr)
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
1.9.1
