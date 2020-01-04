From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  4 Jan 2020 02:14:53 +0100
Subject: [Buildroot] [WIP] package/efl: bump to version 1.23.3
Message-ID: <20200104011453.516356-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove upstream patch [1].
- Switch to meson build system.
- The cryptography backends is now mandatory, use openssl for the host
and use openssl by default for the target if gnutls is not selected.
- Add host-giflib since the dependency can't be disabled anymore.
(even by adding gif in HOST_EFL_EVAS_LOADERS_DISABLER).
- Disable explicitely meson build options that was not previously handled
(avahi, emotion, ecore-imf-loarders...)
- Elput support is now enabled through drm meson option [2], remove
  BR2_PACKAGE_EFL_ELPUT.
- Update license file hash (csharp licensing information, cxx bindings licensing)
- Add COPYING.images and licenses/COPYING.ASL license file.
- The evas png loader is now mandatory [3]
(even by adding png in EFL_EVAS_LOADERS_DISABLER).
- Same for the evas gif loader [4].
- Backport an upstream patch to fix the evas build with -Dwl=false.

See:
https://www.enlightenment.org/news/efl-1.23.0
https://www.enlightenment.org/news/efl-1.23.1
https://www.enlightenment.org/news/efl-1.23.2

[1] https://git.enlightenment.org/core/efl.git/commit/?id=c46a8143916f0d3f66bbdffc7107c97c88df212d
[2] https://git.enlightenment.org/core/efl.git/tree/meson.build?h=v1.23.3#n297
[3] https://git.enlightenment.org/core/efl.git/tree/src/modules/evas/meson.build?h=v1.23.3#n2
[4] https://git.enlightenment.org/core/efl.git/tree/src/modules/evas/meson.build?h=v1.23.3#n4

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
This is my WIP patch to bump the efl stack and switch the build systemd to meson.
As for mesa3d package, it will probably introduce some issues I tried to fix at best.
---
 Config.in.legacy                              |  18 ++
 ...EINA_VALUE_EMPTY-during-library-init.patch |  51 ---
 ...-evas-fix-compilation-with-Dwl-false.patch |  31 ++
 package/efl/Config.in                         |  43 +--
 package/efl/efl.hash                          |   8 +-
 package/efl/efl.mk                            | 304 ++++++++----------
 package/enlightenment/Config.in               |   1 -
 7 files changed, 203 insertions(+), 253 deletions(-)
 delete mode 100644 package/efl/0001-eina-set-EINA_VALUE_EMPTY-during-library-init.patch
 create mode 100644 package/efl/0001-evas-fix-compilation-with-Dwl-false.patch

diff --git a/Config.in.legacy b/Config.in.legacy
index 8436951f0f..9f0b6d7fe2 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,24 @@ endif
 
 comment "Legacy options removed in 2020.02"
 
+config BR2_PACKAGE_EFL_GIF
+	bool "efl evas gif loader is mandatory"
+	select BR2_LEGACY
+	help
+	  Since efl 1.23.x, the evas gif loader can't be disabled.
+
+config BR2_PACKAGE_EFL_PNG
+	bool "efl evas png loader is mandatory"
+	select BR2_LEGACY
+	help
+	  Since efl 1.23.x, the evas png loader can't be disabled.
+
+config BR2_PACKAGE_EFL_ELPUT
+	bool "efl elput is enabled by efl drm option"
+	select BR2_LEGACY
+	help
+	  Since efl 1.23.x, the drm option enable the elput library.
+
 config BR2_PACKAGE_PYTHON_SCAPY3K
 	bool "python-scapy3k is replaced by python-scapy"
 	select BR2_LEGACY
