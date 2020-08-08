From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  8 Aug 2020 17:39:44 +0200
Subject: [Buildroot] [PATCH 2/2] package/libabseil-cpp: add
 BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
In-Reply-To: <20200808153945.734250-1-thomas.petazzoni@bootlin.com>
References: <20200808153945.734250-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200808153945.734250-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libabseil-cpp package fails to build on a number of CPU
architectures in our autobuilders.

On most CPU architectures, the first issue looked like this:

libabseil-cpp-20200225/absl/base/internal/direct_mmap.h: In function 'void* absl::lts_2020_02_25::base_internal::DirectMmap(void*, size_t, int, int, int, off64_t)':
libabseil-cpp-20200225/absl/base/internal/direct_mmap.h:121:39: error: static assertion failed: Platform is not 64-bit
  121 |   static_assert(sizeof(unsigned long) == 8, "Platform is not 64-bit");
      |                 ~~~~~~~~~~~~~~~~~~~~~~^~~~
libabseil-cpp-20200225/absl/base/internal/direct_mmap.h:123:15: error: 'SYS_mmap' was not declared in this scope; did you mean 'SYS_mmap2'?
  123 |       syscall(SYS_mmap, start, length, prot, flags, fd, offset));
      |               ^~~~~~~~
      |               SYS_mmap2

Indeed, on 32-bit architectures, libabseil-cpp has some special code
to use the mmap2() system call, and it white-lists the supported
architectures. It is therefore trivial to add support for more
architectures.

However, once this is fixed, another issue arises:
absl/debugging/internal/examine_stack.cc uses the ucontext data
structures, which are not provided by uClibc-ng on all CPU
architectures, and even the code of libabseil-cpp does not exist for
all CPU architectures.

So, this commit solves that by simply making libabseil-cpp available
on architectures/C libraries where it is supported: it needs ucontext
support in the toolchain + a CPU architecture where
absl/debugging/internal/examine_stack.cc has the appropriate logic.

This new dependency is propagated to the reverse dependencies of
libabseil-cpp.

With this commit, libabseil-cpp passes a test-pkg -a test (so all
external toolchains used by the autobuilders):

                             andes-nds32 [ 1/45]: SKIPPED
                             arm-aarch64 [ 2/45]: OK
                        br-aarch64-glibc [ 3/45]: OK
                           br-arcle-hs38 [ 4/45]: SKIPPED
                            br-arm-basic [ 5/45]: SKIPPED
                  br-arm-cortex-a9-glibc [ 6/45]: OK
                   br-arm-cortex-a9-musl [ 7/45]: OK
                   br-arm-cortex-m4-full [ 8/45]: SKIPPED
                             br-arm-full [ 9/45]: OK
                    br-arm-full-nothread [10/45]: SKIPPED
                      br-arm-full-static [11/45]: SKIPPED
                   br-i386-pentium4-full [12/45]: OK
                br-i386-pentium-mmx-musl [13/45]: OK
                       br-m68k-5208-full [14/45]: SKIPPED
                      br-m68k-68040-full [15/45]: SKIPPED
                    br-microblazeel-full [16/45]: SKIPPED
                 br-mips32r6-el-hf-glibc [17/45]: OK
                      br-mips64-n64-full [18/45]: OK
                 br-mips64r6-el-hf-glibc [19/45]: OK
                      br-mipsel-o32-full [20/45]: OK
                          br-nios2-glibc [21/45]: SKIPPED
                      br-openrisc-uclibc [22/45]: SKIPPED
               br-powerpc-603e-basic-cpp [23/45]: SKIPPED
             br-powerpc64le-power8-glibc [24/45]: OK
               br-powerpc64-power7-glibc [25/45]: OK
                  br-powerpc-e500mc-full [26/45]: SKIPPED
                              br-riscv32 [27/45]: OK
                              br-riscv64 [28/45]: OK
                         br-riscv64-musl [29/45]: OK
                             br-sh4-full [30/45]: SKIPPED
                        br-sparc64-glibc [31/45]: SKIPPED
                         br-sparc-uclibc [32/45]: SKIPPED
                    br-x86-64-core2-full [33/45]: OK
                          br-x86-64-musl [34/45]: OK
                          br-xtensa-full [35/45]: SKIPPED
                       linaro-aarch64-be [36/45]: OK
                          linaro-aarch64 [37/45]: OK
                              linaro-arm [38/45]: OK
                     sourcery-arm-armv4t [39/45]: OK
                            sourcery-arm [40/45]: OK
                     sourcery-arm-thumb2 [41/45]: OK
                         sourcery-mips64 [42/45]: OK
                           sourcery-mips [43/45]: OK
                          sourcery-nios2 [44/45]: SKIPPED
                         sourcery-x86-64 [45/45]: OK
45 builds, 18 skipped, 0 build failed, 0 legal-info failed

Fixes:

  http://autobuild.buildroot.net/results/ead663b4b67b0b57ed003a46db3182d95cc01bc0/
  (and many similar build failures)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/collectd/Config.in      |  2 ++
 package/grpc/Config.in          |  2 ++
 package/libabseil-cpp/Config.in | 15 +++++++++++++++
 3 files changed, 19 insertions(+)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 276ad17329..cd5d876e80 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -572,6 +572,7 @@ config BR2_PACKAGE_COLLECTD_GRPC
 	depends on BR2_INSTALL_LIBSTDCPP # grpc -> protobuf
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # grpc -> protobuf
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # grpc -> protobuf
+	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # grpc
 	select BR2_PACKAGE_GRPC
 	help
 	  Send/receive values using the gRPC protocol.
@@ -580,6 +581,7 @@ comment "grpc needs a toolchain w/ C++, gcc >= 4.8"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # grpc
 
 config BR2_PACKAGE_COLLECTD_MQTT
 	bool "mqtt"
diff --git a/package/grpc/Config.in b/package/grpc/Config.in
index 43ccddbdaf..a2da3f4c53 100644
--- a/package/grpc/Config.in
+++ b/package/grpc/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_GRPC
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
 	depends on !BR2_STATIC_LIBS # protobuf, libabseil-cpp
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	select BR2_PACKAGE_C_ARES
 	select BR2_PACKAGE_LIBABSEIL_CPP
 	select BR2_PACKAGE_OPENSSL
@@ -18,6 +19,7 @@ config BR2_PACKAGE_GRPC
 	  http://github.com/grpc/grpc
 
 comment "grpc needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.8"
+	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
 		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/libabseil-cpp/Config.in b/package/libabseil-cpp/Config.in
index 7b1ca37917..5e20a82856 100644
--- a/package/libabseil-cpp/Config.in
+++ b/package/libabseil-cpp/Config.in
@@ -1,8 +1,22 @@
+# see absl/debugging/internal/examine_stack.cc for the list of
+# architectures that are supported, and for which ucontext is used.
+config BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
+	bool
+	depends on BR2_TOOLCHAIN_HAS_UCONTEXT
+	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_arm || BR2_armeb
+	default y if BR2_i386
+	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_riscv
+	default y if BR2_x86_64
+
 config BR2_PACKAGE_LIBABSEIL_CPP
 	bool "libabseil-cpp"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # uses dlfcn.h
+	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	help
 	  Abseil is an open-source collection of C++ library code
 	  designed to augment the C++ standard library. The Abseil
@@ -13,5 +27,6 @@ config BR2_PACKAGE_LIBABSEIL_CPP
 	  https://github.com/abseil/abseil-cpp
 
 comment "libabseil-cpp needs a toolchain w/ C++, threads, dynamic library"
+	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS
-- 
2.26.2
