From: charles.hardin at storagecraft.com <charles.hardin@storagecraft.com>
Date: Sun, 20 May 2018 22:05:49 -0700
Subject: [Buildroot] [PATCH 3/4] grpc: new package
In-Reply-To: <20180521050550.11898-1-charles.hardin@storagecraft.com>
References: <20180521050550.11898-1-charles.hardin@storagecraft.com>
Message-ID: <20180521050550.11898-3-charles.hardin@storagecraft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Charles Hardin <charles.hardin@storagecraft.com>

add the gRPC package from Google's github repo. This is
currently just installing the C and C++ libraries on the
target installation for now. Some effort could be made
to add the python bindings as a subsequent patch.

This also adds a patch to specify the protoc to use since
that is provided by buildroot and not the host in addition
to overriding the ldconfig command since that doesn't apply
to the buildroot compile.

NOTE: Consider this a reference port for anyone that is
looking to get grpc into buildroot.

Signed-off-by: Charles Hardin <charles.hardin@storagecraft.com>
---
 package/Config.in                                  |  1 +
 .../grpc/0001-use-defined-env-in-makefile.patch    | 51 ++++++++++++
 package/grpc/Config.in                             | 19 +++++
 package/grpc/grpc.hash                             |  2 +
 package/grpc/grpc.mk                               | 90 ++++++++++++++++++++++
 5 files changed, 163 insertions(+)
 create mode 100644 package/grpc/0001-use-defined-env-in-makefile.patch
 create mode 100644 package/grpc/Config.in
 create mode 100644 package/grpc/grpc.hash
 create mode 100644 package/grpc/grpc.mk

diff --git a/package/Config.in b/package/Config.in
index ecee4938c9..f4b9a7d7cd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1506,6 +1506,7 @@ menu "Other"
 	source "package/glibmm/Config.in"
 	source "package/glm/Config.in"
 	source "package/gmp/Config.in"
+	source "package/grpc/Config.in"
 	source "package/gsl/Config.in"
 	source "package/gtest/Config.in"
 	source "package/jemalloc/Config.in"
