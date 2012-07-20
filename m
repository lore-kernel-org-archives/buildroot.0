From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jul 2012 21:08:25 +0200
Subject: [Buildroot] [git commit branch/next] python-nfc: new package
Message-ID: <20120802195257.34A4A8D2C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=45166f30dc40ce810831657c27724a3b5a57f2ad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[thomas.petazzoni at free-electrons.com:
   add patch that creates a standard setup.py file. This allows the
   .pyc files to be generated at build time, and installed into the
   target. This is important because by default, Buildroot removes all
   .py files from the target, to keep only the .pyc files. The
   python-nfc.mk file was changed to use this setup.py standard build
   process.]

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                |    1 +
 package/python-nfc/Config.in                     |    9 +++++++
 package/python-nfc/python-nfc-add-setup-py.patch |   26 ++++++++++++++++++++++
 package/python-nfc/python-nfc.mk                 |   23 +++++++++++++++++++
 4 files changed, 59 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index d0daa18..46747d9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -269,6 +269,7 @@ source "package/python-dpkt/Config.in"
 source "package/python-id3/Config.in"
 source "package/python-mad/Config.in"
 source "package/python-netifaces/Config.in"
+source "package/python-nfc/Config.in"
 source "package/python-pygame/Config.in"
 source "package/python-serial/Config.in"
 source "package/python-setuptools/Config.in"
diff --git a/package/python-nfc/Config.in b/package/python-nfc/Config.in
new file mode 100644
index 0000000..c928ba1
--- /dev/null
+++ b/package/python-nfc/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_NFC
+	bool "python-nfc"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_LIBUSB_COMPAT
+	help
+	  Python module for near field communication.
+
+	  https://launchpad.net/nfcpy
diff --git a/package/python-nfc/python-nfc-add-setup-py.patch b/package/python-nfc/python-nfc-add-setup-py.patch
new file mode 100644
index 0000000..307b749
--- /dev/null
+++ b/package/python-nfc/python-nfc-add-setup-py.patch
@@ -0,0 +1,26 @@
+Add simple setup.py
+
+Having a setup.py allows to easily get the .py files compiled into
+.pyc, which is good because by default, Buildroot only keeps .pyc
+files on the target.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/setup.py
+===================================================================
+--- /dev/null
++++ b/setup.py
+@@ -0,0 +1,13 @@
++#!/usr/bin/env python
++
++from distutils.core import setup
++
++setup(name='NFC',
++      version='1.0',
++      description='Python NFC',
++      author='Stephen Tiedemann',
++      author_email='stephen.tiedemann at googlemail.com',
++      url='https://launchpad.net/nfcpy',
++      packages=['nfc', 'nfc/dev', 'nfc/llcp', 'nfc/ndef',
++                'nfc/npp', 'nfc/snep'],
++      )
diff --git a/package/python-nfc/python-nfc.mk b/package/python-nfc/python-nfc.mk
new file mode 100644
index 0000000..90f7c46
--- /dev/null
+++ b/package/python-nfc/python-nfc.mk
@@ -0,0 +1,23 @@
+#############################################################
+#
+# python-nfc
+#
+#############################################################
+PYTHON_NFC_VERSION = 112
+PYTHON_NFC_SITE = https://launchpad.net/nfcpy
+PYTHON_NFC_SITE_METHOD = bzr
+PYTHON_NFC_DEPENDENCIES = python libusb libusb-compat
+
+define PYTHON_NFC_BUILD_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
+endef
+
+define PYTHON_NFC_INSTALL_TARGET_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+endef
+
+define PYTHON_NFC_UNINSTALL_TARGET_CMDS
+	$(RM) -r $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/nfc/
+endef
+
+$(eval $(generic-package))
