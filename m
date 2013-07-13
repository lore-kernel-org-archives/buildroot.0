From: Rohan Fletcher <rohfledev@gmail.com>
Date: Sat, 13 Jul 2013 21:19:17 +1200
Subject: [Buildroot] [PATCH 1/2] python-pip: new package,
	update python-setuptools, enable openssl for host python
Message-ID: <1373707158-31756-1-git-send-email-rohfledev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added python-pip - a package manager for python. easy way of adding python packages to buildroot.
Updated python-setuptools to version 0.8 - distribute and setuptools have now merged.
Enabled ssl in host python config so pip can download packages over https.

Signed-off-by: Rohan Fletcher <rohfledev@gmail.com>
---
 package/Config.in                              |  2 +
 package/python-pip/Config.in                   | 20 +++++++++
 package/python-pip/python-pip.mk               | 58 ++++++++++++++++++++++++++
 package/python-setuptools/python-setuptools.mk | 10 ++---
 package/python/python.mk                       |  5 +--
 5 files changed, 87 insertions(+), 8 deletions(-)
 create mode 100644 package/python-pip/Config.in
 create mode 100644 package/python-pip/python-pip.mk

diff --git a/package/Config.in b/package/Config.in
index 6d5ff01..d6678a3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -359,6 +359,8 @@ source "package/python-pyparsing/Config.in"
 source "package/python-serial/Config.in"
 source "package/python-setuptools/Config.in"
 source "package/python-thrift/Config.in"
+comment "custom python modules"
+source "package/python-pip/Config.in"
 endmenu
 endif
 source "package/python3/Config.in"
diff --git a/package/python-pip/Config.in b/package/python-pip/Config.in
new file mode 100644
index 0000000..48f3b04
--- /dev/null
+++ b/package/python-pip/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_PYTHON_PIP
+    bool "python-pip"
+    help
+      A tool for installing and managing Python packages.
+
+      http://www.pip-installer.org
+
+if BR2_PACKAGE_PYTHON_PIP
+
+config BR2_PACKAGE_PYTHON_PIP_MODULES_ADDITIONAL
+	string "Additional modules"
+	help
+	  List of space-separated python modules to install via pip.
+	  See 'pip help install' for available installation methods. 
+	  For repeatable builds, download and save tgz files or clone 
+	  git repos for the components you care about.
+
+	  Example: module-name module-name==1.3.4 /my/module/mymodule.tgz git://github.com/someuser/somemodule.git#v1.2
+
+endif
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
new file mode 100644
index 0000000..7cf8ab4
--- /dev/null
+++ b/package/python-pip/python-pip.mk
@@ -0,0 +1,58 @@
+
+#############################################################
+#
+# python-pip
+#
+#############################################################
+
+PYTHON_PIP_VERSION = 1.3.1
+PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
+PYTHON_PIP_SITE = https://pypi.python.org/packages/source/p/pip
+PYTHON_PIP_DEPENDENCIES = python python-setuptools host-python-setuptools host-python-pip
+
+# README.rst refers to the file "LICENSE" but it's not included
+
+define PYTHON_PIP_BUILD_CMDS
+	(cd $(@D); \
+	PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
+	$(HOST_DIR)/usr/bin/python setup.py build --executable=/usr/bin/python)
+endef
+
+define HOST_PYTHON_PIP_INSTALL_CMDS
+	(cd $(@D); PYTHONPATH=$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(HOST_DIR)/usr)
+endef
+
+PYTHON_PIP_MODULES_LIST=$(call qstrip, $(BR2_PACKAGE_PYTHON_PIP_MODULES_ADDITIONAL))
+
+ifneq ($(PYTHON_PIP_MODULES_LIST),)
+define PYTHON_PIP_INSTALL_MODULES
+	# Explanation of environment variables
+	# PATH: the staging dir is required here so that xslt-config can be found
+	# 	when trying to install the python lxml package
+	# PIP_DOWNLOAD_CACHE: all downloads go into the buildroot download folder
+	# PIP_TARGET: this is where the packages end up
+	# PIP_BUILD: where the packages are built - a subdirectory of the pip folder
+	($(TARGET_CONFIGURE_OPTS) \
+	PATH=$(STAGING_DIR)/usr/bin:$(PATH) \
+	PIP_DOWNLOAD_CACHE=$(BR2_DL_DIR) \
+	PIP_TARGET=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+	PIP_BUILD=$(BUILD_DIR)/python-pip-$(PYTHON_PIP_VERSION)/packages \
+	CC="$(TARGET_CC)"		\
+	CFLAGS="$(TARGET_CFLAGS)" 	\
+	LDSHARED="$(TARGET_CC) -shared" \
+	LDFLAGS="$(TARGET_LDFLAGS)" 	\
+	$(HOST_DIR)/usr/bin/pip install \
+	$(PYTHON_PIP_MODULES_LIST))
+endef
+endif
+
+define PYTHON_PIP_INSTALL_TARGET_CMDS
+	(cd $(@D); PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+	$(PYTHON_PIP_INSTALL_MODULES)
+endef
+
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index cd5ee4d..416abfb 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -9,9 +9,9 @@
 # switch back to it.
 # See http://pypi.python.org/packages/source/s/setuptools
 
-PYTHON_SETUPTOOLS_VERSION = 0.6.36
-PYTHON_SETUPTOOLS_SOURCE  = distribute-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE    = http://pypi.python.org/packages/source/d/distribute
+PYTHON_SETUPTOOLS_VERSION = 0.8
+PYTHON_SETUPTOOLS_SOURCE  = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
+PYTHON_SETUPTOOLS_SITE    = http://pypi.python.org/packages/source/s/setuptools
 PYTHON_SETUPTOOLS_DEPENDENCIES = python
 
 define HOST_PYTHON_SETUPTOOLS_BUILD_CMDS
@@ -20,7 +20,7 @@ endef
 
 define PYTHON_SETUPTOOLS_BUILD_CMDS
 	(cd $(@D); \
-	PYTHONPATH="/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
+	PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
 	$(HOST_DIR)/usr/bin/python setup.py build)
 endef
 
@@ -32,7 +32,7 @@ endef
 
 define PYTHON_SETUPTOOLS_INSTALL_TARGET_CMDS
 	(cd $(@D); \
-	PYTHONPATH="/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
+	PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
 	$(HOST_DIR)/usr/bin/python setup.py install --executable=/usr/bin/python \
 	--single-version-externally-managed --root=/ --prefix=$(TARGET_DIR)/usr)
 endef
diff --git a/package/python/python.mk b/package/python/python.mk
index ecea638..45a0563 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -31,8 +31,7 @@ HOST_PYTHON_CONF_OPT += 	\
 	--disable-gdbm		\
 	--disable-bsddb		\
 	--disable-test-modules	\
-	--disable-bz2		\
-	--disable-ssl
+	--disable-bz2		
 
 HOST_PYTHON_MAKE_ENV = \
 	PYTHON_MODULES_INCLUDE=$(HOST_DIR)/usr/include \
@@ -50,7 +49,7 @@ HOST_PYTHON_MAKE = $(MAKE1)
 
 PYTHON_DEPENDENCIES  = host-python libffi
 
-HOST_PYTHON_DEPENDENCIES = host-expat host-zlib
+HOST_PYTHON_DEPENDENCIES = host-expat host-zlib host-openssl
 
 PYTHON_INSTALL_STAGING = YES
 
-- 
1.8.1.2
