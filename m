From: Mark Fine <mark.fine@gmail.com>
Date: Wed, 19 Sep 2018 14:07:44 -0700
Subject: [Buildroot] [PATCH 2/2] grpc: new package
In-Reply-To: <20180919210744.66688-1-mark.fine@gmail.com>
References: <20180919210744.66688-1-mark.fine@gmail.com>
Message-ID: <20180919210744.66688-2-mark.fine@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the gRPC package from Google's gRPC github repo. Build and install
the C and C++ libraries on the target installation.

Signed-off-by: Mark Fine <mark.fine@gmail.com>
---
 package/Config.in                                  |  1 +
 ...01-Update-HOST-flags-with-passed-in-flags.patch | 36 +++++++++++
 package/grpc/Config.in                             | 28 +++++++++
 package/grpc/grpc.hash                             |  2 +
 package/grpc/grpc.mk                               | 69 ++++++++++++++++++++++
 5 files changed, 136 insertions(+)
 create mode 100644 package/grpc/0001-Update-HOST-flags-with-passed-in-flags.patch
 create mode 100644 package/grpc/Config.in
 create mode 100644 package/grpc/grpc.hash
 create mode 100644 package/grpc/grpc.mk

diff --git a/package/Config.in b/package/Config.in
index c04645a30b..1690c77929 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1452,6 +1452,7 @@ menu "Networking"
 	source "package/freeradius-client/Config.in"
 	source "package/geoip/Config.in"
 	source "package/glib-networking/Config.in"
+	source "package/grpc/Config.in"
 	source "package/gssdp/Config.in"
 	source "package/gupnp/Config.in"
 	source "package/gupnp-av/Config.in"
diff --git a/package/grpc/0001-Update-HOST-flags-with-passed-in-flags.patch b/package/grpc/0001-Update-HOST-flags-with-passed-in-flags.patch
new file mode 100644
index 0000000000..5207c471b4
--- /dev/null
+++ b/package/grpc/0001-Update-HOST-flags-with-passed-in-flags.patch
@@ -0,0 +1,36 @@
+From 6b84168130b8ac4322aa612f7ef6aa726d085054 Mon Sep 17 00:00:00 2001
+From: Mark Fine <mark.fine@gmail.com>
+Date: Wed, 19 Sep 2018 13:47:52 -0700
+Subject: [PATCH 1/1] Update HOST flags with passed in flags.
+
+To better support cross compilation, update HOST flags with passed in flags.
+
+Signed-off-by: Mark Fine <mark.fine@gmail.com>
+---
+ Makefile | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 4e993782ee..8bac7e3f91 100644
+--- a/Makefile
++++ b/Makefile
+@@ -455,11 +455,11 @@ LDFLAGS += $(EXTRA_LDFLAGS)
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
+-- 
+2.14.3 (Apple Git-98)
+
diff --git a/package/grpc/Config.in b/package/grpc/Config.in
new file mode 100644
index 0000000000..7713a37e17
--- /dev/null
+++ b/package/grpc/Config.in
@@ -0,0 +1,28 @@
+config BR2_PACKAGE_GRPC
+	bool "grpc"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on !BR2_STATIC_LIBS
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
+comment "grpc needs a toolchain w/ C++, threads, dynamic library, host and target gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| BR2_STATIC_LIBS || !BR2_HOST_GCC_AT_LEAST_4_8 \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR || !BR2_USE_MMU
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
new file mode 100644
index 0000000000..a3b0a4c3a4
--- /dev/null
+++ b/package/grpc/grpc.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 013cc34f3c51c0f87e059a12ea203087a7a15dca2e453295345e1d02e2b9634b  grpc-v1.15.0.tar.gz
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
new file mode 100644
index 0000000000..207c2676e8
--- /dev/null
+++ b/package/grpc/grpc.mk
@@ -0,0 +1,69 @@
+################################################################################
+#
+# grpc
+#
+################################################################################
+
+GRPC_VERSION = v1.15.0
+GRPC_SITE = $(call github,grpc,grpc,$(GRPC_VERSION))
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
+	PATH="$(HOST_DIR)/bin:$(BR_PATH)" \
+	GRPC_CROSS_COMPILE=true \
+	GRPC_CROSS_LDOPTS="$(TARGET_LDFLAGS)" \
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
+define GRPC_BUILD_CMDS
+	$(GRPC_MAKE_ENV) $(MAKE) -C $(@D) \
+		PROTOC="$(HOST_DIR)/bin/protoc" shared
+endef
+
+define GRPC_INSTALL_STAGING_CMDS
+	$(GRPC_MAKE_ENV) $(MAKE) -C $(@D) \
+		prefix="$(STAGING_DIR)/usr" install-headers install-shared_c install-shared_cxx
+endef
+
+define GRPC_INSTALL_TARGET_CMDS
+	$(GRPC_MAKE_ENV) $(MAKE) -C $(@D) \
+		prefix="$(TARGET_DIR)/usr" install-shared_c install-shared_cxx
+endef
+
+HOST_GRPC_MAKE_ENV = \
+	$(HOST_MAKE_ENV) \
+	CFLAGS="$(HOST_CFLAGS)" \
+	LDFLAGS="$(HOST_LDFLAGS)"
+
+define HOST_GRPC_BUILD_CMDS
+	$(HOST_GRPC_MAKE_ENV) $(MAKE) -C $(@D) \
+		prefix=$(HOST_DIR) plugins
+endef
+
+define HOST_GRPC_INSTALL_CMDS
+	$(HOST_GRPC_MAKE_ENV) $(MAKE) -C $(@D) \
+		prefix=$(HOST_DIR) install-plugins
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.14.3 (Apple Git-98)
