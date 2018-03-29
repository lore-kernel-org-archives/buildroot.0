From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Thu, 29 Mar 2018 13:33:36 +0200
Subject: [Buildroot] [PATCH v4 01/11] package/llvm: new host package
In-Reply-To: <20180329113346.10367-1-valentin.korenblit@smile.fr>
References: <20180329113346.10367-1-valentin.korenblit@smile.fr>
Message-ID: <20180329113346.10367-2-valentin.korenblit@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch installs LLVM on the host machine: tools and libraries.

In order to cross-compile LLVM for the target, LLVM
must be installed on the host, or at least llvm-tblgen.
This is necessary as the path to host's llvm-tblgen must
be specified when cross-compiling using the option LLVM_TABLEGEN.
Also, a version of llvm-config that can run on the host will
be required by packages that link with LLVM libraries, so we
need to generate it and install it in STAGING_DIR/usr/bin.

It is important to remark why we need llvm-config(host variant)
installed in STAGING dir. This tool is necessary to build
applications that use LLVM, as it prints the compiler flags,
linker flags and object libraries needed to link against LLVM libs.

More info: https://bugs.chromium.org/p/chromium/issues/detail?id=219369

The original idea was to compile only llvm-tblgen and llvm-config
for the host, as they are the only necessary componentes. However,
llvm-config tool does not work as expected if it is not linked with
libLLVM.so, so we must also enable LLVM_LINK_LLVM_DYLIB, what builds
LLVM as a single shared library and links LLVM tools with it.

More info: https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=224847
in comment #11.

If we don't build full LLVM for the host, it would be necessary to
patch configure.ac from mesa3d if we want dynamic linking, because it
uses llvm-config (host variant installed in STAGING_DIR) to get the
necessary LLVM libraries to link with, what has the following problems:

llvm-config --shared mode outputs static (even if LLVM is built as
one shared library)

llvm-config --libs outputs all LLVM tiny libs: -lLLVMLTO, -lLLVMPasses,etc.

Mesa tries to execute: llvm-config --link-shared --libs, but this outputs
llvm-config: error: libLLVM-5.0.so is missing.

Given that these problems may arise with other packages that use LLVM, it
is preferable to do a full build for the host. Also, having a complete
installation of LLVM on the host will also facilitate the integration
of Clang front-end, what is going to be added in a future patch.

As this package is intended to be used together with Mesa3D to enable llvmpipe,
we target x86 architecture. Mesa strongly recommends support for SSE2. Support
for SSE3 and SSE4.1 will yield the most efficient code.

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
---
 DEVELOPERS                  |   3 +
 package/Config.in.host      |   1 +
 package/llvm/Config.in.host |  17 ++++
 package/llvm/llvm.hash      |   3 +
 package/llvm/llvm.mk        | 217 ++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 241 insertions(+)
 create mode 100644 package/llvm/Config.in.host
 create mode 100644 package/llvm/llvm.hash
 create mode 100644 package/llvm/llvm.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 40fda40bda..3ed9407670 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1858,6 +1858,9 @@ N:	Tzu-Jung Lee <roylee17@gmail.com>
 F:	package/dropwatch/
 F:	package/tstools/
 
+N:	Valentin Korenblit <valentin.korenblit@smile.fr>
+F:	package/llvm/
+
 N:	Vanya Sergeev <vsergeev@gmail.com>
 F:	package/lua-periphery/
 
diff --git a/package/Config.in.host b/package/Config.in.host
index 199a8e9856..9a6227174b 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -27,6 +27,7 @@ menu "Host utilities"
 	source "package/imx-usb-loader/Config.in.host"
 	source "package/jq/Config.in.host"
 	source "package/jsmin/Config.in.host"
+	source "package/llvm/Config.in.host"
 	source "package/lpc3250loader/Config.in.host"
 	source "package/lttng-babeltrace/Config.in.host"
 	source "package/mfgtools/Config.in.host"