diff --git a/package/grpc/0001-use-defined-env-in-makefile.patch b/package/grpc/0001-use-defined-env-in-makefile.patch
new file mode 100644
index 0000000000..9f5998404c
--- /dev/null
+++ b/package/grpc/0001-use-defined-env-in-makefile.patch
@@ -0,0 +1,51 @@
+diff -Naur grpc-1.11.1.orig/Makefile grpc-1.11.1/Makefile
+--- grpc-1.11.1.orig/Makefile	2018-05-15 05:36:44.000000000 +0000
++++ grpc-1.11.1/Makefile	2018-05-20 22:38:03.835389463 +0000
+@@ -240,6 +240,7 @@
+ 
+ PROTOC ?= protoc
+ DTRACE ?= dtrace
++LDCONFIG ?= ldconfig
+ CONFIG ?= opt
+ # Doing X ?= Y is the same as:
+ # ifeq ($(origin X), undefined)
+@@ -524,9 +525,9 @@
+ 
+ PERFTOOLS_CHECK_CMD = $(CC) $(CPPFLAGS) $(CFLAGS) -o $(TMPOUT) test/build/perftools.c -lprofiler $(LDFLAGS)
+ 
+-PROTOC_CHECK_CMD = which protoc > /dev/null
+-PROTOC_CHECK_VERSION_CMD = protoc --version | grep -q libprotoc.3
+-DTRACE_CHECK_CMD = which dtrace > /dev/null
++PROTOC_CHECK_CMD = which $(PROTOC) > /dev/null
++PROTOC_CHECK_VERSION_CMD = $(PROTOC) --version | grep -q libprotoc.3
++DTRACE_CHECK_CMD = which $(DTRACE) > /dev/null
+ SYSTEMTAP_HEADERS_CHECK_CMD = $(CC) $(CPPFLAGS) $(CFLAGS) -o $(TMPOUT) test/build/systemtap.c $(LDFLAGS)
+ 
+ ifndef REQUIRE_CUSTOM_LIBRARIES_$(CONFIG)
+@@ -2914,7 +2915,7 @@
+ endif
+ ifneq ($(SYSTEM),MINGW32)
+ ifneq ($(SYSTEM),Darwin)
+-	$(Q) ldconfig || true
++	$(Q) $(LDCONFIG) || true
+ endif
+ endif
+ 
+@@ -2967,7 +2968,7 @@
+ endif
+ ifneq ($(SYSTEM),MINGW32)
+ ifneq ($(SYSTEM),Darwin)
+-	$(Q) ldconfig || true
++	$(Q) $(LDCONFIG) || true
+ endif
+ endif
+ 
+@@ -2984,7 +2985,7 @@
+ endif
+ ifneq ($(SYSTEM),MINGW32)
+ ifneq ($(SYSTEM),Darwin)
+-	$(Q) ldconfig || true
++	$(Q) $(LDCONFIG) || true
+ endif
+ endif
+ 
diff --git a/package/grpc/Config.in b/package/grpc/Config.in
new file mode 100644
index 0000000000..feb7fb2de7
--- /dev/null
+++ b/package/grpc/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_GRPC
+	bool "grpc"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_GFLAGS
+	select BR2_PACKAGE_GTEST
+	select BR2_PACKAGE_GTEST_GMOCK
+	select BR2_PACKAGE_C_ARES
+	select BR2_PACKAGE_PROTOBUF
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_ZLIB
+	help
+	  gRPC is Google's protocol buffer based implementation of a
+	  remote procedure call protocol.
+
+	  http://www.grpc.io
+
+comment "grpc needs a toolchain w/ C++, threads"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
new file mode 100644
index 0000000000..9f8e6869a5
--- /dev/null
+++ b/package/grpc/grpc.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 0068a0b11795ac89ba8f5cc7332cd8cd2870a2ee0016126f014ce0bc3004e590  grpc-v1.11.1.tar.gz
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
new file mode 100644
index 0000000000..9febf8ffa3
--- /dev/null
+++ b/package/grpc/grpc.mk
@@ -0,0 +1,90 @@
+################################################################################
+#
+# grpc
+#
+################################################################################
+
+GRPC_VERSION = v1.11.1
+GRPC_SITE = $(call github,grpc,grpc,$(GRPC_VERSION))
+GRPC_LICENSE = BSD-3-Clause
+GRPC_LICENSE_FILES = LICENSE
+
+# Need a host c-ares for plugins and host-protobuf during
+# the compilation
+GRPC_DEPENDENCIES = host-grpc host-c-ares host-protobuf host-openssl
+GRPC_DEPENDENCIES += gflags gtest c-ares openssl protobuf zlib
+HOST_GRPC_DEPENDENCIES = host-c-ares host-protobuf host-openssl
+
+GRPC_INSTALL_STAGING = YES
+
+GRPC_CROSS_MAKE_OPTS_BASE = \
+	GRPC_CROSS_COMPILE="true" \
+	LDCONFIG=/bin/true \
+	HOST_CC="$(HOSTCC_NOCCACHE)" \
+	HOST_CXX="$(HOSTCXX_NOCCACHE)" \
+	HOST_LD="$(HOSTCC)" \
+	HOST_LDXX="$(HOSTCXX)" \
+	HOST_CPPFLAGS="$(HOST_CPPFLAGS) -I$(@D) -I$(@D)/include" \
+	HOST_CFLAGS="$(HOST_CFLAGS)" \
+	HOST_LDFLAGS="$(HOST_LDFLAGS)" \
+	CC="$(TARGET_CC)" \
+	CXX="$(TARGET_CXX)" \
+	LD="$(TARGET_CC)" \
+	LDXX="$(TARGET_CXX)" \
+	CFLAGS="$(TARGET_CFLAGS)" \
+	LDFLAGS="$(TARGET_LDFLAGS)" \
+	STRIP=/bin/true
+
+GRPC_MAKE_OPTS = \
+	$(GRPC_CROSS_MAKE_OPTS_BASE) \
+	PROTOC="$(HOST_DIR)/usr/bin/protoc"
+
+GRPC_INSTALL_TARGET_OPTS = \
+	$(GRPC_CROSS_MAKE_OPTS_BASE) \
+	prefix="$(TARGET_DIR)/usr"
+
+GRPC_INSTALL_STAGING_OPTS = \
+	$(GRPC_CROSS_MAKE_OPTS_BASE) \
+	prefix="$(STAGING_DIR)/usr"
+
+define GRPC_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(GRPC_MAKE_OPTS) -C $(@D) \
+		static shared plugins
+endef
+
+define GRPC_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(GRPC_INSTALL_STAGING_OPTS) -C $(@D) \
+		install_c install_cxx
+endef
+
+define GRPC_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(GRPC_INSTALL_TARGET_OPTS) -C $(@D) \
+		install-shared_cxx
+endef
+
+HOST_GRPC_MAKE_OPTS = \
+	CC="$(HOSTCC)" \
+	CXX="$(HOSTCXX)" \
+	LD="$(HOSTCC)" \
+	LDXX="$(HOSTCXX)" \
+	CPPLAGS="$(HOST_CPPFLAGS)" \
+	CFLAGS="$(HOST_CFLAGS)" \
+	CXXLAGS="$(HOST_CXXFLAGS)" \
+	LDFLAGS="$(HOST_LDFLAGS)" \
+	STRIP=/bin/true \
+	PROTOC="$(HOST_DIR)/usr/bin/protoc" \
+	prefix="$(HOST_DIR)/usr"
+
+
+define HOST_GRPC_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_GRPC_MAKE_OPTS) -C $(@D) \
+		static plugins
+endef
+
+define HOST_GRPC_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_GRPC_MAKE_OPTS) -C $(@D) \
+		install-plugins
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.15.1 (Apple Git-101)
