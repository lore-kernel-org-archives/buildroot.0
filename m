From: Johan Derycke <johanderycke@gmail.com>
Date: Mon, 10 Mar 2014 09:38:49 +0100
Subject: [Buildroot] [PATCH v4 2/2] python-libconfig: new package
In-Reply-To: <1394440729-27664-1-git-send-email-johan.derycke@barco.com>
References: <1394440729-27664-1-git-send-email-johan.derycke@barco.com>
Message-ID: <1394440729-27664-2-git-send-email-johan.derycke@barco.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Python bindings to the C++ library libconfig 
https://github.com/cnangel/python-libconfig

Signed-off-by: Johan Derycke <johan.derycke@barco.com>
---
Changes v3 -> v4:
  -Avoid line-wrap using "git send-email" with gmail
  -Also builds with python3
  -Select BR2_PACKAGE_BOOST
Changes v2 -> v3:
  -Avoid line-wrap using "git send-email"
Changes v1 -> v2:
  -Fixed indentations and blank lines
  -Added package/Config.in

 package/Config.in                            |    1 +
 package/python-libconfig/Config.in           |   20 ++++++++++++++++++++
 package/python-libconfig/python-libconfig.mk |   17 +++++++++++++++++
 3 files changed, 38 insertions(+)
 create mode 100644 package/python-libconfig/Config.in
 create mode 100644 package/python-libconfig/python-libconfig.mk

diff --git a/package/Config.in b/package/Config.in
index 417c9b8..fb29097 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -442,6 +442,7 @@ source "package/python-id3/Config.in"
 source "package/python-ipy/Config.in"
 source "package/python-json-schema-validator/Config.in"
 source "package/python-keyring/Config.in"
+source "package/python-libconfig/Config.in"
 source "package/python-mad/Config.in"
 source "package/python-meld3/Config.in"
 source "package/python-msgpack/Config.in"
diff --git a/package/python-libconfig/Config.in b/package/python-libconfig/Config.in
new file mode 100644
index 0000000..35e9804
--- /dev/null
+++ b/package/python-libconfig/Config.in
@@ -0,0 +1,20 @@
+comment "python-libconfig needs a toolchain w/ C++, largefile, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+
+
+config BR2_PACKAGE_PYTHON_LIBCONFIG
+	bool "python-libconfig"
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_PYTHON
+	select BR2_PACKAGE_LIBCONFIG
+	help
+	  Python bindings to the C++ library libconfig
+
+	  https://github.com/cnangel/python-libconfig
+
+	  Libconfig is a simple library for manipulating structured
+	  configuration files. The file format is more compact and more
+	  readable than XML. And unlike XML, it is type-aware, so it is
+	  not necessary to do string parsing in application code.
+	  http://www.hyperrealm.com/libconfig/
diff --git a/package/python-libconfig/python-libconfig.mk b/package/python-libconfig/python-libconfig.mk
new file mode 100644
index 0000000..3f5984b
--- /dev/null
+++ b/package/python-libconfig/python-libconfig.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-libconfig
+#
+################################################################################
+
+PYTHON_LIBCONFIG_VERSION = b271c3d9dac938ad5cd29b67bd08cc5536a5a391
+PYTHON_LIBCONFIG_SITE = $(call github,cnangel,python-libconfig,$(PYTHON_LIBCONFIG_VERSION))
+
+PYTHON_LIBCONFIG_LICENSE = BSD
+PYTHON_LIBCONFIG_LICENSE_FILES = README
+
+PYTHON_LIBCONFIG_SETUP_TYPE = setuptools
+
+PYTHON_LIBCONFIG_DEPENDENCIES = libconfig boost
+
+$(eval $(python-package))
-- 
1.7.10.4
