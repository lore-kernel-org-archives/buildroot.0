From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 13:41:30 +0100
Subject: [Buildroot] [git commit] python-msgpack: new package
Message-ID: <20131215130826.855FE9C025@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c8e76a2d49d278d53e9d21e4df02ca079b3357a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: convert to the Python package infrastructure, added missing
dependency on C++, inherited from msgpack.]

Signed-off-by: Wojciech M. Zabolotny <wzab01@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                        |    1 +
 package/python-msgpack/Config.in         |   16 ++++++++++++++++
 package/python-msgpack/python-msgpack.mk |   15 +++++++++++++++
 3 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 85bf106..a884de1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -393,6 +393,7 @@ source "package/python-id3/Config.in"
 source "package/python-ipy/Config.in"
 source "package/python-mad/Config.in"
 source "package/python-meld3/Config.in"
+source "package/python-msgpack/Config.in"
 source "package/python-netifaces/Config.in"
 source "package/python-nfc/Config.in"
 source "package/python-protobuf/Config.in"
diff --git a/package/python-msgpack/Config.in b/package/python-msgpack/Config.in
new file mode 100644
index 0000000..2075ee6
--- /dev/null
+++ b/package/python-msgpack/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_PYTHON_MSGPACK
+	bool "python-msgpack"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_MSGPACK
+	depends on BR2_INSTALL_LIBSTDCPP # msgpack
+	help
+	  MessagePack (http://msgpack.org/) is a fast, compact binary
+	  serialization format, suitable for similar data to JSON.
+	  This package provides CPython bindings for reading and
+	  writing MessagePack data.
+
+	  https://pypi.python.org/pypi/msgpack-python/
+
+comment "python-msgpack needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_PYTHON
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-msgpack/python-msgpack.mk b/package/python-msgpack/python-msgpack.mk
new file mode 100644
index 0000000..2a7c384
--- /dev/null
+++ b/package/python-msgpack/python-msgpack.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-msgpack
+#
+################################################################################
+
+PYTHON_MSGPACK_VERSION = 0.4.0
+PYTHON_MSGPACK_SOURCE = msgpack-python-$(PYTHON_MSGPACK_VERSION).tar.gz
+PYTHON_MSGPACK_SITE = https://pypi.python.org/packages/source/m/msgpack-python/
+PYTHON_MSGPACK_LICENSE = Apache License, Version 2.0
+PYTHON_MSGPACK_LICENSE_FILES = COPYING
+PYTHON_MSGPACK_SETUP_TYPE = setuptools
+PYTHON_MSGPACK_DEPENDENCIES = msgpack
+
+$(eval $(python-package))
