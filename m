From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 15 Dec 2015 23:40:15 +0100
Subject: [Buildroot] [PATCH v10 03/28] package/efl/libefl: add wayland
	dependency
In-Reply-To: <1450219240-16938-1-git-send-email-romain.naour@openwide.fr>
References: <1450219240-16938-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1450219240-16938-4-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See:
https://www.enlightenment.org/about-wayland

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
v6: use --enable/disable options
v4: rename to libefl
---
 package/efl/libefl/Config.in | 1 +
 package/efl/libefl/libefl.mk | 9 +++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/efl/libefl/Config.in b/package/efl/libefl/Config.in
index cc39c82..41160d4 100644
--- a/package/efl/libefl/Config.in
+++ b/package/efl/libefl/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LIBEFL
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_JPEG # Emile needs libjpeg
 	select BR2_PACKAGE_LIBCURL # Ecore_con_url, runtime dependency
+	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_UTIL_LINUX
 	# libblkid is part of required tools, see EFL's README.
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
index 5059f8c..db150d0 100644
--- a/package/efl/libefl/libefl.mk
+++ b/package/efl/libefl/libefl.mk
@@ -35,7 +35,6 @@ LIBEFL_GETTEXTIZE = YES
 # --disable-image-loader-webp: disable webp support.
 # --disable-sdl: disable sdl2 support.
 # --disable-systemd: disable systemd support.
-# --disable-wayland: disable wayland support.
 # --enable-lua-old: disable Elua and remove luajit dependency.
 # --with-opengl=none: disable opengl support.
 # --with-x11=none: remove dependency on X.org.
@@ -48,7 +47,6 @@ LIBEFL_CONF_OPTS = \
 	--disable-image-loader-webp \
 	--disable-sdl \
 	--disable-systemd \
-	--disable-wayland \
 	--enable-lua-old \
 	--with-opengl=none \
 	--with-x11=none
@@ -140,6 +138,13 @@ else
 LIBEFL_CONF_OPTS += --with-crypto=none
 endif # BR2_PACKAGE_OPENSSL
 
+ifeq ($(BR2_PACKAGE_WAYLAND),y)
+LIBEFL_DEPENDENCIES += wayland libxkbcommon
+LIBEFL_CONF_OPTS += --enable-wayland
+else
+LIBEFL_CONF_OPTS += --disable-wayland
+endif
+
 # Loaders that need external dependencies needs to be --enable-XXX=yes
 # otherwise the default is '=static'.
 # All other loaders are statically built-in
-- 
2.4.3
