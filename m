From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:42:16 +0200
Subject: [Buildroot] [PATCH 30/74] xlib_libX11: convert old-style hooks to
	new-style hooks
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <1976fc5f244cd04027b3a6f0d6b7ab1a29306f7d.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xlib_libX11/xlib_libX11.mk |   18 +++++++++++-------
 1 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index 575aa67..c95d654 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -20,20 +20,24 @@ XLIB_LIBX11_CONF_OPT = \
 
 HOST_XLIB_LIBX11_DEPENDENCIES = host-xproto_xextproto host-libxcb host-xutil_util-macros host-xlib_xtrans host-xlib_libXau host-xlib_libXdmcp host-xproto_kbproto host-xproto_xproto host-xproto_xextproto host-xproto_inputproto host-xproto_xf86bigfontproto xproto_bigreqsproto host-xproto_xcmiscproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libX11))
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libX11,host))
-
 # src/util/makekeys is executed at build time to generate ks_tables.h, so
 # it should get compiled for the host. The libX11 makefile unfortunately
 # doesn't know about cross compilation so this doesn't work.
 # Long term, we should probably teach it about HOSTCC / HOST_CFLAGS, but for
 # now simply disable the src/util Makefile and build makekeys by hand in
 # advance
-$(XLIB_LIBX11_HOOK_POST_EXTRACT):
+define XLIB_LIBX11_DISABLE_MAKEKEYS_BUILD
 	echo '' > $(@D)/src/util/Makefile.am
-	touch $@
+endef
+
+XLIB_LIBX11_POST_EXTRACT_HOOKS += XLIB_LIBX11_DISABLE_MAKEKEYS_BUILD
 
-$(XLIB_LIBX11_HOOK_POST_CONFIGURE):
+define XLIB_LIBX11_BUILD_MAKEKEYS_FOR_HOST
 	cd $(@D)/src/util && $(HOSTCC) $(HOSTCFLAGS) \
 		-I$(STAGING_DIR)/usr/include -o makekeys makekeys.c
-	touch $@
+endef
+
+XLIB_LIBX11_POST_CONFIGURE_HOOKS += XLIB_LIBX11_BUILD_MAKEKEYS_FOR_HOST
+
+$(eval $(call AUTOTARGETS,package/x11r7,xlib_libX11))
+$(eval $(call AUTOTARGETS,package/x11r7,xlib_libX11,host))
-- 
1.7.0.4
