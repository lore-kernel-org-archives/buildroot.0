From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Jul 2016 01:15:20 +0200
Subject: [Buildroot] [git commit] supertuxkart: new package
Message-ID: <20160703231527.BB3FA802FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=886eca58cded22974aa203f872d56dc733b6e3fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Note that this package builds and bundles a number of libraries,
such as GLEW and Irrlicht. We are not interested in doing
non-upstreamable changes, so it is not desirable to modify
this choice in any way.

In addition, Supertuxkart builds a version of the angelscript
interpreter. If a compatible version of angelscript is installed
on the system, it's possible to use it.

[Peter: DOS newlines for 0002 patch, tweak comment header]
Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                                  |  1 +
 ...001-irrlicht-Get-rid-of-unprefixed-cflags.patch | 34 +++++++++++++++
 ...x-boolean-return-type-for-jpeglib-s-callb.patch | 39 ++++++++++++++++++
 package/supertuxkart/Config.in                     | 34 +++++++++++++++
 package/supertuxkart/supertuxkart.hash             |  5 +++
 package/supertuxkart/supertuxkart.mk               | 48 ++++++++++++++++++++++
 6 files changed, 161 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 8f0f45a..67810b0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -236,6 +236,7 @@ menu "Games"
 	source "package/prboom/Config.in"
 	source "package/rubix/Config.in"
 	source "package/sl/Config.in"
+	source "package/supertuxkart/Config.in"
 endmenu
 
 menu "Graphic libraries and applications (graphic/text)"
