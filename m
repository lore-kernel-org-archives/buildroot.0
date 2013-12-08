From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  8 Dec 2013 23:14:55 +0100
Subject: [Buildroot] [PATCH 26/38] python-pyusb: new package
In-Reply-To: <1386540907-7242-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386540907-7242-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1386540907-7242-27-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Wojciech M. Zabolotny" <wzab01@gmail.com>

[Thomas: converted to the Python package infrastructure, added missing
libusb dependency in the .mk file, added missing newline in the
Config.in file]

Signed-off-by: Wojciech M. Zabolotny <wzab01@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |  1 +
 package/python-pyusb/Config.in       | 14 ++++++++++++++
 package/python-pyusb/python-pyusb.mk | 14 ++++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 package/python-pyusb/Config.in
 create mode 100644 package/python-pyusb/python-pyusb.mk

diff --git a/package/Config.in b/package/Config.in
index aa928ec..d7dcbd0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -398,6 +398,7 @@ source "package/python-protobuf/Config.in"
 source "package/python-pygame/Config.in"
 source "package/python-pyparsing/Config.in"
 source "package/python-pyro/Config.in"
+source "package/python-pyusb/Config.in"
 source "package/python-pyzmq/Config.in"
 source "package/python-serial/Config.in"
 source "package/python-setuptools/Config.in"
diff --git a/package/python-pyusb/Config.in b/package/python-pyusb/Config.in
new file mode 100644
index 0000000..8e17714
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
+
+comment "python-pyusb needs a toolchain w/ threads"
+	depends on BR2_PACKAGE_PYTHON
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/python-pyusb/python-pyusb.mk b/package/python-pyusb/python-pyusb.mk
new file mode 100644
index 0000000..3fcc864
--- /dev/null
+++ b/package/python-pyusb/python-pyusb.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pyusb
+#
+################################################################################
+
+PYTHON_PYUSB_VERSION = 0546cad8980783c39f96db717005a550059b730f
+PYTHON_PYUSB_SITE    = $(call github,walac,pyusb,$(PYTHON_PYUSB_VERSION))
+PYTHON_PYUSB_LICENSE = BSD-3c
+PYTHON_PYUSB_LICENSE_FILES = LICENSE
+PYTHON_PYUSB_SETUP_TYPE = distutils
+PYTHON_PYUSB_DEPENDENCIES = libusb
+
+$(eval $(python-package))
-- 
1.8.1.2