diff --git a/package/efl/0001-eina-set-EINA_VALUE_EMPTY-during-library-init.patch b/package/efl/0001-eina-set-EINA_VALUE_EMPTY-during-library-init.patch
deleted file mode 100644
index bfc12fd5b8..0000000000
--- a/package/efl/0001-eina-set-EINA_VALUE_EMPTY-during-library-init.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From b8458ed248cf49bfe9a263d708b5e34adf77e275 Mon Sep 17 00:00:00 2001
-From: Cedric BAIL <cedric.bail@free.fr>
-Date: Wed, 17 Jul 2019 11:12:18 -0700
-Subject: [PATCH] eina: set EINA_VALUE_EMPTY during library init.
-
-This is a work around compiler/linker limit on some system as reported
-by Romain Naour.
-
-Reviewed-by: Mike Blumenkrantz <michael.blumenkrantz@gmail.com>
-Differential Revision: https://phab.enlightenment.org/D9348
-
-(cherry picked from commit c46a8143916f0d3f66bbdffc7107c97c88df212d)
-[Romain: backport to 1.22.x]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- src/lib/eina/eina_value.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/src/lib/eina/eina_value.c b/src/lib/eina/eina_value.c
-index c75a5f1235..942a6d533e 100644
---- a/src/lib/eina/eina_value.c
-+++ b/src/lib/eina/eina_value.c
-@@ -58,7 +58,7 @@ static Eina_Hash *_eina_value_inner_mps = NULL;
- static Eina_Lock _eina_value_inner_mps_lock;
- static char *_eina_value_mp_choice = NULL;
- static int _eina_value_log_dom = -1;
--static const Eina_Value _eina_value_empty = EINA_VALUE_EMPTY;
-+static Eina_Value _eina_value_empty;
- 
- #ifdef ERR
- #undef ERR
-@@ -5404,6 +5404,7 @@ eina_value_inner_free(size_t size, void *mem)
- Eina_Bool
- eina_value_init(void)
- {
-+   const Eina_Value empty = EINA_VALUE_EMPTY;
-    const char *choice, *tmp;
- 
-    _eina_value_log_dom = eina_log_domain_register("eina_value",
-@@ -5490,6 +5491,8 @@ eina_value_init(void)
- 
-    EINA_ERROR_VALUE_FAILED = eina_error_msg_static_register("Eina_Value failed to copy/convert.");
- 
-+   memcpy(&_eina_value_empty, &empty, sizeof (empty));
-+
-    return EINA_TRUE;
- 
-  on_init_fail_hash:
--- 
-2.21.0
-
diff --git a/package/efl/0001-evas-fix-compilation-with-Dwl-false.patch b/package/efl/0001-evas-fix-compilation-with-Dwl-false.patch
new file mode 100644
index 0000000000..feac95fbc7
--- /dev/null
+++ b/package/efl/0001-evas-fix-compilation-with-Dwl-false.patch
@@ -0,0 +1,31 @@
+From e1c289912c4ad68380f8b317c6c91d25b5b73814 Mon Sep 17 00:00:00 2001
+From: Boris Faure <billiob@gmail.com>
+Date: Thu, 2 Jan 2020 11:38:31 +0000
+Subject: [PATCH] evas: fix compilation with -Dwl=false
+
+Reviewed-by: Chris Michael <cp.michael@samsung.com>
+Reviewed-by: Marcel Hollerbach <mail@marcel-hollerbach.de>
+Differential Revision: https://phab.enlightenment.org/D10994
+
+(cherry picked from commit a2afcfc872c29bd2c4a60fdafbc655c90f938d1e)
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ src/modules/evas/engines/gl_drm/evas_engine.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/src/modules/evas/engines/gl_drm/evas_engine.c b/src/modules/evas/engines/gl_drm/evas_engine.c
+index a5b4c7a4c8..8c1d6013e7 100644
+--- a/src/modules/evas/engines/gl_drm/evas_engine.c
++++ b/src/modules/evas/engines/gl_drm/evas_engine.c
+@@ -3,8 +3,6 @@
+ #include "../gl_common/evas_gl_define.h"
+ #include "../software_generic/evas_native_common.h"
+ 
+-#include <wayland-client.h>
+-
+ #ifdef HAVE_DLSYM
+ # include <dlfcn.h>      /* dlopen,dlclose,etc */
+ #else
+-- 
+2.24.1
+
diff --git a/package/efl/Config.in b/package/efl/Config.in
index 98b5b0731a..fdbf7df3e2 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -10,10 +10,13 @@ config BR2_PACKAGE_EFL
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_GIFLIB
 	select BR2_PACKAGE_JPEG # Emile needs libjpeg
 	select BR2_PACKAGE_LIBCURL # Ecore_con_url, runtime dependency
+	select BR2_PACKAGE_LIBPNG
 	# https://phab.enlightenment.org/T2728
 	select BR2_PACKAGE_LUAJIT # Lua support broken
+	select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_GNUTLS && BR2_PACKAGE_LIBGCRYPT)
 	select BR2_PACKAGE_LZ4
 	select BR2_PACKAGE_ZLIB
 	help
@@ -217,60 +220,36 @@ config BR2_PACKAGE_EFL_OPENGL_NONE
 
 endchoice # OpenGL support
 
-config BR2_PACKAGE_EFL_ELPUT
-	bool "Elput"
-	depends on BR2_ENABLE_LOCALE # libinput
-	depends on BR2_PACKAGE_EFL_EEZE
-	select BR2_PACKAGE_LIBINPUT
-	select BR2_PACKAGE_LIBXKBCOMMON
-	help
-	  The elput library is an efl abstraction for the libinput
-	  library which can be used by various other subsystems
-	  (ecore_fb, ecore_drm, etc) to handle interfacing with
-	  libinput without having to duplicate the code in each
-	  subsystem.
-
-comment "Elput support needs udev /dev management (eeze), locales"
-	depends on !BR2_PACKAGE_EFL_EEZE || !BR2_ENABLE_LOCALE
-
 config BR2_PACKAGE_EFL_DRM
 	bool "Evas DRM Engine"
 	depends on BR2_PACKAGE_EFL_EEZE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
 	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # require libgbm from mesa3d
-	depends on BR2_ENABLE_LOCALE # efl-elput <- libinput
-	select BR2_PACKAGE_EFL_ELPUT
+	depends on BR2_ENABLE_LOCALE # libinput
 	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_LIBINPUT # For elput
 	select BR2_PACKAGE_LIBXKBCOMMON
 	help
 	  This option enable building support for the Evas DRM Engine.
 
+	  Since efl 1.23.x, the drm option enable the elput library
+	  which is an efl abstraction for the libinput library which
+	  can be used by various other subsystems (ecore_fb, ecore_drm,
+	  etc) to handle interfacing with libinput without having to
+	  duplicate the code in each subsystem.
+
 comment "Evas DRM Engine needs udev /dev management (eeze), mesa3d w/ EGL support, threads, locales"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_MESA3D_OPENGL_EGL \
 		|| !BR2_PACKAGE_EFL_EEZE || !BR2_ENABLE_LOCALE
 
 comment "libevas loaders"
 
-config BR2_PACKAGE_EFL_PNG
-	bool "libevas png loader"
-	select BR2_PACKAGE_LIBPNG
-	help
-	  This enables the loader code that loads png files using
-	  libpng.
-
 config BR2_PACKAGE_EFL_JPEG
 	bool "libevas jpeg loader"
 	help
 	  This enables the loader code that loads jpeg files using
 	  libjpeg.
 
-config BR2_PACKAGE_EFL_GIF
-	bool "libevas gif loader"
-	select BR2_PACKAGE_GIFLIB
-	help
-	  This enables the loader code that loads gif files using
-	  giflib.
-
 config BR2_PACKAGE_EFL_TIFF
 	bool "libevas tiff loader"
 	select BR2_PACKAGE_TIFF
diff --git a/package/efl/efl.hash b/package/efl/efl.hash
index c60495418c..4d670e47a5 100644
--- a/package/efl/efl.hash
+++ b/package/efl/efl.hash
@@ -1,8 +1,10 @@
-# From https://download.enlightenment.org/rel/libs/efl/efl-1.22.3.tar.xz.sha256
-sha256 7e7a4199b1e90d400dab2491db6032f8e0b26bab65ec19c9f8a97a82394331c8 efl-1.22.3.tar.xz
+# From https://download.enlightenment.org/rel/libs/efl/efl-1.23.2.tar.xz.sha256sum
+sha256 ba8d9e4a4690a6c917c98ec090fffa6ffe005ab911811b8d443aa155ad95d493 efl-1.23.2.tar.xz
 
 sha256 d949e42ca8fd48d275c397c5fc2ac34c9b63ada715dcaf1a670e17bb62964341  COMPLIANCE
-sha256 1f0597d326e2fdb54aa2f0caec6d8bb0afb9941ef32475f017ed02ca214fcf37  COPYING
+sha256 aacde32f865e7166fd8efb117f6a3436c8c6fbe8cce0e4501cb2dbe8c10c86f6  COPYING
+sha256 e5133b4034a4749a781e2220ffb230b60a282b88861f1124d69a58abd5143994  COPYING.images
+sha256 c95bae1d1ce0235ecccd3560b772ec1efb97f348a79f0fbe0a634f0c2ccefe2c  licenses/COPYING.ASL
 sha256 af4ffe7ed1795a6e9cd3b3ce8747fdc45da449ff58cf35b8027c0699a66fd5cf  licenses/COPYING.BSD
 sha256 e60d07dfb2c5264f9f405fa52bf0d4f85429dd9ae1bc2ffcff8af1924ef720d1  licenses/COPYING.FTL
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licenses/COPYING.GPL
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index f1e69f8a23..5365404ca3 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -4,13 +4,15 @@
 #
 ################################################################################
 
-EFL_VERSION = 1.22.3
+EFL_VERSION = 1.23.2
 EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
 EFL_SITE = http://download.enlightenment.org/rel/libs/efl
 EFL_LICENSE = BSD-2-Clause, LGPL-2.1+, GPL-2.0+, FTL, MIT
 EFL_LICENSE_FILES = \
 	COMPLIANCE \
 	COPYING \
+	COPYING.images \
+	licenses/COPYING.ASL \
 	licenses/COPYING.BSD \
 	licenses/COPYING.FTL \
 	licenses/COPYING.GPL \
@@ -21,157 +23,139 @@ EFL_LICENSE_FILES = \
 EFL_INSTALL_STAGING = YES
 
 EFL_DEPENDENCIES = host-pkgconf host-efl host-luajit dbus freetype \
-	jpeg luajit lz4 zlib
+	giflib jpeg libpng luajit lz4 zlib
 
 # Configure options:
-# --disable-lua-old: build elua for the target.
-# --disable-sdl: disable sdl2 support.
-# --disable-spectre: disable spectre image loader.
-# --disable-xinput22: disable X11 XInput v2.2+ support.
-# --disable-vnc-server: remove libvncserver dependency.
-# --enable-liblz4: use liblz4 from lz4 package.
-# --with-net-control=none: disable connman networkmanager.
-# --with-doxygen: disable doxygen documentation
+# elua=true: build elua for the target.
+# sdl=false: disable sdl2 support.
+# xinput22=false: disable X11 XInput v2.2+ support.
+# embedded-lz4=false: use liblz4 from lz4 package.
+# network-backend=none: disable connman networkmanager.
 EFL_CONF_OPTS = \
-	--with-edje-cc=$(HOST_DIR)/bin/edje_cc \
-	--with-eet-eet=$(HOST_DIR)/bin/eet \
-	--with-eldbus_codegen=$(HOST_DIR)/bin/eldbus-codegen \
-	--with-elementary-codegen=$(HOST_DIR)/bin/elementary_codegen \
-	--with-elm-prefs-cc=$(HOST_DIR)/bin/elm_prefs_cc \
-	--with-elua=$(HOST_DIR)/bin/elua \
-	--with-eolian-gen=$(HOST_DIR)/bin/eolian_gen \
-	--disable-image-loader-jp2k \
-	--with-net-control=none \
-	--disable-lua-old \
-	--disable-sdl \
-	--disable-spectre \
-	--disable-xinput22 \
-	--disable-vnc-server \
-	--enable-liblz4 \
-	--with-doxygen=no
+	-Davahi=false \
+	-Dbuild-examples=false \
+	-Dbuild-tests=false \
+	-Decore-imf-loaders-disabler=ibus,scim,xim \
+	-Delua=true \
+	-Demotion-generic-loaders-disabler=vlc \
+	-Demotion-loaders-disabler=gstreamer,gstreamer1,libvlc,xine \
+	-Dembedded-lz4=false \
+	-Dlua-interpreter=luajit \
+	-Dnetwork-backend=none \
+	-Dpixman=false \
+	-Dsdl=false \
+	-Dvnc-server=false \
+	-Dxinput22=false
+
+EFL_BINDINGS = luajit
 
 ifeq ($(BR2_PACKAGE_EFL_EOLIAN_CPP),y)
-EFL_CONF_OPTS += --enable-cxx-bindings \
-	--with-eolian-cxx=$(HOST_DIR)/bin/eolian_cxx
-else
-EFL_CONF_OPTS += --disable-cxx-bindings
+EFL_BINDINGS += cxx
 endif
 
+EFL_CONF_OPTS += -Dbindings=$(subst $(space),$(comma),$(EFL_BINDINGS))
+
 ifeq ($(BR2_PACKAGE_EFL_EEZE),y)
 EFL_DEPENDENCIES += udev
-EFL_CONF_OPTS += --enable-libeeze
+EFL_CONF_OPTS += -Deeze=true
 else
-EFL_CONF_OPTS += --disable-libeeze
+EFL_CONF_OPTS += -Deeze=false
 endif
 
 ifeq ($(BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT),y)
 EFL_DEPENDENCIES += util-linux
-EFL_CONF_OPTS += --enable-libmount
+EFL_CONF_OPTS += -Dlibmount=true
 else
-EFL_CONF_OPTS += --disable-libmount
+EFL_CONF_OPTS += -Dlibmount=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-EFL_CONF_OPTS += --enable-systemd
+EFL_CONF_OPTS += -Dsystemd=true
 EFL_DEPENDENCIES += systemd
 else
-EFL_CONF_OPTS += --disable-systemd
+EFL_CONF_OPTS += -Dsystemd=false
 endif
 
 ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
-EFL_CONF_OPTS += --enable-fontconfig
+EFL_CONF_OPTS += -Dfontconfig=true
 EFL_DEPENDENCIES += fontconfig
 else
-EFL_CONF_OPTS += --disable-fontconfig
+EFL_CONF_OPTS += -Dfontconfig=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBFRIBIDI),y)
-EFL_CONF_OPTS += --enable-fribidi
+EFL_CONF_OPTS += -Dfribidi=true
 EFL_DEPENDENCIES += libfribidi
 else
