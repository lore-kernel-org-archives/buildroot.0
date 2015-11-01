From: Romain Naour <romain.naour@openwide.fr>
Date: Sun,  1 Nov 2015 19:07:50 +0100
Subject: [Buildroot] [PATCH v6 14/33] package/efl/libefl: enable xinput2.2
In-Reply-To: <1446401289-9059-1-git-send-email-romain.naour@openwide.fr>
References: <1446401289-9059-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1446401289-9059-15-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

X11 XInput v2.2+ support is one of the recommended
feature for the efl libraries:
https://git.enlightenment.org/core/efl.git/tree/README?h=efl-1.15#n490

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v6: add missing dependency on xlib_libXi (Yann E.Morin)
v4: rename to libefl
    improve commit log
v3: new patch
---
 package/efl/libefl/Config.in | 1 +
 package/efl/libefl/libefl.mk | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/efl/libefl/Config.in b/package/efl/libefl/Config.in
index b0cb675..98c369c 100644
--- a/package/efl/libefl/Config.in
+++ b/package/efl/libefl/Config.in
@@ -97,6 +97,7 @@ config BR2_PACKAGE_LIBEFL_X_XLIB
 	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE
+	select BR2_PACKAGE_XLIB_LIBXI
 	select BR2_PACKAGE_XLIB_LIBXINERAMA
 	select BR2_PACKAGE_XLIB_LIBXP
 	select BR2_PACKAGE_XLIB_LIBXRANDR
diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
index fa1ee74..d2537dc 100644
--- a/package/efl/libefl/libefl.mk
+++ b/package/efl/libefl/libefl.mk
@@ -33,7 +33,6 @@ LIBEFL_GETTEXTIZE = YES
 # --disable-cxx-bindings: disable C++11 bindings.
 # --disable-sdl: disable sdl2 support.
 # --disable-systemd: disable systemd support.
-# --disable-xinput22: disable X11 XInput v2.2+ support.
 # --enable-lua-old: disable Elua and remove luajit dependency.
 # --with-opengl=none: disable opengl support.
 # --with-x11=none: remove dependency on X.org.
@@ -146,10 +145,12 @@ LIBEFL_CONF_OPTS += --disable-fb
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEFL_X_XLIB),y)
+# --enable-xinput22 is recommended
 LIBEFL_CONF_OPTS += --with-x=$(STAGING_DIR) \
 	--with-x11=xlib \
 	--x-includes=$(STAGING_DIR)/usr/include \
-	--x-libraries=$(STAGING_DIR)/usr/lib
+	--x-libraries=$(STAGING_DIR)/usr/lib \
+	--enable-xinput22
 
 LIBEFL_DEPENDENCIES += \
 	xlib_libX11 \
@@ -157,6 +158,7 @@ LIBEFL_DEPENDENCIES += \
 	xlib_libXcursor \
 	xlib_libXdamage \
 	xlib_libXext \
+	xlib_libXi \
 	xlib_libXinerama \
 	xlib_libXrandr \
 	xlib_libXrender \
-- 
2.4.3
