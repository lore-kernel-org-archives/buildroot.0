From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Jan 2013 22:29:33 +0100
Subject: [Buildroot] [PATCH 21/28] pango: fix X.org dependencies
In-Reply-To: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <649024b2795de3d8ecd6d513362266ca6d879582.1357507764.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pango is a X client library, so it does not need to depend on the
X.org server. So, we replace the server dependency by dependencies on
the appropriate libraries.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pango/Config.in |    3 +++
 package/pango/pango.mk  |   13 +++++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/package/pango/Config.in b/package/pango/Config.in
index 60e9931..6c8a160 100644
--- a/package/pango/Config.in
+++ b/package/pango/Config.in
@@ -5,7 +5,10 @@ config BR2_PACKAGE_PANGO
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 	help
 	  Pango is a library for laying out and rendering of text, with an
 	  emphasis on internationalization. Pango can be used anywhere that
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 7ba53ee..8e0444e 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -41,17 +41,26 @@ PANGO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 
 PANGO_CONF_OPT = --enable-explicit-deps=no --disable-debug
 
-PANGO_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-pkgconf libglib2 cairo
+PANGO_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
+	host-pkgconf \
+	libglib2 \
+	cairo \
+	fontconfig \
+	freetype
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
         PANGO_CONF_OPT += --with-x \
 		--x-includes=$(STAGING_DIR)/usr/include/X11 \
 		--x-libraries=$(STAGING_DIR)/usr/lib --disable-glibtest
-	PANGO_DEPENDENCIES += xserver_xorg-server
+	PANGO_DEPENDENCIES += xlib_libX11
 else
         PANGO_CONF_OPT += --without-x
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXFT)$(BR2_PACKAGE_XLIB_LIBXRENDER),yy)
+	PANGO_DEPENDENCIES += xlib_libXft xlib_libXrender
+endif
+
 define PANGO_INSTALL_INITSCRIPT
 	$(INSTALL) -m 755 -D package/pango/S25pango \
 		$(TARGET_DIR)/etc/init.d/S25pango
-- 
1.7.9.5
