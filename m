From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Feb 2021 23:00:03 +0100
Subject: [Buildroot] [git commit] package/grpc: disable unnecessary build
 plugins
Message-ID: <20210203214040.53C3580845@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1d268cf7de1d0cf3d4ce662cc2ff4a7c8bec845
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

grpc has plugins for multiple programming languages, which are needed on
development machines only. Examples are grpc_cpp_plugin, grpc_ruby_plugin,
etc.

Even though before commit fedf3318e3fd3c9ba57389ed2b36472f1a772b9e,
grpc_cpp_plugin was not installed for target, all other plugins still were.
This causes additional build time and rootfs space.

As Buildroot does not support building a development environment for target,
these tools can be disabled.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/grpc/grpc.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index a8a3af89ef..27b28deff3 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -27,7 +27,14 @@ GRPC_CONF_OPTS = \
 	-DgRPC_PROTOBUF_PROVIDER=package \
 	-DgRPC_RE2_PROVIDER=package \
 	-DgRPC_SSL_PROVIDER=package \
-	-DgRPC_ZLIB_PROVIDER=package
+	-DgRPC_ZLIB_PROVIDER=package \
+	-DgRPC_BUILD_GRPC_CPP_PLUGIN=OFF \
+	-DgRPC_BUILD_GRPC_CSHARP_PLUGIN=OFF \
+	-DgRPC_BUILD_GRPC_NODE_PLUGIN=OFF \
+	-DgRPC_BUILD_GRPC_OBJECTIVE_C_PLUGIN=OFF \
+	-DgRPC_BUILD_GRPC_PHP_PLUGIN=OFF \
+	-DgRPC_BUILD_GRPC_PYTHON_PLUGIN=OFF \
+	-DgRPC_BUILD_GRPC_RUBY_PLUGIN=OFF
 
 # grpc can use __atomic builtins, so we need to link with
 # libatomic when available
