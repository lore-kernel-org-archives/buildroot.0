From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 15:52:12 +0100
Subject: [Buildroot] [git commit] package/grpc: needs atomic or sync
 built-ins
Message-ID: <20181231144908.87913882E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c16b2e2b507152750622f3e69888e3e1c6ec686a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

grpc uses atomic or sync built-ins from the compiler, so we need to
add the appropriate dependency. In addition, on some architectures,
linking with libatomic is needed to use the atomic builtins.

Fixes:

  http://autobuild.buildroot.org/results/2f208fbfe4e9da94be5b9c030dbd278cb8ba053c/

Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Reviewed-by: Robert Rose <robertroyrose@gmail.com>
[Thomas:
 - add the dependency on sync or atomic builtins in Config.in
 - use -DCMAKE_EXE_LINKER_FLAGS instead of
   -DCMAKE_C_STANDARD_LIBRARIES, to be consistent with what we do in
   some other cmake-based packages
 - tweak commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/grpc/Config.in | 2 ++
 package/grpc/grpc.mk   | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/package/grpc/Config.in b/package/grpc/Config.in
index 3b17400612..2765d0fb40 100644
--- a/package/grpc/Config.in
+++ b/package/grpc/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_GRPC
 	depends on BR2_HOST_GCC_AT_LEAST_4_8 # protobuf
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
 	depends on !BR2_STATIC_LIBS # protobuf
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	select BR2_PACKAGE_C_ARES
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PROTOBUF
@@ -17,6 +18,7 @@ config BR2_PACKAGE_GRPC
 	  http://github.com/grpc/grpc
 
 comment "grpc needs a toolchain w/ C++, threads, dynamic library, host and target gcc >= 4.8"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
 		|| BR2_STATIC_LIBS || !BR2_HOST_GCC_AT_LEAST_4_8 \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index 6ca6536fff..6c804429ff 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -23,6 +23,12 @@ GRPC_CONF_OPTS = \
 	-DgRPC_ZLIB_PROVIDER=package \
 	-DgRPC_NATIVE_CPP_PLUGIN=$(HOST_DIR)/bin/grpc_cpp_plugin
 
+# grpc can use __atomic builtins, so we need to link with
+# libatomic when available
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+GRPC_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
+endif
+
 HOST_GRPC_CONF_OPTS = \
 	-D_gRPC_CARES_LIBRARIES=cares \
 	-DgRPC_CARES_PROVIDER=none \
