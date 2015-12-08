From: Romain Naour <romain.naour@openwide.fr>
Date: Wed,  9 Dec 2015 00:02:17 +0100
Subject: [Buildroot] [PATCH v8 14/33] package/efl/libefl: enable xinput2.2
In-Reply-To: <1449615756-19115-1-git-send-email-romain.naour@openwide.fr>
References: <1449615756-19115-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1449615756-19115-15-git-send-email-romain.naour@openwide.fr>
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
v8: Remove --disable-xinput22 added by the patch adding X11 support
    (Yann E.Morin)
v6: add missing dependency on xlib_libXi (Yann E.Morin)
v4: rename to libefl
    improve commit log
v3: new patch
---
 package/efl/libefl/Config.in | 1 +
 package/efl/libefl/libefl.mk | 7 ++++---
 2 files changed, 5 insertions(+), 3 deletions(-)

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
index acc4c06..134531c 100644
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
@@ -43,7 +42,6 @@ LIBEFL_CONF_OPTS = \
 	--disable-cxx-bindings \
 	--disable-sdl \
 	--disable-systemd \
-	--disable-xinput22 \
 	--enable-lua-old
 
 # Disable untested configuration warning.
@@ -147,11 +145,13 @@ LIBEFL_CONF_OPTS += --disable-fb
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEFL_X_XLIB),y)
+# --enable-xinput22 is recommended
 LIBEFL_CONF_OPTS += \
 	--with-x11=xlib \
 	--with-x=$(STAGING_DIR) \
 	--x-includes=$(STAGING_DIR)/usr/include \
-	--x-libraries=$(STAGING_DIR)/usr/lib
+	--x-libraries=$(STAGING_DIR)/usr/lib \
+	--enable-xinput22
 
 LIBEFL_DEPENDENCIES += \
 	xlib_libX11 \
@@ -159,6 +159,7 @@ LIBEFL_DEPENDENCIES += \
 	xlib_libXcursor \
 	xlib_libXdamage \
 	xlib_libXext \
+	xlib_libXi \
 	xlib_libXinerama \
 	xlib_libXrandr \
 	xlib_libXrender \
-- 
2.4.3
