From: Romain Naour <romain.naour@smile.fr>
Date: Fri,  6 Sep 2019 11:09:45 +0200
Subject: [Buildroot] [PATCH 09/11] core: allow to use Clang as cross-compiler
In-Reply-To: <20190906090947.5476-1-romain.naour@smile.fr>
References: <20190906090947.5476-1-romain.naour@smile.fr>
Message-ID: <20190906090947.5476-10-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add this new experimental option into "Advanced" menu since
we are expecting some build and runtime issues for number of
packages (bootloaders, kernel).

Add host-clang as dependency in toolchain-buildroot and
toolchain-external virtual in order to be sure that the
clang cross-compiler is built before generating
Buildroot.cmake file from an TOOLCHAIN_CMAKE_INSTALL_FILES
hook (defined in cmake package).

For toolchain-external package, we can latter remove the
host-clang dependency if we can import Clang with the
prebuilt external toolchain.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
---
 Config.in                                     | 20 +++++++++++++++++++
 package/Makefile.in                           | 13 +++++++++---
 package/clang/clang.mk                        |  5 +++++
 .../toolchain-buildroot.mk                    |  7 +++++++
 .../toolchain-external/toolchain-external.mk  |  7 +++++++
 5 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/Config.in b/Config.in
index a6e280b885..6e3a7986bf 100644
--- a/Config.in
+++ b/Config.in
@@ -711,6 +711,26 @@ config BR2_REPRODUCIBLE
 	  This is labeled as an experimental feature, as not all
 	  packages behave properly to ensure reproducibility.
 
+config BR2_USER_HOST_CLANG_AS_CROSS_COMPILER
+	bool "Use Clang as cross-compiler (experimental)"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on BR2_HOST_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR # std::wstring
+	select BR2_PACKAGE_HOST_CLANG
+	help
+	  This option will force Buildroot to use Clang as cross-compiler
+	  instead of GCC. A GCC toolchain (internal or external) is still
+	  needed to build with Clang.
+
+	  This is labeled as an experimental feature, since we are
+	  expecting some build and runtime issues for number of packages
+	  (bootloaders, kernel).
+
 endmenu
 
 comment "Security Hardening Options"
diff --git a/package/Makefile.in b/package/Makefile.in
index 0a7899c852..aebf4edd1b 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -200,9 +200,6 @@ endif
 # Define TARGET_xx variables for all common binutils/gcc
 TARGET_AR       = $(TARGET_CROSS)ar
 TARGET_AS       = $(TARGET_CROSS)as
-TARGET_CC       = $(TARGET_CROSS)gcc
-TARGET_CPP      = $(TARGET_CROSS)cpp
-TARGET_CXX      = $(TARGET_CROSS)g++
 TARGET_FC       = $(TARGET_CROSS)gfortran
 TARGET_LD       = $(TARGET_CROSS)ld
 TARGET_NM       = $(TARGET_CROSS)nm
@@ -211,6 +208,16 @@ TARGET_READELF  = $(TARGET_CROSS)readelf
 TARGET_OBJCOPY  = $(TARGET_CROSS)objcopy
 TARGET_OBJDUMP  = $(TARGET_CROSS)objdump
 
+ifeq ($(BR2_USER_HOST_CLANG_AS_CROSS_COMPILER),y)
+TARGET_CC       = $(HOST_DIR)/bin/clang
+TARGET_CPP      = $(HOST_DIR)/bin/clang-cpp
+TARGET_CXX      = $(HOST_DIR)/bin/clang++
+else
+TARGET_CC       = $(TARGET_CROSS)gcc
+TARGET_CPP      = $(TARGET_CROSS)cpp
+TARGET_CXX      = $(TARGET_CROSS)g++
+endif
+
 ifeq ($(BR2_STRIP_strip),y)
 STRIP_STRIP_DEBUG := --strip-debug
 TARGET_STRIP = $(TARGET_CROSS)strip
diff --git a/package/clang/clang.mk b/package/clang/clang.mk
index 148df8e611..674dedc746 100644
--- a/package/clang/clang.mk
+++ b/package/clang/clang.mk
@@ -14,6 +14,11 @@ CLANG_LICENSE_FILES = LICENSE.TXT
 CLANG_SUPPORTS_IN_SOURCE_BUILD = NO
 CLANG_INSTALL_STAGING = YES
 
+# Allow host-clang to be build as part of the toolchain
+ifeq ($(BR2_USER_HOST_CLANG_AS_CROSS_COMPILER),y)
+HOST_CLANG_ADD_TOOLCHAIN_DEPENDENCY = NO
+endif
+
 HOST_CLANG_DEPENDENCIES = host-llvm host-libxml2
 CLANG_DEPENDENCIES = llvm host-clang
 
diff --git a/toolchain/toolchain-buildroot/toolchain-buildroot.mk b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
index b30cc332d2..da10ee2662 100644
--- a/toolchain/toolchain-buildroot/toolchain-buildroot.mk
+++ b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
@@ -12,6 +12,13 @@ BR_LIBC = $(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_LIBC))
 
 TOOLCHAIN_BUILDROOT_DEPENDENCIES = host-gcc-final
 
+# Make sure the clang cross-compiler is built before
+# generating Buildroot.cmake file from an
+# TOOLCHAIN_CMAKE_INSTALL_FILES hook.
+ifeq ($(BR2_USER_HOST_CLANG_AS_CROSS_COMPILER),y)
+TOOLCHAIN_BUILDROOT_DEPENDENCIES += host-clang
+endif
+
 TOOLCHAIN_BUILDROOT_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 $(eval $(virtual-package))
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index dd07884c7e..a7157ce7fe 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -15,6 +15,13 @@ ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
 TOOLCHAIN_EXTERNAL_DEPENDENCIES += musl-compat-headers
 endif
 
+# Make sure the clang cross-compiler is built before
+# generating Buildroot.cmake file from an
+# TOOLCHAIN_CMAKE_INSTALL_FILES hook.
+ifeq ($(BR2_USER_HOST_CLANG_AS_CROSS_COMPILER),y)
+TOOLCHAIN_BUILDROOT_DEPENDENCIES += host-clang
+endif
+
 $(eval $(virtual-package))
 
 # Ensure the external-toolchain package has a prefix defined.
-- 
2.21.0
