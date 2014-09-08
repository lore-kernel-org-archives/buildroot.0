From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Mon, 8 Sep 2014 21:43:45 +0000
Subject: [Buildroot] [PATCH] portmap: fix static linking
Message-ID: <F9C551623D2CBB4C9488801D14F864C68C8AD946@ex-mb3.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Portmap builds and links, however, does not get built correctly when
BR2_PREFER_STATIC_LIB is selected.  There are no dynamic libraries in
rootfs.tar, however, portmap gets linked dynamically without regards to
the PREFER_STATIC_LIB tags.  LDFLAGS was not being passed into the build of
portmap.

Signed-off-by:  Andy Kennedy <andy.kennedy@adtran.com>
---
diff -Naur a/package/portmap/portmap.mk b/package/portmap/portmap.mk
--- a/package/portmap/portmap.mk	2014-02-27 14:51:23.000000000 -0600
+++ b/package/portmap/portmap.mk	2014-09-08 16:39:13.715370478 -0500
@@ -15,8 +15,7 @@
 endif
 
 define PORTMAP_BUILD_CMDS
-	CFLAGS="$(TARGET_CFLAGS)" \
-	$(MAKE) CC="$(TARGET_CC)" -C $(@D) $(PORTMAP_FLAGS)
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(PORTMAP_FLAGS)
 endef
 
