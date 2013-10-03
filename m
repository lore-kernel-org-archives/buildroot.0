From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 3 Oct 2013 15:01:03 -0500
Subject: [Buildroot] [PATCH 3/5] python-pysnmp: new package
In-Reply-To: <1380830465-16083-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1380830465-16083-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <1380830465-16083-4-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
Even though the documentation for PySNMP says PyCrypto is an optional
dependancy, it is required for any system besides Windows.
(see Setup.py)
---
 package/Config.in                      |    1 +
 package/python-pysnmp/Config.in        |   10 ++++++++++
 package/python-pysnmp/python-pysnmp.mk |   23 +++++++++++++++++++++++
 3 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 package/python-pysnmp/Config.in
 create mode 100644 package/python-pysnmp/python-pysnmp.mk

diff --git a/package/Config.in b/package/Config.in
index a1f7901..68262f9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -401,6 +401,7 @@ source "package/python-pycrypto/Config.in"
 source "package/python-pygame/Config.in"
 source "package/python-pyparsing/Config.in"
 source "package/python-pyro/Config.in"
+source "package/python-pysnmp/Config.in"
 source "package/python-pyzmq/Config.in"
 source "package/python-serial/Config.in"
 source "package/python-setuptools/Config.in"
diff --git a/package/python-pysnmp/Config.in b/package/python-pysnmp/Config.in
new file mode 100644
index 0000000..88f6f6f
--- /dev/null
+++ b/package/python-pysnmp/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_PYSNMP
+	bool "python-pysnmp"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_PYASN
+	select BR2_PACKAGE_PYTHON_PYCRYPTO
+	help
+	  PySNMP is a cross-platform, pure-Python SNMP engine
+	  implementation.
+
+	  http://pysnmp.sf.net
diff --git a/package/python-pysnmp/python-pysnmp.mk b/package/python-pysnmp/python-pysnmp.mk
new file mode 100644
index 0000000..d4a25c8
--- /dev/null
+++ b/package/python-pysnmp/python-pysnmp.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# python-pysnmp
+#
+################################################################################
+
+PYTHON_PYSNMP_VERSION = 4.2.4
+PYTHON_PYSNMP_SOURCE  = pysnmp-$(PYTHON_PYSNMP_VERSION).tar.gz
+PYTHON_PYSNMP_SITE    = https://pypi.python.org/packages/source/p/pysnmp
+PYTHON_PYSNMP_LICENSE = BSD-3c
+PYTHON_PYSNMP_LICENSE_FILES = LICENSE
+
+PYTHON_PYSNMP_DEPENDENCIES = python python-pyasn python-pycrypto
+
+define PYTHON_PYSNMP_BUILD_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build --executable=/usr/bin/python)
+endef
+
+define PYTHON_PYSNMP_INSTALL_TARGET_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+endef
+
+$(eval $(generic-package))
-- 
1.7.1
