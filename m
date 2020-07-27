From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 22:32:59 +0200
Subject: [Buildroot] [PATCH 8/9 v2] package/solarus: depend on lua ABI
 version 5.1
In-Reply-To: <cover.1595881971.git.yann.morin.1998@free.fr>
References: <cover.1595881971.git.yann.morin.1998@free.fr>
Message-ID: <053f9c5849edf7a5646862c1c7ad6c87007ebdc2.1595881971.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

Since solarus is compatible with lua interpreters that provide the
version 5.1 ABI we should depend on that instead of unconditionally
selecting luajit.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/solarus/Config.in | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/solarus/Config.in b/package/solarus/Config.in
index 5d15342f3a..cdff62687f 100644
--- a/package/solarus/Config.in
+++ b/package/solarus/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_SOLARUS
 	bool "solarus"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
@@ -12,7 +12,6 @@ config BR2_PACKAGE_SOLARUS
 	select BR2_PACKAGE_LIBOGG
 	select BR2_PACKAGE_LIBPNG # runtime
 	select BR2_PACKAGE_LIBVORBIS
-	select BR2_PACKAGE_LUAJIT if !BR2_PACKAGE_LUA_5_1
 	select BR2_PACKAGE_OPENAL
 	select BR2_PACKAGE_PHYSFS
 	select BR2_PACKAGE_SDL2
@@ -26,8 +25,8 @@ config BR2_PACKAGE_SOLARUS
 	  http://www.solarus-games.org
 	  https://github.com/solarus-games/solarus
 
-comment "solarus needs OpenGL and a toolchain w/ C++, gcc >= 4.8, NPTL, dynamic library"
-	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS || BR2_PACKAGE_LUA_5_1
+comment "solarus needs OpenGL and a toolchain w/ C++, gcc >= 4.8, NPTL, dynamic library, and luajit or lua 5.1"
+	depends on !BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
-- 
2.20.1
