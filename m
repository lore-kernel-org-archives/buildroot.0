From: ludovic.desroches at atmel.com <ludovic.desroches@atmel.com>
Date: Fri, 11 Oct 2013 13:58:48 +0200
Subject: [Buildroot] [RFC PATCH 2/7] python-keyring: new package
In-Reply-To: <1381492733-24280-1-git-send-email-ludovic.desroches@atmel.com>
References: <1381492733-24280-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <1381492733-24280-3-git-send-email-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ludovic Desroches <ludovic.desroches@atmel.com>

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---
 package/Config.in                        |  1 +
 package/python-keyring/Config.in         |  7 +++++++
 package/python-keyring/python-keyring.mk | 22 ++++++++++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 package/python-keyring/Config.in
 create mode 100644 package/python-keyring/python-keyring.mk

diff --git a/package/Config.in b/package/Config.in
index 03acc04..c0f7601 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -355,6 +355,7 @@ menu "external python modules"
 source "package/python-bottle/Config.in"
 source "package/python-dpkt/Config.in"
 source "package/python-id3/Config.in"
+source "package/python-keyring/Config.in"
 source "package/python-mad/Config.in"
 source "package/python-meld3/Config.in"
 source "package/python-netifaces/Config.in"
diff --git a/package/python-keyring/Config.in b/package/python-keyring/Config.in
new file mode 100644
index 0000000..496a0a6
--- /dev/null
+++ b/package/python-keyring/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_KEYRING
+	bool "python-keyring"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS
+	help
+	  The Python keyring lib provides a easy way to access the system
+	  keyring service from python.
diff --git a/package/python-keyring/python-keyring.mk b/package/python-keyring/python-keyring.mk
new file mode 100644
index 0000000..2db701e
--- /dev/null
+++ b/package/python-keyring/python-keyring.mk
@@ -0,0 +1,22 @@
+PYTHON_KEYRING_VERSION = 3.0.5
+PYTHON_KEYRING_SOURCE  = keyring-$(PYTHON_KEYRING_VERSION).zip
+PYTHON_KEYRING_SITE    = http://pypi.python.org/packages/source/k/keyring/
+PYTHON_KEYRING_DEPENDENCIES = python python-setuptools
+
+define PYTHON_KEYRING_EXTRACT_CMDS
+        unzip $(DL_DIR)/$(PYTHON_KEYRING_SOURCE) -d $(BUILD_DIR)/python-keyring-$(PYTHON_KEYRING_VERSION)
+endef
+
+define PYTHON_KEYRING_BUILD_CMDS
+	(cd $(@D)/keyring-$(PYTHON_KEYRING_VERSION); \
+	PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
+	$(HOST_DIR)/usr/bin/python setup.py build)
+endef
+
+define PYTHON_KEYRING_INSTALL_TARGET_CMDS
+	(cd $(@D)/keyring-$(PYTHON_KEYRING_VERSION); \
+	PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
+	$(HOST_DIR)/usr/bin/python setup.py install --prefix=/usr --root=$(TARGET_DIR))
+endef
+
+$(eval $(generic-package))
-- 
1.7.11.3
