From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun,  4 Nov 2012 12:30:06 +0100
Subject: [Buildroot] [PATCH] xlib_libX11: fix compilation of makekeys
Message-ID: <1352028606-11338-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xlib_libX11 builds a makekeys executable for the host, but uses the
targets X11_CFLAGS. This leads to build failures like
http://autobuild.buildroot.net/results/411eb3aefea859a7e31986a44acd50b475f174cb/

This problem was introduced by the version bump, because then also
the AUTORECONF was removed so the existing fix didn't work anymore.

As a slightly cleaner solution, just remove X11_CFLAGS from the
Makefile.  We know we don't need it, because the X11 stuff is in
$(HOST_DIR)/usr/include which is already in HOST_CFLAGS.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
 package/x11r7/xlib_libX11/xlib_libX11.mk |   19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index 79b2d54..c8fea3d 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -19,21 +19,14 @@ HOST_XLIB_LIBX11_CONF_OPT = \
 
 # src/util/makekeys is executed at build time to generate ks_tables.h, so
 # it should get compiled for the host. The libX11 makefile unfortunately
-# doesn't know about cross compilation so this doesn't work.
-# Long term, we should probably teach it about HOSTCC / HOST_CFLAGS, but for
-# now simply disable the src/util Makefile and build makekeys by hand in
-# advance
-define XLIB_LIBX11_DISABLE_MAKEKEYS_BUILD
-	echo '' > $(@D)/src/util/Makefile.am
+# doesn't have X11_CFLAGS_FOR_BUILD so this doesn't work.  For buildroot,
+# we now the X11 includes are in $(HOST_DIR)/usr/include with are already
+# in the CFLAGS_FOR_BUILD, so we can just remove the X11_CFLAGS
+define XLIB_LIBX11_DISABLE_MAKEKEYS_X11_CFLAGS
+	$(SED) '/X11_CFLAGS/d' $(@D)/src/util/Makefile*
 endef
 
-XLIB_LIBX11_POST_EXTRACT_HOOKS += XLIB_LIBX11_DISABLE_MAKEKEYS_BUILD
-
-define XLIB_LIBX11_BUILD_MAKEKEYS_FOR_HOST
-	cd $(@D)/src/util && $(HOSTCC) $(HOST_CFLAGS) -o makekeys makekeys.c
-endef
-
-XLIB_LIBX11_POST_CONFIGURE_HOOKS += XLIB_LIBX11_BUILD_MAKEKEYS_FOR_HOST
+XLIB_LIBX11_POST_PATCH_HOOKS += XLIB_LIBX11_DISABLE_MAKEKEYS_X11_CFLAGS
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
tg: (9de85f7..) t/xlib_libX11-makekeys (depends on: master)
