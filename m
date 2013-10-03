From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 3 Oct 2013 15:01:02 -0500
Subject: [Buildroot] [PATCH 2/5] python-pycrypto: new package
In-Reply-To: <1380830465-16083-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1380830465-16083-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <1380830465-16083-3-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 package/Config.in                          |    1 +
 package/python-pycrypto/Config.in          |    8 ++++++++
 package/python-pycrypto/python-pycrypto.mk |   25 +++++++++++++++++++++++++
 3 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 package/python-pycrypto/Config.in
 create mode 100644 package/python-pycrypto/python-pycrypto.mk

diff --git a/package/Config.in b/package/Config.in
index 3592cb7..a1f7901 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -397,6 +397,7 @@ source "package/python-netifaces/Config.in"
 source "package/python-nfc/Config.in"
 source "package/python-protobuf/Config.in"
 source "package/python-pyasn/Config.in"
+source "package/python-pycrypto/Config.in"
 source "package/python-pygame/Config.in"
 source "package/python-pyparsing/Config.in"
 source "package/python-pyro/Config.in"
diff --git a/package/python-pycrypto/Config.in b/package/python-pycrypto/Config.in
new file mode 100644
index 0000000..bfb10f8
--- /dev/null
+++ b/package/python-pycrypto/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_PYCRYPTO
+	bool "python-pycrypto"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  PyCrypto is a collection of cryptographic algorithms and 
+	  protocols, implemented for use from Python.
+
+	  http://www.pycrypto.org/
diff --git a/package/python-pycrypto/python-pycrypto.mk b/package/python-pycrypto/python-pycrypto.mk
new file mode 100644
index 0000000..bba5de1
--- /dev/null
+++ b/package/python-pycrypto/python-pycrypto.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# python-pycrypto
+#
+################################################################################
+
+PYTHON_PYCRYPTO_VERSION = 2.6
+PYTHON_PYCRYPTO_SOURCE  = pycrypto-$(PYTHON_PYCRYPTO_VERSION).tar.gz
+PYTHON_PYCRYPTO_SITE    = http://ftp.dlitz.net/pub/dlitz/crypto/pycrypto
+PYTHON_PYCRYPTO_LICENSE = Public Domain, Python 2.2 License (HMAC.py, setup.py)
+
+PYTHON_PYCRYPTO_LICENSE_FILES = COPYRIGHT LEGAL/copy/LICENSE.libtom \
+		LEGAL/copy/LICENSE.orig LEGAL/copy/LICENSE.python-2.2
+
+PYTHON_PYCRYPTO_DEPENDENCIES = python
+
+define PYTHON_PYCRYPTO_BUILD_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build --executable=/usr/bin/python)
+endef
+
+define PYTHON_PYCRYPTO_INSTALL_TARGET_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+endef
+
+$(eval $(generic-package))
-- 
1.7.1
