From: Robert Rose <robertroyrose@gmail.com>
Date: Wed, 28 Nov 2018 22:17:25 -0800
Subject: [Buildroot] [PATCH v4 2/2] grpc: new package
In-Reply-To: <20181129061725.10327-1-robertroyrose@gmail.com>
References: <20181129061725.10327-1-robertroyrose@gmail.com>
Message-ID: <20181129061725.10327-2-robertroyrose@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Robert Rose <robertroyrose@gmail.com>
---
 DEVELOPERS                                    |  3 ++
 package/Config.in                             |  1 +
 .../0001-target-build-using-host-plugin.patch | 44 +++++++++++++++++++
 package/grpc/Config.in                        | 11 +++++
 package/grpc/grpc.hash                        |  5 +++
 package/grpc/grpc.mk                          | 36 +++++++++++++++
 6 files changed, 100 insertions(+)
 create mode 100644 package/grpc/0001-target-build-using-host-plugin.patch
 create mode 100644 package/grpc/Config.in
 create mode 100644 package/grpc/grpc.hash
 create mode 100644 package/grpc/grpc.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 53467da489..437614c190 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1772,6 +1772,9 @@ F:	package/subversion/
 N:	RJ Ascani <rj.ascani@gmail.com>
 F:	package/azmq/
 
+N:	Robert Rose <robertroyrose@gmail.com>
+F:	package/grpc
+
 N:	Rodrigo Rebello <rprebello@gmail.com>
 F:	package/chocolate-doom/
 F:	package/irssi/
diff --git a/package/Config.in b/package/Config.in
index b60e7700ad..2d0cc51797 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1495,6 +1495,7 @@ menu "Networking"
 	source "package/freeradius-client/Config.in"
 	source "package/geoip/Config.in"
 	source "package/glib-networking/Config.in"
+	source "package/grpc/Config.in"
 	source "package/gssdp/Config.in"
 	source "package/gupnp/Config.in"
 	source "package/gupnp-av/Config.in"
diff --git a/package/grpc/0001-target-build-using-host-plugin.patch b/package/grpc/0001-target-build-using-host-plugin.patch
new file mode 100644
index 0000000000..d4aee1b441
--- /dev/null
+++ b/package/grpc/0001-target-build-using-host-plugin.patch
@@ -0,0 +1,44 @@
+From aa18148e392ef28275a182db34397ccb66fb4617 Mon Sep 17 00:00:00 2001
+From: Robert Rose <robertroyrose@gmail.com>
+Date: Wed, 28 Nov 2018 09:41:52 -0800
+Subject: [PATCH 1/1] grpc: new package
+
+Signed-off-by: Robert Rose <robertroyrose@gmail.com>
+---
+ CMakeLists.txt | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index fc76cf5..7a22b08 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -13108,6 +13108,18 @@ target_link_libraries(grpc_cli
+ endif (gRPC_BUILD_TESTS)
+ if (gRPC_BUILD_CODEGEN)
+ 
++if (gRPC_NATIVE_CPP_PLUGIN)
++
++add_executable(grpc_cpp_plugin
++  IMPORTED
++)
++
++set_property(TARGET grpc_cpp_plugin
++  PROPERTY IMPORTED_LOCATION ${gRPC_NATIVE_CPP_PLUGIN}
++)
++
++else()
++
+ add_executable(grpc_cpp_plugin
+   src/compiler/cpp_plugin.cc
+ )
+@@ -13143,6 +13155,7 @@ if (gRPC_INSTALL)
+     ARCHIVE DESTINATION ${gRPC_INSTALL_LIBDIR}
+   )
+ endif()
++endif()
+ 
+ endif (gRPC_BUILD_CODEGEN)
+ if (gRPC_BUILD_CODEGEN)
+-- 
+2.20.0.rc0.387.gc7a69e6b6c-goog
+
diff --git a/package/grpc/Config.in b/package/grpc/Config.in
new file mode 100644
index 0000000000..e4364c2fe6
--- /dev/null
+++ b/package/grpc/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_GRPC
+	bool "grpc"
+	select BR2_PACKAGE_C_ARES
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_PROTOBUF
+	select BR2_PACKAGE_ZLIB
+	help
+	  A language-neutral, platform-neutral, open source, remote
+	  procedure call (RPC) system initially developed at Google.
+
+	  http://github.com/grpc/grpc
diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
new file mode 100644
index 0000000000..8a1df947fd
--- /dev/null
+++ b/package/grpc/grpc.hash
@@ -0,0 +1,5 @@
+# Locally computed
+sha256 a5342629fe1b689eceb3be4d4f167b04c70a84b9d61cf8b555e968bc500bdb5a grpc-v1.16.1.tar.gz
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE
+
+
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
new file mode 100644
index 0000000000..1aa5447386
--- /dev/null
+++ b/package/grpc/grpc.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# grpc
+#
+################################################################################
+
+GRPC_VERSION = v1.16.1
+GRPC_SOURCE = grpc-$(GRPC_VERSION).tar.gz
+GRPC_SITE = $(call github,grpc,grpc,$(GRPC_VERSION))
+GRPC_LICENSE = Apache-2.0
+GRPC_LICENSE_FILES = LICENSE
+
+GRPC_INSTALL_STAGING = YES
+
+# Need to use host grpc_cpp_plugin during cross compilation.
+GRPC_DEPENDENCIES = c-ares host-grpc openssl protobuf zlib
+HOST_GRPC_DEPENDENCIES = host-c-ares host-openssl host-protobuf host-zlib
+
+GRPC_CONF_OPTS = \
+         -D_gRPC_CARES_LIBRARIES=cares \
+         -DgRPC_CARES_PROVIDER=none \
+         -DgRPC_PROTOBUF_PROVIDER=package \
+         -DgRPC_SSL_PROVIDER=package \
+         -DgRPC_ZLIB_PROVIDER=package \
+         -DgRPC_NATIVE_CPP_PLUGIN=$(HOST_DIR)/bin/grpc_cpp_plugin
+
+HOST_GRPC_CONF_OPTS = \
+         -D_gRPC_CARES_LIBRARIES=cares \
+         -DgRPC_CARES_PROVIDER=none \
+         -DgRPC_CARES_PROVIDER=none \
+         -DgRPC_PROTOBUF_PROVIDER=package \
+         -DgRPC_SSL_PROVIDER=package \
+         -DgRPC_ZLIB_PROVIDER=package
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.20.0.rc0.387.gc7a69e6b6c-goog