-EFL_CONF_OPTS += --disable-fribidi
+EFL_CONF_OPTS += -Dfribidi=false
 endif
 
 ifeq ($(BR2_PACKAGE_GSTREAMER1)$(BR2_PACKAGE_GST1_PLUGINS_BASE),yy)
-EFL_CONF_OPTS += --enable-gstreamer1
+EFL_CONF_OPTS += -Dgstreamer=true
 EFL_DEPENDENCIES += gstreamer1 gst1-plugins-base
 else
-EFL_CONF_OPTS += --disable-gstreamer1
+EFL_CONF_OPTS += -Dgstreamer=false
 endif
 
 ifeq ($(BR2_PACKAGE_BULLET),y)
-EFL_CONF_OPTS += --enable-physics
+EFL_CONF_OPTS += -Dphysics=true
 EFL_DEPENDENCIES += bullet
 else
-EFL_CONF_OPTS += --disable-physics
+EFL_CONF_OPTS += -Dphysics=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
-EFL_CONF_OPTS += --enable-audio
+EFL_CONF_OPTS += -Daudio=true
 EFL_DEPENDENCIES += libsndfile
 else
-EFL_CONF_OPTS += --disable-audio
+EFL_CONF_OPTS += -Daudio=false
 endif
 
 ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
-EFL_CONF_OPTS += --enable-pulseaudio
+EFL_CONF_OPTS += -Dpulseaudio=true
 EFL_DEPENDENCIES += pulseaudio
 else
