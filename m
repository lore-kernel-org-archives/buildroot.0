From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 3 Oct 2013 15:01:01 -0500
Subject: [Buildroot] [PATCH 1/5] python-pyasn: new package
In-Reply-To: <1380830465-16083-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1380830465-16083-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <1380830465-16083-2-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>

---

The definition of CFLAGS/LDFLAGS/LDSHARED is necessary since the
compilation of won't work correctly using either TARGET_CONFIGURE_OPTS
because it won't link against the correct python library. Also using
python-distutilcross doesn't work as the setup.py doesn't understand
the -x option.

---
 package/Config.in                    |    1 +
 package/python-pyasn/Config.in       |   13 +++++++++++
 package/python-pyasn/python-pyasn.mk |   38 ++++++++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+), 0 deletions(-)
 create mode 100644 package/python-pyasn/Config.in
 create mode 100644 package/python-pyasn/python-pyasn.mk

diff --git a/package/Config.in b/package/Config.in
index b7fdb89..3592cb7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -396,6 +396,7 @@ source "package/python-meld3/Config.in"
 source "package/python-netifaces/Config.in"
 source "package/python-nfc/Config.in"
 source "package/python-protobuf/Config.in"
+source "package/python-pyasn/Config.in"
 source "package/python-pygame/Config.in"
 source "package/python-pyparsing/Config.in"
 source "package/python-pyro/Config.in"
diff --git a/package/python-pyasn/Config.in b/package/python-pyasn/Config.in
new file mode 100644
index 0000000..a352fe4
--- /dev/null
+++ b/package/python-pyasn/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PYTHON_PYASN
+	bool "python-pyasn"
+	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  PyASN is a Python extension module that enables you to
+	  perform very fast IP address to Autonomous System Number
+	  lookups.
+
+	  https://code.google.com/p/pyasn/
+
+comment "python-pyasn requires C++ support in toolchain"
+        depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-pyasn/python-pyasn.mk b/package/python-pyasn/python-pyasn.mk
new file mode 100644
index 0000000..4579f38
--- /dev/null
+++ b/package/python-pyasn/python-pyasn.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# python-pyasn
+#
+################################################################################
+
+PYTHON_PYASN_VERSION = 1.2
+PYTHON_PYASN_SOURCE  = PyASN-$(PYTHON_PYASN_VERSION).zip
+PYTHON_PYASN_SITE    = https://pyasn.googlecode.com/files
+PYTHON_PYASN_LICENSE = LGPL
+
+PYTHON_PYASN_DEPENDENCIES = python
+
+define PYTHON_PYASN_EXTRACT_CMDS
+	unzip -d $(@D) $(DL_DIR)/$(PYTHON_PYASN_SOURCE)
+	mv $(@D)/PyASN-$(PYTHON_PYASN_VERSION)/* $(@D)
+	$(RM) -r $(@D)/PyASN-$(PYTHON_PYASN_VERSION)
+endef
+
+define PYTHON_PYASN_BUILD_CMDS
+	(cd $(@D); \
+		CC="$(TARGET_CC)" \
+		CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
+		CXX="$(TARGET_CXX)" \
+		CXXFLAGS="$(TARGET_CXXFLAGS) -I$(STAGING_DIR)/usr/include" \
+		LDSHARED="$(TARGET_CC) -shared" \
+		LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib" \
+		$(HOST_DIR)/usr/bin/python setup.py build_ext \
+		--include-dirs=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR) \
+	)
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
+endef
+
+define PYTHON_PYASN_INSTALL_TARGET_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+endef
+
+$(eval $(generic-package))
-- 
1.7.1
