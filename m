From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 28 Apr 2015 21:44:32 +0200
Subject: [Buildroot] [PATCH v6] python-pyxml: new package
Message-ID: <1430250272-23842-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Clayton Shotwell <clshotwe@rockwellcollins.com>

Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes:
	v6: remove host-python dependency, fix formatting (Thomas Petazzoni)
	v5: refresh the patch, so it can applied without errors
  	v3: updated to use python package type (Matt W)
	    added hash file (Matt W)

 package/Config.in                    |  1 +
 package/python-pyxml/Config.in       | 12 ++++++++++++
 package/python-pyxml/python-xml.hash |  2 ++
 package/python-pyxml/python-xml.mk   | 21 +++++++++++++++++++++
 4 files changed, 36 insertions(+)
 create mode 100644 package/python-pyxml/Config.in
 create mode 100644 package/python-pyxml/python-xml.hash
 create mode 100644 package/python-pyxml/python-xml.mk

diff --git a/package/Config.in b/package/Config.in
index 4e20e4d..8b02486 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -629,6 +629,7 @@ menu "external python modules"
 	source "package/python-pysnmp-mibs/Config.in"
 	source "package/python-pyusb/Config.in"
 	source "package/python-pyxb/Config.in"
+	source "package/python-pyxml/Config.in"
 	source "package/python-pyzmq/Config.in"
 	source "package/python-requests/Config.in"
 	source "package/python-rtslib-fb/Config.in"
diff --git a/package/python-pyxml/Config.in b/package/python-pyxml/Config.in
new file mode 100644
index 0000000..73f7e16
--- /dev/null
+++ b/package/python-pyxml/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_PYXML
+	bool "python-pyxml"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_PYEXPAT
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
index 0000000..df98c46
--- /dev/null
+++ b/package/python-pyxml/python-xml.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 9fab66f9584fb8e67aebd8745a5c97bf1c5a2e2e461adf68862bcec64e448c13  PyXML-0.8.4.tar.gz
diff --git a/package/python-pyxml/python-xml.mk b/package/python-pyxml/python-xml.mk
new file mode 100644
index 0000000..0b31156
--- /dev/null
+++ b/package/python-pyxml/python-xml.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# python-pyxml
+#
+################################################################################
+
+PYTHON_PYXML_VERSION = 0.8.4
+PYTHON_PYXML_SOURCE = PyXML-$(PYTHON_PYXML_VERSION).tar.gz
+PYTHON_PYXML_SITE = http://downloads.sourceforge.net/project/pyxml/pyxml/0.8.4/
+PYTHON_PYXML_LICENSE = BSD-3c
+PYTHON_PYXML_LICENSE_FILES = LICENSE
+PYTHON_PYXML_SETUP_TYPE = distutils
+
+# tell setup.py, where to find libexpat
+define PYTHON_PYXML_CONFIGURE_CMDS
+	(cd $(@D); \
+		$(HOST_DIR)/usr/bin/python setup.py \
+		config --with-libexpat=$(STAGING_DIR)/usr)
+endef
+
+$(eval $(python-package))
-- 
2.1.0
