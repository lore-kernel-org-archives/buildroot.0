From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 16:46:19 +0200
Subject: [Buildroot] [PATCH 10/16] xkeyboard-config: add dependency on
	host-xapp_xkbcomp
In-Reply-To: <cover.1280241791.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280241791.git.thomas.petazzoni@free-electrons.com>
Message-ID: <bb0ed530401b187034ccd5b3e619ccbc0ad3f905.1280241791.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to get xkeyboard-config to build, it needs xkbcomp to be
built on the host, i.e host-xapp_xkbcomp. In turn, xapp_xkbcomp needs
xlib_libX11 and xlib_libxkbfile, which in turn need a few libraries.

This commit adds all the relevant dependencies to build everything
that is needed to get xkeyboard-config to build correctly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/libxcb/libxcb.mk                     |    3 +++
 package/x11r7/pthread-stubs/pthread-stubs.mk       |    1 +
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk         |    2 ++
 package/x11r7/xcb-proto/xcb-proto.mk               |    1 +
 package/x11r7/xkeyboard-config/xkeyboard-config.mk |    2 +-
 package/x11r7/xlib_libX11/xlib_libX11.mk           |    3 +++
 package/x11r7/xlib_libXau/xlib_libXau.mk           |    4 ++++
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk       |    4 ++++
 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk   |    4 ++++
 .../x11r7/xproto_inputproto/xproto_inputproto.mk   |    1 +
 package/x11r7/xproto_kbproto/xproto_kbproto.mk     |    1 +
 .../x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk |    1 +
 package/x11r7/xproto_xextproto/xproto_xextproto.mk |    1 +
 .../xproto_xf86bigfontproto.mk                     |    1 +
 .../x11r7/xutil_util-macros/xutil_util-macros.mk   |    1 +
 15 files changed, 29 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index 4f9b323..bfeceab 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -16,5 +16,8 @@ LIBXCB_CONF_ENV = STAGING_DIR="$(STAGING_DIR)"
 HOST_PYTHON_VERSION=$(shell python --version 2>&1 | sed 's/Python \([0-9]\.[^\.]\).*/\1/')
 LIBXCB_MAKE_OPT = XCBPROTO_XCBINCLUDEDIR=$(STAGING_DIR)/usr/share/xcb XCBPROTO_XCBPYTHONDIR=$(STAGING_DIR)/usr/lib/python$(HOST_PYTHON_VERSION)/site-packages
 
+HOST_LIBXCB_DEPENDENCIES = host-libxslt host-pthread-stubs host-xcb-proto host-xlib_libXdmcp host-xlib_libXau
+
 $(eval $(call AUTOTARGETS,package/x11r7,libxcb))
+$(eval $(call AUTOTARGETS,package/x11r7,libxcb,host))
 
diff --git a/package/x11r7/pthread-stubs/pthread-stubs.mk b/package/x11r7/pthread-stubs/pthread-stubs.mk
index f40332a..3ee7ec1 100644
--- a/package/x11r7/pthread-stubs/pthread-stubs.mk
+++ b/package/x11r7/pthread-stubs/pthread-stubs.mk
@@ -11,4 +11,5 @@ PTHREAD_STUBS_LIBTOOL_PATCH = NO
 PTHREAD_STUBS_INSTALL_STAGING = YES
 
 $(eval $(call AUTOTARGETS,package/x11r7,pthread-stubs))
+$(eval $(call AUTOTARGETS,package/x11r7,pthread-stubs,host))
 
diff --git a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
index 6082c56..e9f7174 100644
--- a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
+++ b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
@@ -9,5 +9,7 @@ XAPP_XKBCOMP_SOURCE = xkbcomp-$(XAPP_XKBCOMP_VERSION).tar.bz2
 XAPP_XKBCOMP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKBCOMP_AUTORECONF = NO
 XAPP_XKBCOMP_DEPENDENCIES = xlib_libX11 xlib_libxkbfile
