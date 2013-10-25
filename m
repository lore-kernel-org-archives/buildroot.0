From: Wojciech M. Zabolotny <wzab01@gmail.com>
Date: Fri, 25 Oct 2013 14:54:06 +0200
Subject: [Buildroot] [PATCH 1/1] Added pyusb as a package
Message-ID: <1382705646-20583-1-git-send-email-wzab01@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Wojciech M. Zabolotny <wzab01@gmail.com>
---
 package/Config.in       |  1 +
 package/pyusb/Config.in | 10 ++++++++++
 package/pyusb/pyusb.mk  | 22 ++++++++++++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 package/pyusb/Config.in
 create mode 100644 package/pyusb/pyusb.mk

diff --git a/package/Config.in b/package/Config.in
index 0e6f86c..591cc04 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -404,6 +404,7 @@ source "package/python-pyzmq/Config.in"
 source "package/python-serial/Config.in"
 source "package/python-setuptools/Config.in"
 source "package/python-thrift/Config.in"
+source "package/pyusb/Config.in"
 endmenu
 endif
 source "package/python3/Config.in"
diff --git a/package/pyusb/Config.in b/package/pyusb/Config.in
new file mode 100644
index 0000000..b0c714a
--- /dev/null
+++ b/package/pyusb/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYUSB
+	bool "pyusb"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_LIBUSB
+	help
+          The PyUSB module provides for Python easy access to the host
+          machine's Universal Serial Bus (USB) system.
+
+	  http://sourceforge.net/apps/trac/pyusb/
+
diff --git a/package/pyusb/pyusb.mk b/package/pyusb/pyusb.mk
new file mode 100644
index 0000000..fde10c9
--- /dev/null
+++ b/package/pyusb/pyusb.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# pyusb
+#
+################################################################################
+
+PYUSB_VERSION = 0546cad8980783c39f96db717005a550059b730f
+PYUSB_SITE = git://github.com/walac/pyusb/
+PYUSB_LICENSE_FILES = LICENSE
+
+PYUSB_DEPENDENCIES = python libusb
+
+define PYUSB_INSTALL_TARGET_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install \
+		--prefix=$(TARGET_DIR)/usr)
+endef
+
+define PYUSB_UNINSTALL_TARGET_CMDS
+	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/pyusb*
+endef
+
+$(eval $(generic-package))
-- 
1.8.4.rc3
