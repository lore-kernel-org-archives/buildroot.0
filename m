From: ludovic.desroches at atmel.com <ludovic.desroches@atmel.com>
Date: Fri, 11 Oct 2013 13:58:53 +0200
Subject: [Buildroot] [RFC PATCH 7/7] lava-test: new package
In-Reply-To: <1381492733-24280-1-git-send-email-ludovic.desroches@atmel.com>
References: <1381492733-24280-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <1381492733-24280-8-git-send-email-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ludovic Desroches <ludovic.desroches@atmel.com>

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---
 package/Config.in              |  1 +
 package/lava-test/Config.in    | 11 +++++++++++
 package/lava-test/lava-test.mk | 21 +++++++++++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 package/lava-test/Config.in
 create mode 100644 package/lava-test/lava-test.mk

diff --git a/package/Config.in b/package/Config.in
index e6150d0..cc7ee49 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -27,6 +27,7 @@ source "package/gdb/Config.in"
 source "package/iozone/Config.in"
 source "package/kexec/Config.in"
 source "package/latencytop/Config.in"
+source "package/lava-test/Config.in"
 source "package/lava-tool/Config.in"
 source "package/lmbench/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/lava-test/Config.in b/package/lava-test/Config.in
new file mode 100644
index 0000000..37b82b0
--- /dev/null
+++ b/package/lava-test/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LAVA_TEST
+	bool "lava-test"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_LAVA_TOOL
+	select BR2_PACKAGE_PYTHON_LINARO_DASHBOARD_BUNDLE
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS
+	select BR2_PACKAGE_PYTHON_VERSIONTOOLS
+	help
+	  LAVA Test is a test execution framework designed to make it easy to
+	  install and run supported tests. Results from testing can be
+	  optionally uploaded to a dashboard running lava-dashboard.
diff --git a/package/lava-test/lava-test.mk b/package/lava-test/lava-test.mk
new file mode 100644
index 0000000..424f615
--- /dev/null
+++ b/package/lava-test/lava-test.mk
@@ -0,0 +1,21 @@
+LAVA_TEST_VERSION = 0.14
+LAVA_TEST_SOURCE = lava-test-$(LAVA_TEST_VERSION)-2013.01.tar.gz
+LAVA_TEST_SITE = https://launchpad.net/lava-test/trunk/2013.01/+download/
+LAVA_TEST_LICENSE = GPLv3
+LAVA_TEST_LICENSE_FILES = COPYING
+LAVA_TEST_DEPENDENCIES = lava-tool python python-linaro-dashboard-bundle python-setuptools python-versiontools
+
+define LAVA_TEST_BUILD_CMDS
+  (cd $(@D); \
+  PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
+  $(HOST_DIR)/usr/bin/python setup.py build)
+endef
+
+define LAVA_TEST_INSTALL_TARGET_CMDS
+  (cd $(@D); \
+  PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
+  $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+  sed -i '1s|#!.*python.*|#!/usr/bin/env python|' $(TARGET_DIR)/usr/bin/{lava,lava-test,lava-tool}
+endef
+
+$(eval $(generic-package))
-- 
1.7.11.3
