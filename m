From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Wed,  4 Apr 2018 18:31:21 +0200
Subject: [Buildroot] [PATCH v5 4/7] package/clang: new package
In-Reply-To: <20180404163124.27934-1-valentin.korenblit@smile.fr>
References: <20180404163124.27934-1-valentin.korenblit@smile.fr>
Message-ID: <20180404163124.27934-5-valentin.korenblit@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch provides Clang tools and libraries for the host and libclang
for the target.

Clang is needed to build libclc, which is also provided in a follup patch.

We need libclang for the target because it is used by most of OpenCL implementations.

A later patch in this series will enable Clover, the OpenCl implementation part
of Mesa3D, which requires libclang.

clang-tblgen must be copied to HOST_DIR as it is not installed by default but is needed
for cross-compilation: http://lists.llvm.org/pipermail/cfe-dev/2015-June/043318.html

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/clang/Config.in  |  9 ++++++
 package/clang/clang.hash |  3 ++
 package/clang/clang.mk   | 71 ++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 85 insertions(+)
 create mode 100644 package/clang/Config.in
 create mode 100644 package/clang/clang.hash
 create mode 100644 package/clang/clang.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 78be8256bc..72303992c2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1888,6 +1888,7 @@ F:	package/dropwatch/
 F:	package/tstools/
 
 N:	Valentin Korenblit <valentin.korenblit@smile.fr>
+F:	package/clang/
 F:	package/llvm/
 
 N:	Vanya Sergeev <vsergeev@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 82c5c40531..b358e39c3f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1479,6 +1479,7 @@ menu "Other"
 	source "package/bctoolbox/Config.in"
 	source "package/bdwgc/Config.in"
 	source "package/boost/Config.in"
+	source "package/clang/Config.in"
 	source "package/clapack/Config.in"
 	source "package/classpath/Config.in"
 	source "package/cppcms/Config.in"
diff --git a/package/clang/Config.in b/package/clang/Config.in
new file mode 100644
index 0000000000..269766da1e
--- /dev/null
+++ b/package/clang/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_CLANG
+	bool "clang"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	select BR2_PACKAGE_LLVM
+	help
+	  Clang is a C/C++, Objective C/C++ and OpenCL C front-end
+	  for the LLVM compiler.
+
+	  http://clang.llvm.org
diff --git a/package/clang/clang.hash b/package/clang/clang.hash
new file mode 100644
index 0000000000..a5bf909814
--- /dev/null
+++ b/package/clang/clang.hash
@@ -0,0 +1,3 @@
+# locally calculated
+sha256 135f6c9b0cd2da1aff2250e065946258eb699777888df39ca5a5b4fe5e23d0ff cfe-5.0.1.src.tar.xz
+sha256 de4c79665f0f5688b0ace17cba6f8e0343925bb95e0949d66d47bbd4527310d6 LICENSE.TXT
diff --git a/package/clang/clang.mk b/package/clang/clang.mk
new file mode 100644
index 0000000000..7535782436
--- /dev/null
+++ b/package/clang/clang.mk
@@ -0,0 +1,71 @@
+################################################################################
+#
+# clang
+#
+################################################################################
+
+CLANG_VERSION = 5.0.1
+CLANG_SITE = http://llvm.org/releases/$(CLANG_VERSION)
+CLANG_SOURCE = cfe-$(CLANG_VERSION).src.tar.xz
+CLANG_LICENSE = NCSA
+CLANG_LICENSE_FILES = LICENSE.TXT
+CLANG_SUPPORTS_IN_SOURCE_BUILD = NO
+CLANG_INSTALL_STAGING = YES
+
+HOST_CLANG_DEPENDENCIES = host-llvm host-libxml2
+CLANG_DEPENDENCIES = llvm host-clang
+
+# This option is needed. Otherwise multiple shared libs (libclangAST.so,
+# libclangBasic.so, libclangFrontend.so, etc.) will be generated. As a final
+# shared lib containing all these components (libclang.so) is also generated, this
+# resulted in the following error when trying to use tools that use libclang:
+# $ CommandLine Error: Option 'track-memory' registered more than once!
+# $ LLVM ERROR: inconsistency in registered CommandLine options
+# By setting BUILD_SHARED_LIBS to OFF, we generate multiple static libraries
+# (the same way as host's clang build) and finally libclang.so to be installed on the
+# target.
+CLANG_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
+
+# Default is Debug build, which requires considerably more disk space and
+# build time. Release build is selected for host and target because the linker
+# can run out of memory in Debug mode.
+HOST_CLANG_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
+CLANG_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
+
+CLANG_CONF_OPTS += -DCMAKE_CROSSCOMPILING=1
+
+# We need to build tools because libclang is a tool
+HOST_CLANG_CONF_OPTS += -DCLANG_BUILD_TOOLS=ON
+CLANG_CONF_OPTS += -DCLANG_BUILD_TOOLS=ON
+
+HOST_CLANG_CONF_OPTS += \
+	-DCLANG_BUILD_EXAMPLES=OFF \
+	-DCLANG_INCLUDE_DOCS=OFF \
+	-DCLANG_INCLUDE_TESTS=OFF
+
+CLANG_CONF_OPTS += \
+	-DCLANG_BUILD_EXAMPLES=OFF \
+	-DCLANG_INCLUDE_DOCS=OFF \
+	-DCLANG_INCLUDE_TESTS=OFF
+
+HOST_CLANG_CONF_OPTS += -DLLVM_CONFIG:FILEPATH=$(HOST_DIR)/bin/llvm-config
+CLANG_CONF_OPTS += -DLLVM_CONFIG:FILEPATH=$(STAGING_DIR)/usr/bin/llvm-config \
+	-DCLANG_TABLEGEN:FILEPATH=$(HOST_DIR)/usr/bin/clang-tblgen
+
+# Clang can't be used as compiler on the target since there are no development files
+# (headers) and other build tools. So remove clang binaries from target.
+define CLANG_DELETE_BINARIES_FROM_TARGET
+	rm -f $(TARGET_DIR)/usr/bin/clang*
+endef
+CLANG_POST_INSTALL_TARGET_HOOKS += CLANG_DELETE_BINARIES_FROM_TARGET
+
+# clang-tblgen is not installed by default, however it is necessary for
+# cross-compiling clang
+define HOST_CLANG_INSTALL_CLANG_TBLGEN
+	$(INSTALL) -D -m 0755 $(HOST_CLANG_BUILDDIR)/bin/clang-tblgen \
+		$(HOST_DIR)/usr/bin/clang-tblgen
+endef
+HOST_CLANG_POST_INSTALL_HOOKS = HOST_CLANG_INSTALL_CLANG_TBLGEN
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.14.3
