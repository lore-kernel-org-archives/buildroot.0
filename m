From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 22:51:18 +0100
Subject: [Buildroot] [git commit] package/solarus: allow building with lua
 5.1
Message-ID: <20191216214247.5CD328B802@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f83c9d97ddb8299c05c1e812cf14233dfe3151df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build with lua 5.1 has been fixed since version 1.6.1 and
https://gitlab.com/solarus-games/solarus/commit/611f81a90d42692e986c78c67090541ffd1c5973

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Thomas: keep a select BR2_PACKAGE_LUAJIT, but make it "if
!BR2_PACKAGE_LUA_5_1"]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/solarus/Config.in  |  4 ++--
 package/solarus/solarus.mk | 10 +++++++++-
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/package/solarus/Config.in b/package/solarus/Config.in
index 359ad15e02..6bed38a6f5 100644
--- a/package/solarus/Config.in
+++ b/package/solarus/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_SOLARUS
 	select BR2_PACKAGE_LIBOGG
 	select BR2_PACKAGE_LIBPNG # runtime
 	select BR2_PACKAGE_LIBVORBIS
-	select BR2_PACKAGE_LUAJIT
+	select BR2_PACKAGE_LUAJIT if !BR2_PACKAGE_LUA_5_1
 	select BR2_PACKAGE_OPENAL
 	select BR2_PACKAGE_PHYSFS
 	select BR2_PACKAGE_SDL2
@@ -26,7 +26,7 @@ config BR2_PACKAGE_SOLARUS
 	  https://github.com/solarus-games/solarus
 
 comment "solarus needs OpenGL and a toolchain w/ C++, gcc >= 4.8, NPTL, dynamic library"
-	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS || BR2_PACKAGE_LUA_5_1
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
diff --git a/package/solarus/solarus.mk b/package/solarus/solarus.mk
index c1c2519693..d522128c33 100644
--- a/package/solarus/solarus.mk
+++ b/package/solarus/solarus.mk
@@ -16,10 +16,18 @@ SOLARUS_LICENSE_FILES = license.txt
 # Install libsolarus.so
 SOLARUS_INSTALL_STAGING = YES
 
-SOLARUS_DEPENDENCIES = libgl libmodplug libogg libvorbis luajit openal physfs sdl2 \
+SOLARUS_DEPENDENCIES = libgl libmodplug libogg libvorbis openal physfs sdl2 \
 	sdl2_image sdl2_ttf
 
 # Disable launcher GUI (requires Qt5)
 SOLARUS_CONF_OPTS = -DSOLARUS_GUI=OFF
 
+ifeq ($(BR2_PACKAGE_LUAJIT),y)
+SOLARUS_CONF_OPTS += -DSOLARUS_USE_LUAJIT=ON
+SOLARUS_DEPENDENCIES += luajit
+else
+SOLARUS_CONF_OPTS += -DSOLARUS_USE_LUAJIT=OFF
+SOLARUS_DEPENDENCIES += lua
+endif
+
 $(eval $(cmake-package))
