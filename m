From: Tomi Valkeinen <tomi.valkeinen@iki.fi>
Date: Tue, 20 Oct 2020 10:08:58 +0300
Subject: [Buildroot] [PATCH 1/1] package/kmsxx: bump to latest
Message-ID: <20201020070858.443338-1-tomi.valkeinen@iki.fi>
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

Most of the stuff in kmsxx.mk goes away, as the meson build files handle
them.

The python bindings are also now enabled, and the build system detects
python automatically.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@iki.fi>
---
 ...0001-fix-compiler-errors-with-gcc-10.patch | 35 -------------
 package/kmsxx/Config.in                       | 11 ++--
 package/kmsxx/kmsxx.hash                      |  4 +-
 package/kmsxx/kmsxx.mk                        | 51 +------------------
 4 files changed, 10 insertions(+), 91 deletions(-)
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
index 1d174c18b1..bb00cdad70 100644
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
 
@@ -21,6 +22,6 @@ config BR2_PACKAGE_KMSXX_INSTALL_TESTS
 
 endif
 
-comment "kms++ needs a toolchain w/ threads, C++, gcc >= 4.8, headers >= 3.8"
+comment "kms++ needs a toolchain w/ threads, C++, gcc >= 5, headers >= 4.10"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
diff --git a/package/kmsxx/kmsxx.hash b/package/kmsxx/kmsxx.hash
index b8d06ac478..6478b4357f 100644
--- a/package/kmsxx/kmsxx.hash
+++ b/package/kmsxx/kmsxx.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  28892e50c1d1c83fddff9ec683e3bdbd465f5032d0014ceeab43563b813807e1  kmsxx-cb0786049f960f2bd383617151b01318e02e9ff9.tar.gz
-sha256  022b4d51da34a380d74dc24eea8e2c4e1a4c8776a52171f8d9e941cf56daf888  LICENSE
+sha256  e9a00a3d91b9d5e331209489f3cd735831141caa9227dd223390a5d2b02b5542  kmsxx-debef007b62bc5e8696e02f96111bd2a10072562.tar.gz
+sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
index 829beb1d68..f684d87c87 100644
--- a/package/kmsxx/kmsxx.mk
+++ b/package/kmsxx/kmsxx.mk
@@ -4,62 +4,15 @@
 #
 ################################################################################
 
-KMSXX_VERSION = cb0786049f960f2bd383617151b01318e02e9ff9
+KMSXX_VERSION = debef007b62bc5e8696e02f96111bd2a10072562
 KMSXX_SITE = $(call github,tomba,kmsxx,$(KMSXX_VERSION))
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
-endif
-
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
-
-$(eval $(cmake-package))
+$(eval $(meson-package))
-- 
2.25.1
