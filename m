From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 13:41:28 +0100
Subject: [Buildroot] [git commit] python-pyusb: new package
Message-ID: <20131215130826.7D5F99C025@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=973b3f75568be74cbe39c19527c6c4a889505e6b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: converted to the Python package infrastructure, added missing
libusb dependency in the .mk file, added missing newline in the
Config.in file, fix the package description]

Signed-off-by: Wojciech M. Zabolotny <wzab01@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                    |    1 +
 package/python-pyusb/Config.in       |   14 ++++++++++++++
 package/python-pyusb/python-pyusb.mk |   14 ++++++++++++++
 3 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index eb96aeb..85bf106 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -399,6 +399,7 @@ source "package/python-protobuf/Config.in"
 source "package/python-pygame/Config.in"
 source "package/python-pyparsing/Config.in"
 source "package/python-pyro/Config.in"
+source "package/python-pyusb/Config.in"
 source "package/python-pyzmq/Config.in"
 source "package/python-serial/Config.in"
 source "package/python-setuptools/Config.in"
diff --git a/package/python-pyusb/Config.in b/package/python-pyusb/Config.in
new file mode 100644
index 0000000..de5b487
--- /dev/null
+++ b/package/python-pyusb/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_PYTHON_PYUSB
+	bool "python-pyusb"
+	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_LIBUSB
+	help
+	  The PyUSB module provides easy access to the Universal
+	  Serial Bus (USB) from Python.
+
+	  http://sourceforge.net/apps/trac/pyusb/
+
+comment "python-pyusb needs a toolchain w/ threads"
+	depends on BR2_PACKAGE_PYTHON
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/python-pyusb/python-pyusb.mk b/package/python-pyusb/python-pyusb.mk
new file mode 100644
index 0000000..dee6561
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
+PYTHON_PYUSB_SITE = $(call github,walac,pyusb,$(PYTHON_PYUSB_VERSION))
+PYTHON_PYUSB_LICENSE = BSD-3c
+PYTHON_PYUSB_LICENSE_FILES = LICENSE
+PYTHON_PYUSB_SETUP_TYPE = distutils
+PYTHON_PYUSB_DEPENDENCIES = libusb
+
+$(eval $(python-package))
