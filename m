From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon,  1 Feb 2021 21:57:09 +0100
Subject: [Buildroot] [PATCH] package/grpc: remove obsolete patch to support
 cross-compiling
Message-ID: <20210201205710.12357-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

When cross-compiling grpc, a native tool 'grpc_cpp_plugin' is needed.
Patch '0001-target-build-using-host-plugin.patch' in Buildroot provides a
way to pass the path to this tool via a configure option
'gRPC_NATIVE_CPP_PLUGIN'.

In version 1.20.0, the upstream grpc project added better support for
cross-compiling via commit 0d7a0ded [1], searching for the native
grpc_cpp_plugin via PATH (rather than specifying it as configure option as
our patch was doing).

This change renders the mentioned Buildroot patch obsolete, so remove it.

[1] https://github.com/grpc/grpc/commit/0d7a0ded1cc93bb7f4d69a156b0a69829557cbf2

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 .../0001-target-build-using-host-plugin.patch | 52 -------------------
 package/grpc/grpc.mk                          |  3 +-
 2 files changed, 1 insertion(+), 54 deletions(-)
 delete mode 100644 package/grpc/0001-target-build-using-host-plugin.patch

diff --git a/package/grpc/0001-target-build-using-host-plugin.patch b/package/grpc/0001-target-build-using-host-plugin.patch
deleted file mode 100644
index c6de0c1831..0000000000
--- a/package/grpc/0001-target-build-using-host-plugin.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From aa18148e392ef28275a182db34397ccb66fb4617 Mon Sep 17 00:00:00 2001
-From: Robert Rose <robertroyrose@gmail.com>
-Date: Wed, 28 Nov 2018 09:41:52 -0800
-Subject: [PATCH] CMakeLists.txt: allow passing a pre-existing grpc_cpp_plugin
-
-The grpc_cpp_plugin is meant to be executed during the build process
-of grpc. As such, in cross-compilation contexts, this program needs to
-be built for the host machine and not the target machine. In order to
-allow this, this commit adds an option gRPC_NATIVE_CPP_PLUGIN that can
-be passed on the command line, with the path to an existing
-grpc_cpp_plugin binary. If not passed, grpc_cpp_plugin is built as
-usual.
-
-Signed-off-by: Robert Rose <robertroyrose@gmail.com>
----
- CMakeLists.txt | 13 +++++++++++++
- 1 file changed, 13 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index be695c2..45c2fcb 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -11199,6 +11199,18 @@ target_link_libraries(grpc_cli
- endif()
- if(gRPC_BUILD_CODEGEN AND gRPC_BUILD_GRPC_CPP_PLUGIN)
- 
-+if (gRPC_NATIVE_CPP_PLUGIN)
-+
-+add_executable(grpc_cpp_plugin
-+  IMPORTED
-+)
-+
-+set_property(TARGET grpc_cpp_plugin
-+  PROPERTY IMPORTED_LOCATION ${gRPC_NATIVE_CPP_PLUGIN}
-+)
-+
-+else()
-+
- add_executable(grpc_cpp_plugin
-   src/compiler/cpp_plugin.cc
- )
-@@ -11233,6 +11245,7 @@ if(gRPC_INSTALL)
-     ARCHIVE DESTINATION ${gRPC_INSTALL_LIBDIR}
-   )
- endif()
-+endif()
- 
- endif()
- if(gRPC_BUILD_CODEGEN AND gRPC_BUILD_GRPC_CSHARP_PLUGIN)
--- 
-2.26.2
-
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index 857064327d..a8a3af89ef 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -27,8 +27,7 @@ GRPC_CONF_OPTS = \
 	-DgRPC_PROTOBUF_PROVIDER=package \
 	-DgRPC_RE2_PROVIDER=package \
 	-DgRPC_SSL_PROVIDER=package \
-	-DgRPC_ZLIB_PROVIDER=package \
-	-DgRPC_NATIVE_CPP_PLUGIN=$(HOST_DIR)/bin/grpc_cpp_plugin
+	-DgRPC_ZLIB_PROVIDER=package
 
 # grpc can use __atomic builtins, so we need to link with
 # libatomic when available
-- 
2.26.2
