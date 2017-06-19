From: Adrian Perez de Castro <aperez@igalia.com>
Date: Mon, 19 Jun 2017 22:03:14 +0300
Subject: [Buildroot] [PATCH v2 1/2] llvm: new package
In-Reply-To: <20170616204143.29198-2-aperez@igalia.com>
References: <20170616204143.29198-2-aperez@igalia.com>
Message-ID: <20170619190315.14288-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

---
Changes v1 -> v2:
    - Added missing Signed-off-by in patch.
    - Renamed BR2_PACKAGE_HOST_LLVM_ARCH_SUPPORT to BR2_PACKAGE_LLVM_ARCH_SUPPORTS
      and made its dependencies more readable.
    - Fixed indentation of help texts in Config.in.
    - Changed comment in Config.in to use the standard Buildroot wording.
    - Handle converting Buildroot's target architecture to LLVM's in
      Config.in instead of in llvm.mk.
    - Change LLVM_LICENSE to use the SPDX license string.
    - Use hooks in llvm.mk instead of appending commands to LLVM_*_CMDS.
    - Fixed all the code style issues pointed out by
      support/scripts/check-package.
---
 package/Config.in                                  |   1 +
 ...-Clean-up-exported-values-update-for-shar.patch |  58 +++++++++++
 package/llvm/Config.in                             |  54 ++++++++++
 package/llvm/llvm.hash                             |   2 +
 package/llvm/llvm.mk                               | 116 +++++++++++++++++++++
 5 files changed, 231 insertions(+)
 create mode 100644 package/llvm/0007-llvm-config-Clean-up-exported-values-update-for-shar.patch
 create mode 100644 package/llvm/Config.in
 create mode 100644 package/llvm/llvm.hash
 create mode 100644 package/llvm/llvm.mk

diff --git a/package/Config.in b/package/Config.in
index aeb7430c89..f8a9dcc307 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -146,6 +146,7 @@ menu "Development tools"
 	source "package/jo/Config.in"
 	source "package/jq/Config.in"
 	source "package/libtool/Config.in"
+	source "package/llvm/Config.in"
 	source "package/make/Config.in"
 	source "package/patch/Config.in"
 	source "package/pkgconf/Config.in"
