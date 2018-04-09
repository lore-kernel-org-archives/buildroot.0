From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 21:11:19 +0200
Subject: [Buildroot] [git commit] package/llvm: add dependency on wchar
Message-ID: <20180409191127.DD0A1881F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4bed9dcd7ba408120606eddd40e905bfc9a5787c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Extract from log:

output/build/llvm-5.0.1/include/llvm/Support/ConvertUTF.h:203:53:
error: ???std::wstring??? has not been declared
bool ConvertUTF8toWide(llvm::StringRef Source, std::wstring &Result);

Also propagate dependency to mesa3d

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/llvm/Config.in   | 5 +++--
 package/mesa3d/Config.in | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/llvm/Config.in b/package/llvm/Config.in
index e007397fa7..83e94660eb 100644
--- a/package/llvm/Config.in
+++ b/package/llvm/Config.in
@@ -20,6 +20,7 @@ config BR2_PACKAGE_LLVM
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR # std::wstring
 	help
 	  The LLVM Project is a collection of modular and reusable
 	  compiler and toolchain technologies.
@@ -36,11 +37,11 @@ config BR2_PACKAGE_LLVM_AMDGPU
 
 endif
 
-comment "llvm needs a toolchain w/ threads, C++, gcc >= 4.8, host gcc >= 4.8, dynamic library"
+comment "llvm needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, host gcc >= 4.8, dynamic library"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
-		|| BR2_STATIC_LIBS
+		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 comment "llvm needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 7dab883aad..1476b39acc 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -34,13 +34,14 @@ config BR2_PACKAGE_MESA3D_LLVM
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR # std::wstring
 	select BR2_PACKAGE_LLVM
 
-comment "llvm support needs a toolchain w/ threads, C++, gcc >= 4.8, host gcc >= 4.8, dynamic library"
+comment "llvm support needs a toolchain w/ wchar, threads, C++, gcc >= 4.8, host gcc >= 4.8, dynamic library"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
-		|| BR2_STATIC_LIBS
+		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 comment "llvm support needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
