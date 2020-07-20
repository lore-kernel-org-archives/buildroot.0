From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 20 Jul 2020 12:23:47 -0700
Subject: [Buildroot] [PATCH 1/2] package/libabseil-cpp new package
Message-ID: <20200720192348.2126418-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

This package is a new dependency on grpc versions > 1.25.0

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 .../libabseil-cpp/0001-Add-fPIC-option.patch  | 36 +++++++++++++++++++
 package/libabseil-cpp/Config.in               | 15 ++++++++
 package/libabseil-cpp/libabseil-cpp.hash      |  3 ++
 package/libabseil-cpp/libabseil-cpp.mk        | 24 +++++++++++++
 6 files changed, 80 insertions(+)
 create mode 100644 package/libabseil-cpp/0001-Add-fPIC-option.patch
 create mode 100644 package/libabseil-cpp/Config.in
 create mode 100644 package/libabseil-cpp/libabseil-cpp.hash
 create mode 100644 package/libabseil-cpp/libabseil-cpp.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5bed3e7439..8462845636 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -43,6 +43,7 @@ F:	package/gstreamer1/gst1-vaapi/
 F:	package/imx-usb-loader/
 F:	package/janus-gateway/
 F:	package/json-for-modern-cpp/
+F:	package/libabseil-cpp/
 F:	package/libcpprestsdk/
 F:	package/libcutl/
 F:	package/libodb/
diff --git a/package/Config.in b/package/Config.in
index 22531d4fb5..b30cba47d0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1823,6 +1823,7 @@ menu "Other"
 	source "package/gtest/Config.in"
 	source "package/jemalloc/Config.in"
 	source "package/lapack/Config.in"
+	source "package/libabseil-cpp/Config.in"
 	source "package/libargtable2/Config.in"
 	source "package/libatomic_ops/Config.in"
 	source "package/libavl/Config.in"
diff --git a/package/libabseil-cpp/0001-Add-fPIC-option.patch b/package/libabseil-cpp/0001-Add-fPIC-option.patch
new file mode 100644
index 0000000000..2bcab5dcb9
--- /dev/null
+++ b/package/libabseil-cpp/0001-Add-fPIC-option.patch
@@ -0,0 +1,36 @@
+From d7160d647c8f8847f3ea8d7b0eb222936962c1af Mon Sep 17 00:00:00 2001
+From: Sinan Kaya <sinan.kaya@microsoft.com>
+Date: Tue, 11 Feb 2020 11:58:02 -0500
+Subject: [PATCH] Add fPIC option
+
+Without this option, programs building for arm64 or x86-64 will fail when
+attempting to link to the built libraries with the following (abbreviated)
+error:
+
+"relocation against `.rodata' can not be used when making a shared object;
+recompile with -fPIC
+
+Force fPIC to resolve this issue.
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+Signed-off-by: Sinan Kaya <sinan.kaya@microsoft.com>
+---
+ CMakeLists.txt | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 74a3a4c..4f837b3 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -79,6 +79,8 @@ option(ABSL_USE_GOOGLETEST_HEAD
+ 
+ option(ABSL_RUN_TESTS "If ON, Abseil tests will be run." OFF)
+ 
++add_compile_options(-fPIC)
++
+ if(${ABSL_RUN_TESTS})
+   # enable CTest.  This will set BUILD_TESTING to ON unless otherwise specified
+   # on the command line
+-- 
+2.20.1.windows.1
+
diff --git a/package/libabseil-cpp/Config.in b/package/libabseil-cpp/Config.in
new file mode 100644
index 0000000000..72265b6596
--- /dev/null
+++ b/package/libabseil-cpp/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LIBABSEIL_CPP
+	bool "libabseil-cpp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Abseil is an open-source collection of C++ library code
+	  designed to augment the C++ standard library. The Abseil
+	  library code is collected from Google's own C++ code base, has
+	  been extensively tested and used in production, and is the
+	  same code we depend on in our daily coding lives.
+
+	  https://github.com/abseil/abseil-cpp
+
+comment "grpc needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libabseil-cpp/libabseil-cpp.hash b/package/libabseil-cpp/libabseil-cpp.hash
new file mode 100644
index 0000000000..7f0b5fc394
--- /dev/null
+++ b/package/libabseil-cpp/libabseil-cpp.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  728a813291bdec2aa46eab8356ace9f75ac2ed9dfe2df5ab603c4e6c09f1c353  libabseil-cpp-20200225.tar.gz
+sha256  c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  LICENSE
diff --git a/package/libabseil-cpp/libabseil-cpp.mk b/package/libabseil-cpp/libabseil-cpp.mk
new file mode 100644
index 0000000000..92cbb0051d
--- /dev/null
+++ b/package/libabseil-cpp/libabseil-cpp.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# libabseil-cpp
+#
+################################################################################
+
+LIBABSEIL_CPP_VERSION = 20200225
+LIBABSEIL_CPP_SITE = $(call github,abseil,abseil-cpp,$(LIBABSEIL_CPP_VERSION))
+LIBABSEIL_CPP_LICENSE = Apache-2.0
+LIBABSEIL_CPP_LICENSE_FILES = LICENSE
+LIBABSEIL_CPP_INSTALL_STAGING = YES
+
+LIBABSEIL_CPP_CONF_OPTS = \
+	-DABSL_ENABLE_INSTALL=ON \
+	-DABSL_USE_GOOGLETEST_HEAD=OFF \
+	-DABSL_RUN_TESTS=OFF
+
+HOST_LIBABSEIL_CPP_CONF_OPTS = \
+	-DABSL_ENABLE_INSTALL=ON \
+	-DABSL_USE_GOOGLETEST_HEAD=OFF \
+	-DABSL_RUN_TESTS=OFF
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.26.2
