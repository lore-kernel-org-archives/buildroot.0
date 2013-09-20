From: Matt Weber <mlweber1@rockwellcollins.com>
Date: Fri, 20 Sep 2013 13:09:20 -0500
Subject: [Buildroot] [PATCH 1/1] pyrex: new package
Message-ID: <1379700560-10738-1-git-send-email-mlweber1@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
---
 package/Config.in                    |    1 +
 package/python-pyrex/Config.in       |    7 ++++++
 package/python-pyrex/python-pyrex.mk |   37 ++++++++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+), 0 deletions(-)
 create mode 100644 package/python-pyrex/Config.in
 create mode 100644 package/python-pyrex/python-pyrex.mk

diff --git a/package/Config.in b/package/Config.in
index e187aa3..1dc46c3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -395,6 +395,7 @@ source "package/python-nfc/Config.in"
 source "package/python-protobuf/Config.in"
 source "package/python-pygame/Config.in"
 source "package/python-pyparsing/Config.in"
+source "package/python-pyrex/Config.in"
 source "package/python-pyro/Config.in"
 source "package/python-pyzmq/Config.in"
 source "package/python-serial/Config.in"
diff --git a/package/python-pyrex/Config.in b/package/python-pyrex/Config.in
new file mode 100644
index 0000000..551c15c
--- /dev/null
+++ b/package/python-pyrex/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PYREX
+	bool "pyrex"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  Pyrex is a language for writing Python extension modules
+
+	  http://www.cosc.canterbury.ac.nz/greg.ewing/python/Pyrex/
diff --git a/package/python-pyrex/python-pyrex.mk b/package/python-pyrex/python-pyrex.mk
new file mode 100644
index 0000000..28eb8ae
--- /dev/null
+++ b/package/python-pyrex/python-pyrex.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# python-pyrex
+#
+################################################################################
+
+PYTHON_PYREX_VERSION = 0.9.9
+PYTHON_PYREX_SOURCE = Pyrex-$(PYTHON_PYREX_VERSION).tar.gz
+PYTHON_PYREX_SITE = http://www.cosc.canterbury.ac.nz/greg.ewing/python/Pyrex/
+PYTHON_PYREX_DEPENDENCIES = python host-python
+PYTHON_PYREX_LICENSE = Apache-v2
+PYTHON_PYREX_LICENSE_FILES = LICENSE.txt
+
+PYTHON_PYREX_PARAMS = CC="$(TARGET_CC)" \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		LDSHARED="$(TARGET_CC) -shared" \
+		CROSS_COMPILING=yes \
+		_python_sysroot=$(STAGING_DIR) \
+		_python_srcdir=$(PYTHON_DIR) \
+		_python_prefix=/usr \
+		_python_exec_prefix=/usr
+
+define PYTHON_PYREX_BUILD_CMDS
+	(cd $(@D); $(PYTHON_PYREX_PARAMS) \
+		$(HOST_DIR)/usr/bin/python setup.py build \
+	)
+endef
+
+define PYTHON_PYREX_INSTALL_TARGET_CMDS
+	(cd $(@D); \
+		$(PYTHON_PYREX_PARAMS) \
+		$(HOST_DIR)/usr/bin/python setup.py install \
+		--prefix=$(TARGET_DIR)/usr; \
+		$(SED) "s:$(HOST_DIR)/usr:/usr:g" $(TARGET_DIR)/usr/bin/pyrexc )
+endef
+
+$(eval $(generic-package))
-- 
1.7.1