diff --git a/package/llvm/0007-llvm-config-Clean-up-exported-values-update-for-shar.patch b/package/llvm/0007-llvm-config-Clean-up-exported-values-update-for-shar.patch
new file mode 100644
index 0000000000..a687e60af7
--- /dev/null
+++ b/package/llvm/0007-llvm-config-Clean-up-exported-values-update-for-shar.patch
@@ -0,0 +1,58 @@
+From 628b899be14a6bab4b32dbd53aabd447dcc16cb7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Micha=C5=82=20G=C3=B3rny?= <mgorny@gentoo.org>
+Date: Sat, 20 Aug 2016 23:47:41 +0200
+Subject: [PATCH] llvm-config: Clean up exported values, update for shared
+ linking
+
+Gentoo-specific fixup for llvm-config, including:
+- wiping build-specific CFLAGS, CXXFLAGS,
+- making --src-root return invalid path (/dev/null).
+
+Thanks to Steven Newbury for the initial patch.
+
+Bug: https://bugs.gentoo.org/565358
+Bug: https://bugs.gentoo.org/501684
+
+Fetch from: https://gitweb.gentoo.org/repo/gentoo.git/plain/sys-devel/llvm/files/9999/0007-llvm-config-Clean-up-exported-values-update-for-shar.patch
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+
+diff --git a/tools/llvm-config/CMakeLists.txt b/tools/llvm-config/CMakeLists.txt
+index 744fa4e44d1..593788aaef3 100644
+--- a/tools/llvm-config/CMakeLists.txt
++++ b/tools/llvm-config/CMakeLists.txt
+@@ -32,8 +32,12 @@ get_property(COMPILE_FLAGS TARGET llvm-config PROPERTY COMPILE_FLAGS)
+ set(LLVM_SRC_ROOT ${LLVM_MAIN_SRC_DIR})
+ set(LLVM_OBJ_ROOT ${LLVM_BINARY_DIR})
+ set(LLVM_CPPFLAGS "${CMAKE_CPP_FLAGS} ${CMAKE_CPP_FLAGS_${uppercase_CMAKE_BUILD_TYPE}} ${LLVM_DEFINITIONS}")
+-set(LLVM_CFLAGS "${CMAKE_C_FLAGS} ${CMAKE_C_FLAGS_${uppercase_CMAKE_BUILD_TYPE}} ${LLVM_DEFINITIONS}")
+-set(LLVM_CXXFLAGS "${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS_${uppercase_CMAKE_BUILD_TYPE}} ${COMPILE_FLAGS} ${LLVM_DEFINITIONS}")
++# Just use CMAKE_CPP_FLAGS for CFLAGS and CXXFLAGS, otherwise compiler
++# specific flags will be set when we don't know what compiler will be used
++# with external project utilising llvm-config.  C++ Standard is required.
++# TODO: figure out if we can remove -std=c++11 and move it to revdeps.
++set(LLVM_CFLAGS "${CMAKE_CPP_FLAGS} ${CMAKE_C_FLAGS_${uppercase_CMAKE_BUILD_TYPE}} ${LLVM_DEFINITIONS}")
++set(LLVM_CXXFLAGS "${CMAKE_CPP_FLAGS} -std=c++11 ${CMAKE_CXX_FLAGS_${uppercase_CMAKE_BUILD_TYPE}} ${LLVM_DEFINITIONS}")
+ set(LLVM_BUILD_SYSTEM cmake)
+ set(LLVM_HAS_RTTI ${LLVM_CONFIG_HAS_RTTI})
+ set(LLVM_DYLIB_VERSION "${LLVM_VERSION_MAJOR}.${LLVM_VERSION_MINOR}${LLVM_VERSION_SUFFIX}")
+diff --git a/tools/llvm-config/llvm-config.cpp b/tools/llvm-config/llvm-config.cpp
+index d780094861c..c61c72ff48c 100644
+--- a/tools/llvm-config/llvm-config.cpp
++++ b/tools/llvm-config/llvm-config.cpp
+@@ -549,7 +550,11 @@ int main(int argc, char **argv) {
+       } else if (Arg == "--obj-root") {
+         OS << ActivePrefix << '\n';
+       } else if (Arg == "--src-root") {
+-        OS << LLVM_SRC_ROOT << '\n';
++        if (IsInDevelopmentTree) {
++          OS << LLVM_SRC_ROOT << '\n';
++        } else {
++          OS << "/dev/null\n";
++        }
+       } else if (Arg == "--ignore-libllvm") {
+         LinkDyLib = false;
+         LinkMode = BuiltSharedLibs ? LinkModeShared : LinkModeAuto;
+-- 
+2.11.0
+
diff --git a/package/llvm/Config.in b/package/llvm/Config.in
new file mode 100644
index 0000000000..f6145fd7f6
--- /dev/null
+++ b/package/llvm/Config.in
@@ -0,0 +1,54 @@
+config BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	bool
+	default y if BR2_arm || BR2_armeb
+	default y if BR2_aarch64
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_sparc
+
+config BR2_PACKAGE_LLVM_TARGET_ARCH
+	string
+	default "ARM" if BR2_arm || BR2_armeb
+	default "AArch64" if BR2_aarch64
+	default "X86" if BR2_i386 || BR2_x86_64
+	default "Mips" if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	default "PowerPC" if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default "Sparc" if BR2_sparc
+
+config BR2_PACKAGE_LLVM
+	bool "llvm"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_BUILDROOT_WCHAR
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_ZLIB
+	help
+	  The LLVM Project is a collection of modular and reusable
+	  compiler and toolchain technologies.
+
+	  http://llvm.org
+
+comment "llvm needs a toolchain w/ C++, wchar"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+
+if BR2_PACKAGE_LLVM
+
+config BR2_PACKAGE_LLVM_ENABLE_FFI
+	bool "Support libffi"
+	select BR2_PACKAGE_LIBFFI
+	help
+	  Use libffi in the LLVM Interpreter in order to enable calling
+	  external functions.
+
+config BR2_PACKAGE_LLVM_ENABLE_RTTI
+	bool "C++: Support RTTI"
+	help
+	  Enable support for C++ Run-Time Type Information (RTTI)
+
+config BR2_PACKAGE_LLVM_ENABLE_EH
+	bool "C++: Support exception handling"
+	help
+	  Enable support for C++ exception handling (try/catch)
+
+endif
diff --git a/package/llvm/llvm.hash b/package/llvm/llvm.hash
new file mode 100644
index 0000000000..b11cd14bf4
--- /dev/null
+++ b/package/llvm/llvm.hash
@@ -0,0 +1,2 @@
+# Computed locally after checking the GPG signature:
+sha256 8d10511df96e73b8ff9e7abbfb4d4d432edbdbe965f1f4f07afaf370b8a533be  llvm-4.0.0.src.tar.xz
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
new file mode 100644
index 0000000000..9d10f3a5c6
--- /dev/null
+++ b/package/llvm/llvm.mk
@@ -0,0 +1,116 @@
+################################################################################
+#
+# llvm
+#
+################################################################################
+
+LLVM_VERSION = 4.0.0
+LLVM_SITE = http://llvm.org/releases/$(LLVM_VERSION)
+LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
+LLVM_LICENSE = NCSA
+LLVM_LICENSE_FILES = LICENSE.TXT
+LLVM_INSTALL_STAGING = YES
+LLVM_DEPENDENCIES = libxml2 zlib host-python
+
+LLVM_TARGET_ARCH = $(call qstrip,$(BR2_PACKAGE_LLVM_TARGET_ARCH))
+
+# List of build options at:
+#    http://llvm.org/docs/CMake.html
+#
+LLVM_CONF_OPTS = \
+	-DLLVM_DEFAULT_TARGET_TRIPLE=$(GNU_TARGET_NAME) \
+	-DLLVM_HOST_TRIPLE=$(GNU_TARGET_NAME) \
+	-DLLVM_TARGETS_TO_BUILD=$(LLVM_TARGET_ARCH) \
+	-DLLVM_TARGET_ARCH=$(LLVM_TARGET_ARCH) \
+	-DLLVM_OPTIMIZED_TABLEGEN=YES \
+	-DLLVM_ENABLE_ZLIB=YES \
+	-DLLVM_INCLUDE_TOOLS=YES \
+	-DLLVM_INCLUDE_UTILS=NO \
+	-DLLVM_INCLUDE_EXAMPLES=NO \
+	-DLLVM_INCLUDE_TESTS=NO \
+	-DLLVM_BUILD_TESTS=NO \
+	-DLLVM_BUILD_RUNTIME=NO \
+	-DLLVM_ENABLE_PROJECTS=''
+
+# The Go bindings have no CMake rules@the moment, but better remove the
+# check preventively. Building the Go and OCaml bindings is yet unsupported.
+#
+LLVM_CONF_OPTS += \
+	-DGO_EXECUTABLE=GO_EXECUTABLE-NOTFOUND \
+	-DOCAMLFIND=OCAMLFIND-NOTFOUND
+
+# Building per-component shared libraries is NOT recommended by upstream.
+# The all-in-one libLLVM-<version>.so is enabled with a different setting.
+LLVM_CONF_OPTS += \
+	-DBUILD_SHARED_LIBS=NO \
+	-DLLVM_BUILD_LLVM_DYLIB=$(if $(BR2_STATIC_LIBS),NO,YES)
+
+ifeq ($(BR2_PACKAGE_LLVM_ENABLE_FFI),y)
+LLVM_DEPENDENCIES += libffi
+LLVM_CONF_OPTS += -DLLVM_ENABLE_FFI=YES
+else
+LLVM_CONF_OPTS += -DLLVM_ENABLE_FFI=NO
+endif
+
+ifeq ($(BR2_PACKAGE_LLVM_ENABLE_RTTI),y)
+LLVM_CONF_OPTS += -DLLVM_ENABLE_RTTI=YES
+else
+LLVM_CONF_OPTS += -DLLVM_ENABLE_RTTI=NO
+endif
+
+ifeq ($(BR2_PACKAGE_LLVM_ENABLE_EH),y)
+LLVM_CONF_OPTS += -DLLVM_ENABLE_EH=YES
+else
+LLVM_CONF_OPTS += -DLLVM_ENABLE_EH=NO
+endif
+
+# LLVM expects to always be built in a separate directory.
+LLVM_SUPPORTS_IN_SOURCE_BUILD = NO
+
+# XXX: LLVM does include some support for building native tools. This is used
+#      to build e.g. llvm-config, and a host-native llvm-tblgen if needed.
+#      Unfortunately, Buildroot is overzealous about passing the parameters
+#      needed for cross-building, and the CMake configuration for the native
+#      tools ends up using the cross-toolchain. Once "cmake-package" has
+#      defined LLVM_*_CMDS, this adds:
+#
+#        - A call to CMake which resets CMAKE_{C,CXX,ASM}_COMPILER with the
+#          paths to the host-native ones. Note that using the *_NOCCACHE
+#          variables is needed, otherwise CMake will choke.
+#
+#        - The file "BuildVariables.inc" is copied over from the cross-build
+#          directory to the native one. This way a new "llvm-config" which
+#          can run on the build host returns information about the target
+#          build which gets installed in the sysroot. This is done as an
+#          appended build command. Note that Make has to be re-invoked to
+#          rebuild after copying the file over.
+#
+#        - Last but not least, "llvm-config" is copied into the sysroot with
+#          the target triple prefix, because packages using sane build systems
+#          will first try that.
+#
+
+define LLVM_CONFIGURE_NATIVE_TOOLS_CMDS
+	cd $(LLVM_BUILDDIR)/NATIVE && \
+	PATH=$(BR_PATH) $(LLVM_CONF_ENV) $(BR2_CMAKE) $(LLVM_SRCDIR) \
+		-DCMAKE_C_COMPILER='$(HOSTCC_NOCCACHE)' \
+		-DCMAKE_ASM_COMPILER='$(HOSTCC_NOCCACHE)' \
+		-DCMAKE_CXX_COMPILER='$(HOSTCXX_NOCCACHE)'
+endef
+
+LLVM_POST_CONFIGURE_HOOKS += LLVM_CONFIGURE_NATIVE_TOOLS_CMDS
+
+define LLVM_REBUILD_NATIVE_LLVM_CONFIG_CMDS
+	cp $(LLVM_BUILDDIR)/tools/llvm-config/BuildVariables.inc $(LLVM_BUILDDIR)/NATIVE/tools/llvm-config/BuildVariables.inc
+	$(HOST_MAKE_ENV) $(LLVM_MAKE_ENV) $(LLVM_MAKE) $(LLVM_MAKE_OPTS) -C $(LLVM_BUILDDIR)/NATIVE llvm-config
+endef
+
+LLVM_POST_BUILD_HOOKS += LLVM_REBUILD_NATIVE_LLVM_CONFIG_CMDS
+
+define LLVM_INSTALL_STAGING_NATIVE_LLVM_CONFIG_CMDS
+	install -Dm755 $(LLVM_BUILDDIR)/NATIVE/bin/llvm-config $(STAGING_DIR)/usr/bin/llvm-config
+endef
+
+LLVM_POST_INSTALL_STAGING_HOOKS += LLVM_INSTALL_STAGING_NATIVE_LLVM_CONFIG_CMDS
+
+$(eval $(cmake-package))
-- 
2.13.1
