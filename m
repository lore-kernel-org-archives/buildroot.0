From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri,  9 Jan 2015 09:11:08 -0600
Subject: [Buildroot] [PATCH v4 07/27] python-pyxml: new package
In-Reply-To: <1420816288-8750-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1420816288-8750-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1420816288-8750-8-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Clayton Shotwell <clshotwe@rockwellcollins.com>

Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
[Matt W:
  - Updated to use python package type
  - Added hash file

 package/Config.in                    |  1 +
 package/python-pyxml/Config.in       | 11 +++++++++++
 package/python-pyxml/python-xml.hash |  2 ++
 package/python-pyxml/python-xml.mk   | 32 ++++++++++++++++++++++++++++++++
 4 files changed, 46 insertions(+)
 create mode 100644 package/python-pyxml/Config.in
 create mode 100644 package/python-pyxml/python-xml.hash
 create mode 100644 package/python-pyxml/python-xml.mk

diff --git a/package/Config.in b/package/Config.in
index 9d64ad9..4772cf8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -538,6 +538,7 @@ menu "external python modules"
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
diff --git a/package/python-pyxml/python-xml.hash b/package/python-pyxml/python-xml.hash
new file mode 100644
index 0000000..47fa4c1
--- /dev/null
+++ b/package/python-pyxml/python-xml.hash
@@ -0,0 +1,2 @@
+#Locally computed
+sha256 9fab66f9584fb8e67aebd8745a5c97bf1c5a2e2e461adf68862bcec64e448c13  PyXML-0.8.4.tar.gz
diff --git a/package/python-pyxml/python-xml.mk b/package/python-pyxml/python-xml.mk
new file mode 100644
index 0000000..59bdc06
--- /dev/null
+++ b/package/python-pyxml/python-xml.mk
@@ -0,0 +1,32 @@
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
+PYTHON_PYXML_SETUP_TYPE = distutils
+PYTHON_PYXML_DEPENDENCIES = host-python python expat
+
+PYTHON_PYXML_INSTALL_STAGING = NO
+
+define PYTHON_PYXML_CONFIGURE_CMDS
+	(cd $(@D); \
+		$(HOST_DIR)/usr/bin/python setup.py \
+		config --with-libexpat=$(STAGING_DIR)/usr)
+endef
+
+HOST_PYTHON_PYXML_DEPENDENCIES = host-python host-expat
+
+define HOST_PYTHON_PYXML_CONFIGURE_CMDS
+	(cd $(@D); \
+		$(HOST_DIR)/usr/bin/python setup.py \
+		config --with-libexpat=$(HOST_DIR)/usr)
+endef
+
+$(eval $(python-package))
+$(eval $(host-python-package))
-- 
1.9.1
