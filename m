From: Rohan Fletcher <rohfledev@gmail.com>
Date: Sat, 20 Jul 2013 22:27:14 +1200
Subject: [Buildroot] [PATCH 3/3] python-pip: new package
In-Reply-To: <1374316034-31973-1-git-send-email-rohfledev@gmail.com>
References: <1374316034-31973-1-git-send-email-rohfledev@gmail.com>
Message-ID: <1374316034-31973-3-git-send-email-rohfledev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pip is a package manager for python that downloads packages from https://pypi.python.org/

Signed-off-by: Rohan Fletcher <rohfledev@gmail.com>
---
 package/Config.in                |  1 +
 package/python-pip/Config.in     | 22 ++++++++++++++++
 package/python-pip/python-pip.mk | 54 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 77 insertions(+)
 create mode 100644 package/python-pip/Config.in
 create mode 100644 package/python-pip/python-pip.mk

diff --git a/package/Config.in b/package/Config.in
index 286a605..9bc9823 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -360,6 +360,7 @@ source "package/python-pyparsing/Config.in"
 source "package/python-serial/Config.in"
 source "package/python-setuptools/Config.in"
 source "package/python-thrift/Config.in"
+source "package/python-pip/Config.in"
 endmenu
 endif
 source "package/python3/Config.in"
diff --git a/package/python-pip/Config.in b/package/python-pip/Config.in
new file mode 100644
index 0000000..a238deb
--- /dev/null
+++ b/package/python-pip/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_PYTHON_PIP
+	bool "python-pip"
+	select BR2_HOST_PYTHON_SSL_SUPPORT
+	help
+	  A tool for installing and managing Python packages.
+
+	  http://www.pip-installer.org
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
+	  Example: module-name module-name==1.3.4 /my/module/mymodule.tgz 
+	  git://github.com/someuser/somemodule.git#v1.2
+
+endif
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
new file mode 100644
index 0000000..6f25759
--- /dev/null
+++ b/package/python-pip/python-pip.mk
@@ -0,0 +1,54 @@
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
+PYTHON_PIP_LICENSE = MIT
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
+	# PIP_DOWNLOAD_CACHE: all downloads go into the buildroot download folder
+	# PIP_TARGET: this is where the packages end up
+	# PIP_BUILD: where the packages are built - a subdirectory of the pip folder
+	($(TARGET_CONFIGURE_OPTS) \
+	PIP_DOWNLOAD_CACHE=$(BR2_DL_DIR) \
+	PIP_TARGET=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+	PIP_BUILD=$(BUILD_DIR)/python-pip-$(PYTHON_PIP_VERSION)/packages \
+	CC="$(TARGET_CC)"			\
+	CFLAGS="$(TARGET_CFLAGS)" 	\
+	LDSHARED="$(TARGET_CC) -shared" \
+	LDFLAGS="$(TARGET_LDFLAGS)" 	\
+	$(HOST_DIR)/usr/bin/pip install \
+	$(PYTHON_PIP_MODULES_LIST));
+endef
+endif
+
+define PYTHON_PIP_INSTALL_TARGET_CMDS
+	$(PYTHON_PIP_INSTALL_MODULES)
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
+
-- 
1.8.1.2
