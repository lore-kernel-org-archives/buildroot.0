From: Wojciech M. Zabolotny <wzab01@gmail.com>
Date: Sat, 26 Oct 2013 09:35:54 +0200
Subject: [Buildroot] [PATCH v2 1/1] python-pyusb: new package
References: <CAMduVEegwCNSu2cBGbTOjUhBUtD5kv1F14eViyj+y9M29wwngQ@mail.gmail.com>
 <1382742325-11435-1-git-send-email-wzab01@gmail.com>
 <OF7CA7B8E3.5FD89345-ON86257C0F.0052857B-86257C0F.0054D5D3@rockwellcollins.com>
 <1256826d-31b9-4b85-8834-35694e372fac@email.android.com>
 <1382742930-11510-1-git-send-email-wzab01@gmail.com>
 <526B018E.9080206@mind.be>
 <1382772329-27702-1-git-send-email-wzab01@gmail.com>
Message-ID: <1382772955-10311-1-git-send-email-wzab01@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Wojciech M. Zabolotny <wzab01@gmail.com>
---
 package/Config.in                    |  1 +
 package/python-pyusb/Config.in       | 14 ++++++++++++++
 package/python-pyusb/python-pyusb.mk | 37 ++++++++++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+)
 create mode 100644 package/python-pyusb/Config.in
 create mode 100644 package/python-pyusb/python-pyusb.mk

diff --git a/package/Config.in b/package/Config.in
index 0e6f86c..40dba0c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -400,6 +400,7 @@ source "package/python-protobuf/Config.in"
 source "package/python-pygame/Config.in"
 source "package/python-pyparsing/Config.in"
 source "package/python-pyro/Config.in"
+source "package/python-pyusb/Config.in"
 source "package/python-pyzmq/Config.in"
 source "package/python-serial/Config.in"
 source "package/python-setuptools/Config.in"
diff --git a/package/python-pyusb/Config.in b/package/python-pyusb/Config.in
new file mode 100644
index 0000000..3337b7e
--- /dev/null
+++ b/package/python-pyusb/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_PYTHON_PYUSB
+	bool "python-pyusb"
+	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_LIBUSB
+	help
+	  The PyUSB module provides for Python easy access to the host
+	  machine's Universal Serial Bus (USB) system.
+
+	  http://sourceforge.net/apps/trac/pyusb/
+comment "python-pyusb needs a toolchain w/ threads"
+	depends on BR2_PACKAGE_PYTHON
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
diff --git a/package/python-pyusb/python-pyusb.mk b/package/python-pyusb/python-pyusb.mk
new file mode 100644
index 0000000..e4d17be
--- /dev/null
+++ b/package/python-pyusb/python-pyusb.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# python-pyusb
+#
+################################################################################
+
+PYTHON_PYUSB_VERSION = 0546cad8980783c39f96db717005a550059b730f
+PYTHON_PYUSB_SITE = http://github.com/walac/pyusb/tarball/$(PYTHON_PYUSB_VERSION)
+PYTHON_PYUSB_LICENSE = BSD-3c
+PYTHON_PYUSB_LICENSE_FILES = LICENSE
+
+PYTHON_PYUSB_DEPENDENCIES = python
+
+# Copied from python-pyparsing, based on python-pygame
+define PYTHON_PYUSB_BUILD_CMDS
+	(cd $(@D);                                              \
+	 CC="$(TARGET_CC)"                                      \
+	 CFLAGS="$(TARGET_CFLAGS)"                              \
+	 LDSHARED="$(TARGET_CROSS)gcc -shared"                  \
+	 CROSS_COMPILING=yes                                    \
+	 _python_sysroot=$(STAGING_DIR)                         \
+	 _python_srcdir=$(BUILD_DIR)/python$(PYTHON_VERSION)    \
+	 _python_prefix=/usr                                    \
+	 _python_exec_prefix=/usr                               \
+	 $(HOST_DIR)/usr/bin/python setup.py build              \
+	)
+endef
+
+# Copied from python-pyparsing, based on python-pygame
+define PYTHON_PYUSB_INSTALL_TARGET_CMDS
+	(cd $(@D);                                              \
+	 $(HOST_DIR)/usr/bin/python setup.py install            \
+	                            --prefix=$(TARGET_DIR)/usr  \
+	)
+endef
+
+$(eval $(generic-package))
-- 
1.8.4.rc3
