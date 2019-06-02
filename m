From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  2 Jun 2019 18:25:57 +0200
Subject: [Buildroot] [PATCH v4,
 1/1] package/grpc: fix build with uclibc on x86_64
Message-ID: <20190602162557.21667-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On x86_64 if GPR_MUSL_LIBC_COMPAT is not set, grpc tries to link with
memcpy at GLIBC_2.2.5, see:
https://github.com/grpc/grpc/blob/618a3f561d4a93f263cca23abad086ed8f4d5e86/src/core/lib/gpr/wrap_memcpy.cc

Add a new GPR_DISABLE_WRAPPED_MEMCPY to disable wrapped memory without
changing CPU behavior

Fixes:
 - http://autobuild.buildroot.org/results/20d6f2489a4e291a53bd514da66105eb607e1014

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v3 -> v4:
 - Add upstream URL for patch
 - Fix typo in GPR_DISABLE_WRAPPED_MEMCPY

Changes v2 -> v3 (after review of Thomas Petazzoni and Arnout
Vandecappelle):
 - Add GPR_DISABLE_WRAPPED_MEMCPY variable instead of using
   GPR_MUSL_LIBC_COMPAT to avoid changing CPU behavior

Changes v1 -> v2:
 - Pass TARGET_CXXFLAGS to CMAKE_CXX_FLAGS

 ...py.cc-add-GPR_DISABLE_WRAPPED_MEMCPY.patch | 34 +++++++++++++++++++
 package/grpc/grpc.mk                          |  8 +++++
 2 files changed, 42 insertions(+)
 create mode 100644 package/grpc/0003-wrap_memcpy.cc-add-GPR_DISABLE_WRAPPED_MEMCPY.patch

diff --git a/package/grpc/0003-wrap_memcpy.cc-add-GPR_DISABLE_WRAPPED_MEMCPY.patch b/package/grpc/0003-wrap_memcpy.cc-add-GPR_DISABLE_WRAPPED_MEMCPY.patch
new file mode 100644
index 0000000000..ad64804470
--- /dev/null
+++ b/package/grpc/0003-wrap_memcpy.cc-add-GPR_DISABLE_WRAPPED_MEMCPY.patch
@@ -0,0 +1,34 @@
+From be030314805137cd63b46ea6eaa702b608669910 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 2 Jun 2019 17:45:47 +0200
+Subject: [PATCH] wrap_memcpy.cc: add GPR_DISABLE_WRAPPED_MEMCPY
+
+Add GPR_DISABLE_WRAPPED_MEMCPY to allow the user to disable wrapped
+memcpy. This will fix build on x86_64 on musl/uclibc without changing
+the cpu behavior.
+
+Fixes:
+ - http://autobuild.buildroot.org/results/20d6f2489a4e291a53bd514da66105eb607e1014
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/grpc/grpc/pull/19207]
+---
+ src/core/lib/gpr/wrap_memcpy.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/core/lib/gpr/wrap_memcpy.cc b/src/core/lib/gpr/wrap_memcpy.cc
+index 9b8608e056..38b76acf95 100644
+--- a/src/core/lib/gpr/wrap_memcpy.cc
++++ b/src/core/lib/gpr/wrap_memcpy.cc
+@@ -28,7 +28,7 @@
+ 
+ extern "C" {
+ #ifdef __linux__
+-#if defined(__x86_64__) && !defined(GPR_MUSL_LIBC_COMPAT)
++#if defined(__x86_64__) && !defined(GPR_MUSL_LIBC_COMPAT) && !defined(GPR_DISABLE_WRAPPED_MEMCPY)
+ __asm__(".symver memcpy,memcpy at GLIBC_2.2.5");
+ void* __wrap_memcpy(void* destination, const void* source, size_t num) {
+   return memcpy(destination, source, num);
+-- 
+2.20.1
+
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index 9506e0268a..1a5f8855a1 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -33,6 +33,14 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 GRPC_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
 endif
 
+# Set GPR_DISABLE_WRAPPED_MEMCPY otherwise build will fail on x86_64 with uclibc
+# because grpc tries to link with memcpy at GLIBC_2.2.5
+ifeq ($(BR2_x86_64):$(BR2_TOOLCHAIN_USES_GLIBC),y:)
+GRPC_CONF_OPTS += \
+	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -DGPR_DISABLE_WRAPPED_MEMCPY" \
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -DGPR_DISABLE_WRAPPED_MEMCPY"
+endif
+
 HOST_GRPC_CONF_OPTS = \
 	-D_gRPC_CARES_LIBRARIES=cares \
 	-DgRPC_CARES_PROVIDER=none \
-- 
2.20.1
