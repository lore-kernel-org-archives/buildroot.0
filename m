From: Matt Weber <mlweber1@rockwellcollins.com>
Date: Wed, 4 Sep 2013 14:25:21 -0500
Subject: [Buildroot] [PATCH 1/1] Eigen: new package
Message-ID: <1378322721-27028-1-git-send-email-mlweber1@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Target packages -> Libraries -> Other -> Eigen

Eigen - a C++ template library for linear algebra

Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
---
 package/Config.in       |    1 +
 package/eigen/Config.in |   16 ++++++++++++++++
 package/eigen/eigen.mk  |   24 ++++++++++++++++++++++++
 3 files changed, 41 insertions(+), 0 deletions(-)
 create mode 100644 package/eigen/Config.in
 create mode 100644 package/eigen/eigen.mk

diff --git a/package/Config.in b/package/Config.in
index a94cb62..6fe9e14 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -617,6 +617,7 @@ source "package/libcofi/Config.in"
 source "package/classpath/Config.in"
 source "package/cppcms/Config.in"
 source "package/elfutils/Config.in"
+source "package/eigen/Config.in"
 source "package/fftw/Config.in"
 source "package/libargtable2/Config.in"
 source "package/argp-standalone/Config.in"
diff --git a/package/eigen/Config.in b/package/eigen/Config.in
new file mode 100644
index 0000000..ee68bc8
--- /dev/null
+++ b/package/eigen/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_EIGEN
+	bool "eigen"
+	help
+	  Eigen is a C++ template library for linear algebra: vectors, 
+	  matrices, and related algorithms. It is versatile, fast, elegant 
+	  and works on many platforms (OS/Compilers).
+
+	  Eigen doesn't have any dependencies other than the C++ standard library. 
+	  The CMake build system is used to build the documentation, unit-tests, 
+	  and to automate installation. If you just want to use Eigen, you can 
+	  use the header files right away. There is no binary library to link 
+	  to and no configured header file. Eigen is a pure template library 
+	  defined in the headers. 
+
+	  http://eigen.tuxfamily.org/
+
diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
new file mode 100644
index 0000000..2580f0b
--- /dev/null
+++ b/package/eigen/eigen.mk
@@ -0,0 +1,24 @@
+#############################################################
+#
+# Eigen - a C++ template library for linear algebra
+#
+#############################################################
+EIGEN_VERSION = 3.2.0
+EIGEN_VERSION_HASH = ffa86ffb5570
+EIGEN_SITE    = http://bitbucket.org/eigen/eigen/get/$(EIGEN_VERSION).tar.bz2
+EIGEN_SOURCE  = eigen-eigen-$(EIGEN_VERSION_HASH).tar.bz2
+EIGEN_LICENSE = MPL2
+EIGEN_LICENSE_FILES = COPYING*
+EIGEN_INSTALL_STAGING = YES
+
+# This package only consists of headers that need to be
+# copied over to the sysroot for compile time use
+define EIGEN_INSTALL_STAGING_CMDS
+	cp -af $(@D)/Eigen $(STAGING_DIR)/usr/include/
+endef
+
+define EIGEN_UNINSTALL_STAGING_CMDS
+	rm -rf $(STAGING_DIR)/usr/include/Eigen
+endef
+
+$(eval $(generic-package))
-- 
1.7.1
