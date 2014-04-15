From: Davide Viti <zinosat@tiscali.it>
Date: Tue, 15 Apr 2014 16:52:13 +0200
Subject: [Buildroot] [PATCH 1/1] flann: new package
Message-ID: <1397573533-7109-1-git-send-email-d.viti@infosolution.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Davide Viti <d.viti@infosolution.it>
---
 package/Config.in       |  1 +
 package/flann/Config.in | 22 ++++++++++++++++++++++
 package/flann/flann.mk  | 22 ++++++++++++++++++++++
 3 files changed, 45 insertions(+)
 create mode 100644 package/flann/Config.in
 create mode 100644 package/flann/flann.mk

diff --git a/package/Config.in b/package/Config.in
index 8e6e590..0e6526a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -771,6 +771,7 @@ source "package/classpath/Config.in"
 source "package/cppcms/Config.in"
 source "package/eigen/Config.in"
 source "package/elfutils/Config.in"
+source "package/flann/Config.in"
 source "package/fftw/Config.in"
 source "package/glibmm/Config.in"
 source "package/gmp/Config.in"
diff --git a/package/flann/Config.in b/package/flann/Config.in
new file mode 100644
index 0000000..43254a8
--- /dev/null
+++ b/package/flann/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_FLANN
+	bool "flann"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  FLANN is a library for performing fast approximate nearest
+	  neighbor searches in high dimensional spaces. It contains a
+	  collection of algorithms we found to work best for nearest
+	  neighbor search and a system for automatically choosing the
+	  best algorithm and optimum parameters depending on the
+	  dataset
+
+	  http://www.cs.ubc.ca/research/flann/
+
+if BR2_PACKAGE_FLANN
+
+config BR2_PACKAGE_FLANN_EXAMPLES
+	bool "flann examples"
+
+endif
+
+comment "flann needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/flann/flann.mk b/package/flann/flann.mk
new file mode 100644
index 0000000..50f128e
--- /dev/null
+++ b/package/flann/flann.mk
@@ -0,0 +1,22 @@
+###############################################################################
+#
+# flann
+#
+###############################################################################
+FLANN_VERSION = d0c04f4d290ebc3aa9411a3322992d298e51f5aa
+FLANN_SITE = $(call github,mariusmuja,flann,$(FLANN_VERSION))
+FLANN_INSTALL_STAGING = YES
+FLANN_LICENSE = BSD
+FLANN_LICENSE_FILES = COPYING
+FLANN_CONF_OPT = \
+	-DCMAKE_BUILD_TYPE=Release \
+	-DBUILD_C_BINDINGS=ON \
+	-DBUILD_PYTHON_BINDINGS=OFF \
+	-DBUILD_MATLAB_BINDINGS=OFF \
+	-DBUILD_EXAMPLES=$(if $(BR2_PACKAGE_FLANN_EXAMPLES),ON,OFF) \
+	-DBUILD_TESTS=OFF \
+	-DBUILD_DOC=OFF \
+	-DUSE_OPENMP=$(if $(BR2_GCC_ENABLE_OPENMP),ON,OFF) \
+	-DPYTHON_EXECUTABLE=OFF
+
+$(eval $(cmake-package))
-- 
1.9.1
