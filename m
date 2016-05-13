From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Fri, 13 May 2016 14:06:28 -0300
Subject: [Buildroot] [PATCH v2] supertuxkart: new package
Message-ID: <1463159188-1564-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
--
Changes from v1 -- thanks, Arnout!
  * Made fribidi optional
  * Made the bluez5_utils optional, which simplifies dependencies
  * Disable Wii only if bluez5_utils is disabled
  * Fixed dependencies inherited from OpenAL
  * Added a patch to remove -I/usr/X11R6/include from bundled irrlicht-based engine

No changes regarding Freetype, because latest v0.9.1 release
does not use it.
---
 package/Config.in                                  |  1 +
 package/supertuxkart/Config.in                     | 31 ++++++++++++++++++++
 .../supertuxkart-rm-x11r6-include.patch            | 14 +++++++++
 package/supertuxkart/supertuxkart.hash             |  2 ++
 package/supertuxkart/supertuxkart.mk               | 34 ++++++++++++++++++++++
 5 files changed, 82 insertions(+)
 create mode 100644 package/supertuxkart/Config.in
 create mode 100644 package/supertuxkart/supertuxkart-rm-x11r6-include.patch
 create mode 100644 package/supertuxkart/supertuxkart.hash
 create mode 100644 package/supertuxkart/supertuxkart.mk

diff --git a/package/Config.in b/package/Config.in
index 9d668bf34f31..ec3dce5ace53 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -233,6 +233,7 @@ menu "Games"
 	source "package/prboom/Config.in"
 	source "package/rubix/Config.in"
 	source "package/sl/Config.in"
+	source "package/supertuxkart/Config.in"
 endmenu
 
 menu "Graphic libraries and applications (graphic/text)"
diff --git a/package/supertuxkart/Config.in b/package/supertuxkart/Config.in
new file mode 100644
index 000000000000..cd7d2a3676a2
--- /dev/null
+++ b/package/supertuxkart/Config.in
@@ -0,0 +1,31 @@
+config BR2_PACKAGE_SUPERTUXKART
+	bool "supertuxkart"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_INSTALL_LIBSTDCPP # openal
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
+	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS # openal
+	depends on BR2_PACKAGE_HAS_LIBGL
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBGLU
+	select BR2_PACKAGE_LIBOGG
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_LIBVORBIS
+	select BR2_PACKAGE_OPENAL
+	select BR2_PACKAGE_XLIB_LIBXRANDR
+	select BR2_PACKAGE_ZLIB
+	help
+	  Karts. Nitro. Action! SuperTuxKart is a free 3D arcade kart
+	  racer with multiple karts, tracks and modes you can play.
+	  Beat the evil Nolok by any means necessary, and make the
+	  mascot kingdom safe once again!
+
+	  http://supertuxkart.sourceforge.net/Main_Page
+
+comment "supertux needs a toolchain w/ NPTL, C++"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
+		|| !BR2_INSTALL_LIBSTDCPP
+
+comment "supertuxkart needs an OpenGL backend"
+	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/supertuxkart/supertuxkart-rm-x11r6-include.patch b/package/supertuxkart/supertuxkart-rm-x11r6-include.patch
new file mode 100644
index 000000000000..368db9417192
--- /dev/null
+++ b/package/supertuxkart/supertuxkart-rm-x11r6-include.patch
@@ -0,0 +1,14 @@
+diff -Naur supertuxkart-0.9.1-old/lib/irrlicht/CMakeLists.txt supertuxkart-0.9.1/lib/irrlicht/CMakeLists.txt
+--- supertuxkart-0.9.1-old/lib/irrlicht/CMakeLists.txt	2016-05-13 12:21:04.857373661 -0300
++++ supertuxkart-0.9.1/lib/irrlicht/CMakeLists.txt	2016-05-13 12:21:25.277821763 -0300
+@@ -25,8 +25,8 @@
+   add_definitions(-D_IRR_STATIC_LIB_)
+   add_definitions(-D_CRT_SECURE_NO_WARNINGS) # Shut up about unsafe stuff
+ else()
+-  set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} -Wall -pipe -O3  -fno-exceptions  -fstrict-aliasing -fexpensive-optimizations -I/usr/X11R6/include")
+-  set(CMAKE_C_FLAGS   "${CMAKE_C_FLAGS} -Wall -pipe -O3  -fno-exceptions  -fstrict-aliasing -fexpensive-optimizations -I/usr/X11R6/include")
++  set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} -Wall -pipe -O3  -fno-exceptions  -fstrict-aliasing -fexpensive-optimizations")
++  set(CMAKE_C_FLAGS   "${CMAKE_C_FLAGS} -Wall -pipe -O3  -fno-exceptions  -fstrict-aliasing -fexpensive-optimizations")
+ endif()
+ 
+ # Xrandr
diff --git a/package/supertuxkart/supertuxkart.hash b/package/supertuxkart/supertuxkart.hash
new file mode 100644
index 000000000000..d8e7ac30f6d1
--- /dev/null
+++ b/package/supertuxkart/supertuxkart.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	c50f00a71df165fb613d20e86bea2d9d5e51ed3e27e1d436fbac3b07cf2ea149	supertuxkart-0.9.1-src.tar.xz
diff --git a/package/supertuxkart/supertuxkart.mk b/package/supertuxkart/supertuxkart.mk
new file mode 100644
index 000000000000..4898140a055e
--- /dev/null
+++ b/package/supertuxkart/supertuxkart.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# supertuxkart
+#
+################################################################################
+
+SUPERTUXKART_VERSION = 0.9.1
+SUPERTUXKART_SOURCE = supertuxkart-$(SUPERTUXKART_VERSION)-src.tar.xz
+SUPERTUXKART_SITE = http://downloads.sourceforge.net/project/supertuxkart/SuperTuxKart/$(SUPERTUXKART_VERSION)
+SUPERTUXKART_LICENSE = GPLv3
+SUPERTUXKART_LICENSE_FILES = COPYING
+
+SUPERTUXKART_DEPENDENCIES += jpeg libcurl libgl libglu libpng libogg libvorbis openal zlib xlib_libXrandr
+
+# Since supertuxkart is not installing libstkirrlicht.so,
+# and given we don't really need that library to be shared
+# we turn off shared libs here.
+SUPERTUXKART_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF
+
+ifeq ($(BR2_PACKAGE_LIBFRIBIDI),y)
+SUPERTUXKART_DEPENDENCIES += libfribidi
+SUPERTUXKART_CONF_OPTS += -DUSE_FRIBIDI=ON
+else
+SUPERTUXKART_CONF_OPTS += -DUSE_FRIBIDI=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
+SUPERTUXKART_DEPENDENCIES += bluez5_utils
+else
+# Disable Wiimote support
+SUPERTUXKART_CONF_OPTS += -DUSE_WIIUSE=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.7.0
