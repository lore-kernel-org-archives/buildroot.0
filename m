From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 14:01:00 +0100
Subject: [Buildroot] [git commit] python-pyasn: new package
Message-ID: <20131215130826.B66D89BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fe6e7a4f136ca92bda7e43c2a2191f484d220f19
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: license is LGPLv3+ / GPLv2+]
Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                    |    1 +
 package/python-pyasn/Config.in       |   13 +++++++++++++
 package/python-pyasn/python-pyasn.mk |   19 +++++++++++++++++++
 3 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 66b3591..2276b41 100644
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
index 0000000..b007222
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
+PYTHON_PYASN_LICENSE = LGPLv3+ (pyasn.cpp), GPLv2+ (libgds)
+PYTHON_PYASN_SETUP_TYPE = distutils
+
+define PYTHON_PYASN_EXTRACT_CMDS
+	unzip -d $(@D) $(DL_DIR)/$(PYTHON_PYASN_SOURCE)
+	mv $(@D)/PyASN-$(PYTHON_PYASN_VERSION)/* $(@D)
+	$(RM) -r $(@D)/PyASN-$(PYTHON_PYASN_VERSION)
+endef
+
+$(eval $(python-package))
