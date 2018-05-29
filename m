From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Tue, 29 May 2018 16:29:50 +0200
Subject: [Buildroot] [PATCH] package/clang: fix for host-clang binaries
Message-ID: <20180529142950.30025-1-valentin.korenblit@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch fixes the following error when trying to execute clang compiler
(host-variant):

CommandLine Error: Option 'x86-use-base-pointer' registered more than once!
LLVM ERROR: inconsistency in registered CommandLine options

The same happens for the other binaries, such as clang-format:

./clang-format
: CommandLine Error: Option 'help-list' registered more than once!
LLVM ERROR: inconsistency in registered CommandLine options

Clang binaries are tools, and given that DLLVM_LINK_LLVM_DYLIB is set,
they are linked against libLLVM.so. The problem is that binaries are
also linking against some LLVM static libraries, resulting in the error
shown above. However, it is not the same case for libclang, which is also
a tool but links only against libLLVM.so.

To fix this problem, remove static linking of clang binaries against
LLVM libraries.

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
---

Currently there is no package in Buildroot that needs host-clang compiler. 
This error was found when trying to build libclc (WIP) after having applied:
http://lists.busybox.net/pipermail/buildroot/2018-May/221386.html

 ...ng-binaries-from-linking-against-LLVM-sta.patch | 128 +++++++++++++++++++++
 1 file changed, 128 insertions(+)
 create mode 100644 package/clang/0001-Prevent-clang-binaries-from-linking-against-LLVM-sta.patch

