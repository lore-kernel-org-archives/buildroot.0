From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 18 Sep 2013 16:58:35 +0200
Subject: [Buildroot] [git commit] python-crc16: new package
Message-ID: <20130918222318.CE22B9B737@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=63e492e4e66229b2f34704e904066209d8491cba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A python library that calculates CRC checksums of the CCITT/XModem
variant.

Signed-off-by: Michael Rommel <rommel@layer-7.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                    |    1 +
 package/python-crc16/Config.in       |   11 ++++++++++
 package/python-crc16/python-crc16.mk |   35 ++++++++++++++++++++++++++++++++++
 3 files changed, 47 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 56c316e..779e9da 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -385,6 +385,7 @@ source "package/python/Config.in"
 if BR2_PACKAGE_PYTHON
 menu "external python modules"
 source "package/python-bottle/Config.in"
+source "package/python-crc16/Config.in"
 source "package/python-dpkt/Config.in"
 source "package/python-id3/Config.in"
 source "package/python-mad/Config.in"
diff --git a/package/python-crc16/Config.in b/package/python-crc16/Config.in
new file mode 100644
index 0000000..3fd8da7
--- /dev/null
+++ b/package/python-crc16/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_CRC16
+	bool "python-crc16"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  This library calculates only CRC16 (16-bit codes) and the
+	  only supported variant at the moment is CRC-CCITT (XModem).
+	  CRC is a way of detecting accidental changes in data storage
+	  or transmission. There are many variants of CRC and CRC16,
+	  in particular.
+
+	  http://pycrc16.googlecode.com/
diff --git a/package/python-crc16/python-crc16.mk b/package/python-crc16/python-crc16.mk
new file mode 100644
index 0000000..adfdcc6
--- /dev/null
+++ b/package/python-crc16/python-crc16.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# python-crc16
+#
+################################################################################
+
+PYTHON_CRC16_VERSION = 0.1.1
+PYTHON_CRC16_SOURCE = crc16-$(PYTHON_CRC16_VERSION).tar.gz
+PYTHON_CRC16_SITE = http://pycrc16.googlecode.com/files/
+PYTHON_CRC16_LICENSE = LGPLv3+
+PYTHON_CRC16_LICENSE_FILES = COPYING.txt
+PYTHON_CRC16_DEPENDENCIES = python host-python
+
+PYTHON_CRC16_PARAMS = CC="$(TARGET_CC)" \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		LDSHARED="$(TARGET_CC) -shared" \
+		LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/usr/lib" \
+		CROSS_COMPILING=yes \
+		_python_sysroot=$(STAGING_DIR) \
+		_python_srcdir=$(PYTHON_DIR) \
+		_python_prefix=/usr \
+		_python_exec_prefix=/usr
+
+define PYTHON_CRC16_BUILD_CMDS
+	(cd $(@D); $(PYTHON_CRC16_PARAMS) \
+		$(HOST_DIR)/usr/bin/python setup.py build)
+endef
+
+define PYTHON_CRC16_INSTALL_TARGET_CMDS
+	(cd $(@D); $(PYTHON_CRC16_PARAMS) \
+		$(HOST_DIR)/usr/bin/python setup.py install \
+		--prefix=$(TARGET_DIR)/usr)
+endef
+
+$(eval $(generic-package))
