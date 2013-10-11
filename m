From: ludovic.desroches at atmel.com <ludovic.desroches@atmel.com>
Date: Fri, 11 Oct 2013 13:58:47 +0200
Subject: [Buildroot] [RFC PATCH 1/7] python-versiontools: new package
In-Reply-To: <1381492733-24280-1-git-send-email-ludovic.desroches@atmel.com>
References: <1381492733-24280-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <1381492733-24280-2-git-send-email-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ludovic Desroches <ludovic.desroches@atmel.com>

---
 package/Config.in                                  |  1 +
 package/python-versiontools/Config.in              |  6 ++++++
 package/python-versiontools/python-versiontools.mk | 18 ++++++++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 package/python-versiontools/Config.in
 create mode 100644 package/python-versiontools/python-versiontools.mk

diff --git a/package/Config.in b/package/Config.in
index 97cd7da..03acc04 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -366,6 +366,7 @@ source "package/python-pyro/Config.in"
 source "package/python-serial/Config.in"
 source "package/python-setuptools/Config.in"
 source "package/python-thrift/Config.in"
+source "package/python-versiontools/Config.in"
 endmenu
 endif
 source "package/python3/Config.in"
diff --git a/package/python-versiontools/Config.in b/package/python-versiontools/Config.in
new file mode 100644
index 0000000..a981742
--- /dev/null
+++ b/package/python-versiontools/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_VERSIONTOOLS
+	bool "python-versiontools"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS
+	help
+	  Smart replacement for plain tuple used in __version__
diff --git a/package/python-versiontools/python-versiontools.mk b/package/python-versiontools/python-versiontools.mk
new file mode 100644
index 0000000..f31b71e
--- /dev/null
+++ b/package/python-versiontools/python-versiontools.mk
@@ -0,0 +1,18 @@
+PYTHON_VERSIONTOOLS_VERSION = 1.9.1
+PYTHON_VERSIONTOOLS_SOURCE  = versiontools-$(PYTHON_VERSIONTOOLS_VERSION).tar.gz
+PYTHON_VERSIONTOOLS_SITE    = http://pypi.python.org/packages/source/v/versiontools/
+PYTHON_VERSIONTOOLS_DEPENDENCIES = python python-setuptools
+
+define PYTHON_VERSIONTOOLS_BUILD_CMDS
+	(cd $(@D); \
+	PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
+	$(HOST_DIR)/usr/bin/python setup.py build)
+endef
+
+define PYTHON_VERSIONTOOLS_INSTALL_TARGET_CMDS
+	(cd $(@D); \
+	PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
+	$(HOST_DIR)/usr/bin/python setup.py install --prefix=/usr --root=$(TARGET_DIR))
+endef
+
+$(eval $(generic-package))
-- 
1.7.11.3
