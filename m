From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 24 May 2020 18:48:40 -0600
Subject: [Buildroot] [PATCH v3 4/9] package/solarus: depend on lua ABI
 version 5.1
In-Reply-To: <20200525004845.3019642-1-james.hilliard1@gmail.com>
References: <20200525004845.3019642-1-james.hilliard1@gmail.com>
Message-ID: <20200525004845.3019642-4-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since solarus is compatible with lua interpreters that provide the
version 5.1 ABI we should depend on that instead of unconditionally
selecting luajit.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/solarus/Config.in | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/solarus/Config.in b/package/solarus/Config.in
index 5d15342f3a..08d79782ca 100644
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
+comment "solarus needs OpenGL and a toolchain w/ C++, luajit or lua 5.1, gcc >= 4.8, NPTL, dynamic library"
+	depends on !BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
-- 
2.25.1
