From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Nov 2018 21:49:50 +0100
Subject: [Buildroot] [git commit] package/grpc: new package
Message-ID: <20181202071600.E0FD2803E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d21366e11a98bc18db75d829d5cb20e853d1ac7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Robert Rose <robertroyrose@gmail.com>
[Thomas:
 - add missing Config.in dependencies inherited from
   BR2_PACKAGE_PROTOBUF, as well as the corresponding Config.in
   comment
 - replace spaces by tabs in grpc.mk indentation
 - remove superfluous GRPC_SOURCE variable
 - improved patch description.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  3 ++
 package/Config.in                                  |  1 +
 .../grpc/0001-target-build-using-host-plugin.patch | 52 ++++++++++++++++++++++
 package/grpc/Config.in                             | 23 ++++++++++
 package/grpc/grpc.hash                             |  3 ++
 package/grpc/grpc.mk                               | 35 +++++++++++++++
 6 files changed, 117 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a597d8d875..c1ec1866ea 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1785,6 +1785,9 @@ F:	package/subversion/
 N:	RJ Ascani <rj.ascani@gmail.com>
 F:	package/azmq/
 
+N:	Robert Rose <robertroyrose@gmail.com>
+F:	package/grpc/
+
 N:	Rodrigo Rebello <rprebello@gmail.com>
 F:	package/chocolate-doom/
 F:	package/irssi/
diff --git a/package/Config.in b/package/Config.in
index e19964dc2b..ff07986a50 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1501,6 +1501,7 @@ menu "Networking"
 	source "package/freeradius-client/Config.in"
 	source "package/geoip/Config.in"
 	source "package/glib-networking/Config.in"
+	source "package/grpc/Config.in"
 	source "package/gssdp/Config.in"
 	source "package/gupnp/Config.in"
 	source "package/gupnp-av/Config.in"
diff --git a/package/grpc/0001-target-build-using-host-plugin.patch b/package/grpc/0001-target-build-using-host-plugin.patch
new file mode 100644
index 0000000000..5993987bc8
--- /dev/null
+++ b/package/grpc/0001-target-build-using-host-plugin.patch
@@ -0,0 +1,52 @@
+From aa18148e392ef28275a182db34397ccb66fb4617 Mon Sep 17 00:00:00 2001
+From: Robert Rose <robertroyrose@gmail.com>
+Date: Wed, 28 Nov 2018 09:41:52 -0800
+Subject: [PATCH] CMakeLists.txt: allow passing a pre-existing grpc_cpp_plugin
+
+The grpc_cpp_plugin is meant to be executed during the build process
+of grpc. As such, in cross-compilation contexts, this program needs to
+be built for the host machine and not the target machine. In order to
+allow this, this commit adds an option gRPC_NATIVE_CPP_PLUGIN that can
+be passed on the command line, with the path to an existing
+grpc_cpp_plugin binary. If not passed, grpc_cpp_plugin is built as
+usual.
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
index 0000000000..3b17400612
--- /dev/null
+++ b/package/grpc/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_GRPC
+	bool "grpc"
+	depends on BR2_INSTALL_LIBSTDCPP # protobuf
+	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # protobuf
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
+	depends on !BR2_STATIC_LIBS # protobuf
+	select BR2_PACKAGE_C_ARES
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_PROTOBUF
+	select BR2_PACKAGE_ZLIB
+	help
+	  A language-neutral, platform-neutral, open source, remote
+	  procedure call (RPC) system initially developed at Google.
+
+	  http://github.com/grpc/grpc
+
+comment "grpc needs a toolchain w/ C++, threads, dynamic library, host and target gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| BR2_STATIC_LIBS || !BR2_HOST_GCC_AT_LEAST_4_8 \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
new file mode 100644
index 0000000000..9e5011125a
--- /dev/null
+++ b/package/grpc/grpc.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 a5342629fe1b689eceb3be4d4f167b04c70a84b9d61cf8b555e968bc500bdb5a grpc-v1.16.1.tar.gz
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
new file mode 100644
index 0000000000..6ca6536fff
--- /dev/null
+++ b/package/grpc/grpc.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# grpc
+#
+################################################################################
+
+GRPC_VERSION = v1.16.1
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
+	-D_gRPC_CARES_LIBRARIES=cares \
+	-DgRPC_CARES_PROVIDER=none \
+	-DgRPC_PROTOBUF_PROVIDER=package \
+	-DgRPC_SSL_PROVIDER=package \
+	-DgRPC_ZLIB_PROVIDER=package \
+	-DgRPC_NATIVE_CPP_PLUGIN=$(HOST_DIR)/bin/grpc_cpp_plugin
+
+HOST_GRPC_CONF_OPTS = \
+	-D_gRPC_CARES_LIBRARIES=cares \
+	-DgRPC_CARES_PROVIDER=none \
+	-DgRPC_CARES_PROVIDER=none \
+	-DgRPC_PROTOBUF_PROVIDER=package \
+	-DgRPC_SSL_PROVIDER=package \
+	-DgRPC_ZLIB_PROVIDER=package
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
