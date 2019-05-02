From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Thu,  2 May 2019 20:51:26 +0200
Subject: [Buildroot] [PATCH v2 7/7] package/bcc: new package
In-Reply-To: <1556823086-29917-1-git-send-email-jugurtha.belkalem@smile.fr>
References: <1556823086-29917-1-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <1556823086-29917-8-git-send-email-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Romain Naour <romain.naour@smile.fr>

bcc is a front-end tool for eBPF :
https://github.com/iovisor/bcc/blob/master/README.md.
eBPF is the most powerful Linux tracer, and bcc
allows to write eBPF scripts in C and PYTHON3.

bcc can help to troubleshoot issues quickly on
embedded systems (as long as Linux kernel
version >= 4.1).

bcc can also make it easy to create observabilty tools,
SDN configuration, ddos mitigation, intrusion detection
and secure containers. More information is available at:
http://www.brendangregg.com/ebpf.html.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
---
---
 package/Config.in                                  |  1 +
 ...CMake-Allow-to-disable-building-man-pages.patch | 35 +++++++++++++++
 package/bcc/0002-fix-aarch64-cross-compile.patch   | 38 ++++++++++++++++
 package/bcc/Config.in                              | 51 ++++++++++++++++++++++
 package/bcc/bcc.hash                               |  3 ++
 package/bcc/bcc.mk                                 | 23 ++++++++++
 6 files changed, 151 insertions(+)
 create mode 100644 package/bcc/0001-CMake-Allow-to-disable-building-man-pages.patch
 create mode 100644 package/bcc/0002-fix-aarch64-cross-compile.patch
 create mode 100644 package/bcc/Config.in
 create mode 100644 package/bcc/bcc.hash
 create mode 100644 package/bcc/bcc.mk

diff --git a/package/Config.in b/package/Config.in
index 38d5321..b2fa28d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -79,6 +79,7 @@ menu "Compressors and decompressors"
 endmenu
 
 menu "Debugging, profiling and benchmark"
+	source "package/bcc/Config.in"
 	source "package/blktrace/Config.in"
 	source "package/bonnie/Config.in"
 	source "package/cache-calibrator/Config.in"
