From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Thu, 29 Mar 2018 13:33:37 +0200
Subject: [Buildroot] [PATCH v4 02/11] package/llvm: enable target variant
In-Reply-To: <20180329113346.10367-1-valentin.korenblit@smile.fr>
References: <20180329113346.10367-1-valentin.korenblit@smile.fr>
Message-ID: <20180329113346.10367-3-valentin.korenblit@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch installs libLLVM.so on the target.

As option LLVM_BUILD_LLVM_DYLIB is enabled, a single shared library
containing all LLVM components is built. This option is not compatible
with BUILD_SHARED_LIBS, which generates on .so per library and is only
recommended for use by LLVM developers.

Tools and utils are not built for the target. The patch aims to provide
LLVM support for other packages.

The main options needed to cross-compile LLVM are the following ones:

LLVM_TABLEGEN
CMAKE_CROSSCOMPILING
LLVM_DEFAULT_TARGET_TRIPLE
LLVM_HOST_TRIPLE
LLVM_TARGET_ARCH
LLVM_TARGETS_TO_BUILD

This patch copies llvm-config from HOST_DIR/usr/bin to STAGING_DIR/usr/in,
so that it can be used by packages that link with LLVM libraries.

Move BR2_PACKAGE_LLVM_ARCH_SUPPORTS and BR2_PACKAGE_LLVM_TARGET_ARCH
to package/llvm/Config.in for consistency with other packages.

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
---
 package/Config.in           |  1 +
 package/llvm/Config.in      | 18 +++++++++++
 package/llvm/Config.in.host |  9 ------
 package/llvm/llvm.mk        | 79 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 98 insertions(+), 9 deletions(-)
 create mode 100644 package/llvm/Config.in

diff --git a/package/Config.in b/package/Config.in
index 2f9210a04e..47e5b3d1b4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1540,6 +1540,7 @@ menu "Other"
 	source "package/libuv/Config.in"
 	source "package/lightning/Config.in"
 	source "package/linux-pam/Config.in"
+	source "package/llvm/Config.in"
 if BR2_PACKAGE_LINUX_PAM
 comment "linux-pam plugins"
 	source "package/libpam-radius-auth/Config.in"
diff --git a/package/llvm/Config.in b/package/llvm/Config.in
new file mode 100644
index 0000000000..1d80498d53
--- /dev/null
+++ b/package/llvm/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	bool
+	default y if BR2_i386 || BR2_x86_64
+	depends on BR2_HOST_GCC_AT_LEAST_4_8
+
+config BR2_PACKAGE_LLVM_TARGET_ARCH
+	string
+	default "X86" if BR2_i386 || BR2_x86_64
+
+config BR2_PACKAGE_LLVM
+	bool "llvm"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_LLVM
+	help
+	  The LLVM Project is a collection of modular and reusable
+	  compiler and toolchain technologies.
+
+	  http://llvm.org
diff --git a/package/llvm/Config.in.host b/package/llvm/Config.in.host
index 26ee7e28bb..fc46535fad 100644
--- a/package/llvm/Config.in.host
+++ b/package/llvm/Config.in.host
@@ -1,12 +1,3 @@
-config BR2_PACKAGE_LLVM_ARCH_SUPPORTS
-	bool
-	default y if BR2_i386 || BR2_x86_64
-	depends on BR2_HOST_GCC_AT_LEAST_4_8
-
-config BR2_PACKAGE_LLVM_TARGET_ARCH
-	string
-	default "X86" if BR2_i386 || BR2_x86_64
-
 config BR2_PACKAGE_HOST_LLVM
 	bool "host llvm"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 71fcaa2b8e..4e58c96e0f 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -10,13 +10,16 @@ LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
 LLVM_LICENSE = NCSA
 LLVM_LICENSE_FILES = LICENSE.TXT
 LLVM_SUPPORTS_IN_SOURCE_BUILD = NO
+LLVM_INSTALL_STAGING = YES
 
 # http://llvm.org/docs/GettingStarted.html#software
 # host-python: Python interpreter 2.7 or newer is required for builds and testing.
 # host-zlib: Optional, adds compression / uncompression capabilities to selected LLVM tools.
 HOST_LLVM_DEPENDENCIES = host-python host-zlib
