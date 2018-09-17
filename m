From: Mark Fine <mark.fine@gmail.com>
Date: Mon, 17 Sep 2018 12:34:55 -0700
Subject: [Buildroot] [PATCH 1/1] New package: gRPC,
 Google's remote procedue calss protocol.
Message-ID: <20180917193455.14329-1-mark.fine@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Introduces support for gRPC, Google's remote procedure call
protocol. Includes a patch for supporting cross compilation.
Also patches the c-ares package for host support.

Signed-off-by: Mark Fine <mark.fine@gmail.com>
---
 package/c-ares/c-ares.mk                    |  1 +
 package/grpc/0001-fixup-cross-compile.patch | 20 +++++++
 package/grpc/Config.in                      | 19 +++++++
 package/grpc/grpc.mk                        | 85 +++++++++++++++++++++++++++++
 4 files changed, 125 insertions(+)
 create mode 100644 package/grpc/0001-fixup-cross-compile.patch
 create mode 100644 package/grpc/Config.in
 create mode 100644 package/grpc/grpc.mk

diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index 67254244a1..76e9687b37 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -15,3 +15,4 @@ C_ARES_LICENSE = MIT
 C_ARES_LICENSE_FILES = ares_mkquery.c
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
diff --git a/package/grpc/0001-fixup-cross-compile.patch b/package/grpc/0001-fixup-cross-compile.patch
new file mode 100644
index 0000000000..eaf262a95a
--- /dev/null
+++ b/package/grpc/0001-fixup-cross-compile.patch
@@ -0,0 +1,20 @@
+diff -ur grpc_custom-v1.12.0/Makefile grpc_custom-v1.12.0.new/Makefile
+--- grpc_custom-v1.12.0/Makefile        2018-05-15 17:10:37.000000000 +0000
++++ grpc_custom-v1.12.0.new/Makefile    2018-08-30 20:28:31.357410038 +0000
+@@ -439,11 +439,11 @@
+ DEFINES += $(EXTRA_DEFINES)
+ LDLIBS += $(EXTRA_LDLIBS)
+
+-HOST_CPPFLAGS = $(CPPFLAGS)
+-HOST_CFLAGS = $(CFLAGS)
+-HOST_CXXFLAGS = $(CXXFLAGS)
+-HOST_LDFLAGS = $(LDFLAGS)
+-HOST_LDLIBS = $(LDLIBS)
++HOST_CPPFLAGS += $(CPPFLAGS)
++HOST_CFLAGS += $(CFLAGS)
++HOST_CXXFLAGS += $(CXXFLAGS)
++HOST_LDFLAGS += $(LDFLAGS)
++HOST_LDLIBS += $(LDLIBS)
+
+ # These are automatically computed variables.
+ # There shouldn't be any need to change anything from now on.
diff --git a/package/grpc/Config.in b/package/grpc/Config.in
new file mode 100644
index 0000000000..237a9d5a15
--- /dev/null
+++ b/package/grpc/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_GRPC
+	bool "grpc"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_C_ARES
+	select BR2_PACKAGE_GFLAGS
+	select BR2_PACKAGE_GTEST
+	select BR2_PACKAGE_GTEST_GMOCK
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_PROTOBUF
+	select BR2_PACKAGE_ZLIB
+	help
+	  gRPC is Google's protocol buffer based implementation of a
+	  remote procedure call protocol.
+
+	  http://www.grpc.io
+
+comment "grpc needs a toolchain w/ C++, threads"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
\ No newline at end of file
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
new file mode 100644
index 0000000000..a74dece713
--- /dev/null
+++ b/package/grpc/grpc.mk
@@ -0,0 +1,85 @@
+################################################################################
+#
+# grpc
+#
+################################################################################
+
+GRPC_VERSION = v1.14.0
+GRPC_SITE = https://github.com/grpc/grpc.git
+GRPC_SITE_METHOD = git
+GRPC_LICENSE = BSD-3-Clause
+GRPC_LICENSE_FILES = LICENSE
+
+GRPC_DEPENDENCIES = host-grpc gflags gtest c-ares openssl protobuf zlib
+HOST_GRPC_DEPENDENCIES = host-c-ares host-protobuf host-openssl
+
+GRPC_INSTALL_STAGING = YES
+
+GRPC_MAKE_ENV = \
+	CC="$(TARGET_CC)" \
+	CXX="$(TARGET_CXX)" \
+	LD="$(TARGET_CC)" \
+	LDXX="$(TARGET_CXX)" \
+	STRIP="$(TARGET_STRIP)" \
+	PROTOC="$(HOST_DIR)/bin/protoc" \
+	PATH="$(HOST_DIR)/bin:$(PATH)" \
+	GRPC_CROSS_COMPILE=true \
+	GRPC_CROSS_LDOPTS="$(TARGET_LDFLAGS)" \
+	GRPC_CROSS_AROPTS="$(LTO_PLUGIN)" \
+	HAS_PKG_CONFIG=false \
+	PROTOBUF_CONFIG_OPTS="--host=$(GNU_TARGET_NAME) --with-protoc=$(HOST_DIR)/bin/protoc" \
+	HOST_CC="$(HOSTCC)" \
+	HOST_CXX="$(HOSTCXX)" \
+	HOST_LD="$(HOSTCC)" \
+	HOST_LDXX="$(HOSTCXX)" \
+	HOST_CPPFLAGS="$(HOST_CPPFLAGS)" \
+	HOST_CFLAGS="$(HOST_CFLAGS)" \
+	HOST_CXXFLAGS="$(HOST_CXXFLAGS)" \
+	HOST_LDFLAGS="$(HOST_LDFLAGS)"
+
+GRPC_MAKE_OPTS = \
+	LD_LIBRARY_PATH="$(STAGING_DIR)/usr/lib" \
+	PROTOC="$(HOST_DIR)/bin/protoc"
+
+GRPC_INSTALL_TARGET_OPTS = \
+	prefix="$(TARGET_DIR)/usr"
+
+GRPC_INSTALL_STAGING_OPTS = \
+	prefix="$(STAGING_DIR)/usr"
+
+define GRPC_BUILD_CMDS
+	$(GRPC_MAKE_ENV) $(MAKE) $(GRPC_MAKE_OPTS) -C $(@D) \
+		shared
+endef
+
+define GRPC_INSTALL_STAGING_CMDS
+	$(GRPC_MAKE_ENV) $(MAKE) $(GRPC_INSTALL_STAGING_OPTS) -C $(@D) \
+		install-headers install-shared_c install-shared_cxx
+endef
+
+define GRPC_INSTALL_TARGET_CMDS
+	$(GRPC_MAKE_ENV) $(MAKE) $(GRPC_INSTALL_TARGET_OPTS) -C $(@D) \
+		install-shared_c install-shared_cxx
+endef
+
+HOST_GRPC_MAKE_ENV = \
+	$(HOST_MAKE_ENV) \
+	CFLAGS="$(HOST_CFLAGS)" \
+	LDFLAGS="$(HOST_LDFLAGS)"
+
+HOST_GRPC_MAKE_OPTS = \
+	LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib" \
+	prefix="$(HOST_DIR)/usr"
+
+define HOST_GRPC_BUILD_CMDS
+	$(HOST_GRPC_MAKE_ENV) $(MAKE) $(HOST_GRPC_MAKE_OPTS) -C $(@D) \
+		plugins
+endef
+
+define HOST_GRPC_INSTALL_CMDS
+	$(HOST_GRPC_MAKE_ENV) $(MAKE) $(HOST_GRPC_MAKE_OPTS) -C $(@D) \
+		install-plugins
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.14.3 (Apple Git-98)
