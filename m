From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 12 Dec 2015 14:33:16 +0100
Subject: [Buildroot] [PATCH v9 13/32] package/efl/libefl: add OpenGLES
	support
In-Reply-To: <1449927215-3452-1-git-send-email-romain.naour@openwide.fr>
References: <1449927215-3452-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1449927215-3452-14-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow to enable graphic acceleration using OpenGLES
with efl libraries.

The full opengl option (--with-opengl=full) is still disabled
for now since it's mainly used with Tizen on GPU Intel and ARM Mali.

With the upcomming Wayland support in EFL 1.16 and Enlightenment 0.20,
only OpenGLES support is recommanded.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v9: remove OpenGL full support
v6: Rename OpenGL options (Yann E.Morin)
    Only full OpenGL support depends on X11.
v4: rename libefl
    improve commit log
---
 package/efl/libefl/Config.in | 19 +++++++++++++++++++
 package/efl/libefl/libefl.mk | 13 ++++++++++---
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/package/efl/libefl/Config.in b/package/efl/libefl/Config.in
index 560a7b3..73e14ae 100644
--- a/package/efl/libefl/Config.in
+++ b/package/efl/libefl/Config.in
@@ -105,6 +105,25 @@ config BR2_PACKAGE_LIBEFL_X_XLIB
 	select BR2_PACKAGE_XLIB_LIBXTST
 	select BR2_PACKAGE_XPROTO_GLPROTO
 
+choice
+	bool "OpenGL support"
+	default BR2_PACKAGE_LIBEFL_OPENGLES if BR2_PACKAGE_HAS_LIBGLES
+	help
+	  libevas can be configured to use HW acceleration only with
+	  OpenGLES.
+
+config BR2_PACKAGE_LIBEFL_OPENGL_NONE
+	bool "none"
+
+config BR2_PACKAGE_LIBEFL_OPENGLES
+	bool "opengles"
+	depends on BR2_PACKAGE_HAS_LIBGLES
+
+comment "opengles support needs an opengles provider"
+	depends on !BR2_PACKAGE_HAS_LIBGLES
+
+endchoice # OpenGL support
+
 comment "libevas loaders"
 
 config BR2_PACKAGE_LIBEFL_PNG
diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
index 3d58e24..0eb17c2 100644
--- a/package/efl/libefl/libefl.mk
+++ b/package/efl/libefl/libefl.mk
@@ -35,7 +35,6 @@ LIBEFL_GETTEXTIZE = YES
 # --disable-systemd: disable systemd support.
 # --disable-xinput22: disable X11 XInput v2.2+ support.
 # --enable-lua-old: disable Elua and remove luajit dependency.
-# --with-opengl=none: disable opengl support.
 LIBEFL_CONF_OPTS = \
 	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
 	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
@@ -43,8 +42,7 @@ LIBEFL_CONF_OPTS = \
 	--disable-sdl \
 	--disable-systemd \
 	--disable-xinput22 \
-	--enable-lua-old \
-	--with-opengl=none
+	--enable-lua-old
 
 # Disable untested configuration warning.
 ifeq ($(BR2_PACKAGE_LIBEFL_RECOMMENDED_CONFIG),)
@@ -168,6 +166,15 @@ else
 LIBEFL_CONF_OPTS += --with-x11=none
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEFL_OPENGLES),y)
+LIBEFL_CONF_OPTS += --with-opengl=es
+LIBEFL_DEPENDENCIES += libgles
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEFL_OPENGL_NONE),y)
+LIBEFL_CONF_OPTS += --with-opengl=none
+endif
+
 # Loaders that need external dependencies needs to be --enable-XXX=yes
 # otherwise the default is '=static'.
 # All other loaders are statically built-in
-- 
2.4.3
