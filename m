From: Romain Naour <romain.naour@smile.fr>
Date: Sat,  7 Sep 2019 11:40:25 +0200
Subject: [Buildroot] [PATCH v2 10/12] core: allow to use Clang as
 cross-compiler
In-Reply-To: <20190907094027.9537-1-romain.naour@smile.fr>
References: <20190907094027.9537-1-romain.naour@smile.fr>
Message-ID: <20190907094027.9537-11-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add this new experimental option into "Advanced" menu since
we are expecting some build and runtime issues for number of
packages (bootloaders, kernel).

Add host-clang as dependency in toolchain virtual package
in order to be sure that the clang cross-compiler is built
before generating Buildroot.cmake file from an
TOOLCHAIN_CMAKE_INSTALL_FILES hook (defined in cmake package).
Buildroot.cmake can be used by a cmake package as soon as
the toolchain package is installed.

Install the GCC external toolchain before executing
realpath command by adding an explicit dependency on
toolchain-external. Without this dependency, host-clang
may be build before toolchain-external when
BR2_USER_HOST_CLANG_AS_CROSS_COMPILER=y, so the realpath
fail to set GCC_INSTALL_PREFIX leading to
"crtbegin.o no such file or directory" error while linking
applications.

Only Glibc toolchain has been tested.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
---
v2: fix typo TOOLCHAIN_{BUILDROOT,EXTERNAL}_DEPENDENCIES in toolchain-external.mk
    Install the GCC external toolchain before executing realpath command.
    Move host-clang dependency to toolchain virtual package since host-clang now
    depends on external-toolchain.
    Add Glibc toolchain dependency
---
 Config.in                        | 23 +++++++++++++++++++++++
 package/Makefile.in              | 13 ++++++++++---
 package/clang/clang.mk           |  7 +++++++
 toolchain/toolchain/toolchain.mk |  7 +++++++
 4 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/Config.in b/Config.in
index a6e280b885..dc2e5f7320 100644
--- a/Config.in
+++ b/Config.in
@@ -711,6 +711,29 @@ config BR2_REPRODUCIBLE
 	  This is labeled as an experimental feature, as not all
 	  packages behave properly to ensure reproducibility.
 
+config BR2_USER_HOST_CLANG_AS_CROSS_COMPILER
+	bool "Use Clang as cross-compiler (experimental)"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
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
+	  Note: Only Glibc toolchain has been tested.
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
index 148df8e611..36703f5d8a 100644
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
 
@@ -106,7 +111,9 @@ CLANG_CONF_OPTS += -DLLVM_DYLIB_COMPONENTS=all
 # Help host-clang to find our external toolchain, use a relative path from the clang
 # installation directory to the external toolchain installation directory in order to
 # not hardcode the toolchain absolute path.
+# Install the GCC external toolchain before executing realpath command.
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
+HOST_CLANG_DEPENDENCIES += toolchain-external
 HOST_CLANG_CONF_OPTS += -DGCC_INSTALL_PREFIX:PATH=`realpath --relative-to=$(HOST_DIR)/bin/ $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)`
 endif
 
diff --git a/toolchain/toolchain/toolchain.mk b/toolchain/toolchain/toolchain.mk
index 17fb62147e..d945e27aac 100644
--- a/toolchain/toolchain/toolchain.mk
+++ b/toolchain/toolchain/toolchain.mk
@@ -10,6 +10,13 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 TOOLCHAIN_DEPENDENCIES += toolchain-external
 endif
 
+# Make sure the clang cross-compiler is built before
+# generating Buildroot.cmake file from an
+# TOOLCHAIN_CMAKE_INSTALL_FILES hook.
+ifeq ($(BR2_USER_HOST_CLANG_AS_CROSS_COMPILER),y)
+TOOLCHAIN_DEPENDENCIES += host-clang
+endif
+
 TOOLCHAIN_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 # Apply a hack that Rick Felker suggested[1] to avoid conflicts between libc
-- 
2.21.0
