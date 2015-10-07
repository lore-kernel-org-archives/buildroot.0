From: Guillaume William Bres <guillaume.bressaix@gmail.com>
Date: Wed, 7 Oct 2015 17:23:08 -0600
Subject: [Buildroot] [PATCH v2] pyqtgraph: new package
In-Reply-To: <Re: [Buildroot] [PATCH 2/2] Add new package PyQtGraph>
References: <Re: [Buildroot] [PATCH 2/2] Add new package PyQtGraph>
Message-ID: <1444260188-9571-1-git-send-email-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Guillaume William Bres <guillaume.bressaix@gmail.com>
---
Applied modifications suggested by Arnout:
 
 package/python-pyqtgraph/Config.in now depends on the new variable:
 BR2_PACKAGE_PYTHON_NUMPY_ARCH_DEPENDS.
 
 package/python-pyqtgraph/Config.in selects Qt/PyQt.
 
 comment all dependencies.

---
 package/Config.in                              |    1 +
 package/python-pyqtgraph/Config.in             |   22 ++++++++++++++++++++++
 package/python-pyqtgraph/python-pyqtgraph.hash |    5 +++++
 package/python-pyqtgraph/python-pyqtgraph.mk   |   15 +++++++++++++++
 4 files changed, 43 insertions(+)
 create mode 100644 package/python-pyqtgraph/Config.in
 create mode 100644 package/python-pyqtgraph/python-pyqtgraph.hash
 create mode 100644 package/python-pyqtgraph/python-pyqtgraph.mk

diff --git a/package/Config.in b/package/Config.in
index 3794f44..c8812a6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -645,6 +645,7 @@ menu "external python modules"
 	source "package/python-pyparsing/Config.in"
 	source "package/python-pypcap/Config.in"
 	source "package/python-pyqt/Config.in"
+	source "package/python-pyqtgraph/Config.in"
 	source "package/python-pyratemp/Config.in"
 	source "package/python-pyro/Config.in"
 	source "package/python-pyroute2/Config.in"
diff --git a/package/python-pyqtgraph/Config.in b/package/python-pyqtgraph/Config.in
new file mode 100644
index 0000000..f1c3a42
--- /dev/null
+++ b/package/python-pyqtgraph/Config.in
@@ -0,0 +1,22 @@
+comment "python-pyqtgraph requires a (e)glibc toolchain w/ wchar and C++"
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_DEPENDS
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_PYTHON_PYQTGRAPH
+	bool "python-pyqtgraph"
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_DEPENDS
+	depends on BR2_USE_MMU # pyqt -> qt
+	depends on BR2_INSTALL_LIBSTDCPP # pyqt -> qt
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pyqt -> qt
+	select BR2_PACKAGE_PYTHON_PYQT
+	select BR2_PACKAGE_PYTHON_NUMPY # runtime dependency
+	select BR2_PACKAGE_PYTHON_PYEXPAT # runtime dependency
+	select BR2_PACKAGE_QT_SVG # runtime dependency
+	select BR2_PACKAGE_QT_GUI_MODULE
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
index 0000000..dbc3598
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
+PYTHON_PYQTGRAPH_LICENSE_FILES = COPYING
+PYTHON_PYQTGRAPH_SETUP_TYPE = distutils
+PYTHON_PYQTGRAPH_DEPENDENCIES = python-pyqt
+
+$(eval $(python-package))
-- 
1.7.10.4
