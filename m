From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Jul 2020 22:37:35 +0200
Subject: [Buildroot] [git commit] package/libabseil-cpp new package
Message-ID: <20200725203718.4C519814BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=93568440eda120b12bcbfe267af8f0182484c3b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package is a new dependency on grpc versions > 1.25.0

Tested with the following distributions:
  - Debian 9
  - CentOS 7
  - Fedora 32

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../0001-force-position-independent-code.patch     | 38 +++++++++++++
 ...ugging-use-execinfo.h-only-when-available.patch | 63 ++++++++++++++++++++++
 package/libabseil-cpp/Config.in                    | 15 ++++++
 package/libabseil-cpp/libabseil-cpp.hash           |  3 ++
 package/libabseil-cpp/libabseil-cpp.mk             | 24 +++++++++
 7 files changed, 145 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ad927c6bbe..bdbfa4728a 100644
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
index 3b0b57bc5b..178b4da98a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1825,6 +1825,7 @@ menu "Other"
 	source "package/gtest/Config.in"
 	source "package/jemalloc/Config.in"
 	source "package/lapack/Config.in"
+	source "package/libabseil-cpp/Config.in"
 	source "package/libargtable2/Config.in"
 	source "package/libatomic_ops/Config.in"
 	source "package/libavl/Config.in"
diff --git a/package/libabseil-cpp/0001-force-position-independent-code.patch b/package/libabseil-cpp/0001-force-position-independent-code.patch
new file mode 100644
index 0000000000..997d75597e
--- /dev/null
+++ b/package/libabseil-cpp/0001-force-position-independent-code.patch
@@ -0,0 +1,38 @@
+From d170b19e500d85381369e379771be8d7816bcc92 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Aduskett@gmail.com>
+Date: Tue, 21 Jul 2020 13:08:50 -0700
+Subject: [PATCH] force position independent code
+
+Without this option, programs building for arm64 or x86-64 will fail when
+attempting to link to the built libraries with the following (abbreviated)
+error:
+
+"relocation against `.rodata' can not be used when making a shared object;
+recompile with -fPIC."
+
+Because libabseil-cpp builds static libraries, it is better to set the
+POSITION_INDEPENDENT_CODE to ON instead of forcing fPIC, as forcing fPIC may
+cause relocation errors when shared libraries link against the built static
+libraries.
+
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+---
+ CMake/AbseilHelpers.cmake | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/CMake/AbseilHelpers.cmake b/CMake/AbseilHelpers.cmake
+index 86ff9eb..bdb7a89 100644
+--- a/CMake/AbseilHelpers.cmake
++++ b/CMake/AbseilHelpers.cmake
+@@ -207,6 +207,8 @@ function(absl_cc_library)
+     set_property(TARGET ${_NAME} PROPERTY CXX_STANDARD ${ABSL_CXX_STANDARD})
+     set_property(TARGET ${_NAME} PROPERTY CXX_STANDARD_REQUIRED ON)
+ 
++    # Without this setting, other programs such as GRPC will fail when linking.
++    set_property(TARGET ${_NAME} PROPERTY POSITION_INDEPENDENT_CODE ON)
+     # When being installed, we lose the absl_ prefix.  We want to put it back
+     # to have properly named lib files.  This is a no-op when we are not being
+     # installed.
+-- 
+2.26.2
+
diff --git a/package/libabseil-cpp/0002-absl-debugging-use-execinfo.h-only-when-available.patch b/package/libabseil-cpp/0002-absl-debugging-use-execinfo.h-only-when-available.patch
new file mode 100644
index 0000000000..dd40d4138f
--- /dev/null
+++ b/package/libabseil-cpp/0002-absl-debugging-use-execinfo.h-only-when-available.patch
@@ -0,0 +1,63 @@
+From 445907a8a98e5d14f9c0042aa6849bdad4b0af5b Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Thu, 23 Jul 2020 22:28:55 +0200
+Subject: [PATCH] absl/debugging: use <execinfo.h> only when available
+
+Instead of relying on __GLIBC__ or other unreliable detection
+mechanism, simply detect if <execinfo.h> is available before using the
+stacktrace_generic-inl.inc implementation.
+
+Upstream: https://github.com/abseil/abseil-cpp/pull/746
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ absl/debugging/CMakeLists.txt               | 7 +++++++
+ absl/debugging/internal/stacktrace_config.h | 6 +++---
+ 2 files changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/absl/debugging/CMakeLists.txt b/absl/debugging/CMakeLists.txt
+index 7733615..285c5a8 100644
+--- a/absl/debugging/CMakeLists.txt
++++ b/absl/debugging/CMakeLists.txt
+@@ -14,6 +14,13 @@
+ # limitations under the License.
+ #
+ 
++include(CheckIncludeFileCXX)
++
++check_include_file_cxx(execinfo.h HAVE_EXECINFO_H)
++if(HAVE_EXECINFO_H)
++    add_definitions(-DHAVE_EXECINFO_H)
++endif()
++
+ absl_cc_library(
+   NAME
+     stacktrace
+diff --git a/absl/debugging/internal/stacktrace_config.h b/absl/debugging/internal/stacktrace_config.h
+index d4e8480..2e17ca3 100644
+--- a/absl/debugging/internal/stacktrace_config.h
++++ b/absl/debugging/internal/stacktrace_config.h
+@@ -40,7 +40,7 @@
+ # elif defined(__aarch64__)
+ #define ABSL_STACKTRACE_INL_HEADER \
+     "absl/debugging/internal/stacktrace_aarch64-inl.inc"
+-# elif defined(__arm__)
++# elif defined(__arm__) && defined(HAVE_EXECINFO_H)
+ // Note: When using glibc this may require -funwind-tables to function properly.
+ #define ABSL_STACKTRACE_INL_HEADER \
+   "absl/debugging/internal/stacktrace_generic-inl.inc"
+@@ -49,10 +49,10 @@
+    "absl/debugging/internal/stacktrace_unimplemented-inl.inc"
+ # endif
+ #else  // defined(NO_FRAME_POINTER)
+-# if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__)
++# if (defined(__i386__) || defined(__x86_64__) || defined(__aarch64__)) && defined(HAVE_EXECINFO_H)
+ #define ABSL_STACKTRACE_INL_HEADER \
+     "absl/debugging/internal/stacktrace_generic-inl.inc"
+-# elif defined(__ppc__) || defined(__PPC__)
++# elif (defined(__ppc__) || defined(__PPC__)) && defined(HAVE_EXECINFO_H)
+ #define ABSL_STACKTRACE_INL_HEADER \
+     "absl/debugging/internal/stacktrace_generic-inl.inc"
+ # else
+-- 
+2.26.2
+
diff --git a/package/libabseil-cpp/Config.in b/package/libabseil-cpp/Config.in
new file mode 100644
index 0000000000..38cb66d49f
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
+	  library code is collected from Google's own C++ code base,
+	  has been extensively tested and used in production, and is
+	  the same code we depend on in our daily coding lives.
+
+	  https://github.com/abseil/abseil-cpp
+
+comment "libabseil-cpp needs a toolchain w/ C++, threads"
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