diff --git a/package/bcc/0001-CMake-Allow-to-disable-building-man-pages.patch b/package/bcc/0001-CMake-Allow-to-disable-building-man-pages.patch
new file mode 100644
index 0000000..c5c87d5
--- /dev/null
+++ b/package/bcc/0001-CMake-Allow-to-disable-building-man-pages.patch
@@ -0,0 +1,35 @@
+From a99f097aedbf964356e62c0c4bba1257f108c3eb Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 7 Dec 2018 22:36:21 +0100
+Subject: [PATCH] CMake: Allow to disable building man pages
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ CMakeLists.txt | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index bb3f53b9..5e95d555 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -19,6 +19,7 @@ include(cmake/FindCompilerFlag.cmake)
+ option(ENABLE_LLVM_SHARED "Enable linking LLVM as a shared library" OFF)
+ option(ENABLE_CLANG_JIT "Enable Loading BPF through Clang Frontend" ON)
+ option(ENABLE_USDT "Enable User-level Statically Defined Tracing" ON)
++option(ENABLE_MAN "Build man pages" ON)
+ CMAKE_DEPENDENT_OPTION(ENABLE_CPP_API "Enable C++ API" ON "ENABLE_USDT" OFF)
+ 
+ set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
+@@ -88,7 +89,9 @@ add_subdirectory(src)
+ add_subdirectory(introspection)
+ if(ENABLE_CLANG_JIT)
+ add_subdirectory(examples)
++if(ENABLE_MAN)
+ add_subdirectory(man)
++endif(ENABLE_MAN)
+ add_subdirectory(tests)
+ add_subdirectory(tools)
+ endif(ENABLE_CLANG_JIT)
+-- 
+2.14.5
+
diff --git a/package/bcc/0002-fix-aarch64-cross-compile.patch b/package/bcc/0002-fix-aarch64-cross-compile.patch
new file mode 100644
index 0000000..896ad6a
--- /dev/null
+++ b/package/bcc/0002-fix-aarch64-cross-compile.patch
@@ -0,0 +1,38 @@
+From 4198c9589f9285c2f4e656159e28a3f19e280a7b Mon Sep 17 00:00:00 2001
+From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
+Date: Thu, 2 May 2019 11:06:23 +0200
+Subject: [PATCH] luajit: fix aarch64 cross-compile
+
+Unlike CMAKE_SYSTEM_PROCESSOR which identifies aarch64
+as a valid architecture, luajit does not recognize it.
+luajit defines aarch64 as arm64.
+
+Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
+---
+ src/lua/CMakeLists.txt | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/src/lua/CMakeLists.txt b/src/lua/CMakeLists.txt
+index 7541d48..59415b0 100644
+--- a/src/lua/CMakeLists.txt
++++ b/src/lua/CMakeLists.txt
+@@ -13,9 +13,15 @@ if (LUAJIT_LIBRARIES AND LUAJIT)
+ 		DEPENDS ${SRC_LUA} ${CMAKE_CURRENT_SOURCE_DIR}/squishy
+ 	)
+ 
++	if (CMAKE_SYSTEM_PROCESSOR STREQUAL "aarch64")
++		SET (LUAJIT_TARGET_ARCH arm64)
++	else()
++		SET (LUAJIT_TARGET_ARCH ${CMAKE_SYSTEM_PROCESSOR})
++	endif()
++
+ 	ADD_CUSTOM_COMMAND(
+ 		OUTPUT bcc.o
+-		COMMAND ${LUAJIT} -bg bcc.lua bcc.o
++		COMMAND ${LUAJIT} -bg bcc.lua -a ${LUAJIT_TARGET_ARCH} bcc.o
+ 		DEPENDS bcc.lua
+ 	)
+ 
+-- 
+2.7.4
+
diff --git a/package/bcc/Config.in b/package/bcc/Config.in
new file mode 100644
index 0000000..4efcb94
--- /dev/null
+++ b/package/bcc/Config.in
@@ -0,0 +1,51 @@
+config BR2_PACKAGE_BCC
+	bool "bcc"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_USES_GLIBC # hardcode GNU tuple (x86_64-unknown-linux-gnu)
+	depends on BR2_LINUX_KERNEL # needs kernel sources on the target
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # clang
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # clang
+	depends on BR2_TOOLCHAIN_HAS_THREADS # clang
+	depends on BR2_INSTALL_LIBSTDCPP # clang
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # clang
+	depends on !BR2_STATIC_LIBS # clang, luajit
+	depends on BR2_USE_WCHAR # clang
+	select BR2_PACKAGE_CLANG
+	select BR2_PACKAGE_ELFUTILS
+	select BR2_PACKAGE_FLEX # needs FlexLexer.h
+	select BR2_PACKAGE_LLVM_BPF
+	select BR2_PACKAGE_LUAJIT
+	select BR2_PACKAGE_PYTHON_BCC # wrappers for BPF
+	help
+	  BPF Compiler Collection (BCC)
+
+	  BCC is a toolkit for creating efficient kernel tracing and
+	  manipulation programs, and includes several useful tools and
+	  examples. It makes use of extended BPF (Berkeley Packet
+	  Filters), formally known as eBPF, a new feature that was
+	  first added to Linux 3.15. Much of what BCC uses requires
+	  Linux 4.1 and above.
+
+	  Note: Before using bcc, you need to copy the kernel source
+	  code to the target. By default bcc use:
+	  "/lib/module/<kernel version>/build". That's because the
+	  clang frontend build eBPF code at runtime.
+
+	  https://github.com/iovisor/bcc
+
+comment "bcc needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+comment "bcc needs a glibc toolchain w/ wchar, threads, C++, gcc >= 4.8, host gcc >= 4.8, dynamic library"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on BR2_LINUX_KERNEL
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_HOST_GCC_AT_LEAST_4_8 \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || BR2_STATIC_LIBS \
+		|| !BR2_USE_WCHAR
+
+comment "bcc needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/bcc/bcc.hash b/package/bcc/bcc.hash
new file mode 100644
index 0000000..19eccb3
--- /dev/null
+++ b/package/bcc/bcc.hash
@@ -0,0 +1,3 @@
+# locally calculated
+sha256 269949a47f9ed2ff01b5ebca20ec4a52341f7ff14b033b9dc1669b72a87af042  bcc-v0.8.0.tar.gz
+sha256 b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE.txt
diff --git a/package/bcc/bcc.mk b/package/bcc/bcc.mk
new file mode 100644
index 0000000..e8f53eb
--- /dev/null
+++ b/package/bcc/bcc.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# bcc
+#
+################################################################################
+
+BCC_VERSION = v0.8.0
+BCC_SITE = $(call github,iovisor,bcc,$(BCC_VERSION))
+BCC_LICENSE = Apache-2.0
+BCC_LICENSE_FILES = LICENSE.txt
+# libbcc.so and libbpf.so
+BCC_INSTALL_STAGING = YES
+
+BCC_DEPENDENCIES = host-bison host-flex host-luajit clang elfutils flex llvm luajit
+
+# ENABLE_LLVM_SHARED=ON to use llvm.so.
+# Force REVISION otherwise bcc will use git describe to generate a version number.
+BCC_CONF_OPTS = -DENABLE_LLVM_SHARED=ON \
+	-DREVISION=$(BCC_VERSION) \
+	-DENABLE_CLANG_JIT=ON \
+	-DENABLE_MAN=OFF
+
+$(eval $(cmake-package))
-- 
2.7.4
