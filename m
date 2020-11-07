From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  7 Nov 2020 01:28:36 +0100
Subject: [Buildroot] [PATCH v4 4/4] package/bpftrace: new package
In-Reply-To: <20201107002836.3101760-1-romain.naour@gmail.com>
References: <20201107002836.3101760-1-romain.naour@gmail.com>
Message-ID: <20201107002836.3101760-4-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Qais Yousef <qais.yousef@arm.com>

bpftrace is a high-level tracing language for Linux enhanced Berkeley
Packet Filter (eBPF) available in recent Linux kernels (4.x).

Only tested on x86_64 and aarch64. The package doesn't support i386 and
aarch32.

Signed-off-by: Qais Yousef <qais.yousef@arm.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
---
v2: patch to build bundled libraries statically
    Add glibc dependency
    Rework to select bcc, libbpf and llvm RTII dependencies.
    Add reverse dependencies
    Add BR2_PACKAGE_BPFTRACE_ARCH_SUPPORTS
    Bump the version to the latest (upcoming 0.12)
      due to many build issues (and patch to backport) with
      the latest release.
    Add binutils optional dependency to provide libbfd and libopcodes.
    Disable manpages.
---
 package/Config.in                             |  1 +
 ...resources-parser-as-static-libraries.patch | 71 +++++++++++++++++++
 package/bpftrace/Config.in                    | 40 +++++++++++
 package/bpftrace/bpftrace.hash                |  3 +
 package/bpftrace/bpftrace.mk                  | 21 ++++++
 5 files changed, 136 insertions(+)
 create mode 100644 package/bpftrace/0001-cmake-link-ast-resources-parser-as-static-libraries.patch
 create mode 100644 package/bpftrace/Config.in
 create mode 100644 package/bpftrace/bpftrace.hash
 create mode 100644 package/bpftrace/bpftrace.mk

diff --git a/package/Config.in b/package/Config.in
index c0b8b06846..3fa16fdb2a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -86,6 +86,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/bcc/Config.in"
 	source "package/blktrace/Config.in"
 	source "package/bonnie/Config.in"
+	source "package/bpftrace/Config.in"
 	source "package/cache-calibrator/Config.in"
 	source "package/clinfo/Config.in"
 	source "package/dacapo/Config.in"
