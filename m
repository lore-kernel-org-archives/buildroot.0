From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Dec 2010 14:14:53 +0100
Subject: [Buildroot] [PATCH 1/1] xlib_libX11: compile makekeys for the host
	correctly
In-Reply-To: <cover.1292937286.git.thomas.petazzoni@free-electrons.com>
References: <cover.1292937286.git.thomas.petazzoni@free-electrons.com>
Message-ID: <90d05a2a9ac9123d0fab7f68c31d58feb627d16a.1292937286.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As reported by Miroslav Ignjatovic in bug #2983, our hack in
xlib_libX11 to build makekeys for the host does not work, for several
reasons:

 * As we are building a tool for the host, we shouldn't pass
   -I$(STAGING_DIR)/usr/include, since the $(STAGING_DIR) contains
   headers of packages for the target.

 * Instead, we should use the headers in $(HOST_DIR)/usr/include. They
   were not used due to a type: $(HOST_CFLAGS) must be used instead of
   $(HOSTCFLAGS).

 * Finally, in order for makekeys to find the required headers in
   $(HOST_DIR)/usr/include, we must depend on host-xproto_xproto.

This fixes bug #2983.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xlib_libX11/xlib_libX11.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index c95d654..1acc35c 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -9,7 +9,7 @@ XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.bz2
 XLIB_LIBX11_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBX11_AUTORECONF = YES
 XLIB_LIBX11_INSTALL_STAGING = YES
-XLIB_LIBX11_DEPENDENCIES = libxcb xutil_util-macros xlib_xtrans xlib_libXau xlib_libXdmcp xproto_kbproto xproto_xproto xproto_xextproto xproto_inputproto xproto_xf86bigfontproto xproto_bigreqsproto xproto_xcmiscproto
+XLIB_LIBX11_DEPENDENCIES = libxcb xutil_util-macros xlib_xtrans xlib_libXau xlib_libXdmcp xproto_kbproto xproto_xproto xproto_xextproto xproto_inputproto xproto_xf86bigfontproto xproto_bigreqsproto xproto_xcmiscproto host-xproto_xproto
 XLIB_LIBX11_CONF_OPT = \
 	--disable-malloc0returnsnull \
 	--with-xcb \
@@ -33,8 +33,7 @@ endef
 XLIB_LIBX11_POST_EXTRACT_HOOKS += XLIB_LIBX11_DISABLE_MAKEKEYS_BUILD
 
 define XLIB_LIBX11_BUILD_MAKEKEYS_FOR_HOST
-	cd $(@D)/src/util && $(HOSTCC) $(HOSTCFLAGS) \
-		-I$(STAGING_DIR)/usr/include -o makekeys makekeys.c
+	cd $(@D)/src/util && $(HOSTCC) $(HOST_CFLAGS) -o makekeys makekeys.c
 endef
 
 XLIB_LIBX11_POST_CONFIGURE_HOOKS += XLIB_LIBX11_BUILD_MAKEKEYS_FOR_HOST
-- 
1.7.0.4
