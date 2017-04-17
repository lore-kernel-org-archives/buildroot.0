From: mrugiero at gmail.com <mrugiero@gmail.com>
Date: Mon, 17 Apr 2017 14:22:25 -0300
Subject: [Buildroot] [PATCH 2/2] new package: grpc
In-Reply-To: <20170417172225.20472-1-mrugiero@gmail.com>
References: <20170417172225.20472-1-mrugiero@gmail.com>
Message-ID: <20170417172225.20472-2-mrugiero@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Mario J. Rugiero" <mrugiero@gmail.com>

gRPC is Google's take on RPC. It attempts to be simple and language
agnostic by using protocol buffers to define the payloads.
It depends on protobuf.

Signed-off-by: Mario J. Rugiero <mrugiero@gmail.com>
---
 package/Config.in      |  1 +
 package/grpc/Config.in | 17 ++++++++++++
 package/grpc/grpc.hash |  2 ++
 package/grpc/grpc.mk   | 72 ++++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 92 insertions(+)
 create mode 100644 package/grpc/Config.in
 create mode 100644 package/grpc/grpc.hash
 create mode 100644 package/grpc/grpc.mk

diff --git a/package/Config.in b/package/Config.in
index 4eaa95b1d..54133ee0d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1353,6 +1353,7 @@ menu "Other"
 	source "package/glibmm/Config.in"
 	source "package/glm/Config.in"
 	source "package/gmp/Config.in"
+	source "package/grpc/Config.in"
 	source "package/gsl/Config.in"
 	source "package/gtest/Config.in"
 	source "package/jemalloc/Config.in"
diff --git a/package/grpc/Config.in b/package/grpc/Config.in
new file mode 100644
index 000000000..a26b2c44a
--- /dev/null
+++ b/package/grpc/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_GRPC
+	bool "grpc"
+	depends on BR2_PACKAGE_GFLAGS
+	depends on BR2_PACKAGE_OPENSSL
+	depends on BR2_PACKAGE_PROTOBUF
+	depends on BR2_PACKAGE_ZLIB
+	help
+	  gRPC is Google's protocol buffers\' based implementation of a
+	  remote procedure call protocol.
+
+	  http://www.grpc.io
+
+comment "grpc needs protocol buffers, google flags, openssl and zlib"
+	depends on !BR2_PACKAGE_GFLAGS || !BR2_PACKAGE_OPENSSL || \
+		!BR2_PACKAGE_PROTOBUF || !BR2_PACKAGE_ZLIB
+		
+
diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
new file mode 100644
index 000000000..e45e49bca
--- /dev/null
+++ b/package/grpc/grpc.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 b4f41c0f223ade0b5a4b95de018c28e781e06a76c35629a42279a02b26efb8c8 grpc-v1.2.4.tar.gz
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
new file mode 100644
index 000000000..0326080b3
--- /dev/null
+++ b/package/grpc/grpc.mk
@@ -0,0 +1,72 @@
+################################################################################
+#
+# grpc
+#
+################################################################################
+
+GRPC_VERSION = v1.2.4
+GRPC_SITE = $(call github,grpc,grpc,$(GRPC_VERSION))
+GRPC_LICENSE = BSD-3-Clause
+GRPC_LICENSE_FILES = LICENSE
+
+# N.B. Need to use host protoc during cross compilation.
+GRPC_DEPENDENCIES = gflags openssl host-grpc host-protobuf protobuf zlib
+
+GRPC_INSTALL_STAGING = YES
+
+GRPC_CROSS_MAKE_OPTS_BASE = \
+	CC="$(TARGET_CC)" \
+	CXX="$(TARGET_CXX)" \
+	LD="$(TARGET_CC)" \
+	LDXX="$(TARGET_CXX)" \
+	CFLAGS="$(TARGET_CFLAGS)" \
+	LDFLAGS="$(TARGET_LDFLAGS)" \
+	STRIP="$(TARGET_STRIP)"
+
+GRPC_MAKE_OPTS = \
+	$(GRPC_CROSS_MAKE_OPTS_BASE) \
+	LD_LIBRARY_PATH="$(STAGING_DIR)/usr/lib" \
+	PROTOC="$(HOST_DIR)/usr/bin/protoc" \
+	PROTOC_PLUGINS_DIR="$(HOST_DIR)/usr/bin/" \
+	prefix="$(TARGET_DIR)/usr"
+
+GRPC_INSTALL_TARGET_OPTS = \
+	$(GRPC_CROSS_MAKE_OPTS_BASE) \
+	prefix="$(TARGET_DIR)/usr"
+
+GRPC_INSTALL_STAGING_OPTS = \
+	$(GRPC_CROSS_MAKE_OPTS_BASE) \
+	prefix="$(STAGING_DIR)/usr"
+
+HOST_GRPC_MAKE_OPTS = \
+	CFLAGS="$(HOST_CFLAGS)" \
+	LDFLAGS="$(HOST_LDFLAGS)" \
+	LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib" \
+	PROTOC="$(HOST_DIR)/usr/bin/protoc" \
+	PROTOC_PLUGINS_DIR="$(HOST_DIR)/usr/bin/" \
+	prefix="$(HOST_DIR)/usr"
+
+define GRPC_BUILD_CMDS
+	$(MAKE) $(GRPC_MAKE_OPTS) -C $(@D) static shared
+endef
+
+define GRPC_INSTALL_TARGET_CMDS
+  # Could be install-static and install-shared, but grpc is currently missing
+  # the install-shared target.
+	$(MAKE) $(GRPC_MAKE_OPTS) -C $(@D) install-static install-shared_c install-shared_cxx
+endef
+
+define GRPC_INSTALL_STAGING_CMDS
+	$(MAKE) $(GRPC_INSTALL_STAGING_OPTS) -C $(@D) install_c install_cxx
+endef
+
+define HOST_GRPC_BUILD_CMDS
+	$(MAKE) $(HOST_GRPC_MAKE_OPTS) -C $(@D) plugins
+endef
+
+define HOST_GRPC_INSTALL_CMDS
+	$(MAKE) $(HOST_GRPC_MAKE_OPTS) -C $(@D) install-plugins
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.12.2
