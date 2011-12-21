From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 21 Dec 2011 11:52:55 +0100
Subject: [Buildroot] [PATCH] New package: python-setuptools
Message-ID: <1324464775-9409-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-setuptools/Config.in            |    9 +++++++++
 package/python-setuptools/python-setuptools.mk |   24 ++++++++++++++++++++++++
 package/python/Config.in                       |    2 ++
 3 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 package/python-setuptools/Config.in
 create mode 100644 package/python-setuptools/python-setuptools.mk

diff --git a/package/python-setuptools/Config.in b/package/python-setuptools/Config.in
new file mode 100644
index 0000000..365470e
--- /dev/null
+++ b/package/python-setuptools/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_SETUPTOOLS
+	bool "python-setuptools"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  Download, build, install, upgrade, and uninstall Python packages.
+
+	  http://pypi.python.org/pypi/setuptools
+
+
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
new file mode 100644
index 0000000..1103717
--- /dev/null
+++ b/package/python-setuptools/python-setuptools.mk
@@ -0,0 +1,24 @@
+#############################################################
+#
+# python-setuptools
+#
+#############################################################
+
+PYTHON_SETUPTOOLS_VERSION = 0.6c11
+PYTHON_SETUPTOOLS_SOURCE  = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
+PYTHON_SETUPTOOLS_SITE    = http://pypi.python.org/packages/source/s/setuptools
+PYTHON_INSTALL_STAGING = YES
+PYTHON_SETUPTOOLS_DEPENDENCIES = python
+
+define HOST_PYTHON_SETUPTOOLS_BUILD_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
+endef
+
+define HOST_PYTHON_SETUPTOOLS_INSTALL_CMDS
+	(cd $(@D); PYTHONPATH="$(HOST_DIR)/usr/lib/python2.7/site-packages"\
+	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(HOST_DIR)/usr)
+endef
+
+$(eval $(call GENTARGETS))
+$(eval $(call GENTARGETS,host))
+
diff --git a/package/python/Config.in b/package/python/Config.in
index 11aa267..c48496a 100644
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -93,6 +93,8 @@ config BR2_PACKAGE_PYTHON_ZLIB
 	help
 	  zlib support in Python
 
+source "package/python-setuptools/Config.in"
+
 endmenu
 
 endif
-- 
1.7.1.1
