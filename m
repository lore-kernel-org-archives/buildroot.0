From: ludovic.desroches at atmel.com <ludovic.desroches@atmel.com>
Date: Fri, 11 Oct 2013 13:58:52 +0200
Subject: [Buildroot] [RFC PATCH 6/7] lava-tool: new package
In-Reply-To: <1381492733-24280-1-git-send-email-ludovic.desroches@atmel.com>
References: <1381492733-24280-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <1381492733-24280-7-git-send-email-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ludovic Desroches <ludovic.desroches@atmel.com>

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---
 package/Config.in              |  1 +
 package/lava-tool/Config.in    |  8 ++++++++
 package/lava-tool/lava-tool.mk | 21 +++++++++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 package/lava-tool/Config.in
 create mode 100644 package/lava-tool/lava-tool.mk

diff --git a/package/Config.in b/package/Config.in
index fe92827..e6150d0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -27,6 +27,7 @@ source "package/gdb/Config.in"
 source "package/iozone/Config.in"
 source "package/kexec/Config.in"
 source "package/latencytop/Config.in"
+source "package/lava-tool/Config.in"
 source "package/lmbench/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/lsof/Config.in"
diff --git a/package/lava-tool/Config.in b/package/lava-tool/Config.in
new file mode 100644
index 0000000..6a0206d
--- /dev/null
+++ b/package/lava-tool/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LAVA_TOOL
+	bool "lava-tool"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_KEYRING
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS
+	select BR2_PACKAGE_PYTHON_VERSIONTOOLS
+	help
+	  Command line utility for the various Linaro validation services
diff --git a/package/lava-tool/lava-tool.mk b/package/lava-tool/lava-tool.mk
new file mode 100644
index 0000000..9d796ef
--- /dev/null
+++ b/package/lava-tool/lava-tool.mk
@@ -0,0 +1,21 @@
+LAVA_TOOL_VERSION = 0.6
+LAVA_TOOL_SOURCE = lava-tool-$(LAVA_TOOL_VERSION)-2012.11.tar.gz
+LAVA_TOOL_SITE = https://launchpad.net/lava-tool/trunk/2012.11/+download/
+LAVA_TOOL_LICENSE = GPLv3
+LAVA_TOOL_LICENSE_FILES = COPYING
+LAVA_TOOL_DEPENDENCIES = python python-keyring python-setuptools python-versiontools
+
+define LAVA_TOOL_BUILD_CMDS
+  (cd $(@D); \
+  PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
+  $(HOST_DIR)/usr/bin/python setup.py build)
+endef
+
+define LAVA_TOOL_INSTALL_TARGET_CMDS
+  (cd $(@D); \
+  PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
+  $(HOST_DIR)/usr/bin/python setup.py install --prefix=/usr --root=$(TARGET_DIR))
+  sed -i '1s|#!.*python.*|#!/usr/bin/env python|' $(TARGET_DIR)/usr/bin/{lava,lava-tool}
+endef
+
+$(eval $(generic-package))
-- 
1.7.11.3
