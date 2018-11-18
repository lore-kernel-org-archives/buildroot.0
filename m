From: Robert Rose <robertroyrose@gmail.com>
Date: Sun, 18 Nov 2018 13:19:42 -0800
Subject: [Buildroot] [PATCH v2 2/2] grpc: new package
In-Reply-To: <20181118211942.28839-1-robertroyrose@gmail.com>
References: <20181118211942.28839-1-robertroyrose@gmail.com>
Message-ID: <20181118211942.28839-2-robertroyrose@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Robert Rose <robertroyrose@gmail.com>
---
 DEVELOPERS                                    |  3 ++
 package/Config.in                             |  1 +
 .../0001-target-build-using-host-plugin.patch | 26 ++++++++++++++
 package/grpc/Config.in                        | 11 ++++++
 package/grpc/grpc.hash                        |  3 ++
 package/grpc/grpc.mk                          | 36 +++++++++++++++++++
 6 files changed, 80 insertions(+)
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
index 0000000000..379464916a
--- /dev/null
+++ b/package/grpc/0001-target-build-using-host-plugin.patch
@@ -0,0 +1,26 @@
+From f7e70f03167834ce5e221c7dbca936edb1662274 Mon Sep 17 00:00:00 2001
+From: Robert Rose <robertroyrose@gmail.com>
+Date: Sun, 18 Nov 2018 12:55:49 -0800
+Subject: [PATCH 1/1] target build using host plugin
+
+Signed-off-by: Robert Rose <robertroyrose@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index ab1802e..1b44c3c 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -199,7 +199,7 @@ function(protobuf_generate_grpc_cpp)
+       COMMAND ${_gRPC_PROTOBUF_PROTOC_EXECUTABLE}
+       ARGS --grpc_out=generate_mock_code=true:${_gRPC_PROTO_GENS_DIR}
+            --cpp_out=${_gRPC_PROTO_GENS_DIR}
+-           --plugin=protoc-gen-grpc=$<TARGET_FILE:grpc_cpp_plugin>
++           --plugin=protoc-gen-grpc=$<IF:$<BOOL:${gRPC_NATIVE_CPP_PLUGIN}>,${gRPC_NATIVE_CPP_PLUGIN},$<TARGET_FILE:grpc_cpp_plugin>>
+            ${_protobuf_include_path}
+            ${REL_FIL}
+       DEPENDS ${ABS_FIL} ${_gRPC_PROTOBUF_PROTOC} grpc_cpp_plugin
+-- 
+2.19.1
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
index 0000000000..3b1904a883
--- /dev/null
+++ b/package/grpc/grpc.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 d99db0b39b490d2469a8ef74197d5f211fa740fc9581dccecbb76c56d080fce1  grpc-v1.16.0.tar.gz
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
new file mode 100644
index 0000000000..8ee7781428
--- /dev/null
+++ b/package/grpc/grpc.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# grpc
+#
+################################################################################
+
+GRPC_VERSION = v1.16.0
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
2.19.1
