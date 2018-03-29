From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Thu, 29 Mar 2018 13:33:42 +0200
Subject: [Buildroot] [PATCH v4 07/11] package/clang: new host package
In-Reply-To: <20180329113346.10367-1-valentin.korenblit@smile.fr>
References: <20180329113346.10367-1-valentin.korenblit@smile.fr>
Message-ID: <20180329113346.10367-8-valentin.korenblit@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch provides Clang for the host, tools and libraries.

Clang is needed to build libclc, which is also provided in this
series.

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
---
 DEVELOPERS                   |  1 +
 package/Config.in.host       |  1 +
 package/clang/Config.in.host |  8 ++++++++
 package/clang/clang.hash     |  3 +++
 package/clang/clang.mk       | 40 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 53 insertions(+)
 create mode 100644 package/clang/Config.in.host
 create mode 100644 package/clang/clang.hash
 create mode 100644 package/clang/clang.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3ed9407670..47aa2dd82a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1859,6 +1859,7 @@ F:	package/dropwatch/
 F:	package/tstools/
 
 N:	Valentin Korenblit <valentin.korenblit@smile.fr>
+F:	package/clang/
 F:	package/llvm/
 
 N:	Vanya Sergeev <vsergeev@gmail.com>
diff --git a/package/Config.in.host b/package/Config.in.host
index 9a6227174b..09e00a2b45 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -5,6 +5,7 @@ menu "Host utilities"
 	source "package/cargo/Config.in.host"
 	source "package/cbootimage/Config.in.host"
 	source "package/checkpolicy/Config.in.host"
+	source "package/clang/Config.in.host"
 	source "package/cmake/Config.in.host"
 	source "package/cramfs/Config.in.host"
 	source "package/cryptsetup/Config.in.host"
diff --git a/package/clang/Config.in.host b/package/clang/Config.in.host
new file mode 100644
index 0000000000..61a7ed59f0
--- /dev/null
+++ b/package/clang/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_CLANG
+	bool "host clang"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	help
+	  Clang is a C/C++, Objective C/C++ and OpenCL C front-end
+	  for the LLVM compiler.
+
+	  http://clang.llvm.org/
diff --git a/package/clang/clang.hash b/package/clang/clang.hash
new file mode 100644
index 0000000000..7e7584ced7
--- /dev/null
+++ b/package/clang/clang.hash
@@ -0,0 +1,3 @@
+# locally calculated
+sha256 135f6c9b0cd2da1aff2250e065946258eb699777888df39ca5a5b4fe5e23d0ff cfe-5.0.1.src.tar.xz
+sha256 de4c79665f0f5688b0ace17cba6f8e0343925bb95e0949d66d47bbd4527310d6 LICENSE.txt
diff --git a/package/clang/clang.mk b/package/clang/clang.mk
new file mode 100644
index 0000000000..5ea0bb05f9
--- /dev/null
+++ b/package/clang/clang.mk
@@ -0,0 +1,40 @@
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
+
+HOST_CLANG_DEPENDENCIES = host-llvm host-libxml2
+
+# Use "Unix Makefiles" generator for generating make-compatible parallel makefiles.
+HOST_CLANG_CONF_OPTS += -G "Unix Makefiles"
+
+# Select Release build
+HOST_CLANG_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
+
+# Build tools enabled
+HOST_CLANG_CONF_OPTS += -DCLANG_BUILD_TOOLS=ON
+
+# Don't build examples
+HOST_CLANG_CONF_OPTS += -DCLANG_BUILD_EXAMPLES=OFF
+
+# Don't build doc
+HOST_CLANG_CONF_OPTS += -DCLANG_INCLUDE_DOCS=OFF
+
+# Don't build tests
+HOST_CLANG_CONF_OPTS += -DCLANG_INCLUDE_TESTS=OFF
+
+# Specify path to host's llvm-config
+HOST_CLANG_CONF_OPTS += -DLLVM_CONFIG:FILEPATH=$(HOST_DIR)/bin/llvm-config
+
+# Install clang in  HOST_DIR/usr
+HOST_CLANG_CONF_OPTS += -DCMAKE_INSTALL_PREFIX=$(HOST_DIR)/usr
+
+$(eval $(host-cmake-package))
-- 
2.14.3