+HOST_XAPP_XKBCOMP_DEPENDENCIES = host-xlib_libX11 host-xlib_libxkbfile
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xkbcomp))
+$(eval $(call AUTOTARGETS,package/x11r7,xapp_xkbcomp,host))
diff --git a/package/x11r7/xcb-proto/xcb-proto.mk b/package/x11r7/xcb-proto/xcb-proto.mk
index a3d029c..153cc0d 100644
--- a/package/x11r7/xcb-proto/xcb-proto.mk
+++ b/package/x11r7/xcb-proto/xcb-proto.mk
@@ -10,4 +10,5 @@ XCB_PROTO_SITE = http://xcb.freedesktop.org/dist/
 XCB_PROTO_INSTALL_STAGING = YES
 
 $(eval $(call AUTOTARGETS,package/x11r7,xcb-proto))
+$(eval $(call AUTOTARGETS,package/x11r7,xcb-proto,host))
 
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index eb790b8..e398d30 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -10,7 +10,7 @@ XKEYBOARD_CONFIG_AUTORECONF = NO
 XKEYBOARD_CONFIG_INSTALL_STAGING = NO
 XKEYBOARD_CONFIG_INSTALL_TARGET = YES
 XKEYBOARD_CONFIG_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
-XKEYBOARD_CONFIG_DEPENDENCIES = host-intltool
+XKEYBOARD_CONFIG_DEPENDENCIES = host-intltool host-xapp_xkbcomp
 
 XKEYBOARD_CONFIG_CONF_OPT = GMSGFMT=/usr/bin/msgfmt
 
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index b9c18d0..575aa67 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -18,7 +18,10 @@ XLIB_LIBX11_CONF_OPT = \
 	--with-keysymdef=$(STAGING_DIR)/usr/include/X11/keysymdef.h \
 	--disable-specs
 
+HOST_XLIB_LIBX11_DEPENDENCIES = host-xproto_xextproto host-libxcb host-xutil_util-macros host-xlib_xtrans host-xlib_libXau host-xlib_libXdmcp host-xproto_kbproto host-xproto_xproto host-xproto_xextproto host-xproto_inputproto host-xproto_xf86bigfontproto xproto_bigreqsproto host-xproto_xcmiscproto
+
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libX11))
+$(eval $(call AUTOTARGETS,package/x11r7,xlib_libX11,host))
 
 # src/util/makekeys is executed at build time to generate ks_tables.h, so
 # it should get compiled for the host. The libX11 makefile unfortunately
diff --git a/package/x11r7/xlib_libXau/xlib_libXau.mk b/package/x11r7/xlib_libXau/xlib_libXau.mk
index d5f6814..ad6a0e5 100644
--- a/package/x11r7/xlib_libXau/xlib_libXau.mk
+++ b/package/x11r7/xlib_libXau/xlib_libXau.mk
@@ -13,4 +13,8 @@ XLIB_LIBXAU_INSTALL_STAGING = YES
 XLIB_LIBXAU_DEPENDENCIES = xutil_util-macros xproto_xproto
 XLIB_LIBXAU_CONF_OPT = --enable-shared --disable-static
 
+HOST_XLIB_LIBXAU_DEPENDENCIES = host-xutil_util-macros host-xproto_xproto
+HOST_XLIB_LIBXAU_CONF_OPT = --enable-shared --disable-static
+
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXau))
+$(eval $(call AUTOTARGETS,package/x11r7,xlib_libXau,host))
diff --git a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
index 40b8058..eef3a5e 100644
--- a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
+++ b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
@@ -13,4 +13,8 @@ XLIB_LIBXDMCP_INSTALL_STAGING = YES
 XLIB_LIBXDMCP_DEPENDENCIES = xutil_util-macros xproto_xproto
 XLIB_LIBXDMCP_CONF_OPT = --enable-shared --disable-static
 
+HOST_XLIB_LIBXDMCP_DEPENDENCIES = host-xutil_util-macros host-xproto_xproto
+HOST_XLIB_LIBXDMCP_CONF_OPT = --enable-shared --disable-static
+
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXdmcp))
+$(eval $(call AUTOTARGETS,package/x11r7,xlib_libXdmcp,host))
diff --git a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
index 7b6de7e..e71b36b 100644
--- a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
+++ b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
@@ -12,4 +12,8 @@ XLIB_LIBXKBFILE_INSTALL_STAGING = YES
 XLIB_LIBXKBFILE_DEPENDENCIES = xlib_libX11 xproto_kbproto
 XLIB_LIBXKBFILE_CONF_OPT = --enable-shared --disable-static
 
