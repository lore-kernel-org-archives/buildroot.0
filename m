From: ludovic.desroches at atmel.com <ludovic.desroches@atmel.com>
Date: Wed, 9 Oct 2013 11:34:43 +0200
Subject: [Buildroot] [PATCH] New: add lava-test package
In-Reply-To: <20131008151729.GB3599@ludovic.desroches@atmel.com>
References: <20131008151729.GB3599@ludovic.desroches@atmel.com>
Message-ID: <1381311283-3534-1-git-send-email-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ludovic Desroches <ludovic.desroches@atmel.com>

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---

I have the same issues with latest release of Buildroot.

I have added python path replacement in install target instead of doing it in
the post-build script. I have added license stuff too and bump to latest
version.

 package/Config.in              |  1 +
 package/lava-test/Config.in    |  8 ++++++++
 package/lava-test/lava-test.mk | 13 +++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 package/lava-test/Config.in
 create mode 100644 package/lava-test/lava-test.mk

diff --git a/package/Config.in b/package/Config.in
index 97cd7da..2bf8313 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -27,6 +27,7 @@ source "package/gdb/Config.in"
 source "package/iozone/Config.in"
 source "package/kexec/Config.in"
 source "package/latencytop/Config.in"
+source "package/lava-test/Config.in"
 source "package/lmbench/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/lsof/Config.in"
diff --git a/package/lava-test/Config.in b/package/lava-test/Config.in
new file mode 100644
index 0000000..336ca42
--- /dev/null
+++ b/package/lava-test/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LAVA_TEST
+	bool "lava-test"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS
+	help
+	  LAVA Test is a test execution framework designed to make it easy to
+	  install and run supported tests. Results from testing can be
+	  optionally uploaded to a dashboard running lava-dashboard.
diff --git a/package/lava-test/lava-test.mk b/package/lava-test/lava-test.mk
new file mode 100644
index 0000000..bb32b29
--- /dev/null
+++ b/package/lava-test/lava-test.mk
@@ -0,0 +1,13 @@
+LAVA_TEST_VERSION = 0.14
+LAVA_TEST_SOURCE = lava-test-$(LAVA_TEST_VERSION)-2013.01.tar.gz
+LAVA_TEST_SITE = https://launchpad.net/lava-test/trunk/2013.01/+download/
+LAVA_TEST_DEPENDENCIES = python host-python-setuptools
+LAVA_TEST_LICENSE = GPLv3
+LAVA_TEST_LICENSE_FILES = COPYING
+
+define LAVA_TEST_INSTALL_TARGET_CMDS
+  (cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=/usr --root=$(TARGET_DIR))
+  sed -i '1s|#!.*python.*|#!/usr/bin/env python|' $(TARGET_DIR)/usr/bin/{lava,lava-dashboard-tool,lava-test,lava-tool}
+endef
+
+$(eval $(generic-package))
-- 
1.7.11.3
