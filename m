From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Jan 2019 21:20:57 +0100
Subject: [Buildroot] [git commit] package/supertux: needs gcc >= 6
Message-ID: <20190116202440.62001882DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e7386442c97b8ca521618656d1899018a09ecf1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The initial build issue [1] has been fixed upstream but the supertux
fail to link with boost libraries when using gcc 5 (which use C++11 by default):

libsupertux2_lib.a(main.cpp.o): In function `boost::system::error_category::std_category::equivalent(std::error_code const&, int) const':
main.cpp:(.text._ZNK5boost6system14error_category12std_category10equivalentERKSt10error_codei[_ZNK5boost6system14error_category12std_category10equivalentERKSt10error_codei]+0x32): undefined reference to `boost::system::detail::generic_category_instance'
main.cpp:(.text._ZNK5boost6system14error_category12std_category10equivalentERKSt10error_codei[_ZNK5boost6system14error_category12std_category10equivalentERKSt10error_codei]+0x47): undefined reference to `boost::system::detail::generic_category_instance'
main.cpp:(.text._ZNK5boost6system14error_category12std_category10equivalentERKSt10error_codei[_ZNK5boost6system14error_category12std_category10equivalentERKSt10error_codei]+0x99): undefined reference to `boost::system::detail::generic_category_instance'
libsupertux2_lib.a(main.cpp.o): In function `boost::system::error_category::std_category::equivalent(int, std::error_condition const&) const':
main.cpp:(.text._ZNK5boost6system14error_category12std_category10equivalentEiRKSt15error_condition[_ZNK5boost6system14error_category12std_category10equivalentEiRKSt15error_condition]+0x33): undefined reference to `boost::system::detail::generic_category_instance'
main.cpp:(.text._ZNK5boost6system14error_category12std_category10equivalentEiRKSt15error_condition[_ZNK5boost6system14error_category12std_category10equivalentEiRKSt15error_condition]+0x48): undefined reference to `boost::system::detail::generic_category_instance'
collect2: error: ld returned 1 exit status

This is a similar issue as the one reported by [2].

With gcc 5, boost libraries are compiled using C++11 but
supertux2_lib.a is using C++14 standard.

To fix the issue, boost libraries should be build using C++14
standard but we currently don't have an option to "force" the
default C++ standard used by the compiler.

So bump the minimum gcc version to gcc 6 since the C++14 is
used by default.

[1] https://github.com/SuperTux/supertux/issues/1014
[2] https://github.com/boostorg/system/issues/26

Fixes:
http://autobuild.buildroot.net/results/5b4/5b452c155917d783b3d8167fde48c2c938a74b95

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/supertux/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/supertux/Config.in b/package/supertux/Config.in
index 50bea58610..c77d1ae2bd 100644
--- a/package/supertux/Config.in
+++ b/package/supertux/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_SUPERTUX
 	depends on BR2_PACKAGE_HAS_LIBGL # libglew
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_XORG7 # libglew, SDL2 OpenGL (GLX)
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # C++14
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
 	depends on BR2_USE_MMU # SDL2 OpenGL (GLX)
 	depends on !BR2_STATIC_LIBS # SDL2
@@ -33,10 +33,10 @@ config BR2_PACKAGE_SUPERTUX
 
 	  http://supertux.github.io/
 
-comment "supertux needs OpenGL and a toolchain w/ C++, gcc >= 5, NPTL, dynamic library, wchar"
+comment "supertux needs OpenGL and a toolchain w/ C++, gcc >= 6, NPTL, dynamic library, wchar"
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_HAS_LIBGL || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_6 || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		BR2_STATIC_LIBS || !BR2_USE_WCHAR