+LLVM_DEPENDENCIES = host-llvm zlib
 
 # Don't build clang libcxx libcxxabi lldb compiler-rt lld polly as llvm subprojects
+#This flag assumes that projects are checked out side-by-side and not nested
 HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_PROJECTS=""
 
 # Disable CCACHE
@@ -28,166 +31,238 @@ HOST_LLVM_CONF_OPTS += -DLLVM_BUILD_GLOBAL_ISEL=OFF
 # * Use "Unix Makefiles" generator for generating make-compatible parallel makefiles.
 #   Ninja is not supported yet by Buildroot
 HOST_LLVM_CONF_OPTS += -G "Unix Makefiles"
+LLVM_CONF_OPTS += -G "Unix Makefiles"
+
+# Use native llvm-tblgen from host-llvm (needed for cross-compilation)
+LLVM_CONF_OPTS += -DLLVM_TABLEGEN=$(HOST_DIR)/usr/bin/llvm-tblgen
+
+# Copy llvm-config (host variant) to STAGING_DIR since llvm-config
+# provided by llvm target variant can't run on the host.
+# Also, llvm-config (host variant) returns include and lib directories
+# for the host if it's installed in host/usr/bin:
+# output/host/usr/bin/llvm-config --includedir
+# output/host/usr/include
+# When istalled in STAGING_DIR, llvm-config return include and lib
+# directories from STAGING_DIR.
+# output/staging/usr/bin/llvm-config --includedir
+# output/staging/usr/include
+define LLVM_COPY_LLVM_CONFIG_TO_STAGING_DIR
+	$(INSTALL) -D -m 0755 $(HOST_DIR)/usr/bin/llvm-config \
+		$(STAGING_DIR)/usr/bin/llvm-config
+endef
+LLVM_POST_INSTALL_STAGING_HOOKS = LLVM_COPY_LLVM_CONFIG_TO_STAGING_DIR
+
+# Make it explicit that we are cross-compiling
+LLVM_CONF_OPTS += -DCMAKE_CROSSCOMPILING=1
 
 # * LLVM_BUILD_UTILS: Build LLVM utility binaries. If OFF, just generate build targets.
+#   Keep llvm utility binaries for the host. llvm-tblgen is built anyway as CMakeLists.txt
+#   has add_subdirectory(utils/TableGen) unconditionally.
 HOST_LLVM_CONF_OPTS += -DLLVM_BUILD_UTILS=ON
+LLVM_CONF_OPTS += -DLLVM_BUILD_UTILS=OFF
 
 # * LLVM_INSTALL_UTILS: Include utility binaries in the 'install' target. ON for host.
 #   Utils : FileCheck, KillTheDoctor, llvm-PerfectShuffle, count, not, yaml-bench
 HOST_LLVM_CONF_OPTS += -DLLVM_INSTALL_UTILS=ON
+LLVM_CONF_OPTS += -DLLVM_INSTALL_UTILS=OFF
 
 # * LLVM_ENABLE_LIBEDIT: Use libedit if available
 #   Disabled since no host-libedit
 HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_LIBEDIT=OFF
+LLVM_CONF_OPTS += -DLLVM_ENABLE_LIBEDIT=OFF
 
 # * LLVM_INSTALL_TOOLCHAIN_ONLY "Only include toolchain files in the 'install' target. OFF
 #   We also want llvm libraries and modules.
 HOST_LLVM_CONF_OPTS += -DLLVM_INSTALL_TOOLCHAIN_ONLY=OFF
+LLVM_CONF_OPTS += -DLLVM_INSTALL_TOOLCHAIN_ONLY=OFF
 
 # * LLVM_APPEND_VC_REV "Append the version control system revision id to LLVM version OFF
 #   We build from a release archive without vcs
 HOST_LLVM_CONF_OPTS += -DLLVM_APPEND_VC_REV=OFF
+LLVM_CONF_OPTS += -DLLVM_APPEND_VC_REV=OFF
 
 # * BUILD_SHARED_LIBS Build all libraries as shared libraries instead of static
 #   It is only recommended to be used by LLVM developers.To build LLVM as a single
 #   shared library, we should use the LLVM_BUILD_LLVM_DYLIB option.
 HOST_LLVM_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
+LLVM_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
 
 # * LLVM_ENABLE_BACKTRACES: Enable embedding backtraces on crash ON
 #   Use backtraces on crash to report toolchain issue.
 HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_BACKTRACES=ON
