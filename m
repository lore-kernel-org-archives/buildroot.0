From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Dec 2013 21:27:07 +0100
Subject: [Buildroot] [PATCHv2 32/36] python-pyasn: new package
In-Reply-To: <1386793631-14026-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386793631-14026-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1386793631-14026-33-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ryan Barnett <ryanbarnett3@gmail.com>

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |  1 +
 package/python-pyasn/Config.in       | 13 +++++++++++++
 package/python-pyasn/python-pyasn.mk | 19 +++++++++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 package/python-pyasn/Config.in
 create mode 100644 package/python-pyasn/python-pyasn.mk

diff --git a/package/Config.in b/package/Config.in
index acfd125..8dc03d0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -400,6 +400,7 @@ source "package/python-msgpack/Config.in"
 source "package/python-netifaces/Config.in"
 source "package/python-nfc/Config.in"
 source "package/python-protobuf/Config.in"
+source "package/python-pyasn/Config.in"
 source "package/python-pygame/Config.in"
 source "package/python-pyparsing/Config.in"
 source "package/python-pyro/Config.in"
diff --git a/package/python-pyasn/Config.in b/package/python-pyasn/Config.in
new file mode 100644
index 0000000..a9f0014
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
+comment "python-pyasn needs a toolchain w/ C++"
+        depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-pyasn/python-pyasn.mk b/package/python-pyasn/python-pyasn.mk
new file mode 100644
index 0000000..e360464
--- /dev/null
+++ b/package/python-pyasn/python-pyasn.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# python-pyasn
+#
+################################################################################
+
+PYTHON_PYASN_VERSION = 1.2
+PYTHON_PYASN_SOURCE = PyASN-$(PYTHON_PYASN_VERSION).zip
+PYTHON_PYASN_SITE = https://pyasn.googlecode.com/files
+PYTHON_PYASN_LICENSE = LGPL
+PYTHON_PYASN_SETUP_TYPE = distutils
+
+define PYTHON_PYASN_EXTRACT_CMDS
+	unzip -d $(@D) $(DL_DIR)/$(PYTHON_PYASN_SOURCE)
+	mv $(@D)/PyASN-$(PYTHON_PYASN_VERSION)/* $(@D)
+	$(RM) -r $(@D)/PyASN-$(PYTHON_PYASN_VERSION)
+endef
+
+$(eval $(python-package))
-- 
1.8.1.2
