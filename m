From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Jun 2009 10:43:01 +0200
Subject: [Buildroot] [git commit] Fix Matchbox build
Message-ID: <20090701181741.C656D7645A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=51ef5b81224c243aa7f937c4690b1a120c81ccbc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Several issues were encountered when trying to build Matchbox. This
patches fixes these issues :

 * Selecting BR2_PACKAGE_MATCHBOX should select BR2_PACKAGE_XORG7,
   otherwise the x11r7 mk files are not included, and matchbox.mk
   refers to non-existing dependencies (such as xlib_libXtst).

 * In matchbox.mk, wrong dependencies for Matchbox keyboard. When
   pango is available, use it through --enable-pango, otherwise, add
   the dependency to xlib_libXft

 * Enable AUTORECONF for libXfont and libXft, otherwise the libtool
   Buildroot patch has no effect, and these packages fail to build
   without the libtool hack.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/matchbox/Config.in                   |    1 +
 package/matchbox/matchbox.mk                 |    7 ++++++-
 package/x11r7/xlib_libXfont/xlib_libXfont.mk |    2 +-
 package/x11r7/xlib_libXft/xlib_libXft.mk     |    2 +-
 4 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index a5e68f8..b57a4a2 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_MATCHBOX
 	bool "MatchBox Window Manager"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
diff --git a/package/matchbox/matchbox.mk b/package/matchbox/matchbox.mk
index 6dfccf8..a3ff222 100644
--- a/package/matchbox/matchbox.mk
+++ b/package/matchbox/matchbox.mk
@@ -160,6 +160,8 @@ MATCHBOX_WM_OPTS:=
 MATCHBOX_WM_DEPS:=xlib_libXdamage
 MATCHBOX_WM_DEPS+=xlib_libXcursor
 
+MATCHBOX_KB_DEPS:=
+
 ifeq ($(BR2_PACKAGE_X11R7_LIBXCOMPOSITE),y)
 ifeq ($(BR2_PACKAGE_X11R7_LIBXPM),y)
   MATCHBOX_WM_OPTS+=--enable-composite
@@ -199,8 +201,10 @@ endif
 ifeq ($(BR2_PACKAGE_PANGO),y)
   MATCHBOX_LIB_OPTS+=--enable-pango
   MATCHBOX_LIB_DEPS+=pango
+  MATCHBOX_KB_OPTS+=--enable-pango
 else
   MATCHBOX_LIB_OPTS+=--disable-pango
+  MATCHBOX_KB_DEPS+=xlib_libXft
 endif
 
 ifeq ($(BR2_PACKAGE_X11R7_LIBXFT2),y)
@@ -424,6 +428,7 @@ $(MATCHBOX_KB_DIR)/.configured: $(MATCHBOX_KB_DIR)/.unpacked
 	--with-x \
 	--x-includes=$(STAGING_DIR)/usr/include/X11 \
 	--x-libraries=$(STAGING_DIR)/usr/lib \
+	$(MATCHBOX_KB_OPTS) \
 	)
 	touch $(MATCHBOX_KB_DIR)/.configured
 
@@ -610,7 +615,7 @@ matchbox-panel: uclibc matchbox $(TARGET_DIR)/usr/bin/$(MATCHBOX_PL_BIN) $(TARGE
 
 matchbox-desktop: uclibc matchbox $(TARGET_DIR)/usr/bin/$(MATCHBOX_DP_BIN)
 
-matchbox-keyboard: uclibc matchbox xlib_libXtst $(TARGET_DIR)/usr/lib/$(MATCHBOX_FK_BIN).so $(TARGET_DIR)/usr/bin/$(MATCHBOX_KB_BIN)
+matchbox-keyboard: uclibc matchbox xlib_libXtst $(MATCHBOX_KB_DEPS) $(TARGET_DIR)/usr/lib/$(MATCHBOX_FK_BIN).so $(TARGET_DIR)/usr/bin/$(MATCHBOX_KB_BIN)
 
 matchbox-clean:
 	rm -f $(TARGET_DIR)/usr/lib/libmb.*
diff --git a/package/x11r7/xlib_libXfont/xlib_libXfont.mk b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
index 39b25fc..a64b74e 100644
--- a/package/x11r7/xlib_libXfont/xlib_libXfont.mk
+++ b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
@@ -7,7 +7,7 @@
 XLIB_LIBXFONT_VERSION = 1.3.3
 XLIB_LIBXFONT_SOURCE = libXfont-$(XLIB_LIBXFONT_VERSION).tar.bz2
 XLIB_LIBXFONT_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXFONT_AUTORECONF = NO
+XLIB_LIBXFONT_AUTORECONF = YES
 XLIB_LIBXFONT_INSTALL_STAGING = YES
 XLIB_LIBXFONT_DEPENDENCIES = freetype xlib_libfontenc xlib_xtrans xproto_fontcacheproto xproto_fontsproto xproto_xproto xfont_encodings
 XLIB_LIBXFONT_CONF_OPT = --enable-shared --disable-static
diff --git a/package/x11r7/xlib_libXft/xlib_libXft.mk b/package/x11r7/xlib_libXft/xlib_libXft.mk
index b112d23..5ae3f17 100644
--- a/package/x11r7/xlib_libXft/xlib_libXft.mk
+++ b/package/x11r7/xlib_libXft/xlib_libXft.mk
@@ -7,7 +7,7 @@
 XLIB_LIBXFT_VERSION = 2.1.13
 XLIB_LIBXFT_SOURCE = libXft-$(XLIB_LIBXFT_VERSION).tar.bz2
 XLIB_LIBXFT_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXFT_AUTORECONF = NO
+XLIB_LIBXFT_AUTORECONF = YES
 XLIB_LIBXFT_INSTALL_STAGING = YES
 XLIB_LIBXFT_DEPENDENCIES = fontconfig freetype xlib_libX11 xlib_libXext xlib_libXrender xproto_xproto
 XLIB_LIBXFT_CONF_OPT = --enable-shared --disable-static
-- 
1.6.3.3
