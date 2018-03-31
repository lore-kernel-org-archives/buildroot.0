From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 31 Mar 2018 17:33:34 +0200
Subject: [Buildroot] [git commit] python-libusb1: new package
Message-ID: <20180331153347.64D5A83FF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=34b62af1e05a9510f707eceb63e9b8c285035dc1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License info from PyPI is wrong: it is LGPL-2.1+, not GPL-2.0. The
package includes a COPYING file with GPL-2.0, but since it is really
LGPL-2.1+ only the COPYING.LESSER file is relevant.

Signed-off-by: Jaap Crezee <jaap@jcz.nl>
[Arnout: regenerate with scanpypi, fix legal info]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in                          |  1 +
 package/python-libusb1/Config.in           | 11 +++++++++++
 package/python-libusb1/python-libusb1.hash |  4 ++++
 package/python-libusb1/python-libusb1.mk   | 15 +++++++++++++++
 4 files changed, 31 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 3bff349905..de10dd0613 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -817,6 +817,7 @@ menu "External python modules"
 	source "package/python-json-schema-validator/Config.in"
 	source "package/python-keyring/Config.in"
 	source "package/python-libconfig/Config.in"
+	source "package/python-libusb1/Config.in"
 	source "package/python-lmdb/Config.in"
 	source "package/python-logbook/Config.in"
 	source "package/python-lxml/Config.in"
diff --git a/package/python-libusb1/Config.in b/package/python-libusb1/Config.in
new file mode 100644
index 0000000000..1c4a72edae
--- /dev/null
+++ b/package/python-libusb1/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_LIBUSB1
+	bool "python-libusb1"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_LIBUSB
+	help
+	  Pure-python wrapper for libusb-1.0.
+
+	  http://github.com/vpelletier/python-libusb1
+
+comment "python-libusb1 needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/python-libusb1/python-libusb1.hash b/package/python-libusb1/python-libusb1.hash
new file mode 100644
index 0000000000..3649872eca
--- /dev/null
+++ b/package/python-libusb1/python-libusb1.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/libusb1/json, sha256 locally computed
+md5	9c2eb6032deda59f287a443091d38cb4  libusb1-1.6.4.tar.gz
+sha256	8c930d9c1d037d9c83924c82608aa6a1adcaa01ca0e4a23ee0e8e18d7eee670d  libusb1-1.6.4.tar.gz
+sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/python-libusb1/python-libusb1.mk b/package/python-libusb1/python-libusb1.mk
new file mode 100644
index 0000000000..3329764fef
--- /dev/null
+++ b/package/python-libusb1/python-libusb1.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-libusb1
+#
+################################################################################
+
+PYTHON_LIBUSB1_VERSION = 1.6.4
+PYTHON_LIBUSB1_SOURCE = libusb1-$(PYTHON_LIBUSB1_VERSION).tar.gz
+PYTHON_LIBUSB1_SITE = https://pypi.python.org/packages/ec/5d/4fdac6c53525786fe35cff035c3345452e24e2bee5627893be65d12555cb
+PYTHON_LIBUSB1_SETUP_TYPE = setuptools
+PYTHON_LIBUSB1_LICENSE = LGPL-2.1+
+PYTHON_LIBUSB1_LICENSE_FILES = COPYING.LESSER
+PYTHON_LIBUSB1_DEPENDENCIES = libusb
+
+$(eval $(python-package))
