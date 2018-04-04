From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Wed,  4 Apr 2018 18:31:18 +0200
Subject: [Buildroot] [PATCH v5 1/7] package/llvm: new package
In-Reply-To: <20180404163124.27934-1-valentin.korenblit@smile.fr>
References: <20180404163124.27934-1-valentin.korenblit@smile.fr>
Message-ID: <20180404163124.27934-2-valentin.korenblit@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch installs LLVM tools and libraries for the host and
libLLVM.so for the target.

In order to cross-compile LLVM for the target, LLVM
must be installed on the host, or at least llvm-tblgen.
This is necessary as the path to host's llvm-tblgen must
be specified when cross-compiling using the LLVM_TABLEGEN option.
Also, a version of llvm-config that can run on the host will
be required by packages that link with LLVM libraries, so we
need to generate it and install it in STAGING_DIR/usr/bin.

It is important to remark why we need llvm-config(host variant)
installed in STAGING dir. This tool is necessary to build
applications that use LLVM, as it prints the compiler flags,
linker flags and object libraries needed to link against LLVM libs.

More info: https://bugs.chromium.org/p/chromium/issues/detail?id=219369

The original idea was to compile only llvm-tblgen and llvm-config
for the host, as they are the only necessary components. However,
llvm-config tool does not work as expected if it is not linked with
libLLVM.so, so we must also enable LLVM_LINK_LLVM_DYLIB, what builds
LLVM as a single shared library and links LLVM tools with it.

More info: https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=224847
in comment #11.

If we don't build full LLVM for the host, it would be necessary to
patch configure.ac from mesa3d if we want dynamic linking, because it
uses llvm-config (host variant installed in STAGING_DIR) to get the
necessary LLVM libraries to link with, which has the following problems:

 - llvm-config --shared mode outputs static (even if LLVM is built as
   one shared library) which leads to link issues with libgallium.

 - llvm-config --libs outputs all LLVM tiny libs: -lLLVMLTO,
   -lLLVMPasses,etc instead of the single shared library containing
    all LLVM components (-lLLVM-5.0)

Mesa tries to execute: llvm-config --link-shared --libs, but this outputs
llvm-config: error: libLLVM-5.0.so is missing.

Given that these problems may arise with other packages that use LLVM,
it is preferable to do a full build for the host. Also, having a
complete installation of LLVM on the host will also facilitate the
integration of Clang front-end, which is going to be added in a future
patch.

As option LLVM_BUILD_LLVM_DYLIB is enabled for the llvm target variant,
a single shared library containing all LLVM components is built.
This option is not compatible with BUILD_SHARED_LIBS, which generates
one .so per library and is only recommended for use by LLVM developers.

Tools and utils are not built for the target. The patch aims to provide
LLVM support for other packages.

The main options needed to cross-compile LLVM are the following ones:

LLVM_TABLEGEN
CMAKE_CROSSCOMPILING
LLVM_DEFAULT_TARGET_TRIPLE
LLVM_HOST_TRIPLE
LLVM_TARGET_ARCH
LLVM_TARGETS_TO_BUILD

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
---
 DEVELOPERS             |   3 +
 package/Config.in      |   1 +
 package/llvm/Config.in |  27 +++++
 package/llvm/llvm.hash |   3 +
 package/llvm/llvm.mk   | 263 +++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 297 insertions(+)
 create mode 100644 package/llvm/Config.in
 create mode 100644 package/llvm/llvm.hash
 create mode 100644 package/llvm/llvm.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 38e727ecc3..78be8256bc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1887,6 +1887,9 @@ N:	Tzu-Jung Lee <roylee17@gmail.com>
 F:	package/dropwatch/
 F:	package/tstools/
 
+N:	Valentin Korenblit <valentin.korenblit@smile.fr>
+F:	package/llvm/
+
 N:	Vanya Sergeev <vsergeev@gmail.com>
 F:	package/lua-periphery/
 
diff --git a/package/Config.in b/package/Config.in
index d883909094..82c5c40531 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1545,6 +1545,7 @@ menu "Other"
 	source "package/libuv/Config.in"
 	source "package/lightning/Config.in"
 	source "package/linux-pam/Config.in"