diff --git a/package/supertuxkart/0001-irrlicht-Get-rid-of-unprefixed-cflags.patch b/package/supertuxkart/0001-irrlicht-Get-rid-of-unprefixed-cflags.patch
new file mode 100644
index 0000000..351b587
--- /dev/null
+++ b/package/supertuxkart/0001-irrlicht-Get-rid-of-unprefixed-cflags.patch
@@ -0,0 +1,34 @@
+From 73bed675202cf1f1c748540a4363d7d99e161dca Mon Sep 17 00:00:00 2001
+From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
+Date: Thu, 9 Jun 2016 18:58:51 -0300
+Subject: [PATCH 1/2] irrlicht: Get rid of unprefixed cflags
+
+Cross-building requires proper include paths. This commit
+removes the unprefixed -I/usr/X11R6/include in irrlicht cflags.
+
+Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
+---
+Fix sent upstream as part of pull:
+https://github.com/supertuxkart/stk-code/pull/2554
+
+ lib/irrlicht/CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/irrlicht/CMakeLists.txt b/lib/irrlicht/CMakeLists.txt
+index 46d54008c291..5f4975e3a6f9 100644
+--- a/lib/irrlicht/CMakeLists.txt
++++ b/lib/irrlicht/CMakeLists.txt
+@@ -25,8 +25,8 @@ elseif(MINGW)
+   add_definitions(-D_IRR_STATIC_LIB_)
+   add_definitions(-D_CRT_SECURE_NO_WARNINGS) # Shut up about unsafe stuff
+ else()
+-  set(CMAKE_C_FLAGS   "${CMAKE_C_FLAGS} -Wall -pipe -O3  -fno-exceptions  -fstrict-aliasing -I/usr/X11R6/include")
+-  set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} -Wall -pipe -O3  -fno-exceptions  -fstrict-aliasing -I/usr/X11R6/include")
++  set(CMAKE_C_FLAGS   "${CMAKE_C_FLAGS} -Wall -pipe -O3  -fno-exceptions  -fstrict-aliasing")
++  set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} -Wall -pipe -O3  -fno-exceptions  -fstrict-aliasing")
+   if(CMAKE_COMPILER_IS_GNUCC)
+ 	  set(CMAKE_C_FLAGS   "${CMAKE_C_FLAGS} -fexpensive-optimizations")
+   endif()
+-- 
+2.9.0
+
diff --git a/package/supertuxkart/0002-irrlicht-Fix-boolean-return-type-for-jpeglib-s-callb.patch b/package/supertuxkart/0002-irrlicht-Fix-boolean-return-type-for-jpeglib-s-callb.patch
new file mode 100644
index 0000000..1a89bea
--- /dev/null
+++ b/package/supertuxkart/0002-irrlicht-Fix-boolean-return-type-for-jpeglib-s-callb.patch
@@ -0,0 +1,39 @@
+From fe71624eb39e0bc302a7603c79503fb12667dc2b Mon Sep 17 00:00:00 2001
+From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
+Date: Sun, 3 Jul 2016 15:16:59 -0300
+Subject: [PATCH 2/2] irrlicht: Fix boolean return type for jpeglib's callback
+
+Building on certain toolchains can fail due to returning an integer
+instead of TRUE. In any case, only {TRUE,FALSE} should be used
+as 'boolean' jpeglib type. Fix this by returning TRUE.
+
+  CImageLoaderJPG.cpp: In static member function 'static boolean
+  irr::video::CImageLoaderJPG::fill_input_buffer(j_decompress_ptr)':
+  CImageLoaderJPG.cpp:69:9: error: invalid conversion from 'int' to 'boolean'
+  [-fpermissive]
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
+---
+Fix sent upstream as part of pull:
+https://github.com/supertuxkart/stk-code/pull/2554
+
+ lib/irrlicht/source/Irrlicht/CImageLoaderJPG.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/irrlicht/source/Irrlicht/CImageLoaderJPG.cpp b/lib/irrlicht/source/Irrlicht/CImageLoaderJPG.cpp
+index 8fc5222a1e9b..1811f31dd28f 100644
+--- a/lib/irrlicht/source/Irrlicht/CImageLoaderJPG.cpp
++++ b/lib/irrlicht/source/Irrlicht/CImageLoaderJPG.cpp
+@@ -66,7 +66,7 @@ void CImageLoaderJPG::init_source (j_decompress_ptr cinfo)
+ boolean CImageLoaderJPG::fill_input_buffer (j_decompress_ptr cinfo)
+ {
+ 	// DO NOTHING
+-	return 1;
++	return TRUE;
+ }
+ 
+ 
+-- 
+2.9.0
+
diff --git a/package/supertuxkart/Config.in b/package/supertuxkart/Config.in
new file mode 100644
index 0000000..a1f7074
--- /dev/null
+++ b/package/supertuxkart/Config.in
@@ -0,0 +1,34 @@
+config BR2_PACKAGE_SUPERTUXKART
+	bool "supertuxkart"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_INSTALL_LIBSTDCPP # openal
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
+	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS # openal
+	depends on BR2_PACKAGE_HAS_LIBGL
+	depends on BR2_PACKAGE_XORG7
+	depends on !BR2_TOOLCHAIN_USES_MUSL
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
+comment "supertuxkart needs an OpenGL backend, a uClibc or glibc toolchain w/ NPTL, C++"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_XORG7
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
+		|| !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_PACKAGE_HAS_LIBGL \
+		|| BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/supertuxkart/supertuxkart.hash b/package/supertuxkart/supertuxkart.hash
new file mode 100644
index 0000000..45ad8c5
--- /dev/null
+++ b/package/supertuxkart/supertuxkart.hash
@@ -0,0 +1,5 @@
+# Locally computed
+sha256	0b080bb098a26adb552d6fd48905bcb6b1e873ef1567457d7268d7d3aaa48282  supertuxkart-0.9.2-src.tar.xz
+# From https://sourceforge.net/projects/supertuxkart/files/SuperTuxKart/0.9.2/
+sha1	df3805a8f9dc556a0fc5af44442dae8126db5d5a  supertuxkart-0.9.2-src.tar.xz
+md5	f1f5081fd41b8eeb310b4edc07b9ee12  supertuxkart-0.9.2-src.tar.xz
diff --git a/package/supertuxkart/supertuxkart.mk b/package/supertuxkart/supertuxkart.mk
new file mode 100644
index 0000000..037c6f3
--- /dev/null
+++ b/package/supertuxkart/supertuxkart.mk
@@ -0,0 +1,48 @@
+################################################################################
+#
+# supertuxkart
+#
+################################################################################
+
+SUPERTUXKART_VERSION = 0.9.2
+SUPERTUXKART_SOURCE = supertuxkart-$(SUPERTUXKART_VERSION)-src.tar.xz
+SUPERTUXKART_SITE = http://downloads.sourceforge.net/project/supertuxkart/SuperTuxKart/$(SUPERTUXKART_VERSION)
+
+# Supertuxkart itself is GPLv3+, but it bundles a few libraries with different
+# licenses. Irrlicht, bullet and angelscript have zlib license, while glew is
+# BSD-3c. Since they are linked statically, the result is GPLv3+.
+SUPERTUXKART_LICENSE = GPLv3+
+SUPERTUXKART_LICENSE_FILES = COPYING
+
+SUPERTUXKART_DEPENDENCIES = \
+	jpeg \
+	libcurl \
+	libgl \
+	libglu \
+	libogg \
+	libpng \
+	libvorbis \
+	openal \
+	xlib_libXrandr \
+	zlib
+
+# Since supertuxkart is not installing libstkirrlicht.so, and since it is
+# the only user of the bundled libraries, turn off shared libraries entirely.
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
+SUPERTUXKART_CONF_OPTS += -DUSE_WIIUSE=ON
+else
+# Wiimote support relies on bluez5.
+SUPERTUXKART_CONF_OPTS += -DUSE_WIIUSE=OFF
+endif
+
+$(eval $(cmake-package))
