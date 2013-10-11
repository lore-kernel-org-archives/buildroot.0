From: ludovic.desroches at atmel.com <ludovic.desroches@atmel.com>
Date: Fri, 11 Oct 2013 13:58:49 +0200
Subject: [Buildroot] [RFC PATCH 3/7] python-simplejson: new package
In-Reply-To: <1381492733-24280-1-git-send-email-ludovic.desroches@atmel.com>
References: <1381492733-24280-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <1381492733-24280-4-git-send-email-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ludovic Desroches <ludovic.desroches@atmel.com>

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---
 package/Config.in                              |  1 +
 package/python-simplejson/Config.in            |  6 ++++++
 package/python-simplejson/python-simplejson.mk | 22 ++++++++++++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 package/python-simplejson/Config.in
 create mode 100644 package/python-simplejson/python-simplejson.mk

diff --git a/package/Config.in b/package/Config.in
index c0f7601..4c95b58 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -366,6 +366,7 @@ source "package/python-pyparsing/Config.in"
 source "package/python-pyro/Config.in"
 source "package/python-serial/Config.in"
 source "package/python-setuptools/Config.in"
+source "package/python-simplejson/Config.in"
 source "package/python-thrift/Config.in"
 source "package/python-versiontools/Config.in"
 endmenu
diff --git a/package/python-simplejson/Config.in b/package/python-simplejson/Config.in
new file mode 100644
index 0000000..77bf835
--- /dev/null
+++ b/package/python-simplejson/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_SIMPLEJSON
+	bool "python-simplejson"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS
+	help
+	  Simple, fast, extensible JSON encoder/decoder for Python
diff --git a/package/python-simplejson/python-simplejson.mk b/package/python-simplejson/python-simplejson.mk
new file mode 100644
index 0000000..d034e14
--- /dev/null
+++ b/package/python-simplejson/python-simplejson.mk
@@ -0,0 +1,22 @@
+PYTHON_SIMPLEJSON_VERSION = 3.3.1
+PYTHON_SIMPLEJSON_SOURCE  = simplejson-$(PYTHON_SIMPLEJSON_VERSION).tar.gz
+PYTHON_SIMPLEJSON_SITE = http://pypi.python.org/packages/source/s/simplejson/
+PYTHON_SIMPLEJSON_LICENSE = MIT
+PYTHON_SIMPLEJSON_LICENSE_FILES = LICENSE.txt
+PYTHON_SIMPLEJSON_DEPENDENCIES = python python-setuptools
+
+define PYTHON_SIMPLEJSON_BUILD_CMDS
+	(cd $(@D); \
+	CC="$(TARGET_CC)" LD="$(TARGET_LD)" CFLAGS="" \
+	PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
+	$(HOST_DIR)/usr/bin/python setup.py build)
+endef
+
+define PYTHON_SIMPLEJSON_INSTALL_TARGET_CMDS
+	(cd $(@D); \
+	CC="$(TARGET_CC)" LD="$(TARGET_LD)" CFLAGS="" \
+	PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
+	$(HOST_DIR)/usr/bin/python setup.py install --prefix=/usr --root=$(TARGET_DIR))
+endef
+
+$(eval $(generic-package))
-- 
1.7.11.3