-EFL_CONF_OPTS += --disable-pulseaudio
+EFL_CONF_OPTS += -Dpulseaudio=false
 endif
 
 ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
 EFL_DEPENDENCIES += harfbuzz
-EFL_CONF_OPTS += --enable-harfbuzz
+EFL_CONF_OPTS += -Dharfbuzz=true
 else
-EFL_CONF_OPTS += --disable-harfbuzz
+EFL_CONF_OPTS += -Dharfbuzz=false
 endif
 
 ifeq ($(BR2_PACKAGE_TSLIB),y)
 EFL_DEPENDENCIES += tslib
-EFL_CONF_OPTS += --enable-tslib
+EFL_CONF_OPTS += -Dtslib=true
 else
-EFL_CONF_OPTS += --disable-tslib
+EFL_CONF_OPTS += -Dtslib=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
 EFL_DEPENDENCIES += libglib2
-EFL_CONF_OPTS += --with-glib=yes
+EFL_CONF_OPTS += -Dglib=true
 else
-EFL_CONF_OPTS += --with-glib=no
+EFL_CONF_OPTS += -Dglib=false
 endif
 
 # Prefer openssl (the default) over gnutls.
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 EFL_DEPENDENCIES += openssl
-EFL_CONF_OPTS += --with-crypto=openssl
-else ifeq ($(BR2_PACKAGE_GNUTLS)$(BR2_PACKAGE_LIBGCRYPT),yy)
-EFL_DEPENDENCIES += gnutls libgcrypt
-EFL_CONF_OPTS += --with-crypto=gnutls \
-	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
-else
-EFL_CONF_OPTS += --with-crypto=none
-endif # BR2_PACKAGE_OPENSSL
-
-ifeq ($(BR2_PACKAGE_EFL_ELPUT),y)
-EFL_CONF_OPTS += --enable-elput
-EFL_DEPENDENCIES += libinput
+EFL_CONF_OPTS += -Dcrypto=openssl
 else
