From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Fri,  4 May 2018 14:27:43 +0200
Subject: [Buildroot] [PATCH] package/clang: link libclang against libLLVM.so
Message-ID: <20180504122743.13589-1-valentin.korenblit@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libclang.so is statically linking against all LLVM static libraries
instead of linking dynamically against libLLVM.so.

This patch fixes this problem partially: libclang links against libLLVM.so
but the following LLVM libraries are still being linked statically:

libLLVMOption.a
libLLVMMCParser.a
libLLVMProfileData.a
libLLVMBitReader.a
libLLVMBinaryFormat.a
libLLVMCore.a
libLLVMMC.a
libLLVMSupport.a
libLLVMDemangle.a

This problem comes out when clang is not built as a subproject of
LLVM (llvm/tools/clang).

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
---
 .../0001-Avoid-linking-LLVM-static-libs.patch      | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/clang/0001-Avoid-linking-LLVM-static-libs.patch

diff --git a/package/clang/0001-Avoid-linking-LLVM-static-libs.patch b/package/clang/0001-Avoid-linking-LLVM-static-libs.patch
new file mode 100644
index 0000000000..919667c2e6
--- /dev/null
+++ b/package/clang/0001-Avoid-linking-LLVM-static-libs.patch
@@ -0,0 +1,31 @@
+From 37c3271cc49fd1556783dae33e0fcb142d6809cd Mon Sep 17 00:00:00 2001
+From: Valentin Korenblit <valentin.korenblit@smile.fr>
+Date: Fri, 4 May 2018 10:54:38 +0200
+Subject: [PATCH] Avoid linking LLVM static libs
+
+Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
+---
+ tools/libclang/CMakeLists.txt | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/tools/libclang/CMakeLists.txt b/tools/libclang/CMakeLists.txt
+index 2dd6703076..c7346c04e5 100644
+--- a/tools/libclang/CMakeLists.txt
++++ b/tools/libclang/CMakeLists.txt
+@@ -90,12 +90,8 @@ add_clang_library(libclang ${ENABLE_SHARED} ${ENABLE_STATIC}
+   DEPENDS clang-headers
+ 
+   LINK_LIBS
+-  ${LIBS}
++  ${LIBS} libLLVM.so
+ 
+-  LINK_COMPONENTS
+-  ${LLVM_TARGETS_TO_BUILD}
+-  Core
+-  Support
+   )
+ 
+ if(ENABLE_SHARED)
+-- 
+2.14.3
+
-- 
2.14.3
