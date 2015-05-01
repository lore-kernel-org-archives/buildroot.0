From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 1 May 2015 22:27:43 +0200
Subject: [Buildroot] [git commit] python-pyxml: new package
Message-ID: <20150501205228.D95C681DDC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0ef25ae2e47cbaec0e304d6823d0f5d7340f9035
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It always uses its own copy of pyexpat, but we can at least make it use
buildroot's expat.so.

[Peter: select expat]
Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                    |    1 +
 package/python-pyxml/Config.in       |   12 ++++++++++++
 package/python-pyxml/python-xml.hash |    2 ++
 package/python-pyxml/python-xml.mk   |   17 +++++++++++++++++
 4 files changed, 32 insertions(+), 0 deletions(-)

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
index 0000000..82316ba
--- /dev/null
+++ b/package/python-pyxml/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_PYXML
+	bool "python-pyxml"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_EXPAT
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
