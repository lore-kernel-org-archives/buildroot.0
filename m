From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 3 Oct 2013 20:12:09 -0500
Subject: [Buildroot] [PATCH 5/5] python-pysnmp-mibs: new package
In-Reply-To: <1380849129-18517-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1380849129-18517-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <1380849129-18517-6-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>

---

v1 -> v2
 * Added PYTHONPATH definition to the install target command
 * Added the dependancy on host-python-pysnmp since the setuptools
   python module will be unable to find the installation version
   of pyasn/pycrypto/pysnmp in the hostdir.
---
 package/Config.in                                |    1 +
 package/python-pysnmp-mibs/Config.in             |    8 ++++++
 package/python-pysnmp-mibs/python-pysnmp-mibs.mk |   29 ++++++++++++++++++++++
 3 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 package/python-pysnmp-mibs/Config.in
 create mode 100644 package/python-pysnmp-mibs/python-pysnmp-mibs.mk

diff --git a/package/Config.in b/package/Config.in
index 970f5ce..71a4357 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -404,6 +404,7 @@ source "package/python-pyro/Config.in"
 source "package/python-pysnmp/Config.in"
 if BR2_PACKAGE_PYTHON_PYSNMP
 source "package/python-pysnmp-apps/Config.in"
+source "package/python-pysnmp-mibs/Config.in"
 endif
 source "package/python-pyzmq/Config.in"
 source "package/python-serial/Config.in"
diff --git a/package/python-pysnmp-mibs/Config.in b/package/python-pysnmp-mibs/Config.in
new file mode 100644
index 0000000..2835678
--- /dev/null
+++ b/package/python-pysnmp-mibs/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_PYSNMP_MIBS
+	bool "python-pysnmp-mibs"
+	depends on BR2_PACKAGE_PYTHON && BR2_PACKAGE_PYTHON_PYSNMP
+	help
+	  PySNMP MIBs is a set of IETF & IANA MIBs pre-compiled and 
+	  packaged to simplify their use with the PySNMP library.
+
+	  http://pysnmp.sf.net
diff --git a/package/python-pysnmp-mibs/python-pysnmp-mibs.mk b/package/python-pysnmp-mibs/python-pysnmp-mibs.mk
new file mode 100644
index 0000000..204582d
--- /dev/null
+++ b/package/python-pysnmp-mibs/python-pysnmp-mibs.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# python-pysnmp-mibs
+#
+################################################################################
+
+PYTHON_PYSNMP_MIBS_VERSION = 0.1.4
+PYTHON_PYSNMP_MIBS_SOURCE  = pysnmp-mibs-$(PYTHON_PYSNMP_MIBS_VERSION).tar.gz
+PYTHON_PYSNMP_MIBS_SITE    = https://pypi.python.org/packages/source/p/pysnmp-mibs
+PYTHON_PYSNMP_MIBS_LICENSE = BSD-3c
+PYTHON_PYSNMP_MIBS_LICENSE_FILES = LICENSE
+
+PYTHON_PYSNMP_MIBS_DEPENDENCIES = python \
+	python-pysnmp \
+	host-python-pysnmp
+
+define PYTHON_PYSNMP_MIBS_BUILD_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build --executable=/usr/bin/python)
+endef
+
+# PYTHONPATH definition is need for install since an error could
+# be thrown about installing to location that isn't in PYTHONPATH
+define PYTHON_PYSNMP_MIBS_INSTALL_TARGET_CMDS
+	(cd $(@D); \
+		PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+endef
+
+$(eval $(generic-package))
-- 
1.7.1
