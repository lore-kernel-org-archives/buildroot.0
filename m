From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 3 Oct 2013 15:01:04 -0500
Subject: [Buildroot] [PATCH 4/5] python-pysnmp-apps: new package
In-Reply-To: <1380830465-16083-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1380830465-16083-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <1380830465-16083-5-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 package/Config.in                                |    3 ++
 package/python-pysnmp-apps/Config.in             |    7 ++++++
 package/python-pysnmp-apps/python-pysnmp-apps.mk |   23 ++++++++++++++++++++++
 3 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 package/python-pysnmp-apps/Config.in
 create mode 100644 package/python-pysnmp-apps/python-pysnmp-apps.mk

diff --git a/package/Config.in b/package/Config.in
index 68262f9..970f5ce 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -402,6 +402,9 @@ source "package/python-pygame/Config.in"
 source "package/python-pyparsing/Config.in"
 source "package/python-pyro/Config.in"
 source "package/python-pysnmp/Config.in"
+if BR2_PACKAGE_PYTHON_PYSNMP
+source "package/python-pysnmp-apps/Config.in"
+endif
 source "package/python-pyzmq/Config.in"
 source "package/python-serial/Config.in"
 source "package/python-setuptools/Config.in"
diff --git a/package/python-pysnmp-apps/Config.in b/package/python-pysnmp-apps/Config.in
new file mode 100644
index 0000000..89a2610
--- /dev/null
+++ b/package/python-pysnmp-apps/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PYSNMP_APPS
+	bool "python-pysnmp-apps"
+	help
+	  PySNMP MIBs is a set of IETF & IANA MIBs pre-compiled and 
+	  packaged to simplify their use with the PySNMP library.
+
+	  http://pysnmp.sf.net
diff --git a/package/python-pysnmp-apps/python-pysnmp-apps.mk b/package/python-pysnmp-apps/python-pysnmp-apps.mk
new file mode 100644
index 0000000..f968f04
--- /dev/null
+++ b/package/python-pysnmp-apps/python-pysnmp-apps.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# python-pysnmp-apps
+#
+################################################################################
+
+PYTHON_PYSNMP_APPS_VERSION = 0.3.3
+PYTHON_PYSNMP_APPS_SOURCE  = pysnmp-apps-$(PYTHON_PYSNMP_APPS_VERSION).tar.gz
+PYTHON_PYSNMP_APPS_SITE    = https://pypi.python.org/packages/source/p/pysnmp-apps
+PYTHON_PYSNMP_APPS_LICENSE = BSD-3c
+PYTHON_PYSNMP_APPS_LICENSE_FILES = LICENSE
+
+PYTHON_PYSNMP_APPS_DEPENDENCIES = python python-pysnmp
+
+define PYTHON_PYSNMP_APPS_BUILD_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build --executable=/usr/bin/python)
+endef
+
+define PYTHON_PYSNMP_APPS_INSTALL_TARGET_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+endef
+
+$(eval $(generic-package))
-- 
1.7.1
