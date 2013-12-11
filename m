From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Dec 2013 21:27:03 +0100
Subject: [Buildroot] [PATCHv2 28/36] python-keyring: new package
In-Reply-To: <1386793631-14026-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386793631-14026-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1386793631-14026-29-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ludovic Desroches <ludovic.desroches@atmel.com>

[Thomas: convert to the Python package infrastructure, improved the
.zip handling, added license informations.]

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                        |  1 +
 package/python-keyring/Config.in         |  8 ++++++++
 package/python-keyring/python-keyring.mk | 19 +++++++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 package/python-keyring/Config.in
 create mode 100644 package/python-keyring/python-keyring.mk

diff --git a/package/Config.in b/package/Config.in
index 99bc898..5d7f9a2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -392,6 +392,7 @@ source "package/python-dialog/Config.in"
 source "package/python-dpkt/Config.in"
 source "package/python-id3/Config.in"
 source "package/python-ipy/Config.in"
+source "package/python-keyring/Config.in"
 source "package/python-mad/Config.in"
 source "package/python-meld3/Config.in"
 source "package/python-msgpack/Config.in"
diff --git a/package/python-keyring/Config.in b/package/python-keyring/Config.in
new file mode 100644
index 0000000..a6eacf5
--- /dev/null
+++ b/package/python-keyring/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_KEYRING
+	bool "python-keyring"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  The Python keyring lib provides a easy way to access the
+	  system keyring service from Python.
+
+	  https://pypi.python.org/pypi/keyring
diff --git a/package/python-keyring/python-keyring.mk b/package/python-keyring/python-keyring.mk
new file mode 100644
index 0000000..3f27f20
--- /dev/null
+++ b/package/python-keyring/python-keyring.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# python-keyring
+#
+################################################################################
+
+PYTHON_KEYRING_VERSION = 3.0.5
+PYTHON_KEYRING_SOURCE = keyring-$(PYTHON_KEYRING_VERSION).zip
+PYTHON_KEYRING_SITE = http://pypi.python.org/packages/source/k/keyring/
+PYTHON_KEYRING_SETUP_TYPE = setuptools
+PYTHON_KEYRING_LICENSE = python software foundation license
+
+define PYTHON_KEYRING_EXTRACT_CMDS
+	unzip -d $(@D) $(DL_DIR)/$(PYTHON_KEYRING_SOURCE)
+	mv $(@D)/keyring-$(PYTHON_KEYRING_VERSION)/* $(@D)
+	$(RM) -r $(@D)/keyring-$(PYTHON_KEYRING_VERSION)
+endef
+
+$(eval $(python-package))
-- 
1.8.1.2
