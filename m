From: Matt Weber <Matthew.Weber@collins.com>
Date: Mon,  3 Dec 2018 22:08:44 -0600
Subject: [Buildroot] [PATCH v5 1/7] package/compiler-rt: new package
Message-ID: <1543896530-33550-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds support for the compiler-rt (CLANG runtime) library.
It builds a set of static libraries and installs them into the
CLANG/LLVM toolchain resource folder.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Cc: Romain Naour <romain.naour@smile.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
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
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/compiler-rt/Config.in        | 14 ++++++++++++++
 package/compiler-rt/compiler-rt.hash |  3 +++
 package/compiler-rt/compiler-rt.mk   | 34 ++++++++++++++++++++++++++++++++++
 5 files changed, 53 insertions(+)
 create mode 100644 package/compiler-rt/Config.in
 create mode 100644 package/compiler-rt/compiler-rt.hash
 create mode 100644 package/compiler-rt/compiler-rt.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ad80d36..6946cc3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1374,6 +1374,7 @@ F:	package/bridge-utils/
 F:	package/checkpolicy/
 F:	package/checksec/
 F:	package/cgroupfs-mount/
+F:	package/compiler-rt/
 F:	package/crda/
 F:	package/cunit/
 F:	package/devmem2/
diff --git a/package/Config.in b/package/Config.in
index 0339ec7..dac18dc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1611,6 +1611,7 @@ menu "Other"
 	source "package/clapack/Config.in"
 	source "package/classpath/Config.in"
 	source "package/cmocka/Config.in"
+	source "package/compiler-rt/Config.in"
 	source "package/cppcms/Config.in"
 	source "package/cracklib/Config.in"
 	source "package/dawgdic/Config.in"
diff --git a/package/compiler-rt/Config.in b/package/compiler-rt/Config.in
new file mode 100644
index 0000000..9afc0d9
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
index 0000000..df6ed19
--- /dev/null
+++ b/package/compiler-rt/compiler-rt.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256 bdec7fe3cf2c85f55656c07dfb0bd93ae46f2b3dd8f33ff3ad6e7586f4c670d6  compiler-rt-7.0.0.src.tar.xz
+sha256 417541d990edb3f96327ac03cb67e52eac80fc5c3e7afc69213cd04d7c3b9b27  LICENSE.TXT
diff --git a/package/compiler-rt/compiler-rt.mk b/package/compiler-rt/compiler-rt.mk
new file mode 100644
index 0000000..8a3c98d
--- /dev/null
+++ b/package/compiler-rt/compiler-rt.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# compiler-rt
+#
+################################################################################
+
+# Compiler-RT should be bumped together with LLVM and Clang as the run-time is
+# tied to the version of those tools
+COMPILER_RT_VERSION = 7.0.0
+COMPILER_RT_SOURCE = compiler-rt-$(COMPILER_RT_VERSION).src.tar.xz
+COMPILER_RT_SITE = http://llvm.org/releases/$(COMPILER_RT_VERSION)
+COMPILER_RT_LICENSE = NCSA MIT
+COMPILER_RT_LICENSE_FILES = LICENSE.TXT
+COMPILER_RT_DEPENDENCIES = host-clang llvm
+
+COMPILER_RT_INSTALL_STAGING = YES
+COMPILER_RT_INSTALL_TARGET = NO
+
+COMPILER_RT_CONF_OPTS=-DCOMPILER_RT_INCLUDE_TESTS=ON \
+	-DCOMPILER_RT_STANDALONE_BUILD=ON \
+	-DCOMPILER_RT_DEFAULT_TARGET_TRIPLE=$(GNU_TARGET_NAME) \
+	-DLLVM_CONFIG_PATH=$(HOST_DIR)/usr/bin/llvm-config
+
+# The installation of the target runtime libraries defaults to DESTDIR, however
+# the host-clang resources directory needs a link so Clang can find the runtime
+# libraries in the same location they would be if built as part of the Clang
+# build (vs this standalone build).
+define COMPILER_RT_SETUP_RUNTIME_LIBS
+	mkdir -p $(HOST_DIR)/lib/clang/$(HOST_CLANG_VERSION)/lib
+	ln -sf ../../../../$(GNU_TARGET_NAME)/sysroot/usr/lib/linux $(HOST_DIR)/lib/clang/$(HOST_CLANG_VERSION)/lib/linux
+endef
+COMPILER_RT_POST_INSTALL_STAGING_HOOKS += COMPILER_RT_SETUP_RUNTIME_LIBS
+
+$(eval $(cmake-package))
-- 
1.9.1