-EFL_CONF_OPTS += --disable-elput
+EFL_DEPENDENCIES += gnutls libgcrypt
+EFL_CONF_OPTS += -Dcrypto=gnutls
 endif
 
 ifeq ($(BR2_PACKAGE_EFL_FB),y)
-EFL_CONF_OPTS += --enable-fb
+EFL_CONF_OPTS += -Dfb=true
 else
-EFL_CONF_OPTS += --disable-fb
+EFL_CONF_OPTS += -Dfb=false
 endif
 
 ifeq ($(BR2_PACKAGE_EFL_X_XLIB),y)
-EFL_CONF_OPTS += \
-	--with-x11=xlib \
-	--with-x=$(STAGING_DIR) \
-	--x-includes=$(STAGING_DIR)/usr/include \
-	--x-libraries=$(STAGING_DIR)/usr/lib
+EFL_CONF_OPTS += -Dx11=true
 
 EFL_DEPENDENCIES += \
 	xlib_libX11 \
@@ -185,98 +169,81 @@ EFL_DEPENDENCIES += \
 	xlib_libXScrnSaver \
 	xlib_libXtst
 else
-EFL_CONF_OPTS += --with-x11=none
+EFL_CONF_OPTS += -Dx11=false
 endif
 
 ifeq ($(BR2_PACKAGE_EFL_OPENGL),y)
