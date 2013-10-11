From: ludovic.desroches at atmel.com <ludovic.desroches@atmel.com>
Date: Fri, 11 Oct 2013 13:58:51 +0200
Subject: [Buildroot] [RFC PATCH 5/7] python-linaro-dashboard-bundle: new
	package
In-Reply-To: <1381492733-24280-1-git-send-email-ludovic.desroches@atmel.com>
References: <1381492733-24280-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <1381492733-24280-6-git-send-email-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ludovic Desroches <ludovic.desroches@atmel.com>

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---
 package/Config.in                                     |  1 +
 package/python-linaro-dashboard-bundle/Config.in      | 10 ++++++++++
 .../python-linaro-dashboard-bundle.mk                 | 19 +++++++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 package/python-linaro-dashboard-bundle/Config.in
 create mode 100644 package/python-linaro-dashboard-bundle/python-linaro-dashboard-bundle.mk

diff --git a/package/Config.in b/package/Config.in
index 115a1c5..fe92827 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -357,6 +357,7 @@ source "package/python-dpkt/Config.in"
 source "package/python-id3/Config.in"
 source "package/python-json-schema-validator/Config.in"
 source "package/python-keyring/Config.in"
+source "package/python-linaro-dashboard-bundle/Config.in"
 source "package/python-mad/Config.in"
 source "package/python-meld3/Config.in"
 source "package/python-netifaces/Config.in"
diff --git a/package/python-linaro-dashboard-bundle/Config.in b/package/python-linaro-dashboard-bundle/Config.in
new file mode 100644
index 0000000..8eb7068
--- /dev/null
+++ b/package/python-linaro-dashboard-bundle/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_LINARO_DASHBOARD_BUNDLE
+	bool "python-linaro-dashboard-bundle"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_JSON_SCHEMA_VALIDATOR
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS
+	select BR2_PACKAGE_PYTHON_SIMPLEJSON
+	select BR2_PACKAGE_PYTHON_VERSIONTOOLS
+	help
+	  Python package with utilities for handling Linaro Dashboard Bundle
+	  documents
diff --git a/package/python-linaro-dashboard-bundle/python-linaro-dashboard-bundle.mk b/package/python-linaro-dashboard-bundle/python-linaro-dashboard-bundle.mk
new file mode 100644
index 0000000..0bf57fa
--- /dev/null
+++ b/package/python-linaro-dashboard-bundle/python-linaro-dashboard-bundle.mk
@@ -0,0 +1,19 @@
+PYTHON_LINARO_DASHBOARD_BUNDLE_VERSION = 1.8
+PYTHON_LINARO_DASHBOARD_BUNDLE_SOURCE = linaro-python-dashboard-bundle-$(PYTHON_LINARO_DASHBOARD_BUNDLE_VERSION)-2012.11.tar.gz
+PYTHON_LINARO_DASHBOARD_BUNDLE_SITE = https://launchpad.net/linaro-python-dashboard-bundle/trunk/2012.11/+download/
+PYTHON_LINARO_DASHBOARD_BUNDLE_LICENSE = GPLv3
+PYTHON_LINARO_DASHBOARD_BUNDLE_LICENSE_FILES = COPYING
+PYTHON_LINARO_DASHBOARD_BUNDLE_DEPENDENCIES = python python-json-schema-validator python-setuptools python-simplejson python-versiontools
+
+define PYTHON_LINARO_DASHBOARD_BUNDLE_BUILD_CMDS
+  (cd $(@D); \
+  PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
+  $(HOST_DIR)/usr/bin/python setup.py build)
+endef
+
+define PYTHON_LINARO_DASHBOARD_BUNDLE_INSTALL_TARGET_CMDS
+  (cd $(@D); PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
+  $(HOST_DIR)/usr/bin/python setup.py install --prefix=/usr --root=$(TARGET_DIR))
+endef
+
+$(eval $(generic-package))
-- 
1.7.11.3
