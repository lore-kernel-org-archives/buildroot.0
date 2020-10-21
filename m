From: Tomi Valkeinen <tomi.valkeinen@iki.fi>
Date: Wed, 21 Oct 2020 11:20:12 +0300
Subject: [Buildroot] [PATCH v2 1/1] package/kmsxx: bump to latest
Message-ID: <20201021082012.1592809-1-tomi.valkeinen@iki.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

kms++ is moving to meson build system and there has been plenty of
changes since the last version bump, so lets update the buildroot
package.

We can drop the "0001-fix-compiler-errors-with-gcc-10.patch" as that is
no longer needed.

The manual install stuff in kmsxx.mk goes away, as the meson build files
handle them.

kms++ has two git submodules, fmt and pybind11, so we need to change the
site method to git:// to enable submodules.

The python bindings can now also be enabled with a config option.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@iki.fi>
---

Another try:
* With config options for building the utilities and the python bindings
* Fixed the site method

 ...0001-fix-compiler-errors-with-gcc-10.patch | 35 -----------
 package/kmsxx/Config.in                       | 32 +++++++---
 package/kmsxx/kmsxx.hash                      |  4 +-
 package/kmsxx/kmsxx.mk                        | 61 +++++--------------
 4 files changed, 39 insertions(+), 93 deletions(-)
 delete mode 100644 package/kmsxx/0001-fix-compiler-errors-with-gcc-10.patch