+HOST_XLIB_LIBXKBFILE_DEPENDENCIES = host-xlib_libX11 host-xproto_kbproto
+HOST_XLIB_LIBXKBFILE_CONF_OPT = --enable-shared --disable-static
+
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libxkbfile))
+$(eval $(call AUTOTARGETS,package/x11r7,xlib_libxkbfile,host))
diff --git a/package/x11r7/xproto_inputproto/xproto_inputproto.mk b/package/x11r7/xproto_inputproto/xproto_inputproto.mk
index d83ba7e..825ebed 100644
--- a/package/x11r7/xproto_inputproto/xproto_inputproto.mk
+++ b/package/x11r7/xproto_inputproto/xproto_inputproto.mk
@@ -12,3 +12,4 @@ XPROTO_INPUTPROTO_INSTALL_STAGING = YES
 XPROTO_INPUTPROTO_INSTALL_TARGET = NO
 
 $(eval $(call AUTOTARGETS,package/x11r7,xproto_inputproto))
+$(eval $(call AUTOTARGETS,package/x11r7,xproto_inputproto,host))
diff --git a/package/x11r7/xproto_kbproto/xproto_kbproto.mk b/package/x11r7/xproto_kbproto/xproto_kbproto.mk
index 802bae4..ecdabf1 100644
--- a/package/x11r7/xproto_kbproto/xproto_kbproto.mk
+++ b/package/x11r7/xproto_kbproto/xproto_kbproto.mk
@@ -12,3 +12,4 @@ XPROTO_KBPROTO_INSTALL_STAGING = YES
 XPROTO_KBPROTO_INSTALL_TARGET = NO
 
 $(eval $(call AUTOTARGETS,package/x11r7,xproto_kbproto))
+$(eval $(call AUTOTARGETS,package/x11r7,xproto_kbproto,host))
diff --git a/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk b/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
index 9c85d9f..1846f20 100644
--- a/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
+++ b/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
@@ -12,3 +12,4 @@ XPROTO_XCMISCPROTO_INSTALL_STAGING = YES
 XPROTO_XCMISCPROTO_INSTALL_TARGET = NO
 
 $(eval $(call AUTOTARGETS,package/x11r7,xproto_xcmiscproto))
+$(eval $(call AUTOTARGETS,package/x11r7,xproto_xcmiscproto,host))
diff --git a/package/x11r7/xproto_xextproto/xproto_xextproto.mk b/package/x11r7/xproto_xextproto/xproto_xextproto.mk
index 6b880b4..1fd39c9 100644
--- a/package/x11r7/xproto_xextproto/xproto_xextproto.mk
+++ b/package/x11r7/xproto_xextproto/xproto_xextproto.mk
@@ -12,3 +12,4 @@ XPROTO_XEXTPROTO_INSTALL_STAGING = YES
 XPROTO_XEXTPROTO_INSTALL_TARGET = NO
 
 $(eval $(call AUTOTARGETS,package/x11r7,xproto_xextproto))
+$(eval $(call AUTOTARGETS,package/x11r7,xproto_xextproto,host))
diff --git a/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk b/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
index fda78e2..1872873 100644
--- a/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
+++ b/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
@@ -12,3 +12,4 @@ XPROTO_XF86BIGFONTPROTO_INSTALL_STAGING = YES
 XPROTO_XF86BIGFONTPROTO_INSTALL_TARGET = NO
 
 $(eval $(call AUTOTARGETS,package/x11r7,xproto_xf86bigfontproto))
+$(eval $(call AUTOTARGETS,package/x11r7,xproto_xf86bigfontproto,host))
diff --git a/package/x11r7/xutil_util-macros/xutil_util-macros.mk b/package/x11r7/xutil_util-macros/xutil_util-macros.mk
index 648136e..b600a46 100644
--- a/package/x11r7/xutil_util-macros/xutil_util-macros.mk
+++ b/package/x11r7/xutil_util-macros/xutil_util-macros.mk
@@ -12,3 +12,4 @@ XUTIL_UTIL_MACROS_INSTALL_STAGING = YES
 XUTIL_UTIL_MACROS_INSTALL_TARGET = NO
 
 $(eval $(call AUTOTARGETS,package/x11r7,xutil_util-macros))
+$(eval $(call AUTOTARGETS,package/x11r7,xutil_util-macros,host))
-- 
1.7.0.4