-EFL_CONF_OPTS += --with-opengl=full
+EFL_CONF_OPTS += -Dopengl=full
 EFL_DEPENDENCIES += libgl
 # OpenGL ES requires EGL
 else ifeq ($(BR2_PACKAGE_EFL_OPENGLES),y)
-EFL_CONF_OPTS += --with-opengl=es --enable-egl
+EFL_CONF_OPTS += -Dopengl=es-egl
 EFL_DEPENDENCIES += libegl libgles
 else ifeq ($(BR2_PACKAGE_EFL_OPENGL_NONE),y)
-EFL_CONF_OPTS += --with-opengl=none
+EFL_CONF_OPTS += -Dopengl=none
 endif
 
 ifeq ($(BR2_PACKAGE_EFL_DRM),y)
-EFL_CONF_OPTS += --enable-drm
-EFL_DEPENDENCIES += libdrm libegl mesa3d
+EFL_CONF_OPTS += -Ddrm=true
+EFL_DEPENDENCIES += libdrm libegl libinput mesa3d
 else
-EFL_CONF_OPTS += --disable-drm
+EFL_CONF_OPTS += -Ddrm=false
 endif
 
-# The EFL Wayland support requires Evas GLES DRM engine support
-# which depends on wayland-client to build.
-# So enable gl_drm only when wayland support is selected.
 ifeq ($(BR2_PACKAGE_EFL_WAYLAND),y)
 EFL_DEPENDENCIES += wayland wayland-protocols
-EFL_CONF_OPTS += --enable-wayland --enable-gl-drm
+EFL_CONF_OPTS += -Dwl=true
 else
-EFL_CONF_OPTS += --disable-wayland --disable-gl-drm
+EFL_CONF_OPTS += -Dwl=false
 endif
 
 EFL_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBXKBCOMMON),libxkbcommon)
 
-# Loaders that need external dependencies needs to be --enable-XXX=yes
-# otherwise the default is '=static'.
-# All other loaders are statically built-in
-ifeq ($(BR2_PACKAGE_EFL_PNG),y)
-EFL_CONF_OPTS += --enable-image-loader-png=yes
-EFL_DEPENDENCIES += libpng
-else
-EFL_CONF_OPTS += --disable-image-loader-png
-endif
+# Evas loaders are shared by default.
+EFL_CONF_OPTS += -Devas-modules=shared
 
-ifeq ($(BR2_PACKAGE_EFL_JPEG),y)
-EFL_CONF_OPTS += --enable-image-loader-jpeg=yes
-# efl already depends on jpeg.
-else
-EFL_CONF_OPTS += --disable-image-loader-jpeg
-endif
+# json evas loader is disabled by default by upstream.
+# Disable libspectre (ps).
+# Keep all other evas loader enabled or handled below.
+EFL_EVAS_LOADERS_DISABLER = gst json ps
 
