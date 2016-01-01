From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 1 Jan 2016 21:07:07 +0100
Subject: [Buildroot] [git commit] python-pyxml: remove obsolete package
Message-ID: <20160101200817.C737F827C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=af45a4f46ccc5709e3ff391b417b6768cff5117e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

PyXML is bitrotten and obsolete. You'll find the functionality it
previously provided is now included in the Python standard library.

So no need to keep this package in Buildroot anymore.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                       |  7 +++++++
 package/Config.in                      |  1 -
 package/python-pyxml/Config.in         | 12 ------------
 package/python-pyxml/python-pyxml.hash |  2 --
 package/python-pyxml/python-pyxml.mk   | 17 -----------------
 5 files changed, 7 insertions(+), 32 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 5d45d04..2e6062c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.02"
 
+config BR2_PACKAGE_PYTHON_PYXML
+	bool "python-pyxml package has been removed"
+	select BR2_LEGACY
+	help
+	  PyXML is obsolete and its functionality is covered either via
+	  native Python XML support or python-lxml package.
+
 # BR2_ENABLE_SSP is still referenced in Config.in (default in choice)
 config BR2_ENABLE_SSP
 	bool "Stack Smashing protection now has different levels"
diff --git a/package/Config.in b/package/Config.in
index 61b516a..71e1948 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -686,7 +686,6 @@ menu "External python modules"
 	source "package/python-pyudev/Config.in"
 	source "package/python-pyusb/Config.in"
 	source "package/python-pyxb/Config.in"
-	source "package/python-pyxml/Config.in"
 	source "package/python-pyyaml/Config.in"
 	source "package/python-pyzmq/Config.in"
 	source "package/python-requests/Config.in"
diff --git a/package/python-pyxml/Config.in b/package/python-pyxml/Config.in
deleted file mode 100644
index 82316ba..0000000
--- a/package/python-pyxml/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_PYTHON_PYXML
-	bool "python-pyxml"
-	depends on BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_EXPAT
-	help
-	  This is the Python XML package. The distribution contains a
-	  validating XML parser, an implementation of the SAX and DOM
-	  programming interfaces, an interface to the Expat parser (and the
-	  Expat parser itself), and a C helper module that can speed up
-	  xmllib.py by a factor of 5. There's even documentation!
-
-	  http://pyxml.sourceforge.net/topics/index.html
diff --git a/package/python-pyxml/python-pyxml.hash b/package/python-pyxml/python-pyxml.hash
deleted file mode 100644
index df98c46..0000000
--- a/package/python-pyxml/python-pyxml.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed
-sha256 9fab66f9584fb8e67aebd8745a5c97bf1c5a2e2e461adf68862bcec64e448c13  PyXML-0.8.4.tar.gz
diff --git a/package/python-pyxml/python-pyxml.mk b/package/python-pyxml/python-pyxml.mk
deleted file mode 100644
index 7ccce8e..0000000
--- a/package/python-pyxml/python-pyxml.mk
+++ /dev/null
@@ -1,17 +0,0 @@
-################################################################################
-#
-# python-pyxml
-#
-################################################################################
-
-PYTHON_PYXML_VERSION = 0.8.4
-PYTHON_PYXML_SOURCE = PyXML-$(PYTHON_PYXML_VERSION).tar.gz
-PYTHON_PYXML_SITE = http://downloads.sourceforge.net/project/pyxml/pyxml/$(PYTHON_PYXML_VERSION)
-PYTHON_PYXML_LICENSE = BSD-3c
-PYTHON_PYXML_LICENSE_FILES = LICENCE
-PYTHON_PYXML_SETUP_TYPE = distutils
-PYTHON_PYXML_DEPENDENCIES = expat
-PYTHON_PYXML_BUILD_OPTS = --with-libexpat=$(STAGING_DIR)/usr
-PYTHON_PYXML_INSTALL_TARGET_OPTS = --with-libexpat=$(STAGING_DIR)/usr
-
-$(eval $(python-package))
