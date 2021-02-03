From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed,  3 Feb 2021 13:43:23 +0100
Subject: [Buildroot] [PATCH 2/3] package/grpc: fix cross-compilation with
 gRPC_BUILD_GRPC_CPP_PLUGIN=OFF
In-Reply-To: <20210203124325.18843-1-patrickdepinguin@gmail.com>
References: <20210203124325.18843-1-patrickdepinguin@gmail.com>
Message-ID: <20210203124325.18843-3-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

In commit fedf3318e3fd3c9ba57389ed2b36472f1a772b9e, an obsolete patch to
support cross-compilation was removed, in favor of the upstream solution.

However, this caused a small change in behavior: for the target grpc, the
tool 'grpc_cpp_plugin' is now also built, while before it was not.

This tool is only really needed on development machines. Since Buildroot
does not support compilers and such on target itself, the tool is not
needed.

There exists an option gRPC_BUILD_GRPC_CPP_PLUGIN which can be set to 'OFF',
but disabling it in a cross-compilation context yields build failures.

Add a patch to fix that. This patch is intended to be upstreamed to grpc.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 ...ix-cross-compilation-with-gRPC_BUILD.patch | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/grpc/0001-CMakeLists.txt-fix-cross-compilation-with-gRPC_BUILD.patch

diff --git a/package/grpc/0001-CMakeLists.txt-fix-cross-compilation-with-gRPC_BUILD.patch b/package/grpc/0001-CMakeLists.txt-fix-cross-compilation-with-gRPC_BUILD.patch
new file mode 100644
index 0000000000..553be8cb99
--- /dev/null
+++ b/package/grpc/0001-CMakeLists.txt-fix-cross-compilation-with-gRPC_BUILD.patch
@@ -0,0 +1,43 @@
+From 268815d74ea34856c686dce9e9c23106b51f2782 Mon Sep 17 00:00:00 2001
+From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+Date: Tue, 2 Feb 2021 21:46:29 +0100
+Subject: [PATCH] CMakeLists.txt: fix cross-compilation with
+ gRPC_BUILD_GRPC_CPP_PLUGIN=OFF
+
+When cross-compiling gRPC, a native version of 'grpc_cpp_plugin' is searched
+in the environment. For most use cases, a cross version of this file is not
+needed.
+
+However, when cross-building with -DgRPC_BUILD_GRPC_CPP_PLUGIN=OFF, there
+are some build errors, for example:
+
+make[3]: *** No rule to make target 'grpc_cpp_plugin', needed by 'gens/src/proto/grpc/reflection/v1alpha/reflection.grpc.pb.cc'.  Stop.
+
+This is because there is still a hard dependency on 'grpc_cpp_plugin' for
+these targets, not taking into account the cross-compilation case.
+
+Fix by depending on the variable gRPC_CPP_PLUGIN, which is set correctly for
+either cross or native case.
+
+Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 6bdae22083..08aea609f7 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -317,7 +317,7 @@ function(protobuf_generate_grpc_cpp)
+            --plugin=protoc-gen-grpc=${_gRPC_CPP_PLUGIN}
+            ${_protobuf_include_path}
+            ${REL_FIL}
+-      DEPENDS ${ABS_FIL} ${_gRPC_PROTOBUF_PROTOC} grpc_cpp_plugin
++      DEPENDS ${ABS_FIL} ${_gRPC_PROTOBUF_PROTOC} ${_gRPC_CPP_PLUGIN}
+       WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
+       COMMENT "Running gRPC C++ protocol buffer compiler on ${FIL}"
+       VERBATIM)
+-- 
+2.26.2
+
-- 
2.26.2
