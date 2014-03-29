From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 18:26:19 +0100
Subject: [Buildroot] [git commit] python-libconfig: new package
Message-ID: <20140329172704.A300F9C425@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9523bdfddfab849bef143db493a052df863de44f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Python bindings to the C++ library libconfig
https://github.com/cnangel/python-libconfig

Signed-off-by: Johan Derycke <johan.derycke@barco.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                            |    1 +
 package/python-libconfig/Config.in           |   22 ++++++++++++++++++++++
 package/python-libconfig/python-libconfig.mk |   17 +++++++++++++++++
 3 files changed, 40 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index a9d1633..a4efa75 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -444,6 +444,7 @@ source "package/python-id3/Config.in"
 source "package/python-ipy/Config.in"
 source "package/python-json-schema-validator/Config.in"
 source "package/python-keyring/Config.in"
+source "package/python-libconfig/Config.in"
 source "package/python-mad/Config.in"
 source "package/python-meld3/Config.in"
 source "package/python-msgpack/Config.in"
diff --git a/package/python-libconfig/Config.in b/package/python-libconfig/Config.in
new file mode 100644
index 0000000..eae6cda
--- /dev/null
+++ b/package/python-libconfig/Config.in
@@ -0,0 +1,22 @@
+comment "python-libconfig needs a toolchain w/ C++, largefile, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_PYTHON_LIBCONFIG
+	bool "python-libconfig"
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_PYTHON
+	select BR2_PACKAGE_LIBCONFIG
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Python bindings to the C++ library libconfig
+
+	  Libconfig is a simple library for manipulating structured
+	  configuration files. The file format is more compact and more
+	  readable than XML. And unlike XML, it is type-aware, so it is
+	  not necessary to do string parsing in application code.
+	  http://www.hyperrealm.com/libconfig/
+
+	  https://github.com/cnangel/python-libconfig
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
