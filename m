From: Guillaume William Bres <guillaume.bressaix@gmail.com>
Date: Tue, 13 Oct 2015 10:54:24 -0600
Subject: [Buildroot] [PATCH 1/1 v3] pyqtgraph: new package
Message-ID: <1444755264-17899-1-git-send-email-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Guillaume William Bres <guillaume.bressaix@gmail.com>
---
 PyQtGraph is an easy to use library using PyQt bindings, to develop
 scientific applications.

 The library requires python-numpy to run, which depends on
 certain types of toolchain. I know Gwen has submitted a new variable 
 BR2_PACKAGE_PYTHON_NUMPY_ARCH_DEPENDS so I added that one as a
 dependency: please correct me on that.

 All suggestions are appreciated.
 The package builds easily because it is only made of python scripts.

 Builds and runs successfully on ARM Cortex A9.

 package/Config.in                              |    1 +
 package/python-pyqtgraph/Config.in             |   14 ++++++++++++++
 package/python-pyqtgraph/python-pyqtgraph.hash |    5 +++++
 package/python-pyqtgraph/python-pyqtgraph.mk   |   15 +++++++++++++++
 4 files changed, 35 insertions(+)
 create mode 100644 package/python-pyqtgraph/Config.in
 create mode 100644 package/python-pyqtgraph/python-pyqtgraph.hash
 create mode 100644 package/python-pyqtgraph/python-pyqtgraph.mk

diff --git a/package/Config.in b/package/Config.in
index f686f13..7ef27b4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -646,6 +646,7 @@ menu "External python modules"
 	source "package/python-pyparsing/Config.in"
 	source "package/python-pypcap/Config.in"
 	source "package/python-pyqt/Config.in"
+	source "package/python-pyqtgraph/Config.in"
 	source "package/python-pyratemp/Config.in"
 	source "package/python-pyro/Config.in"
 	source "package/python-pyroute2/Config.in"
diff --git a/package/python-pyqtgraph/Config.in b/package/python-pyqtgraph/Config.in
new file mode 100644
index 0000000..5e1a1e6
--- /dev/null
+++ b/package/python-pyqtgraph/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_PYTHON_PYQTGRAPH
+	bool "python-pyqtgraph"
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_DEPENDS
+	select BR2_PACKAGE_PYTHON_PYQT
+	select BR2_PACKAGE_PYTHON_NUMPY # runtime dependency
+	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON # runtime dependency
+	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 #runtime dependency
+	select BR2_PACKAGE_QT_SVG # runtime dependency
+	help
+	  Pyqtgraph is a pure Python graphics and GUI library built on PyQt4, 
+	  PySide and Numpy. 
+	  
+	  Official website: 
+	  http://www.pyqtgraph.org/
diff --git a/package/python-pyqtgraph/python-pyqtgraph.hash b/package/python-pyqtgraph/python-pyqtgraph.hash
new file mode 100644
index 0000000..c20eea2
--- /dev/null
+++ b/package/python-pyqtgraph/python-pyqtgraph.hash
@@ -0,0 +1,5 @@
+# From http://www.pyqtgraph.org/downloads
+md5 6e2efa185b6b9227dfe16fefd921a8ec  pyqtgraph-0.9.10.tar.gz
+
+# Locally calculated:
+sha256 4c0589774e3c8b0c374931397cf6356b9cc99a790215d1917bb7f015c6f0729a  pyqtgraph-0.9.10.tar.gz
diff --git a/package/python-pyqtgraph/python-pyqtgraph.mk b/package/python-pyqtgraph/python-pyqtgraph.mk
new file mode 100644
index 0000000..575ea71
--- /dev/null
+++ b/package/python-pyqtgraph/python-pyqtgraph.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-pyqtgraph
+#
+################################################################################
+
+PYTHON_PYQTGRAPH_VERSION = 0.9.10
+PYTHON_PYQTGRAPH_SOURCE = pyqtgraph-$(PYTHON_PYQTGRAPH_VERSION).tar.gz
+PYTHON_PYQTGRAPH_SITE = http://www.pyqtgraph.org/downloads
+PYTHON_PYQTGRAPH_LICENSE = MIT
+PYTHON_PYQTGRAPH_LICENSE_FILES = LICENSE 
+PYTHON_PYQTGRAPH_SETUP_TYPE = distutils
+PYTHON_PYQTGRAPH_DEPENDENCIES = python-pyqt
+
+$(eval $(python-package))
-- 
1.7.10.4
