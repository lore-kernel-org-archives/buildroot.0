From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Thu, 29 Mar 2018 13:33:43 +0200
Subject: [Buildroot] [PATCH v4 08/11] package/clang: enable target variant
In-Reply-To: <20180329113346.10367-1-valentin.korenblit@smile.fr>
References: <20180329113346.10367-1-valentin.korenblit@smile.fr>
Message-ID: <20180329113346.10367-9-valentin.korenblit@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch provides Clang for the target, tools and libraries.

In this package we have to deal with the same kind of problem we encountered
when building mesa3d with llvm support: llvm-config (host-version) had to be
copied to STAGING_DIR/usr/bin. In this case, we need llvm-tblgen from host
to be installed in STAGING_DIR/usr/bin for cross-compiling clang.

We need libclang for the target because it is used by all OpenCL implementations.
In this series, Clover is provided.

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
---
 package/Config.in       |  1 +
 package/clang/Config.in |  8 ++++++++
 package/clang/clang.mk  | 30 ++++++++++++++++++++++++++++++
 3 files changed, 39 insertions(+)
 create mode 100644 package/clang/Config.in

diff --git a/package/Config.in b/package/Config.in
index 47e5b3d1b4..4d32d749fb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1474,6 +1474,7 @@ menu "Other"
 	source "package/bctoolbox/Config.in"
 	source "package/bdwgc/Config.in"
 	source "package/boost/Config.in"
+	source "package/clang/Config.in"
 	source "package/clapack/Config.in"
 	source "package/classpath/Config.in"
 	source "package/cppcms/Config.in"
diff --git a/package/clang/Config.in b/package/clang/Config.in
new file mode 100644
index 0000000000..e2e53dcbc8
--- /dev/null
+++ b/package/clang/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_CLANG
+	bool "clang"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	help
+	  Clang is a C/C++, Objective C/C++ and OpenCL C front-end
+	  for the LLVM compiler.
+
+	  http://clang.llvm.org/
diff --git a/package/clang/clang.mk b/package/clang/clang.mk
index 5ea0bb05f9..c2b83a8e60 100644
--- a/package/clang/clang.mk
+++ b/package/clang/clang.mk
@@ -10,31 +10,61 @@ CLANG_SOURCE = cfe-$(CLANG_VERSION).src.tar.xz
 CLANG_LICENSE = NCSA
 CLANG_LICENSE_FILES = LICENSE.TXT
 CLANG_SUPPORTS_IN_SOURCE_BUILD = NO
+CLANG_INSTALL_STAGING = YES
 
 HOST_CLANG_DEPENDENCIES = host-llvm host-libxml2
+CLANG_DEPENDENCIES = host-clang llvm
 
 # Use "Unix Makefiles" generator for generating make-compatible parallel makefiles.
 HOST_CLANG_CONF_OPTS += -G "Unix Makefiles"
+CLANG_CONF_OPTS += -G "Unix Makefiles"
+
+# This option is needed. Otherwise multiple shared libs (libclangAST.so,
+# libclangBasic.so, libclangFrontend.so, etc.) will generated. As a final
+# shared lib containing all these components (libclang.so) is also generated, this
+# resulted in the following error when trying to use tools that use libclang:
+# $ CommandLine Error: Option 'track-memory' registered more than once!
+# $ LLVM ERROR: inconsistency in registered CommandLine options
+# By setting BUILD_SHARED_LIBS to OFF, we generate multiple static libraries
+# (the same way as host's clang build) and finally libclang.so to be installed on the
+# target.
+CLANG_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
+
+# Copy llvm-tblgen (host variant) to STAGING_DIR
+define CLANG_COPY_LLVM_TBLGEN_TO_STAGING_DIR
+	$(INSTALL) -D -m 0755 $(HOST_DIR)/bin/llvm-tblgen $(STAGING_DIR)/usr/bin/llvm-tblgen
+endef
+CLANG_PRE_CONFIGURE_HOOKS = CLANG_COPY_LLVM_TBLGEN_TO_STAGING_DIR
 
 # Select Release build
 HOST_CLANG_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
+CLANG_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
+
+# Make it explicit that we are cross-compiling
+CLANG_CONF_OPTS += -DCMAKE_CROSSCOMPILING=1
 
 # Build tools enabled
 HOST_CLANG_CONF_OPTS += -DCLANG_BUILD_TOOLS=ON
+CLANG_CONF_OPTS += -DCLANG_BUILD_TOOLS=ON
 
 # Don't build examples
 HOST_CLANG_CONF_OPTS += -DCLANG_BUILD_EXAMPLES=OFF
+CLANG_CONF_OPTS += -DCLANG_BUILD_EXAMPLES=OFF
 
 # Don't build doc
 HOST_CLANG_CONF_OPTS += -DCLANG_INCLUDE_DOCS=OFF
+CLANG_CONF_OPTS += -DCLANG_INCLUDE_DOCS=OFF
 
 # Don't build tests
 HOST_CLANG_CONF_OPTS += -DCLANG_INCLUDE_TESTS=OFF
+CLANG_CONF_OPTS += -DCLANG_INCLUDE_TESTS=OFF
 
 # Specify path to host's llvm-config
 HOST_CLANG_CONF_OPTS += -DLLVM_CONFIG:FILEPATH=$(HOST_DIR)/bin/llvm-config
+CLANG_CONF_OPTS += -DLLVM_CONFIG:FILEPATH=$(STAGING_DIR)/usr/bin/llvm-config
 
 # Install clang in  HOST_DIR/usr
 HOST_CLANG_CONF_OPTS += -DCMAKE_INSTALL_PREFIX=$(HOST_DIR)/usr
 
+$(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.14.3