+	source "package/llvm/Config.in"
 if BR2_PACKAGE_LINUX_PAM
 comment "linux-pam plugins"
 	source "package/libpam-radius-auth/Config.in"
diff --git a/package/llvm/Config.in b/package/llvm/Config.in
new file mode 100644
index 0000000000..f222b196cb
--- /dev/null
+++ b/package/llvm/Config.in
@@ -0,0 +1,27 @@
+config BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	bool
+	default y if BR2_i386
+	default y if BR2_x86_64
+	default y if BR2_aarch64
+	default y if BR2_arm || BR2_armeb
+
+config BR2_PACKAGE_LLVM_TARGET_ARCH
+	string
+	default "AArch64" if BR2_aarch64
+	default "ARM" if BR2_arm || BR2_armeb
+	default "X86" if BR2_i386 || BR2_x86_64
+
+config BR2_PACKAGE_LLVM
+	bool "llvm"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on BR2_HOST_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	help
+	  The LLVM Project is a collection of modular and reusable
+	  compiler and toolchain technologies.
+
+	  http://llvm.org
+
+comment "llvm needs a toolchain w/ gcc >= 4.8, host gcc >= 4.8"
+	depends on !BR2_HOST_GCC_AT_LEAST_4_8 \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/llvm/llvm.hash b/package/llvm/llvm.hash
new file mode 100644
index 0000000000..3e998c4328
--- /dev/null
+++ b/package/llvm/llvm.hash
@@ -0,0 +1,3 @@
+# locally calculated
+sha256 5fa7489fc0225b11821cab0362f5813a05f2bcf2533e8a4ea9c9c860168807b0	llvm-5.0.1.src.tar.xz
+sha256 abd4d8794808bacb1eb6924d49efafd9ab6eef88faaaeb5d3cfa13ee3670d672 LICENSE.TXT
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
new file mode 100644
index 0000000000..525e0f98f8
--- /dev/null
+++ b/package/llvm/llvm.mk
@@ -0,0 +1,263 @@
+################################################################################
+#
+# llvm
+#
+################################################################################
+
+LLVM_VERSION = 5.0.1
+LLVM_SITE = http://llvm.org/releases/$(LLVM_VERSION)
+LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
+LLVM_LICENSE = NCSA
+LLVM_LICENSE_FILES = LICENSE.TXT
+LLVM_SUPPORTS_IN_SOURCE_BUILD = NO
+LLVM_INSTALL_STAGING = YES
+
+# http://llvm.org/docs/GettingStarted.html#software
+# host-python: Python interpreter 2.7 or newer is required for builds and testing.
+HOST_LLVM_DEPENDENCIES = host-python
+LLVM_DEPENDENCIES = host-llvm
+
+# Don't build clang libcxx libcxxabi lldb compiler-rt lld polly as llvm subprojects
+# This flag assumes that projects are checked out side-by-side and not nested
+HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_PROJECTS=""
+LLVM_CONF_OPTS += -DLLVM_ENABLE_PROJECTS=""
+
+HOST_LLVM_CONF_OPTS += -DLLVM_CCACHE_BUILD=$(if $(BR2_CCACHE),ON,OFF)
+LLVM_CONF_OPTS += -DLLVM_CCACHE_BUILD=$(if $(BR2_CCACHE),ON,OFF)
+
+# Disable experimental Global Instruction Selection support.
+# https://llvm.org/docs/GlobalISel.html
+HOST_LLVM_CONF_OPTS += -DLLVM_BUILD_GLOBAL_ISEL=OFF
+LLVM_CONF_OPTS += -DLLVM_BUILD_GLOBAL_ISEL=OFF
+
+# Get target architecture
+LLVM_TARGET_ARCH = $(call qstrip,$(BR2_PACKAGE_LLVM_TARGET_ARCH))
+
+# Build backend for target architecture. This include backends like AMDGPU.
+LLVM_TARGETS_TO_BUILD = $(LLVM_TARGET_ARCH)
+HOST_LLVM_CONF_OPTS = -DLLVM_TARGETS_TO_BUILD="$(subst $(space),;,$(LLVM_TARGETS_TO_BUILD))"
+LLVM_CONF_OPTS = -DLLVM_TARGETS_TO_BUILD="$(subst $(space),;,$(LLVM_TARGETS_TO_BUILD))"
+
+# LLVM target to use for native code generation. This is required for JIT generation.
+# It must be set to LLVM_TARGET_ARCH for host and target, otherwise we get
+# "No available targets are compatible for this triple" with llvmpipe when host
+# and target architectures are different.
+HOST_LLVM_CONF_OPTS += -DLLVM_TARGET_ARCH=$(LLVM_TARGET_ARCH)
+LLVM_CONF_OPTS += -DLLVM_TARGET_ARCH=$(LLVM_TARGET_ARCH)
+
+# Use native llvm-tblgen from host-llvm (needed for cross-compilation)
+LLVM_CONF_OPTS += -DLLVM_TABLEGEN=$(HOST_DIR)/bin/llvm-tblgen
+
+# BUILD_SHARED_LIBS has a misleading name. It is in fact an option for
+# LLVM developers to build all LLVM libraries as separate shared libraries.
+# For normal use of LLVM, it is recommended to build a single
+# shared library, which is achieved by BUILD_SHARED_LIBS=OFF and
+# LLVM_BUILD_LLVM_DYLIB=ON.
+HOST_LLVM_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
+LLVM_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
+
+# Generate libLLVM.so. This library contains a default set of LLVM components
+# that can be overwritten with "LLVM_DYLIB_COMPONENTS". The default contains
+# most of LLVM and is defined in "tools/llvm-shlib/CMakelists.txt".
+HOST_LLVM_CONF_OPTS += -DLLVM_BUILD_LLVM_DYLIB=ON
+LLVM_CONF_OPTS += -DLLVM_BUILD_LLVM_DYLIB=ON
+
+# LLVM_BUILD_LLVM_DYLIB to ON. We need to enable this option for the
+# host as llvm-config for the host will be used in STAGING_DIR by packages
+# linking against libLLVM and if this option is not selected, then llvm-config
+# does not work properly. For example, it assumes that LLVM is built statically
+# and cannot find libLLVM.so.
+HOST_LLVM_CONF_OPTS += -DLLVM_LINK_LLVM_DYLIB=ON
+LLVM_CONF_OPTS += -DLLVM_LINK_LLVM_DYLIB=ON
+
+LLVM_CONF_OPTS += -DCMAKE_CROSSCOMPILING=1
+
+# Disabled for the host since no host-libedit.
+# Fall back to "Simple fgets-based implementation" of llvm line editor.
+HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_LIBEDIT=OFF
+LLVM_CONF_OPTS += -DLLVM_ENABLE_LIBEDIT=OFF
+
+# We want to install llvm libraries and modules.
+HOST_LLVM_CONF_OPTS += -DLLVM_INSTALL_TOOLCHAIN_ONLY=OFF
+LLVM_CONF_OPTS += -DLLVM_INSTALL_TOOLCHAIN_ONLY=OFF
+
+# We build from a release archive without vcs files.
+HOST_LLVM_CONF_OPTS += -DLLVM_APPEND_VC_REV=OFF
+LLVM_CONF_OPTS += -DLLVM_APPEND_VC_REV=OFF
+
+# No backtrace package in Buildroot.
+# https://documentation.backtrace.io
+HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_BACKTRACES=OFF
+LLVM_CONF_OPTS += -DLLVM_ENABLE_BACKTRACES=OFF
+
+# Enable signal handlers overrides support.
+HOST_LLVM_CONF_OPTS += -DENABLE_CRASH_OVERRIDES=ON
+LLVM_CONF_OPTS += -DENABLE_CRASH_OVERRIDES=ON
+
+# Disable ffi for now.
+HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_FFI=OFF
+LLVM_CONF_OPTS += -DLLVM_ENABLE_FFI=OFF
+
+# Disable terminfo database (needs ncurses libtinfo.so)
+HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_TERMINFO=OFF
+LLVM_CONF_OPTS += -DLLVM_ENABLE_TERMINFO=OFF
+
+# Enable thread support
+HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_THREADS=ON
+LLVM_CONF_OPTS += -DLLVM_ENABLE_THREADS=ON
+
+# Enable optional host-zlib support for LLVM Machine Code (llvm-mc) to add
+# compression/uncompression capabilities.
+# Not needed on the target.
+HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_ZLIB=ON
+HOST_LLVM_DEPENDENCIES += host-zlib
+LLVM_CONF_OPTS += -DLLVM_ENABLE_ZLIB=OFF
+
+# We don't use llvm for static only build, so enable PIC
+HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_PIC=ON
+LLVM_CONF_OPTS += -DLLVM_ENABLE_PIC=ON
+
+# Default is Debug build, which requires considerably more disk space and
+# build time. Release build is selected for host and target because the linker
+# can run out of memory in Debug mode.
+HOST_LLVM_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
+LLVM_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
+
+# Disable C++1y (ISO C++ 2014 standard)
+# Disable C++1z (ISO C++ 2017 standard)
+# Compile llvm with the C++11 (ISO C++ 2011 standard) which is the fallback.
+HOST_LLVM_CONF_OPTS += \
+	-DLLVM_ENABLE_CXX1Y=OFF \
+	-DLLVM_ENABLE_CXX1Z=OFF
+LLVM_CONF_OPTS += \
+	-DLLVM_ENABLE_CXX1Y=OFF \
+	-DLLVM_ENABLE_CXX1Z=OFF
+
+# Disabled, requires sys/ndir.h header
+# Disable debug in module
+HOST_LLVM_CONF_OPTS += \
+	-DLLVM_ENABLE_MODULES=OFF \
+	-DLLVM_ENABLE_MODULE_DEBUGGING=OFF
+LLVM_CONF_OPTS += \
+	-DLLVM_ENABLE_MODULES=OFF \
+	-DLLVM_ENABLE_MODULE_DEBUGGING=OFF
+
+# Don't change the standard library to libc++.
+HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_LIBCXX=OFF
+LLVM_CONF_OPTS += -DLLVM_ENABLE_LIBCXX=OFF
+
+# Don't use lld as a linker.
+HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_LLD=OFF
+LLVM_CONF_OPTS += -DLLVM_ENABLE_LLD=OFF
+
+# Generate code for the target. LLVM selects a target by looking at the
+# toolchain tuple
+HOST_LLVM_CONF_OPTS += -DLLVM_DEFAULT_TARGET_TRIPLE=$(GNU_TARGET_NAME)
+LLVM_CONF_OPTS += -DLLVM_DEFAULT_TARGET_TRIPLE=$(GNU_TARGET_NAME)
+
+# LLVM_HOST_TRIPLE has a misleading name, it is in fact the triple of the
+# system where llvm is going to run on. We need to specify triple for native
+# code generation on the target.
+# This solves "No available targets are compatible for this triple" with llvmpipe
+LLVM_CONF_OPTS += -DLLVM_HOST_TRIPLE=$(GNU_TARGET_NAME)
+
+# The Go bindings have no CMake rules at the moment, but better remove the
+# check preventively. Building the Go and OCaml bindings is yet unsupported.
+HOST_LLVM_CONF_OPTS += \
+	-DGO_EXECUTABLE=GO_EXECUTABLE-NOTFOUND \
+	-DOCAMLFIND=OCAMLFIND-NOTFOUND
+
+# Builds a release host tablegen that gets used during the LLVM build.
+HOST_LLVM_CONF_OPTS += -DLLVM_OPTIMIZED_TABLEGEN=ON
+
+# Keep llvm utility binaries for the host. llvm-tblgen is built anyway as
+# CMakeLists.txt has add_subdirectory(utils/TableGen) unconditionally.
+HOST_LLVM_CONF_OPTS += \
+	-DLLVM_BUILD_UTILS=ON \
+	-DLLVM_INCLUDE_UTILS=ON \
+	-DLLVM_INSTALL_UTILS=ON
+LLVM_CONF_OPTS += \
+	-DLLVM_BUILD_UTILS=OFF \
+	-DLLVM_INCLUDE_UTILS=OFF \
+	-DLLVM_INSTALL_UTILS=OFF
+
+HOST_LLVM_CONF_OPTS += \
+	-DLLVM_INCLUDE_TOOLS=ON \
+	-DLLVM_BUILD_TOOLS=ON
+
+# We need to activate LLVM_INCLUDE_TOOLS, otherwise it does not generate
+# libLLVM.so
+LLVM_CONF_OPTS += \
+	-DLLVM_INCLUDE_TOOLS=ON \
+	-DLLVM_BUILD_TOOLS=OFF
+
+# Compiler-rt not in the source tree.
+# llvm runtime libraries are not in the source tree.
+# Polly is not in the source tree.
+HOST_LLVM_CONF_OPTS += \
+	-DLLVM_BUILD_EXTERNAL_COMPILER_RT=OFF \
+	-DLLVM_BUILD_RUNTIME=OFF \
+	-DLLVM_INCLUDE_RUNTIMES=OFF \
+	-DLLVM_POLLY_BUILD=OFF
+LLVM_CONF_OPTS += \
+	-DLLVM_BUILD_EXTERNAL_COMPILER_RT=OFF \
+	-DLLVM_BUILD_RUNTIME=OFF \
+	-DLLVM_INCLUDE_RUNTIMES=OFF \
+	-DLLVM_POLLY_BUILD=OFF
+
+HOST_LLVM_CONF_OPTS += \
+	-DLLVM_ENABLE_WARNINGS=ON \
+	-DLLVM_ENABLE_PEDANTIC=ON \
+	-DLLVM_ENABLE_WERROR=OFF
+LLVM_CONF_OPTS += \
+	-DLLVM_ENABLE_WARNINGS=ON \
+	-DLLVM_ENABLE_PEDANTIC=ON \
+	-DLLVM_ENABLE_WERROR=OFF
+
+HOST_LLVM_CONF_OPTS += \
+	-DLLVM_BUILD_EXAMPLES=OFF \
+	-DLLVM_BUILD_DOCS=OFF \
+	-DLLVM_BUILD_TESTS=OFF \
+	-DLLVM_ENABLE_DOXYGEN=OFF \
+	-DLLVM_ENABLE_OCAMLDOC=OFF \
+	-DLLVM_ENABLE_SPHINX=OFF \
+	-DLLVM_INCLUDE_EXAMPLES=OFF \
+	-DLLVM_INCLUDE_DOCS=OFF \
+	-DLLVM_INCLUDE_GO_TESTS=OFF \
+	-DLLVM_INCLUDE_TESTS=OFF
+LLVM_CONF_OPTS += \
+	-DLLVM_BUILD_EXAMPLES=OFF \
+	-DLLVM_BUILD_DOCS=OFF \
+	-DLLVM_BUILD_TESTS=OFF \
+	-DLLVM_ENABLE_DOXYGEN=OFF \
+	-DLLVM_ENABLE_OCAMLDOC=OFF \
+	-DLLVM_ENABLE_SPHINX=OFF \
+	-DLLVM_INCLUDE_EXAMPLES=OFF \
+	-DLLVM_INCLUDE_DOCS=OFF \
+	-DLLVM_INCLUDE_GO_TESTS=OFF \
+	-DLLVM_INCLUDE_TESTS=OFF
+
+# Copy llvm-config (host variant) to STAGING_DIR
+# llvm-config (host variant) returns include and lib directories
+# for the host if it's installed in host/bin:
+# output/host/bin/llvm-config --includedir
+# output/host/include
+# When installed in STAGING_DIR, llvm-config returns include and lib
+# directories from STAGING_DIR.
+# output/staging/usr/bin/llvm-config --includedir
+# output/staging/usr/include
+define HOST_LLVM_COPY_LLVM_CONFIG_TO_STAGING_DIR
+	$(INSTALL) -D -m 0755 $(HOST_DIR)/bin/llvm-config \
+		$(STAGING_DIR)/usr/bin/llvm-config
+endef
+HOST_LLVM_POST_INSTALL_HOOKS = HOST_LLVM_COPY_LLVM_CONFIG_TO_STAGING_DIR
+
+# By default llvm-tblgen is built and installed on the target but it is
+# not necessary.
+define LLVM_DELETE_LLVM_TBLGEN_TARGET
+	rm -f $(TARGET_DIR)/usr/bin/llvm-tblgen
+endef
+LLVM_POST_INSTALL_TARGET_HOOKS = LLVM_DELETE_LLVM_TBLGEN_TARGET
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.14.3
