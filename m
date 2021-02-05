From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri,  5 Feb 2021 12:43:42 -0600
Subject: [Buildroot] [PATCH v10 3/4] package/compiler-rt: new package
In-Reply-To: <20210205184343.57068-1-matthew.weber@rockwellcollins.com>
References: <20210205184343.57068-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210205184343.57068-3-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds support for the compiler-rt (CLANG runtime) library.
It builds a set of static libraries and installs them into the
CLANG/LLVM toolchain resource folder. These libraries can then be
used by developers in the SDK for building target applications for
analysis.

What is fuzzing and why libfuzzer?
https://www.moritz.systems/blog/an-introduction-to-llvm-libfuzzer/

The compiler-rt fuzzer and address sanitizer tools require additional
LLVM binary tools installed to allow stack trace decoding actively during
executable analysis.  This patch conditionally enables these tools.
https://github.com/google/sanitizers/wiki/AddressSanitizerCallStack

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Cc: Romain Naour <romain.naour@smile.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
Cc: Michael Drake <michael.drake@codethink.co.uk>

---
Changes
v1 -> v2
[Romain
 - Removed unnecessary host-cmake dependency

v2 -> v3
[Romain
 - Update to use COMPILER_RT_INSTALL_PATH for library install
[Ricardo
 - Fixed check-package extra line
 - Spelling in commit message

v3 -> v4
[Valentin
 - Pointed out that non-glibc libraries won't build. Further
   investigation shows that the lib asan support in compiler-rt
   doesn't have the libc checks yet to support multiple libraries.
   (https://patchwork.ozlabs.org/patch/339938/ was the best example
    I could find and it doesn't look like anything has changed in the
    recent codebase)

v4 -> v5
[Thomas P
 - Revisited staging install step and found a cleaner way to use the
   default and then a hook to setup the runtime library path

v6
 - Bumped to 7.0.1 to match current LLVM/Clang version

v7
 - Rebased on master for 8.0 LLVM/Clang version
 - Added comment about bumping verions of LLVM/Clang and Compiler-rt
   together
[Romain
 - Disabled test cases (-DCOMPILER_RT_INCLUDE_TESTS=OFF)

v8
 - Rebased and updated version to 9.x to match llvm/clang

[Romain
 - Squashed "[v7,1/5]package/llvm: install target binary/debug tools" to
   be included in this patch

[Michael D
 - compiler-rt symlink creation to include shared folder such
   that control flow lists work

v9
 - Rebased post 2020.05

v10
 - Switched compiler-rt site to point towards new github project
 - Updated compiler-rt version to 11.0.0
 - Tested against master[8640e8ffde3f61c5838] using
   support/testing/run-tests -o runtest -k \
      tests.package.test_clang.TestClangCompilerRT
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/compiler-rt/Config.in        | 14 +++++++++++
 package/compiler-rt/compiler-rt.hash |  3 +++
 package/compiler-rt/compiler-rt.mk   | 37 ++++++++++++++++++++++++++++
 package/llvm/llvm.mk                 | 11 ++++++++-
 6 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 package/compiler-rt/Config.in
 create mode 100644 package/compiler-rt/compiler-rt.hash
 create mode 100644 package/compiler-rt/compiler-rt.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c750105623..cc365c42ed 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1709,6 +1709,7 @@ F:	package/bridge-utils/
 F:	package/checkpolicy/
 F:	package/checksec/
 F:	package/cgroupfs-mount/
+F:	package/compiler-rt/
 F:	package/crda/
 F:	package/cunit/
 F:	package/dacapo/
diff --git a/package/Config.in b/package/Config.in
index 06dfc32cc6..61ec54fd38 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1856,6 +1856,7 @@ menu "Other"
 	source "package/clang/Config.in"
 	source "package/clapack/Config.in"
 	source "package/cmocka/Config.in"
+	source "package/compiler-rt/Config.in"
 	source "package/cppcms/Config.in"
 	source "package/cracklib/Config.in"
 	source "package/dawgdic/Config.in"
diff --git a/package/compiler-rt/Config.in b/package/compiler-rt/Config.in
new file mode 100644
index 0000000000..9afc0d9d60
--- /dev/null
+++ b/package/compiler-rt/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_COMPILER_RT
+	bool "compiler-rt"
+	depends on BR2_PACKAGE_LLVM
+	depends on BR2_TOOLCHAIN_USES_GLIBC # asan lib requires
+	help
+	  A collection of runtime libraries primarily used by clang and
+	  llvm to provide builtins, sanitizer runtimes, and profiling
+	  at runtime.
+
+	  https://compiler-rt.llvm.org/
+
+comment "compiler-rt requires llvm to be enabled and a glibc toolchain"
+	depends on !BR2_PACKAGE_LLVM
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/compiler-rt/compiler-rt.hash b/package/compiler-rt/compiler-rt.hash
new file mode 100644
index 0000000000..dfdad8cddc
--- /dev/null
+++ b/package/compiler-rt/compiler-rt.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256 374aff82ff573a449f9aabbd330a5d0a441181c535a3599996127378112db234  compiler-rt-11.0.0.src.tar.xz
+sha256 1a8f1058753f1ba890de984e48f0242a3a5c29a6a8f2ed9fd813f36985387e8d  LICENSE.TXT
diff --git a/package/compiler-rt/compiler-rt.mk b/package/compiler-rt/compiler-rt.mk
new file mode 100644
index 0000000000..0652717f3f
--- /dev/null
+++ b/package/compiler-rt/compiler-rt.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# compiler-rt
+#
+################################################################################
+
+# Compiler-RT should be bumped together with LLVM and Clang as the run-time is
+# tied to the version of those tools
+COMPILER_RT_VERSION = 11.0.0
+COMPILER_RT_SOURCE = compiler-rt-$(COMPILER_RT_VERSION).src.tar.xz
+COMPILER_RT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(COMPILER_RT_VERSION)
+COMPILER_RT_LICENSE = NCSA MIT
+COMPILER_RT_LICENSE_FILES = LICENSE.TXT
+COMPILER_RT_DEPENDENCIES = host-clang llvm
+
+COMPILER_RT_INSTALL_STAGING = YES
+COMPILER_RT_INSTALL_TARGET = NO
+
+COMPILER_RT_CONF_OPTS=-DCOMPILER_RT_STANDALONE_BUILD=OFF \
+	-DCOMPILER_RT_STANDALONE_BUILD=ON \
+	-DCOMPILER_RT_DEFAULT_TARGET_TRIPLE=$(GNU_TARGET_NAME) \
+	-DLLVM_CONFIG_PATH=$(HOST_DIR)/usr/bin/llvm-config
+
+# The installation of the target runtime libraries defaults to DESTDIR, however
+# host-clang resources directory needs a link so Clang can find the runtime
+# libraries in the same location they would be if built as part of the Clang
+# build. The "resources" directory is loosely documented and seems to be
+# assumed, as compiler-rt is usually build at the same time as Clang and not
+# standalone.
+define COMPILER_RT_SETUP_RUNTIME_LIBS
+	mkdir -p $(HOST_DIR)/lib/clang/$(HOST_CLANG_VERSION)/lib
+	ln -sf ../../../../$(GNU_TARGET_NAME)/sysroot/usr/lib/linux $(HOST_DIR)/lib/clang/$(HOST_CLANG_VERSION)/lib/linux
+	ln -sf ../../../../$(GNU_TARGET_NAME)/sysroot/usr/share $(HOST_DIR)/lib/clang/$(HOST_CLANG_VERSION)/share
+endef
+COMPILER_RT_POST_INSTALL_STAGING_HOOKS += COMPILER_RT_SETUP_RUNTIME_LIBS
+
+$(eval $(cmake-package))
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 069312bb3f..6efdebdde4 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -215,8 +215,17 @@ HOST_LLVM_CONF_OPTS += \
 # We need to activate LLVM_INCLUDE_TOOLS, otherwise it does not generate
 # libLLVM.so
 LLVM_CONF_OPTS += \
-	-DLLVM_INCLUDE_TOOLS=ON \
+	-DLLVM_INCLUDE_TOOLS=ON
+
+# The llvm-symbolizer binary is used by the Compiler-RT Fuzzer
+# and AddressSanitizer tools for stack traces.
+ifeq ($(BR2_PACKAGE_COMPILER_RT),y)
+LLVM_CONF_OPTS += \
+	-DLLVM_BUILD_TOOLS=ON
+else
+LLVM_CONF_OPTS += \
 	-DLLVM_BUILD_TOOLS=OFF
+endif
 
 ifeq ($(BR2_PACKAGE_LLVM_RTTI),y)
 HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_RTTI=ON
-- 
2.17.1