diff --git a/package/bpftrace/0001-cmake-link-ast-resources-parser-as-static-libraries.patch b/package/bpftrace/0001-cmake-link-ast-resources-parser-as-static-libraries.patch
new file mode 100644
index 0000000000..d99b97c3a4
--- /dev/null
+++ b/package/bpftrace/0001-cmake-link-ast-resources-parser-as-static-libraries.patch
@@ -0,0 +1,71 @@
+From 960d2b69975462e445733482ac8d6ea319d3c5b2 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Thu, 5 Nov 2020 01:19:54 +0100
+Subject: [PATCH] cmake: link ast, resources parser as static libraries
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ CMakeLists.txt           | 2 +-
+ resources/CMakeLists.txt | 2 +-
+ src/arch/CMakeLists.txt  | 8 ++++----
+ src/ast/CMakeLists.txt   | 2 +-
+ 4 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d732d23..4ebd3ce 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -91,7 +91,7 @@ find_package(FLEX REQUIRED)
+ bison_target(bison_parser src/parser.yy ${CMAKE_BINARY_DIR}/parser.tab.cc VERBOSE)
+ flex_target(flex_lexer src/lexer.l ${CMAKE_BINARY_DIR}/lex.yy.cc)
+ add_flex_bison_dependency(flex_lexer bison_parser)
+-add_library(parser ${BISON_bison_parser_OUTPUTS} ${FLEX_flex_lexer_OUTPUTS})
++add_library(parser STATIC ${BISON_bison_parser_OUTPUTS} ${FLEX_flex_lexer_OUTPUTS})
+ target_compile_options(parser PRIVATE "-w")
+ target_include_directories(parser PUBLIC src src/ast ${CMAKE_BINARY_DIR})
+ 
+diff --git a/resources/CMakeLists.txt b/resources/CMakeLists.txt
+index a95c60a..2b05a68 100644
+--- a/resources/CMakeLists.txt
++++ b/resources/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-add_library(resources headers.cpp)
++add_library(resources STATIC headers.cpp)
+ 
+ target_include_directories(resources PUBLIC ../src)
+ 
+diff --git a/src/arch/CMakeLists.txt b/src/arch/CMakeLists.txt
+index a26c1c8..fca9a6b 100644
+--- a/src/arch/CMakeLists.txt
++++ b/src/arch/CMakeLists.txt
+@@ -1,13 +1,13 @@
+ if(CMAKE_SYSTEM_PROCESSOR STREQUAL "aarch64")
+-    add_library(arch aarch64.cpp)
++    add_library(arch STATIC aarch64.cpp)
+ elseif(CMAKE_SYSTEM_PROCESSOR STREQUAL "ppc64" OR
+        CMAKE_SYSTEM_PROCESSOR STREQUAL "ppc64le")
+-    add_library(arch ppc64.cpp)
++    add_library(arch STATIC ppc64.cpp)
+ elseif(CMAKE_SYSTEM_PROCESSOR STREQUAL "s390" OR
+        CMAKE_SYSTEM_PROCESSOR STREQUAL "s390x")
+-    add_library(arch s390.cpp)
++    add_library(arch STATIC s390.cpp)
+ elseif(CMAKE_SYSTEM_PROCESSOR STREQUAL "x86_64")
+-    add_library(arch x86_64.cpp)
++    add_library(arch STATIC x86_64.cpp)
+ else()
+   message(FATAL_ERROR "Unsupported architecture: ${CMAKE_SYSTEM_PROCESSOR}")
+ endif()
+diff --git a/src/ast/CMakeLists.txt b/src/ast/CMakeLists.txt
+index 649bf0a..477d809 100644
+--- a/src/ast/CMakeLists.txt
++++ b/src/ast/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-add_library(ast
++add_library(ast STATIC
+   ast.cpp
+   attachpoint_parser.cpp
+   codegen_llvm.cpp
+-- 
+2.25.4
+
diff --git a/package/bpftrace/Config.in b/package/bpftrace/Config.in
new file mode 100644
index 0000000000..f627725afe
--- /dev/null
+++ b/package/bpftrace/Config.in
@@ -0,0 +1,40 @@
+config BR2_PACKAGE_BPFTRACE_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_x86_64
+
+config BR2_PACKAGE_BPFTRACE
+	bool "bpftrace"
+	depends on BR2_PACKAGE_BPFTRACE_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # bcc
+	depends on BR2_TOOLCHAIN_USES_GLIBC # bcc
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # bcc, clang
+	depends on BR2_INSTALL_LIBSTDCPP # bcc, clang
+	select BR2_PACKAGE_BCC
+	select BR2_PACKAGE_LIBBPF
+	# LLVM RTTI mendatory: https://github.com/iovisor/bpftrace/issues/1156
+	select BR2_PACKAGE_LLVM_RTTI
+	help
+	  bpftrace is a high-level tracing language for Linux enhanced
+	  Berkeley Packet Filter (eBPF) available in recent Linux
+	  kernels (4.x).
+
+	  bpftrace uses LLVM as a backend to compile scripts to
+	  BPF-bytecode and makes use of BCC for interacting with the
+	  Linux BPF system, as well as existing Linux tracing
+	  capabilities: kernel dynamic tracing (kprobes), user-level
+	  dynamic tracing (uprobes), and tracepoints. The bpftrace
+	  language is inspired by awk and C, and predecessor tracers
+	  such as DTrace and SystemTap.
+
+	  It's highly recommended to NOT strip bpftrace binary.
+	  To do so, add "bpftrace" to BR2_STRIP_EXCLUDE_FILES.
+	  See:
+	    https://bugzilla.redhat.com/show_bug.cgi?id=1865787
+
+	  https://www.github.com/iovisor/bpftrace
+
+comment "bpftrace needs a glibc toolchain w/ C++, gcc >= 4.8"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/bpftrace/bpftrace.hash b/package/bpftrace/bpftrace.hash
new file mode 100644
index 0000000000..b48d9555fd
--- /dev/null
+++ b/package/bpftrace/bpftrace.hash
@@ -0,0 +1,3 @@
+# locally calculated
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
+sha256  1f08661bac9dfa7d3d76b54b3b4d1738b02c3847049da90a5cff25093a9dc9c9  bpftrace-487dd815bfe4a24908950552f35ef17d6653b2f8.tar.gz
diff --git a/package/bpftrace/bpftrace.mk b/package/bpftrace/bpftrace.mk
new file mode 100644
index 0000000000..0d8640a184
--- /dev/null
+++ b/package/bpftrace/bpftrace.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# bpftrace
+#
+################################################################################
+
+# upcoming 0.12 version.
+BPFTRACE_VERSION = 487dd815bfe4a24908950552f35ef17d6653b2f8
+BPFTRACE_SITE = $(call github,iovisor,bpftrace,$(BPFTRACE_VERSION))
+BPFTRACE_LICENSE = Apache-2.0
+BPFTRACE_LICENSE_FILES = LICENSE
+BPFTRACE_DEPENDENCIES = host-bison host-flex bcc libbpf llvm
+
+# libbfd, libopcodes
+ifeq ($(BR2_PACKAGE_BINUTILS),y)
+BPFTRACE_DEPENDENCIES += binutils
+endif
+
+BPFTRACE_CONF_OPTS += -DENABLE_MAN=OFF
+
+$(eval $(cmake-package))
-- 
2.25.4
