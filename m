From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  1 Dec 2019 10:28:22 +0100
Subject: [Buildroot] [PATCH/next 2/3] package/solarus: luajit is optional,
 not mandatory
In-Reply-To: <20191201092823.1288313-1-fontaine.fabrice@gmail.com>
References: <20191201092823.1288313-1-fontaine.fabrice@gmail.com>
Message-ID: <20191201092823.1288313-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build with lua 5.1 has been fixed since version 1.6.1 and
https://gitlab.com/solarus-games/solarus/commit/611f81a90d42692e986c78c67090541ffd1c5973

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/solarus/Config.in  |  9 ++++-----
 package/solarus/solarus.mk | 12 ++++++++++--
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/package/solarus/Config.in b/package/solarus/Config.in
index 359ad15e02..290d5a756c 100644
--- a/package/solarus/Config.in
+++ b/package/solarus/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_SOLARUS
 	bool "solarus"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
@@ -11,7 +11,6 @@ config BR2_PACKAGE_SOLARUS
 	select BR2_PACKAGE_LIBOGG
 	select BR2_PACKAGE_LIBPNG # runtime
 	select BR2_PACKAGE_LIBVORBIS
-	select BR2_PACKAGE_LUAJIT
 	select BR2_PACKAGE_OPENAL
 	select BR2_PACKAGE_PHYSFS
 	select BR2_PACKAGE_SDL2
@@ -25,9 +24,9 @@ config BR2_PACKAGE_SOLARUS
 	  http://www.solarus-games.org
 	  https://github.com/solarus-games/solarus
 
-comment "solarus needs OpenGL and a toolchain w/ C++, gcc >= 4.8, NPTL, dynamic library"
-	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
+comment "solarus needs OpenGL, a Lua 5.1 interpreter and a toolchain w/ C++, gcc >= 4.8, NPTL, dynamic library"
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
-		|| !BR2_PACKAGE_HAS_LIBGL
+		|| !BR2_PACKAGE_HAS_LIBGL \
+		|| !(BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT)
diff --git a/package/solarus/solarus.mk b/package/solarus/solarus.mk
index 6f65a53fea..c17483d339 100644
--- a/package/solarus/solarus.mk
+++ b/package/solarus/solarus.mk
@@ -15,10 +15,18 @@ SOLARUS_LICENSE_FILES = license.txt
 # Install libsolarus.so
 SOLARUS_INSTALL_STAGING = YES
 
-SOLARUS_DEPENDENCIES = libgl libmodplug libogg libvorbis luajit openal physfs sdl2 \
-	sdl2_image sdl2_ttf
+SOLARUS_DEPENDENCIES = libgl libmodplug libogg libvorbis openal physfs sdl2 \
+	sdl2_image sdl2_ttf \
+	$(if $(BR2_PACKAGE_LUA_5_1),lua)
 
 # Disable launcher GUI (requires Qt5)
 SOLARUS_CONF_OPTS = -DSOLARUS_GUI=OFF
 
+ifeq ($(BR2_PACKAGE_LUAJIT),y)
+SOLARUS_CONF_OPTS += -DSOLARUS_USE_LUAJIT=ON
+SOLARUS_DEPENDENCIES += luajit
+else
+SOLARUS_CONF_OPTS += -DSOLARUS_USE_LUAJIT=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.24.0
