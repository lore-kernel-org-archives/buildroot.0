From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 30 May 2019 12:48:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/grpc: fix build with uclibc on
 x86_64
Message-ID: <20190530104848.24885-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On x86_64 if GPR_MUSL_LIBC_COMPAT is not set, grpc tries to link with
memcpy at GLIBC_2.2.5, see:
https://github.com/grpc/grpc/blob/618a3f561d4a93f263cca23abad086ed8f4d5e86/src/core/lib/gpr/wrap_memcpy.cc

Fixes:
 - http://autobuild.buildroot.org/results/20d6f2489a4e291a53bd514da66105eb607e1014

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/grpc/grpc.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index 9506e0268a..8da9f95a18 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -33,6 +33,14 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 GRPC_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
 endif
 
+# Set GPR_MUSL_LIBC_COMPAT otherwise build will fail on x86_64 with uclibc
+# because grpc tries to link with memcpy at GLIBC_2.2.5
+ifeq ($(BR2_x86_64):$(BR2_TOOLCHAIN_USES_GLIBC),y:)
+GRPC_CONF_OPTS += \
+	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -DGPR_MUSL_LIBC_COMPAT" \
+	-DCMAKE_CXX_FLAGS="$(TARGET_CFLAGS) -DGPR_MUSL_LIBC_COMPAT"
+endif
+
 HOST_GRPC_CONF_OPTS = \
 	-D_gRPC_CARES_LIBRARIES=cares \
 	-DgRPC_CARES_PROVIDER=none \
-- 
2.20.1
