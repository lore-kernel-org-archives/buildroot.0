From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 May 2020 11:50:11 +0200
Subject: [Buildroot] [PATCH 38/38] package/stella: needs gcc >= 6
Message-ID: <20200517095011.1759451-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

stella converted most of its C-Style arrays to std::array since version
6.1:
https://github.com/stella-emu/stella/commit/0c0f732e5f50b08cfcbdc5ad96c4e18ad230c04b

However, gcc 5.x does not accept a = {} initialization for std::array:

In file included from src/emucore/ConsoleIO.hxx:18:0,
                 from src/emucore/Console.hxx:34,
                 from src/gui/AudioDialog.cxx:22:
src/emucore/Control.hxx:331:71: error: array must be initialized with a brace-enclosed initializer
     std::array<bool, 5> myDigitalPinState{true, true, true, true, true};
                                                                       ^

So add a dependency on gcc >= 6 instead of trying to patch the numerous
array initializations to make them compliant with C++11

Fixes:
 - http://autobuild.buildroot.org/results/dfd9b901fabf310ed9033b8a012466c565d58684

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/stella/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/stella/Config.in b/package/stella/Config.in
index 709da98159..c14f48572b 100644
--- a/package/stella/Config.in
+++ b/package/stella/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_STELLA
 	depends on !BR2_STATIC_LIBS # sdl2
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # C++14
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	select BR2_PACKAGE_SDL2
 	select BR2_PACKAGE_LIBPNG
@@ -13,10 +13,10 @@ config BR2_PACKAGE_STELLA
 
 	  https://stella-emu.github.io/
 
-comment "stella needs a toolchain w/ dynamic library, C++, threads, gcc >= 5"
+comment "stella needs a toolchain w/ dynamic library, C++, threads, gcc >= 6"
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_6
 
 comment "stella needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-- 
2.26.2
