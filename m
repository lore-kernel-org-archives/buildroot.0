From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Jun 2015 06:37:08 +0200
Subject: [Buildroot] [git commit] fluxbox: explicitly configure optional
	dependencies
Message-ID: <20150621043717.B12218075F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5465107eef24de1b64383b579d66b03695cb9c4c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The following commit explicitly configures optional dependencies based
off the respective package selections for a given configuration.

In addition, this commit also cleans up some obsolete/incorrect
arguments. With the introduction of (at least) Fluxbox 1.3.7, the
'--with-imlib2-prefix' argument no longer exists. The argument
'--with-xpm-prefix' has never existed; it was accidentally committed
mimicking the configuration used to provide imlib2.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fluxbox/fluxbox.mk |   53 ++++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/package/fluxbox/fluxbox.mk b/package/fluxbox/fluxbox.mk
index d2e8c89..305dd9a 100644
--- a/package/fluxbox/fluxbox.mk
+++ b/package/fluxbox/fluxbox.mk
@@ -15,20 +15,69 @@ FLUXBOX_CONF_OPTS = \
 	--x-libraries=$(STAGING_DIR)/usr/lib
 FLUXBOX_DEPENDENCIES = xlib_libX11 $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
+ifeq ($(BR2_PACKAGE_FREETYPE),y)
+FLUXBOX_CONF_OPTS += --enable-freetype2
+FLUXBOX_DEPENDENCIES += freetype
+else
+FLUXBOX_CONF_OPTS += --disable-freetype2
+endif
+
 ifeq ($(BR2_PACKAGE_IMLIB2_X),y)
-FLUXBOX_CONF_OPTS += --enable-imlib2 --with-imlib2-prefix=$(STAGING_DIR)/usr
+FLUXBOX_CONF_OPTS += --enable-imlib2
 FLUXBOX_DEPENDENCIES += imlib2
 else
 FLUXBOX_CONF_OPTS += --disable-imlib2
 endif
 
+ifeq ($(BR2_PACKAGE_LIBFRIBIDI),y)
+FLUXBOX_CONF_OPTS += --enable-fribidi
+FLUXBOX_DEPENDENCIES += libfribidi
+else
+FLUXBOX_CONF_OPTS += --disable-fribidi
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXFT),y)
+FLUXBOX_CONF_OPTS += --enable-xft
+FLUXBOX_DEPENDENCIES += xlib_libXft
+else
+FLUXBOX_CONF_OPTS += --disable-xft
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXRENDER),y)
+FLUXBOX_CONF_OPTS += --enable-xrender
+FLUXBOX_DEPENDENCIES += xlib_libXrender
+else
+FLUXBOX_CONF_OPTS += --disable-xrender
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBXPM),y)
-FLUXBOX_CONF_OPTS += --enable-xpm --with-xpm-prefix=$(STAGING_DIR)/usr
+FLUXBOX_CONF_OPTS += --enable-xpm
 FLUXBOX_DEPENDENCIES += xlib_libXpm
 else
 FLUXBOX_CONF_OPTS += --disable-xpm
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
+FLUXBOX_CONF_OPTS += --enable-xinerama
+FLUXBOX_DEPENDENCIES += xlib_libXinerama
+else
+FLUXBOX_CONF_OPTS += --disable-xinerama
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXEXT),y)
+FLUXBOX_CONF_OPTS += --enable-xext
+FLUXBOX_DEPENDENCIES += xlib_libXext
+else
+FLUXBOX_CONF_OPTS += --disable-xext
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
+FLUXBOX_CONF_OPTS += --enable-xrandr
+FLUXBOX_DEPENDENCIES += xlib_libXrandr
+else
+FLUXBOX_CONF_OPTS += --disable-xrandr
+endif
+
 define FLUXBOX_INSTALL_XSESSION_FILE
 	$(INSTALL) -m 0755 -D package/fluxbox/xsession \
 		$(TARGET_DIR)/root/.xsession
