From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri,  1 May 2015 17:13:45 +0200
Subject: [Buildroot] [PATCH v7] python-pyxml: new package
Message-ID: <1430493225-19081-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Clayton Shotwell <clshotwe@rockwellcollins.com>

It always uses its own copy of pyexpat, but we can at least make it use
buildroot's expat.so.

Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Changes:
	v7: use bundled pyexpat, fix using external expat, remove
	    double spaces from help text (Arnout)
	v6: remove host-python dependency, fix formatting (Thomas Petazzoni)
	v5: refresh the patch, so it can applied without errors
  	v3: updated to use python package type (Matt W)
	    added hash file (Matt W)
---
 package/Config.in                                  |  1 +
 package/python-pyxml/Config.in                     | 11 +++++++++++
 package/python-pyxml/python-xml.hash               |  2 ++
 package/python-pyxml/python-xml.mk                 | 17 +++++++++++++++++
 toolchain/toolchain-external/toolchain-external.mk |  8 --------
 5 files changed, 31 insertions(+), 8 deletions(-)
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
index 0000000..e6d20fa
--- /dev/null
+++ b/package/python-pyxml/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_PYXML
+	bool "python-pyxml"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  This is the Python XML package. The distribution contains a
+	  validating XML parser, an implementation of the SAX and DOM
+	  programming interfaces, an interface to the Expat parser (and the
+	  Expat parser itself), and a C helper module that can speed up
+	  xmllib.py by a factor of 5. There's even documentation!
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
index 0000000..bfe2c89
--- /dev/null
+++ b/package/python-pyxml/python-xml.mk
@@ -0,0 +1,17 @@
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
+PYTHON_PYXML_DEPENDENCIES = expat
+PYTHON_PYXML_BUILD_OPTS = --with-libexpat=$(STAGING_DIR)/usr
+PYTHON_PYXML_INSTALL_TARGET_OPTS = --with-libexpat=$(STAGING_DIR)/usr
+
+$(eval $(python-package))
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index fd796a0..c38692a 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -367,17 +367,9 @@ TOOLCHAIN_EXTERNAL_SOURCE = crossx86-i486-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSIO
 else ifeq ($(BR2_microblazebe),y)
 TOOLCHAIN_EXTERNAL_SOURCE = crossx86-microblaze-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
 else ifeq ($(BR2_mips),y)
-ifeq ($(BR2_SOFT_FLOAT),y)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mips-sf-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-else
 TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mips-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-endif # BR2_SOFT_FLOAT
 else ifeq ($(BR2_mipsel),y)
-ifeq ($(BR2_SOFT_FLOAT),y)
-TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mipsel-sf-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-else
 TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mipsel-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
-endif # BR2_SOFT_FLOAT
 else ifeq ($(BR2_powerpc),y)
 TOOLCHAIN_EXTERNAL_SOURCE = crossx86-powerpc-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
 else ifeq ($(BR2_x86_64),y)
-- 
2.1.4