diff --git a/package/llvm/Config.in.host b/package/llvm/Config.in.host
new file mode 100644
index 0000000000..26ee7e28bb
--- /dev/null
+++ b/package/llvm/Config.in.host
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	bool
+	default y if BR2_i386 || BR2_x86_64
+	depends on BR2_HOST_GCC_AT_LEAST_4_8
+
+config BR2_PACKAGE_LLVM_TARGET_ARCH
+	string
+	default "X86" if BR2_i386 || BR2_x86_64
+
+config BR2_PACKAGE_HOST_LLVM
+	bool "host llvm"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	help
+	  The LLVM Project is a collection of modular and reusable
+	  compiler and toolchain technologies.
+
+	  http://llvm.org
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
index 0000000000..71fcaa2b8e
--- /dev/null
+++ b/package/llvm/llvm.mk
@@ -0,0 +1,217 @@
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
+
+# http://llvm.org/docs/GettingStarted.html#software
+# host-python: Python interpreter 2.7 or newer is required for builds and testing.
+# host-zlib: Optional, adds compression / uncompression capabilities to selected LLVM tools.
+HOST_LLVM_DEPENDENCIES = host-python host-zlib
+
+# Don't build clang libcxx libcxxabi lldb compiler-rt lld polly as llvm subprojects
+HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_PROJECTS=""
+
+# Disable CCACHE
+HOST_LLVM_CONF_OPTS += -DLLVM_CCACHE_BUILD=OFF
+
+# Disable Build GlobalIsel
+HOST_LLVM_CONF_OPTS += -DLLVM_BUILD_GLOBAL_ISEL=OFF
+
+# * Use "Unix Makefiles" generator for generating make-compatible parallel makefiles.
+#   Ninja is not supported yet by Buildroot
+HOST_LLVM_CONF_OPTS += -G "Unix Makefiles"
+
+# * LLVM_BUILD_UTILS: Build LLVM utility binaries. If OFF, just generate build targets.
+HOST_LLVM_CONF_OPTS += -DLLVM_BUILD_UTILS=ON
+
+# * LLVM_INSTALL_UTILS: Include utility binaries in the 'install' target. ON for host.
+#   Utils : FileCheck, KillTheDoctor, llvm-PerfectShuffle, count, not, yaml-bench
+HOST_LLVM_CONF_OPTS += -DLLVM_INSTALL_UTILS=ON
+
+# * LLVM_ENABLE_LIBEDIT: Use libedit if available
+#   Disabled since no host-libedit
+HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_LIBEDIT=OFF
+
+# * LLVM_INSTALL_TOOLCHAIN_ONLY "Only include toolchain files in the 'install' target. OFF
+#   We also want llvm libraries and modules.
+HOST_LLVM_CONF_OPTS += -DLLVM_INSTALL_TOOLCHAIN_ONLY=OFF
+
+# * LLVM_APPEND_VC_REV "Append the version control system revision id to LLVM version OFF
+#   We build from a release archive without vcs
+HOST_LLVM_CONF_OPTS += -DLLVM_APPEND_VC_REV=OFF
+
+# * BUILD_SHARED_LIBS Build all libraries as shared libraries instead of static
+#   It is only recommended to be used by LLVM developers.To build LLVM as a single
+#   shared library, we should use the LLVM_BUILD_LLVM_DYLIB option.
+HOST_LLVM_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
+
+# * LLVM_ENABLE_BACKTRACES: Enable embedding backtraces on crash ON
+#   Use backtraces on crash to report toolchain issue.
+HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_BACKTRACES=ON
+
+# * ENABLE_CRASH_OVERRIDES: Enable crash overrides ON
+#   Keep the possibility to install or overrides signal handlers
+HOST_LLVM_CONF_OPTS += -DENABLE_CRASH_OVERRIDES=ON
+
+# * LLVM_ENABLE_FFI: Use libffi to call external functions from the interpreter OFF
+#   Keep ffi disabled for now
+HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_FFI=OFF
+
+# * LLVM_ENABLE_TERMINFO: Use terminfo database if available.
+#   Disable terminfo database (needs ncurses libtinfo.so)
+HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_TERMINFO=OFF
+
+# * LLVM_ENABLE_THREADS: Use threads if available ON
+#   Keep threads enabled
+HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_THREADS=ON
+
+# * LLVM_ENABLE_ZLIB: Use zlib for compression/decompression if available ON
+#   Keep zlib support enabled
+HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_ZLIB=ON
+
+# * LLVM_ENABLE_PIC: Build Position-Independent Code ON
+#   We don't use llvm for static only build, so enable PIC
+HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_PIC=ON
+
+# * LLVM_ENABLE_WARNINGS: Enable compiler warnings ON
+#   Keep compiler warning enabled
+HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_WARNINGS=ON
+
+# * LLVM_ENABLE_PEDANTIC: Compile with pedantic enabled ON
+#   Keep pedantic enabled
+HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_PEDANTIC=ON
+
+# * LLVM_ENABLE_WERROR: Fail and stop if a warning is triggered OFF
+#   Keep Werror disabled
+HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_WERROR=OFF
+
+# * CMAKE_BUILD_TYPE: Set build type Debug, Release, RelWithDebInfo, and MinSizeRel.
+#   Default is Debug. Use the Release build which requires considerably less space.
+HOST_LLVM_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
+
+# * LLVM_POLLY_BUILD: Build LLVM with Polly ON
+#   Keep it enabled, if POLLY is not in-tree it will not be built
+HOST_LLVM_CONF_OPTS += -DLLVM_POLLY_BUILD=ON
+
+# * LINK_POLLY_INTO_TOOLS: Static link Polly into tools ON
+HOST_LLVM_CONF_OPTS += -DLLVM_POLLY_LINK_INTO_TOOLS=ON
+
+# * LLVM_INCLUDE_TOOLS: Generate build targets for the LLVM tools ON
+HOST_LLVM_CONF_OPTS += -DLLVM_INCLUDE_TOOLS=ON
+
+# * LLVM_BUILD_TOOLS: Build the LLVM tools
+#   Enabled for host
+HOST_LLVM_CONF_OPTS += -DLLVM_BUILD_TOOLS=ON
+
+# * LLVM_INCLUDE_UTILS: Generate build targets for the LLVM utils.
+#   Enabled for host, disabled for the target.
+HOST_LLVM_CONF_OPTS += -DLLVM_INCLUDE_UTILS=ON
+
+# Do not build llvm runtime libraries
+HOST_LLVM_CONF_OPTS += -DLLVM_BUILD_RUNTIME=OFF \
+	-DLLVM_INCLUDE_RUNTIMES=OFF
+
+# * LLVM_BUILD_EXAMPLES: Build the LLVM example programs OFF
+#   Don't build examples
+HOST_LLVM_CONF_OPTS += -DLLVM_BUILD_EXAMPLES=OFF \
+	-DLLVM_INCLUDE_EXAMPLES=OFF
+
+# * LLVM_BUILD_TESTS: Build LLVM unit tests OFF
+#   Don't build tests
+HOST_LLVM_CONF_OPTS += -DLLVM_BUILD_TESTS=OFF
+
+# * LLVM_INCLUDE_TESTS: Generate build targets for the LLVM unit tests OFF
+#   Don't build llvm unit tests
+HOST_LLVM_CONF_OPTS += -DLLVM_INCLUDE_TESTS=OFF
+
+# * LLVM_INCLUDE_GO_TESTS: Include the Go bindings tests in test build targets OFF
+#   Don't build Go tests
+HOST_LLVM_CONF_OPTS += -DLLVM_INCLUDE_GO_TESTS=OFF
+
+# * LLVM_BUILD_DOCS: Build the llvm documentation OFF
+#   Disable llvm documentation
+HOST_LLVM_CONF_OPTS += -DLLVM_BUILD_DOCS=OFF
+
+# * LLVM_INCLUDE_DOCS: Generate build targets for llvm documentation OFF
+#   Don't build llvm documentation
+HOST_LLVM_CONF_OPTS += -DLLVM_INCLUDE_DOCS=OFF
+
+# * LLVM_ENABLE_DOXYGEN: Use doxygen to generate llvm API documentation OFF
+#   Don't build llvm API documentation
+HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_DOXYGEN=OFF
+
+# * LLVM_ENABLE_SPHINX: Use Sphinx to generate llvm documentation OFF
+#   Don't build llvm documentation
+HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_SPHINX=OFF
+
+# * LLVM_ENABLE_OCAMLDOC: Use OCaml bindings documentation OFF
+#   Don't build llvm documentation
+HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_OCAMLDOC=OFF
+
+# * LLVM_BUILD_EXTERNAL_COMPILER_RT: Build compiler-rt as an external project OFF
+#   Keep rt compiler disabled
+HOST_LLVM_CONF_OPTS += -DLLVM_BUILD_EXTERNAL_COMPILER_RT=OFF
+
+# Get target architecture
+HOST_LLVM_TARGET_ARCH = $(call qstrip,$(BR2_PACKAGE_LLVM_TARGET_ARCH))
+
+# Build backend for target architecture
+HOST_LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD="$(HOST_LLVM_TARGET_ARCH)"
+
+# LLVM target to use for native code generation.
+HOST_LLVM_CONF_OPTS += -DLLVM_TARGET_ARCH=$(HOST_LLVM_TARGET_ARCH)
+
+# * LLVM_ENABLE_CXX1Y: Compile with C++1y enabled OFF
+#   Enable C++ and C++11 support if BR2_INSTALL_LIBSTDCPP=y
+HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_CXX1Y=$(if $(BR2_INSTALL_LIBSTDCPP),ON,OFF)
+
+# * LLVM_ENABLE_MODULES: Compile with C++ modules enabled OFF
+#   Disabled, requires sys/ndir.h header
+#   Disable debug in module
+HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_MODULES=OFF \
+	-DLLVM_ENABLE_MODULE_DEBUGGING=OFF
+
+# * LLVM_ENABLE_LIBCXX: Use libc++ if available OFF
+#   Use -stdlib=libc++ compiler flag, use libc++ as C++ standard library
+HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_LIBCXX=OFF
+
+# * LLVM_ENABLE_LLD: Use lld as C and C++ linker. OFF
+HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_LLD=OFF
+
+# * LLVM_DEFAULT_TARGET_TRIPLE: by default, generate code for the target
+HOST_LLVM_CONF_OPTS += -DLLVM_DEFAULT_TARGET_TRIPLE=$(GNU_TARGET_NAME)
+
+# * The Go bindings have no CMake rules at the moment, but better remove the
+# check preventively. Building the Go and OCaml bindings is yet unsupported.
+HOST_LLVM_CONF_OPTS += \
+	-DGO_EXECUTABLE=GO_EXECUTABLE-NOTFOUND \
+	-DOCAMLFIND=OCAMLFIND-NOTFOUND
+
+# Builds a release tablegen that gets used during the LLVM build.
+HOST_LLVM_CONF_OPTS += -DLLVM_OPTIMIZED_TABLEGEN=ON
+
+# * Generate libLLVM.so. This library contains a default set of LLVM components
+# that can be overridden with "LLVM_DYLIB_COMPONENTS". The default contains
+# most of LLVM and is defined in "tools/llvm-shlib/CMakelists.txt".
+HOST_LLVM_CONF_OPTS += -DLLVM_BUILD_LLVM_DYLIB=ON
+
+# * Link tools with libLLVM shared library. If set to ON, it sets
+# LLVM_BUILD_LLVM_DYLIB to ON. We need to enable this option for the
+# host as llvm-config for the host will be used in STAGING_DIR by packages
+# linking against libLLVM and if this option is not selected, then llvm-config
+# does not work properly. For example, it assumes that LLVM is built statically
+# and cannot find libLLVM.so.
+HOST_LLVM_CONF_OPTS += -DLLVM_LINK_LLVM_DYLIB=ON
+
+# Install libLLVM and tools in HOST_DIR/usr
+HOST_LLVM_CONF_OPTS += -DCMAKE_INSTALL_PREFIX=$(HOST_DIR)/usr
+
+$(eval $(host-cmake-package))
-- 
2.14.3
