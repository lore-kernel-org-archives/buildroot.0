From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Dec 2013 21:27:08 +0100
Subject: [Buildroot] [PATCHv2 33/36] python-pycrypto: new package
In-Reply-To: <1386793631-14026-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386793631-14026-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1386793631-14026-34-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ryan Barnett <ryanbarnett3@gmail.com>

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |  1 +
 package/python-pycrypto/Config.in          |  9 ++++++++
 package/python-pycrypto/python-pycrypto.mk | 35 ++++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+)
 create mode 100644 package/python-pycrypto/Config.in
 create mode 100644 package/python-pycrypto/python-pycrypto.mk

diff --git a/package/Config.in b/package/Config.in
index 8dc03d0..59b7d6c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -401,6 +401,7 @@ source "package/python-netifaces/Config.in"
 source "package/python-nfc/Config.in"
 source "package/python-protobuf/Config.in"
 source "package/python-pyasn/Config.in"
+source "package/python-pycrypto/Config.in"
 source "package/python-pygame/Config.in"
 source "package/python-pyparsing/Config.in"
 source "package/python-pyro/Config.in"
diff --git a/package/python-pycrypto/Config.in b/package/python-pycrypto/Config.in
new file mode 100644
index 0000000..60a3446
--- /dev/null
+++ b/package/python-pycrypto/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_PYCRYPTO
+	bool "python-pycrypto"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_GMP
+	help
+	  PyCrypto is a collection of cryptographic algorithms and
+	  protocols, implemented for use from Python.
+
+	  http://www.pycrypto.org/
diff --git a/package/python-pycrypto/python-pycrypto.mk b/package/python-pycrypto/python-pycrypto.mk
new file mode 100644
index 0000000..eda48bd
--- /dev/null
+++ b/package/python-pycrypto/python-pycrypto.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# python-pycrypto
+#
+################################################################################
+
+PYTHON_PYCRYPTO_VERSION = 2.6
+PYTHON_PYCRYPTO_SOURCE = pycrypto-$(PYTHON_PYCRYPTO_VERSION).tar.gz
+PYTHON_PYCRYPTO_SITE = http://ftp.dlitz.net/pub/dlitz/crypto/pycrypto
+PYTHON_PYCRYPTO_SETUP_TYPE = distutils
+
+PYTHON_PYCRYPTO_LICENSE = Public Domain, Python 2.2 License (HMAC.py, setup.py)
+PYTHON_PYCRYPTO_LICENSE_FILES = COPYRIGHT LEGAL/copy/LICENSE.libtom \
+		LEGAL/copy/LICENSE.orig LEGAL/copy/LICENSE.python-2.2
+
+PYTHON_PYCRYPTO_DEPENDENCIES = gmp
+
+# The configure step needs to be run outside of the setup.py since it isn't
+# run correctly for cross-compiling
+define PYTHON_PYCRYPTO_CONFIGURE_CMDS
+	(cd $(@D) && \
+	$(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_CONFIGURE_ARGS) \
+	./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--exec-prefix=/usr \
+		--sysconfdir=/etc \
+		--program-prefix="" \
+	)
+endef
+
+$(eval $(python-package))
-- 
1.8.1.2