diff --git a/package/kmsxx/0001-fix-compiler-errors-with-gcc-10.patch b/package/kmsxx/0001-fix-compiler-errors-with-gcc-10.patch
deleted file mode 100644
index 6ec080af97..0000000000
--- a/package/kmsxx/0001-fix-compiler-errors-with-gcc-10.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From aa54634ce7cbbfc844de945e73a9f34cdcb9bb12 Mon Sep 17 00:00:00 2001
-From: Peter Trompeter <christoph@zen.fritz.box>
-Date: Fri, 15 May 2020 15:20:47 +0200
-Subject: [PATCH] fix compiler errors with gcc 10
-
-[Retrieved from:
-https://github.com/tomba/kmsxx/commit/aa54634ce7cbbfc844de945e73a9f34cdcb9bb12]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- kms++/inc/kms++/pixelformats.h | 1 +
- kms++util/src/opts.cpp         | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/kms++/inc/kms++/pixelformats.h b/kms++/inc/kms++/pixelformats.h
-index 784717d..4e73d5d 100644
---- a/kms++/inc/kms++/pixelformats.h
-+++ b/kms++/inc/kms++/pixelformats.h
-@@ -2,6 +2,7 @@
- 
- #include <cstdint>
- #include <string>
-+#include <stdexcept>
- 
- namespace kms
- {
-diff --git a/kms++util/src/opts.cpp b/kms++util/src/opts.cpp
-index afef452..5a14b84 100644
---- a/kms++util/src/opts.cpp
-+++ b/kms++util/src/opts.cpp
-@@ -1,4 +1,5 @@
- #include <algorithm>
-+#include <stdexcept>
- 
- #include <unistd.h>
- #include <getopt.h>
diff --git a/package/kmsxx/Config.in b/package/kmsxx/Config.in
index 1d174c18b1..0b3013a171 100644
--- a/package/kmsxx/Config.in
+++ b/package/kmsxx/Config.in
@@ -1,12 +1,13 @@
 config BR2_PACKAGE_KMSXX
 	bool "kms++"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
 	select BR2_PACKAGE_LIBDRM
 	help
-	  libkms++ is a C++11 library for kernel mode setting.
+	  libkms++ is a C++17 library for kernel mode setting with Python
+	  bindings.
 
 	  Also included are simple test tools for KMS.
 
@@ -14,13 +15,26 @@ config BR2_PACKAGE_KMSXX
 
 if BR2_PACKAGE_KMSXX
 
-config BR2_PACKAGE_KMSXX_INSTALL_TESTS
-	bool "Install test programs"
+config BR2_PACKAGE_KMSXX_UTILS
+	bool "Install kms++utils library and utilities"
+	default y
 	help
-	  This option allows to install the kmsxx test programs.
+	  This option installs the kms++ utilities.
+
+config BR2_PACKAGE_KMSXX_PYTHON
+	bool "Install kms++ python bindings"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6
+	depends on !BR2_PACKAGE_PYTHON # python3
+	depends on BR2_USE_WCHAR # python3
+	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
+	depends on BR2_USE_MMU # python3
+	depends on !BR2_STATIC_LIBS # python3
+	select BR2_PACKAGE_PYTHON3
+	help
+	  This option installs the kms++ python bindings.
 
 endif
 
-comment "kms++ needs a toolchain w/ threads, C++, gcc >= 4.8, headers >= 3.8"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
+comment "kms++ needs a toolchain w/ threads, C++, gcc >= 5, headers >= 4.10"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
diff --git a/package/kmsxx/kmsxx.hash b/package/kmsxx/kmsxx.hash
index b8d06ac478..4fd0bc8347 100644
--- a/package/kmsxx/kmsxx.hash
+++ b/package/kmsxx/kmsxx.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  28892e50c1d1c83fddff9ec683e3bdbd465f5032d0014ceeab43563b813807e1  kmsxx-cb0786049f960f2bd383617151b01318e02e9ff9.tar.gz
-sha256  022b4d51da34a380d74dc24eea8e2c4e1a4c8776a52171f8d9e941cf56daf888  LICENSE
+sha256  f3e036384ab559670e97ae79d1a504c752b9b3cea71a1d3528230ef9f5f36fee  kmsxx-084ff3c55cce8bcba7099565b334fa4c88fd9df7.tar.gz
+sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
index 829beb1d68..d1feb7f370 100644
--- a/package/kmsxx/kmsxx.mk
+++ b/package/kmsxx/kmsxx.mk
@@ -4,62 +4,29 @@
 #
 ################################################################################
 
-KMSXX_VERSION = cb0786049f960f2bd383617151b01318e02e9ff9
-KMSXX_SITE = $(call github,tomba,kmsxx,$(KMSXX_VERSION))
+KMSXX_VERSION = 084ff3c55cce8bcba7099565b334fa4c88fd9df7
+KMSXX_SITE = git://github.com/tomba/kmsxx.git
+KMSXX_GIT_SUBMODULES=YES
 KMSXX_LICENSE = MPL-2.0
 KMSXX_LICENSE_FILES = LICENSE
 KMSXX_INSTALL_STAGING = YES
 KMSXX_DEPENDENCIES = libdrm host-pkgconf
-KMSXX_CONF_OPTS = -DKMSXX_ENABLE_PYTHON=OFF
-
-KMSXX_CXXFLAGS = $(TARGET_CXXFLAGS)
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 KMSXX_CXXFLAGS += -O0
 endif
 
-KMSXX_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(KMSXX_CXXFLAGS)"
-
-ifeq ($(BR2_PACKAGE_KMSXX_INSTALL_TESTS),y)
-KMSXX_TESTS = \
-	fbtest kmsblank kmscapture \
-	kmsprint kmstest kmsview wbcap \
-	wbm2m
-
-define KMSXX_INSTALL_TARGET_TESTS
-	$(foreach t,$(KMSXX_TESTS),\
-		$(INSTALL) -D -m 0755 $(@D)/bin/$(t) \
-			$(TARGET_DIR)/usr/bin/$(t)
-	)
-endef
+ifeq ($(BR2_PACKAGE_KMSXX_UTILS),y)
+KMSXX_CONF_OPTS += -Dutils=true
+else
+KMSXX_CONF_OPTS += -Dutils=false
 endif
 
-KMSXX_LIBS = kms++ kms++util
-
-define KMSXX_INSTALL_TARGET_CMDS
-	$(if $(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),
-		$(foreach l,$(KMSXX_LIBS),\
-			$(INSTALL) -D -m 0755 $(@D)/lib/lib$(l).so \
-				$(TARGET_DIR)/usr/lib/lib$(l).so
-		)
-	)
-	$(KMSXX_INSTALL_TARGET_TESTS)
-endef
-
-# kmsxx only builds shared or static libraries, so when
-# BR2_SHARED_STATIC_LIBS=y, we don't have any static library to
-# install
-define KMSXX_INSTALL_STAGING_CMDS
-	$(foreach l,$(KMSXX_LIBS),\
-		$(if $(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),
-			$(INSTALL) -D -m 0755 $(@D)/lib/lib$(l).so \
-				$(STAGING_DIR)/usr/lib/lib$(l).so)
-		$(if $(BR2_STATIC_LIBS),
-			$(INSTALL) -D -m 0755 $(@D)/lib/lib$(l).a \
-				$(STAGING_DIR)/usr/lib/lib$(l).a)
-		mkdir -p $(STAGING_DIR)/usr/include/$(l)
-		cp -dpfr $(@D)/$(l)/inc/$(l)/* $(STAGING_DIR)/usr/include/$(l)/
-	)
-endef
+ifeq ($(BR2_PACKAGE_KMSXX_PYTHON),y)
+KMSXX_CONF_OPTS += -Dpykms=enabled
+KMSXX_DEPENDENCIES += python3
+else
+KMSXX_CONF_OPTS += -Dpykms=disabled
+endif
 
-$(eval $(cmake-package))
+$(eval $(meson-package))
-- 
2.25.1
