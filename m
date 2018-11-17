From: Robert Rose <robertroyrose@gmail.com>
Date: Sat, 17 Nov 2018 07:21:15 -0800
Subject: [Buildroot] [PATCH 1/1] grpc: new package
Message-ID: <20181117152115.11888-1-robertroyrose@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Robert Rose <robertroyrose@gmail.com>
---
 DEVELOPERS                   |  3 ++
 package/Config.in            |  1 +
 package/grpc/0001-grpc.patch | 60 ++++++++++++++++++++++++++++++++++++
 package/grpc/Config.in       | 10 ++++++
 package/grpc/grpc.hash       |  2 ++
 package/grpc/grpc.mk         | 34 ++++++++++++++++++++
 6 files changed, 110 insertions(+)
 create mode 100644 package/grpc/0001-grpc.patch
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
diff --git a/package/grpc/0001-grpc.patch b/package/grpc/0001-grpc.patch
new file mode 100644
index 0000000000..d276e7df19
--- /dev/null
+++ b/package/grpc/0001-grpc.patch
@@ -0,0 +1,60 @@
+diff -rc /usr/local/google/home/robertroyrose/grpc-1.16.0/CMakeLists.txt ./CMakeLists.txt
+*** /usr/local/google/home/robertroyrose/grpc-1.16.0/CMakeLists.txt	2018-10-22 21:02:54.000000000 -0700
+--- ./CMakeLists.txt	2018-11-08 14:34:57.419741555 -0800
+***************
+*** 190,195 ****
+--- 190,213 ----
+      get_filename_component(REL_DIR ${REL_FIL} DIRECTORY)
+      set(RELFIL_WE "${REL_DIR}/${FIL_WE}")
+  
++     if(CMAKE_CROSSCOMPILING)
++     add_custom_command(
++       OUTPUT "${_gRPC_PROTO_GENS_DIR}/${RELFIL_WE}.grpc.pb.cc"
++              "${_gRPC_PROTO_GENS_DIR}/${RELFIL_WE}.grpc.pb.h"
++              "${_gRPC_PROTO_GENS_DIR}/${RELFIL_WE}_mock.grpc.pb.h"
++              "${_gRPC_PROTO_GENS_DIR}/${RELFIL_WE}.pb.cc"
++              "${_gRPC_PROTO_GENS_DIR}/${RELFIL_WE}.pb.h"
++       COMMAND ${_gRPC_PROTOBUF_PROTOC_EXECUTABLE}
++       ARGS --grpc_out=generate_mock_code=true:${_gRPC_PROTO_GENS_DIR}
++            --cpp_out=${_gRPC_PROTO_GENS_DIR}
++            --plugin=protoc-gen-grpc=$ENV{HOST_DIR}/bin/grpc_cpp_plugin
++            ${_protobuf_include_path}
++            ${REL_FIL}
++       DEPENDS ${ABS_FIL} ${_gRPC_PROTOBUF_PROTOC} grpc_cpp_plugin
++       WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
++       COMMENT "Running gRPC C++ protocol buffer compiler on ${FIL}"
++       VERBATIM)
++     else()
+      add_custom_command(
+        OUTPUT "${_gRPC_PROTO_GENS_DIR}/${RELFIL_WE}.grpc.pb.cc"
+               "${_gRPC_PROTO_GENS_DIR}/${RELFIL_WE}.grpc.pb.h"
+***************
+*** 206,211 ****
+--- 224,230 ----
+        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
+        COMMENT "Running gRPC C++ protocol buffer compiler on ${FIL}"
+        VERBATIM)
++     endif()
+  
+        set_source_files_properties("${_gRPC_PROTO_GENS_DIR}/${RELFIL_WE}.grpc.pb.cc" "${_gRPC_PROTO_GENS_DIR}/${RELFIL_WE}.grpc.pb.h"  "${_gRPC_PROTO_GENS_DIR}/${RELFIL_WE}_mock.grpc.pb.h" "${_gRPC_PROTO_GENS_DIR}/${RELFIL_WE}.pb.cc" "${_gRPC_PROTO_GENS_DIR}/${RELFIL_WE}.pb.h" PROPERTIES GENERATED TRUE)
+    endforeach()
+diff -rc /usr/local/google/home/robertroyrose/grpc-1.16.0/include/grpc/impl/codegen/port_platform.h ./include/grpc/impl/codegen/port_platform.h
+*** /usr/local/google/home/robertroyrose/grpc-1.16.0/include/grpc/impl/codegen/port_platform.h	2018-10-22 21:02:54.000000000 -0700
+--- ./include/grpc/impl/codegen/port_platform.h	2018-11-08 14:10:44.097349975 -0800
+***************
+*** 462,468 ****
+  #define GPR_MAX_ALIGNMENT 16
+  
+  #ifndef GRPC_ARES
+! #define GRPC_ARES 1
+  #endif
+  
+  #ifndef GRPC_MUST_USE_RESULT
+--- 462,468 ----
+  #define GPR_MAX_ALIGNMENT 16
+  
+  #ifndef GRPC_ARES
+! #define GRPC_ARES 0
+  #endif
+  
+  #ifndef GRPC_MUST_USE_RESULT
diff --git a/package/grpc/Config.in b/package/grpc/Config.in
new file mode 100644
index 0000000000..2d8018ed85
--- /dev/null
+++ b/package/grpc/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_GRPC
+	bool "grpc"
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
index 0000000000..8eca73e211
--- /dev/null
+++ b/package/grpc/grpc.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 d99db0b39b490d2469a8ef74197d5f211fa740fc9581dccecbb76c56d080fce1  grpc-v1.16.0.tar.gz
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
new file mode 100644
index 0000000000..b193e3f340
--- /dev/null
+++ b/package/grpc/grpc.mk
@@ -0,0 +1,34 @@
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
+# N.B. Need to use host grpc_cpp_plugin during cross compilation.
+GRPC_DEPENDENCIES = host-grpc openssl protobuf zlib
+HOST_GRPC_DEPENDENCIES = host-openssl host-protobuf host-zlib
+
+GRPC_CONF_OPTS = \
+         -DgRPC_ZLIB_PROVIDER=package \
+         -DgRPC_PROTOBUF_PROVIDER=package \
+         -DgRPC_CARES_PROVIDER=none \
+         -DgRPC_GFLAGS_PROVIDER=none \
+         -DgRPC_BENCHMARK_PROVIDER=none \
+         -DgRPC_SSL_PROVIDER=package
+
+HOST_GRPC_CONF_OPTS = \
+         -DgRPC_ZLIB_PROVIDER=package \
+         -DgRPC_PROTOBUF_PROVIDER=package \
+         -DgRPC_CARES_PROVIDER=none \
+         -DgRPC_SSL_PROVIDER=package
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.19.1