-ifeq ($(BR2_PACKAGE_EFL_GIF),y)
-EFL_CONF_OPTS += --enable-image-loader-gif=yes
-EFL_DEPENDENCIES += giflib
-else
-EFL_CONF_OPTS += --disable-image-loader-gif
+# efl already depends on jpeg.
+ifeq ($(BR2_PACKAGE_EFL_JPEG),)
+EFL_EVAS_LOADERS_DISABLER += jp2k
 endif
 
 ifeq ($(BR2_PACKAGE_EFL_TIFF),y)
-EFL_CONF_OPTS += --enable-image-loader-tiff=yes
 EFL_DEPENDENCIES += tiff
 else
-EFL_CONF_OPTS += --disable-image-loader-tiff
+EFL_EVAS_LOADERS_DISABLER += tiff
 endif
 
 ifeq ($(BR2_PACKAGE_EFL_WEBP),y)
-EFL_CONF_OPTS += --enable-image-loader-webp=yes
 EFL_DEPENDENCIES += webp
 else
-EFL_CONF_OPTS += --disable-image-loader-webp
+EFL_EVAS_LOADERS_DISABLER += webp
 endif
 
 ifeq ($(BR2_PACKAGE_POPPLER),y)
 EFL_DEPENDENCIES += poppler
-EFL_CONF_OPTS += --enable-poppler
 else
-EFL_CONF_OPTS += --disable-poppler
+EFL_EVAS_LOADERS_DISABLER += pdf
 endif
 
 ifeq ($(BR2_PACKAGE_EFL_LIBRAW),y)
 EFL_DEPENDENCIES += libraw
-EFL_CONF_OPTS += --enable-libraw
 else
-EFL_CONF_OPTS += --disable-libraw
+EFL_EVAS_LOADERS_DISABLER += raw
 endif
 
 ifeq ($(BR2_PACKAGE_EFL_SVG),y)
 EFL_DEPENDENCIES += librsvg cairo
-EFL_CONF_OPTS += --enable-librsvg
 else
-EFL_CONF_OPTS += --disable-librsvg
+EFL_EVAS_LOADERS_DISABLER += rsvg
 endif
 
+EFL_CONF_OPTS += -Devas-loaders-disabler=$(subst $(space),$(comma),$(EFL_EVAS_LOADERS_DISABLER))
+
 ifeq ($(BR2_PACKAGE_UPOWER),)
 # upower ecore system module is only useful if upower
 # dbus service is available.
@@ -293,7 +260,7 @@ ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
 EFL_DEPENDENCIES += libunwind
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
 
 ################################################################################
 #
@@ -309,73 +276,78 @@ $(eval $(autotools-package))
 # * host-dbus: for Eldbus
 # * host-freetype: for libevas
 # * host-libglib2: for libecore
-# * host-libjpeg, host-libpng: for libevas image loader
+# * host-giflib, host-libjpeg, host-libpng: for libevas image loader
 # * host-luajit for Elua tool for the host
+# * host-openssl: cryptography backends.
 HOST_EFL_DEPENDENCIES = \
 	host-pkgconf \
 	host-dbus \
 	host-freetype \
+	host-giflib \
 	host-libglib2 \
 	host-libjpeg \
 	host-libpng \
 	host-luajit \
+	host-openssl \
 	host-zlib
 
 # Configure options:
-# --disable-audio, --disable-multisense remove libsndfile dependency.
-# --disable-fontconfig: remove dependency on fontconfig.
-# --disable-fribidi: remove dependency on libfribidi.
-# --disable-gstreamer1: remove dependency on gtreamer 1.0.
-# --disable-libeeze: remove libudev dependency.
-# --disable-libmount: remove dependency on host-util-linux libmount.
-# --disable-lua-old: build elua for the host.
-# --disable-physics: remove Bullet dependency.
-# --disable-poppler: disable poppler image loader.
-# --disable-spectre: disable spectre image loader.
-# --disable-systemd: disable systemd dependency.
-# --disable-vnc-server: remove libvncserver dependency.
-# --enable-image-loader-gif=no: disable Gif dependency.
-# --enable-image-loader-tiff=no: disable Tiff dependency.
-# --with-crypto=none: remove dependencies on openssl or gnutls.
-# --with-doxygen: disable doxygen documentation
-# --with-net-control=none: disable connman networkmanager.
-# --with-x11=none: remove dependency on X.org.
+# audio=false: remove libsndfile dependency.
+# eeze=false: remove libudev dependency.
+# libmount=false: remove dependency on host-util-linux libmount.
+# elua=true: build elua for the host.
+# physics=false: remove Bullet dependency.
+# network-backend=none: remove network-backend (connman).
+# embedded-lz4=true: use lz4 bundled in efl.
 HOST_EFL_CONF_OPTS += \
