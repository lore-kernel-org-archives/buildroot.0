From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jan 2011 22:07:14 +0100
Subject: [Buildroot] [git commit master 1/1] python-serial: new package
Message-ID: <20110125211621.4E6CE8D254@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0eafafbe3dcff1362ee7f0617af6b75e22cd5014
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-serial is a Python library to access serial ports.

This package has originally been introduced to test that third-party
pure Python modules (that do not use C extensions) build properly
against the Buildroot Python infrastructure.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                      |    1 +
 package/python-serial/Config.in        |    8 ++++++++
 package/python-serial/python-serial.mk |   21 +++++++++++++++++++++
 3 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 package/python-serial/Config.in
 create mode 100644 package/python-serial/python-serial.mk

diff --git a/package/Config.in b/package/Config.in
index 4f1621b..8154907 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -294,6 +294,7 @@ source "package/libraw1394/Config.in"
 source "package/tslib/Config.in"
 source "package/libusb/Config.in"
 source "package/libusb-compat/Config.in"
+source "package/python-serial/Config.in"
 endmenu
 
 if BROKEN
diff --git a/package/python-serial/Config.in b/package/python-serial/Config.in
new file mode 100644
index 0000000..ea090bd
--- /dev/null
+++ b/package/python-serial/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_SERIAL
+	bool "python-serial"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  python-serial is a Python library to access serial ports.
+
+	  http://pyserial.sf.net
+
diff --git a/package/python-serial/python-serial.mk b/package/python-serial/python-serial.mk
new file mode 100644
index 0000000..048930b
--- /dev/null
+++ b/package/python-serial/python-serial.mk
@@ -0,0 +1,21 @@
+#############################################################
+#
+# python-serial
+#
+#############################################################
+
+PYTHON_SERIAL_VERSION = 2.5
+PYTHON_SERIAL_SOURCE  = pyserial-$(PYTHON_SERIAL_VERSION).tar.gz
+PYTHON_SERIAL_SITE    = http://pypi.python.org/packages/source/p/pyserial/
+
+PYTHON_SERIAL_DEPENDENCIES = python
+
+define PYTHON_SERIAL_BUILD_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
+endef
+
+define PYTHON_SERIAL_INSTALL_TARGET_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+endef
+
+$(eval $(call GENTARGETS,package,python-serial))
-- 
1.7.3.4