+LLVM_CONF_OPTS += -DLLVM_ENABLE_BACKTRACES=OFF
 
 # * ENABLE_CRASH_OVERRIDES: Enable crash overrides ON
 #   Keep the possibility to install or overrides signal handlers
 HOST_LLVM_CONF_OPTS += -DENABLE_CRASH_OVERRIDES=ON
+LLVM_CONF_OPTS += -DENABLE_CRASH_OVERRIDES=ON
 
 # * LLVM_ENABLE_FFI: Use libffi to call external functions from the interpreter OFF
 #   Keep ffi disabled for now
 HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_FFI=OFF
+LLVM_CONF_OPTS += -DLLVM_ENABLE_FFI=OFF
 
 # * LLVM_ENABLE_TERMINFO: Use terminfo database if available.
 #   Disable terminfo database (needs ncurses libtinfo.so)
 HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_TERMINFO=OFF
+LLVM_CONF_OPTS += -DLLVM_ENABLE_TERMINFO=OFF
 
 # * LLVM_ENABLE_THREADS: Use threads if available ON
 #   Keep threads enabled
 HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_THREADS=ON
+LLVM_CONF_OPTS += -DLLVM_ENABLE_THREADS=ON
 
 # * LLVM_ENABLE_ZLIB: Use zlib for compression/decompression if available ON
 #   Keep zlib support enabled
 HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_ZLIB=ON
+LLVM_CONF_OPTS += -DLLVM_ENABLE_ZLIB=ON
 
 # * LLVM_ENABLE_PIC: Build Position-Independent Code ON
 #   We don't use llvm for static only build, so enable PIC
 HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_PIC=ON
+LLVM_CONF_OPTS += -DLLVM_ENABLE_PIC=ON
 
 # * LLVM_ENABLE_WARNINGS: Enable compiler warnings ON
 #   Keep compiler warning enabled
 HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_WARNINGS=ON
+LLVM_CONF_OPTS += -DLLVM_ENABLE_WARNINGS=ON
 
 # * LLVM_ENABLE_PEDANTIC: Compile with pedantic enabled ON
 #   Keep pedantic enabled
 HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_PEDANTIC=ON
+LLVM_CONF_OPTS += -DLLVM_ENABLE_PEDANTIC=ON
 
 # * LLVM_ENABLE_WERROR: Fail and stop if a warning is triggered OFF
 #   Keep Werror disabled
 HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_WERROR=OFF
+LLVM_CONF_OPTS += -DLLVM_ENABLE_WERROR=OFF
 
 # * CMAKE_BUILD_TYPE: Set build type Debug, Release, RelWithDebInfo, and MinSizeRel.
 #   Default is Debug. Use the Release build which requires considerably less space.
 HOST_LLVM_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
+LLVM_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
 
 # * LLVM_POLLY_BUILD: Build LLVM with Polly ON
 #   Keep it enabled, if POLLY is not in-tree it will not be built
 HOST_LLVM_CONF_OPTS += -DLLVM_POLLY_BUILD=ON
+LLVM_CONF_OPTS += -DLLVM_POLLY_BUILD=ON
 
 # * LINK_POLLY_INTO_TOOLS: Static link Polly into tools ON
 HOST_LLVM_CONF_OPTS += -DLLVM_POLLY_LINK_INTO_TOOLS=ON
+LLVM_CONF_OPTS += -DLLVM_POLLY_LINK_INTO_TOOLS=ON
 
 # * LLVM_INCLUDE_TOOLS: Generate build targets for the LLVM tools ON
 HOST_LLVM_CONF_OPTS += -DLLVM_INCLUDE_TOOLS=ON
+LLVM_CONF_OPTS += -DLLVM_INCLUDE_TOOLS=ON
 
 # * LLVM_BUILD_TOOLS: Build the LLVM tools
 #   Enabled for host
 HOST_LLVM_CONF_OPTS += -DLLVM_BUILD_TOOLS=ON
+LLVM_CONF_OPTS += -DLLVM_BUILD_TOOLS=OFF
 
 # * LLVM_INCLUDE_UTILS: Generate build targets for the LLVM utils.
 #   Enabled for host, disabled for the target.
 HOST_LLVM_CONF_OPTS += -DLLVM_INCLUDE_UTILS=ON
