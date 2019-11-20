From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Wed, 20 Nov 2019 17:39:21 +0000
Subject: [Buildroot] [RFC PATCH v3 07/30] package/compiler-rt: new package
In-Reply-To: <20191120173944.130142-1-thomas.preston@codethink.co.uk>
References: <20191120173944.130142-1-thomas.preston@codethink.co.uk>
Message-ID: <20191120173944.130142-8-thomas.preston@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Weber <matthew.weber@rockwellcollins.com>

This patch adds support for the compiler-rt (CLANG runtime) library.
It builds a set of static libraries and installs them into the
CLANG/LLVM toolchain resource folder.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Cc: Romain Naour <romain.naour@smile.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/clang/clang.mk               |  2 +-
 package/compiler-rt/Config.in        | 14 +++++++++++
 package/compiler-rt/compiler-rt.hash |  2 ++
 package/compiler-rt/compiler-rt.mk   | 35 ++++++++++++++++++++++++++++
 package/lld/lld.mk                   |  2 +-
 package/llvm/llvm.mk                 |  2 +-
 8 files changed, 56 insertions(+), 3 deletions(-)
 create mode 100644 package/compiler-rt/Config.in
 create mode 100644 package/compiler-rt/compiler-rt.hash
 create mode 100644 package/compiler-rt/compiler-rt.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 991be89849..47923399eb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1535,6 +1535,7 @@ F:	package/bridge-utils/
 F:	package/checkpolicy/
 F:	package/checksec/
 F:	package/cgroupfs-mount/
+F:	package/compiler-rt/
 F:	package/crda/
 F:	package/cunit/
 F:	package/dacapo/
diff --git a/package/Config.in b/package/Config.in
index f72c77b416..f3c69b60c2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1703,6 +1703,7 @@ menu "Other"
 	source "package/clapack/Config.in"
 	source "package/classpath/Config.in"
 	source "package/cmocka/Config.in"
+	source "package/compiler-rt/Config.in"
 	source "package/cppcms/Config.in"
 	source "package/cracklib/Config.in"
 	source "package/dawgdic/Config.in"
diff --git a/package/clang/clang.mk b/package/clang/clang.mk
index 87bdf52e8d..2e33229eb3 100644
--- a/package/clang/clang.mk
+++ b/package/clang/clang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-# LLVM, Clang and lld should be version bumped together
+# LLVM, Clang, lld, and Compiler-rt should be version bumped together
 CLANG_VERSION = 9.0.0
 CLANG_SITE = http://llvm.org/releases/$(CLANG_VERSION)
 CLANG_SOURCE = cfe-$(CLANG_VERSION).src.tar.xz
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
index 0000000000..b17a96edc7
--- /dev/null
+++ b/package/compiler-rt/compiler-rt.hash
@@ -0,0 +1,2 @@
+sha256 56e4cd96dd1d8c346b07b4d6b255f976570c6f2389697347a6c3dcb9e820d10e  compiler-rt-9.0.0.src.tar.xz
+sha256 1a8f1058753f1ba890de984e48f0242a3a5c29a6a8f2ed9fd813f36985387e8d  LICENSE.TXT
diff --git a/package/compiler-rt/compiler-rt.mk b/package/compiler-rt/compiler-rt.mk
new file mode 100644
index 0000000000..febd71b906
--- /dev/null
+++ b/package/compiler-rt/compiler-rt.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# compiler-rt
+#
+################################################################################
+
+# LLVM, Clang, lld, and Compiler-rt should be version bumped together
+COMPILER_RT_VERSION = 9.0.0
+COMPILER_RT_SOURCE = compiler-rt-$(COMPILER_RT_VERSION).src.tar.xz
+COMPILER_RT_SITE = http://llvm.org/releases/$(COMPILER_RT_VERSION)
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
+endef
+COMPILER_RT_POST_INSTALL_STAGING_HOOKS += COMPILER_RT_SETUP_RUNTIME_LIBS
+
+$(eval $(cmake-package))
diff --git a/package/lld/lld.mk b/package/lld/lld.mk
index bba608d64a..ccba3ae180 100644
--- a/package/lld/lld.mk
+++ b/package/lld/lld.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-# LLVM, Clang and lld should be version bumped together
+# LLVM, Clang, lld, and Compiler-rt should be version bumped together
 LLD_VERSION = 9.0.0
 LLD_SITE = https://llvm.org/releases/$(LLD_VERSION)
 LLD_SOURCE = lld-$(LLD_VERSION).src.tar.xz
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index d15ca80d75..fc147e6d12 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-# LLVM, Clang and lld should be version bumped together
+# LLVM, Clang, lld, and Compiler-rt should be version bumped together
 LLVM_VERSION = 9.0.0
 LLVM_SITE = http://llvm.org/releases/$(LLVM_VERSION)
 LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
-- 
2.20.1
