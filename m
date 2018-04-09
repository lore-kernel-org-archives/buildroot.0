From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Mon,  9 Apr 2018 11:46:06 +0200
Subject: [Buildroot] [PATCH 1/2] package/llvm: add dependency on shared
 libraries
Message-ID: <20180409094607.11677-1-valentin.korenblit@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

llvm generates libLLVM.so, so it won't work if BR2_STATIC_LIBS is set

Also propagate llvm dependency to mesa3d.

Link to report from autobuilders:
http://lists.busybox.net/pipermail/buildroot/2018-April/218296.html

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
---
 package/llvm/Config.in   | 6 ++++--
 package/mesa3d/Config.in | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/llvm/Config.in b/package/llvm/Config.in
index 15f2507ef2..e007397fa7 100644
--- a/package/llvm/Config.in
+++ b/package/llvm/Config.in
@@ -19,6 +19,7 @@ config BR2_PACKAGE_LLVM
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
+	depends on !BR2_STATIC_LIBS
 	help
 	  The LLVM Project is a collection of modular and reusable
 	  compiler and toolchain technologies.
@@ -35,10 +36,11 @@ config BR2_PACKAGE_LLVM_AMDGPU
 
 endif
 
-comment "llvm needs a toolchain w/ threads, C++, gcc >= 4.8, host gcc >= 4.8"
+comment "llvm needs a toolchain w/ threads, C++, gcc >= 4.8, host gcc >= 4.8, dynamic library"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
+		|| BR2_STATIC_LIBS
 
 comment "llvm needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 8f347ffe0c..7dab883aad 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -33,12 +33,14 @@ config BR2_PACKAGE_MESA3D_LLVM
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LLVM
 
-comment "llvm support needs a toolchain w/ threads, C++, gcc >= 4.8, host gcc >= 4.8"
+comment "llvm support needs a toolchain w/ threads, C++, gcc >= 4.8, host gcc >= 4.8, dynamic library"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
+		|| BR2_STATIC_LIBS
 
 comment "llvm support needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
-- 
2.14.3