-	--disable-audio \
-	--disable-fontconfig \
-	--disable-fribidi \
-	--disable-gstreamer1 \
-	--disable-libeeze \
-	--disable-libmount \
-	--disable-libraw \
-	--disable-librsvg \
-	--disable-lua-old \
-	--disable-multisense \
-	--disable-physics \
-	--disable-poppler \
-	--disable-spectre \
-	--disable-systemd \
-	--disable-xcf \
-	--disable-vnc-server \
-	--enable-image-loader-gif=no \
-	--enable-image-loader-jpeg=yes \
-	--enable-image-loader-png=yes \
-	--enable-image-loader-tiff=no \
-	--with-crypto=none \
-	--with-doxygen=no \
-	--with-glib=yes \
-	--with-net-control=none \
-	--with-opengl=none \
-	--with-x11=none
+	-Daudio=false \
+	-Davahi=false \
+	-Dbuild-examples=false \
+	-Dbuild-tests=false \
+	-Dcrypto=openssl \
+	-Decore-imf-loaders-disabler=ibus,scim,xim \
+	-Dedje-sound-and-video=false \
+	-Deeze=false \
+	-Delogind=false \
+	-Delua=true \
+	-Dembedded-lz4=true \
+	-Demotion-generic-loaders-disabler=vlc \
+	-Demotion-loaders-disabler=gstreamer,gstreamer1,libvlc,xine \
+	-Dfontconfig=false \
+	-Dfribidi=false \
+	-Dglib=true \
+	-Dgstreamer=false \
+	-Dharfbuzz=false \
+	-Dlibmount=false \
+	-Dlua-interpreter=luajit \
+	-Dnetwork-backend=none \
+	-Dnls=false \
+	-Dopengl=none \
+	-Dphysics=false \
+	-Dpixman=false \
+	-Dpulseaudio=false \
+	-Dsdl=false \
+	-Dsystemd=false \
+	-Dv4l2=false \
+	-Dvnc-server=false \
+	-Dx11=false \
+	-Dxinput22=false
+
+# List of modular image/vector loaders to disable in efl
+HOST_EFL_EVAS_LOADERS_DISABLER = bmp dds eet generic gst ico json \
+	jp2k pdf pmaps ps psd raw rsvg tga tgv tiff wbmp webp xcf xpm
+
+HOST_EFL_CONF_OPTS += -Devas-loaders-disabler=$(subst $(space),$(comma),$(HOST_EFL_EVAS_LOADERS_DISABLER))
+
+HOST_EFL_BINDINGS = luajit
 
 # Enable Eolian language bindings to provide eolian_cxx tool for the
 # host which is required to build Eolian language bindings for the
 # target.
 ifeq ($(BR2_PACKAGE_EFL_EOLIAN_CPP),y)
-HOST_EFL_CONF_OPTS += --enable-cxx-bindings
-else
-HOST_EFL_CONF_OPTS += --disable-cxx-bindings
+HOST_EFL_BINDINGS += cxx
 endif
+HOST_EFL_CONF_OPTS += -Dbindings=$(subst $(space),$(comma),$(HOST_EFL_BINDINGS))
 
 # Always disable upower system module from host as it's
 # not useful and would try to use the output/host/var
@@ -386,4 +358,4 @@ define HOST_EFL_HOOK_REMOVE_UPOWER
 endef
 HOST_EFL_POST_INSTALL_HOOKS = HOST_EFL_HOOK_REMOVE_UPOWER
 
-$(eval $(host-autotools-package))
+$(eval $(host-meson-package))
diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
index 2cd6512e1e..1630416718 100644
--- a/package/enlightenment/Config.in
+++ b/package/enlightenment/Config.in
@@ -17,7 +17,6 @@ config BR2_PACKAGE_ENLIGHTENMENT
 	select BR2_PACKAGE_EFL_X_XLIB
 	select BR2_PACKAGE_EFL_EEZE
 	select BR2_PACKAGE_EFL_JPEG # needed at runtime by enlightenment_start
-	select BR2_PACKAGE_EFL_PNG # needed@runtime by enlightenment_start
 	select BR2_PACKAGE_EFL_SVG
 	select BR2_PACKAGE_XCB_UTIL_KEYSYMS
 	help
-- 
2.24.1
