From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 14:01:00 +0100
Subject: [Buildroot] [git commit] python-pycrypto: new package
Message-ID: <20131215130826.BEA539BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f096d82eb294ded1a8040d5d6d42bbc54591cd25
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                          |    1 +
 package/python-pycrypto/Config.in          |    9 +++++++
 package/python-pycrypto/python-pycrypto.mk |   35 ++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 2276b41..50307f2 100644
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