diff --git a/package/clang/0001-Prevent-clang-binaries-from-linking-against-LLVM-sta.patch b/package/clang/0001-Prevent-clang-binaries-from-linking-against-LLVM-sta.patch
new file mode 100644
index 0000000000..10370cc230
--- /dev/null
+++ b/package/clang/0001-Prevent-clang-binaries-from-linking-against-LLVM-sta.patch
@@ -0,0 +1,128 @@
+From 7e8dc6f5d11b8717dd40ac7d2c9137c4c7cefd1d Mon Sep 17 00:00:00 2001
+From: Valentin Korenblit <valentin.korenblit@smile.fr>
+Date: Tue, 29 May 2018 14:34:15 +0200
+Subject: [PATCH] Prevent clang binaries from linking against LLVM static libs
+
+Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
+---
+ tools/c-index-test/CMakeLists.txt          |  4 ----
+ tools/clang-check/CMakeLists.txt           |  6 ------
+ tools/clang-format/CMakeLists.txt          |  2 --
+ tools/clang-format/fuzzer/CMakeLists.txt   |  2 --
+ tools/clang-import-test/CMakeLists.txt     |  5 -----
+ tools/clang-offload-bundler/CMakeLists.txt |  2 --
+ tools/clang-rename/CMakeLists.txt          |  5 -----
+ tools/driver/CMakeLists.txt                | 18 ------------------
+ 8 files changed, 44 deletions(-)
+
+diff --git a/tools/c-index-test/CMakeLists.txt b/tools/c-index-test/CMakeLists.txt
+index ad990e010e..a71e7a49bc 100644
+--- a/tools/c-index-test/CMakeLists.txt
++++ b/tools/c-index-test/CMakeLists.txt
+@@ -1,7 +1,3 @@
+-set(LLVM_LINK_COMPONENTS
+-  support
+-)
+-
+ add_clang_executable(c-index-test
+   c-index-test.c
+   core_main.cpp
+diff --git a/tools/clang-check/CMakeLists.txt b/tools/clang-check/CMakeLists.txt
+index 04151a8e03..a2753c08f2 100644
+--- a/tools/clang-check/CMakeLists.txt
++++ b/tools/clang-check/CMakeLists.txt
+@@ -1,9 +1,3 @@
+-set( LLVM_LINK_COMPONENTS
+-  ${LLVM_TARGETS_TO_BUILD}
+-  Option
+-  Support
+-  )
+-
+ add_clang_executable(clang-check
+   ClangCheck.cpp
+   )
+diff --git a/tools/clang-format/CMakeLists.txt b/tools/clang-format/CMakeLists.txt
+index a13633eaef..bdee9b8f68 100644
+--- a/tools/clang-format/CMakeLists.txt
++++ b/tools/clang-format/CMakeLists.txt
+@@ -1,5 +1,3 @@
+-set(LLVM_LINK_COMPONENTS support)
+-
+ add_clang_tool(clang-format
+   ClangFormat.cpp
+   )
+diff --git a/tools/clang-format/fuzzer/CMakeLists.txt b/tools/clang-format/fuzzer/CMakeLists.txt
+index c7772fcb2f..484d1b9446 100644
+--- a/tools/clang-format/fuzzer/CMakeLists.txt
++++ b/tools/clang-format/fuzzer/CMakeLists.txt
+@@ -1,5 +1,3 @@
+-set(LLVM_LINK_COMPONENTS support)
+-
+ add_clang_executable(clang-format-fuzzer
+   EXCLUDE_FROM_ALL
+   ClangFormatFuzzer.cpp
+diff --git a/tools/clang-import-test/CMakeLists.txt b/tools/clang-import-test/CMakeLists.txt
+index bd4919694a..bcfab77cde 100644
+--- a/tools/clang-import-test/CMakeLists.txt
++++ b/tools/clang-import-test/CMakeLists.txt
+@@ -1,8 +1,3 @@
+-set(LLVM_LINK_COMPONENTS
+-  core
+-  support
+-)
+-
+ if(NOT CLANG_BUILT_STANDALONE)
+   set(tablegen_deps intrinsics_gen)
+ endif()
+diff --git a/tools/clang-offload-bundler/CMakeLists.txt b/tools/clang-offload-bundler/CMakeLists.txt
+index 6161d08ae5..17fcd5a1fe 100644
+--- a/tools/clang-offload-bundler/CMakeLists.txt
++++ b/tools/clang-offload-bundler/CMakeLists.txt
+@@ -1,5 +1,3 @@
+-set(LLVM_LINK_COMPONENTS BitWriter Core Object Support)
+-
+ if(NOT CLANG_BUILT_STANDALONE)
+   set(tablegen_deps intrinsics_gen)
+ endif()
+diff --git a/tools/clang-rename/CMakeLists.txt b/tools/clang-rename/CMakeLists.txt
+index 771e3bdea6..f6a4f49f7a 100644
+--- a/tools/clang-rename/CMakeLists.txt
++++ b/tools/clang-rename/CMakeLists.txt
+@@ -1,8 +1,3 @@
+-set(LLVM_LINK_COMPONENTS
+-  Option
+-  Support
+-  )
+-
+ add_clang_executable(clang-rename ClangRename.cpp)
+ 
+ target_link_libraries(clang-rename
+diff --git a/tools/driver/CMakeLists.txt b/tools/driver/CMakeLists.txt
+index 901b6d62e4..bf41f04141 100644
+--- a/tools/driver/CMakeLists.txt
++++ b/tools/driver/CMakeLists.txt
+@@ -1,21 +1,3 @@
+-set( LLVM_LINK_COMPONENTS
+-  ${LLVM_TARGETS_TO_BUILD}
+-  Analysis
+-  CodeGen
+-  Core
+-  IPO
+-  InstCombine
+-  Instrumentation
+-  MC
+-  MCParser
+-  ObjCARCOpts
+-  Option
+-  ScalarOpts
+-  Support
+-  TransformUtils
+-  Vectorize
+-  )
+-
+ option(CLANG_PLUGIN_SUPPORT "Build clang with plugin support" ON)
+ 
+ # Support plugins. This must be before add_clang_executable as it reads
+-- 
+2.14.3
+
-- 
2.14.3