+LLVM_CONF_OPTS += -DLLVM_INCLUDE_UTILS=OFF
 
 # Do not build llvm runtime libraries
 HOST_LLVM_CONF_OPTS += -DLLVM_BUILD_RUNTIME=OFF \
 	-DLLVM_INCLUDE_RUNTIMES=OFF
+LLVM_CONF_OPTS += -DLLVM_BUILD_RUNTIME=OFF \
+	-DLLVM_INCLUDE_RUNTIMES=OFF
 
 # * LLVM_BUILD_EXAMPLES: Build the LLVM example programs OFF
 #   Don't build examples
 HOST_LLVM_CONF_OPTS += -DLLVM_BUILD_EXAMPLES=OFF \
 	-DLLVM_INCLUDE_EXAMPLES=OFF
+LLVM_CONF_OPTS += -DLLVM_BUILD_EXAMPLES=OFF \
+	-DLLVM_INCLUDE_EXAMPLES=OFF
 
 # * LLVM_BUILD_TESTS: Build LLVM unit tests OFF
 #   Don't build tests
 HOST_LLVM_CONF_OPTS += -DLLVM_BUILD_TESTS=OFF
+LLVM_CONF_OPTS += -DLLVM_BUILD_TESTS=OFF
 
 # * LLVM_INCLUDE_TESTS: Generate build targets for the LLVM unit tests OFF
 #   Don't build llvm unit tests
 HOST_LLVM_CONF_OPTS += -DLLVM_INCLUDE_TESTS=OFF
+LLVM_CONF_OPTS += -DLLVM_INCLUDE_TESTS=OFF
 
 # * LLVM_INCLUDE_GO_TESTS: Include the Go bindings tests in test build targets OFF
 #   Don't build Go tests
 HOST_LLVM_CONF_OPTS += -DLLVM_INCLUDE_GO_TESTS=OFF
+LLVM_CONF_OPTS += -DLLVM_INCLUDE_GO_TESTS=OFF
 
 # * LLVM_BUILD_DOCS: Build the llvm documentation OFF
 #   Disable llvm documentation
 HOST_LLVM_CONF_OPTS += -DLLVM_BUILD_DOCS=OFF
+LLVM_CONF_OPTS += -DLLVM_BUILD_DOCS=OFF
 
 # * LLVM_INCLUDE_DOCS: Generate build targets for llvm documentation OFF
 #   Don't build llvm documentation
 HOST_LLVM_CONF_OPTS += -DLLVM_INCLUDE_DOCS=OFF
+LLVM_CONF_OPTS += -DLLVM_INCLUDE_DOCS=OFF
 
 # * LLVM_ENABLE_DOXYGEN: Use doxygen to generate llvm API documentation OFF
 #   Don't build llvm API documentation
 HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_DOXYGEN=OFF
+LLVM_CONF_OPTS += -DLLVM_ENABLE_DOXYGEN=OFF
 
 # * LLVM_ENABLE_SPHINX: Use Sphinx to generate llvm documentation OFF
 #   Don't build llvm documentation
 HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_SPHINX=OFF
+LLVM_CONF_OPTS += -DLLVM_ENABLE_SPHINX=OFF
 
 # * LLVM_ENABLE_OCAMLDOC: Use OCaml bindings documentation OFF
 #   Don't build llvm documentation
 HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_OCAMLDOC=OFF
+LLVM_CONF_OPTS += -DLLVM_ENABLE_OCAMLDOC=OFF
 
 # * LLVM_BUILD_EXTERNAL_COMPILER_RT: Build compiler-rt as an external project OFF
 #   Keep rt compiler disabled
 HOST_LLVM_CONF_OPTS += -DLLVM_BUILD_EXTERNAL_COMPILER_RT=OFF
+LLVM_CONF_OPTS += -DLLVM_BUILD_EXTERNAL_COMPILER_RT=OFF
 
 # Get target architecture
 HOST_LLVM_TARGET_ARCH = $(call qstrip,$(BR2_PACKAGE_LLVM_TARGET_ARCH))
 
 # Build backend for target architecture
 HOST_LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD="$(HOST_LLVM_TARGET_ARCH)"
+LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD="$(HOST_LLVM_TARGET_ARCH)"
 
 # LLVM target to use for native code generation.
 HOST_LLVM_CONF_OPTS += -DLLVM_TARGET_ARCH=$(HOST_LLVM_TARGET_ARCH)
+LLVM_CONF_OPTS += -DLLVM_TARGET_ARCH=$(HOST_LLVM_TARGET_ARCH)
 
 # * LLVM_ENABLE_CXX1Y: Compile with C++1y enabled OFF
 #   Enable C++ and C++11 support if BR2_INSTALL_LIBSTDCPP=y
 HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_CXX1Y=$(if $(BR2_INSTALL_LIBSTDCPP),ON,OFF)
+LLVM_CONF_OPTS += -DLLVM_ENABLE_CXX1Y=$(if $(BR2_INSTALL_LIBSTDCPP),ON,OFF)
 
 # * LLVM_ENABLE_MODULES: Compile with C++ modules enabled OFF
 #   Disabled, requires sys/ndir.h header
 #   Disable debug in module
 HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_MODULES=OFF \
 	-DLLVM_ENABLE_MODULE_DEBUGGING=OFF
+LLVM_CONF_OPTS += -DLLVM_ENABLE_MODULES=OFF \
+	-DLLVM_ENABLE_MODULE_DEBUGGING=OFF
 
 # * LLVM_ENABLE_LIBCXX: Use libc++ if available OFF
 #   Use -stdlib=libc++ compiler flag, use libc++ as C++ standard library
 HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_LIBCXX=OFF
+LLVM_CONF_OPTS += -DLLVM_ENABLE_LIBCXX=OFF
 
 # * LLVM_ENABLE_LLD: Use lld as C and C++ linker. OFF
 HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_LLD=OFF
+LLVM_CONF_OPTS += -DLLVM_ENABLE_LLD=OFF
 
 # * LLVM_DEFAULT_TARGET_TRIPLE: by default, generate code for the target
 HOST_LLVM_CONF_OPTS += -DLLVM_DEFAULT_TARGET_TRIPLE=$(GNU_TARGET_NAME)
+LLVM_CONF_OPTS += -DLLVM_DEFAULT_TARGET_TRIPLE=$(GNU_TARGET_NAME)
+
+# Need to specify triple for native code generation
+# This solves "No available targets are compatible for this triple" with llvmpipe
+LLVM_CONF_OPTS += -DLLVM_HOST_TRIPLE=$(GNU_TARGET_NAME)
 
 # * The Go bindings have no CMake rules at the moment, but better remove the
 # check preventively. Building the Go and OCaml bindings is yet unsupported.
@@ -197,11 +272,13 @@ HOST_LLVM_CONF_OPTS += \
 
 # Builds a release tablegen that gets used during the LLVM build.
 HOST_LLVM_CONF_OPTS += -DLLVM_OPTIMIZED_TABLEGEN=ON
+LLVM_CONF_OPTS += -DLLVM_OPTIMIZED_TABLEGEN=ON
 
 # * Generate libLLVM.so. This library contains a default set of LLVM components
 # that can be overridden with "LLVM_DYLIB_COMPONENTS". The default contains
 # most of LLVM and is defined in "tools/llvm-shlib/CMakelists.txt".
 HOST_LLVM_CONF_OPTS += -DLLVM_BUILD_LLVM_DYLIB=ON
+LLVM_CONF_OPTS += -DLLVM_BUILD_LLVM_DYLIB=ON
 
 # * Link tools with libLLVM shared library. If set to ON, it sets
 # LLVM_BUILD_LLVM_DYLIB to ON. We need to enable this option for the
@@ -210,8 +287,10 @@ HOST_LLVM_CONF_OPTS += -DLLVM_BUILD_LLVM_DYLIB=ON
 # does not work properly. For example, it assumes that LLVM is built statically
 # and cannot find libLLVM.so.
 HOST_LLVM_CONF_OPTS += -DLLVM_LINK_LLVM_DYLIB=ON
+LLVM_CONF_OPTS += -DLLVM_LINK_LLVM_DYLIB=ON
 
 # Install libLLVM and tools in HOST_DIR/usr
 HOST_LLVM_CONF_OPTS += -DCMAKE_INSTALL_PREFIX=$(HOST_DIR)/usr
 
+$(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.14.3
