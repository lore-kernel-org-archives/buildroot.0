From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri, 20 Jul 2012 09:58:12 +0100
Subject: [Buildroot] [PATCH] python-nfc: new package
Message-ID: <1342774693-28905-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/Config.in                |    1 +
 package/python-nfc/Config.in     |    9 +++++++++
 package/python-nfc/python-nfc.mk |   20 ++++++++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 package/python-nfc/Config.in
 create mode 100644 package/python-nfc/python-nfc.mk

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
diff --git a/package/python-nfc/python-nfc.mk b/package/python-nfc/python-nfc.mk
new file mode 100644
index 0000000..5a54eb0
--- /dev/null
+++ b/package/python-nfc/python-nfc.mk
@@ -0,0 +1,20 @@
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
+define PYTHON_NFC_INSTALL_TARGET_CMDS
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/nfc
+	cp -a $(@D)/nfc $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)
+endef
+
+define PYTHON_NFC_UNINSTALL_TARGET_CMDS
+	$(RM) -r $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/nfc
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
