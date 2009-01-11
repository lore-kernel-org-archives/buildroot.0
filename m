From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 11 Jan 2009 20:24:26 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sdl
Message-ID: <20090111202426.20C6576736@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-11 20:24:24 +0000 (Sun, 11 Jan 2009)
New Revision: 24761

Log:
Make sure SDL finds DirectFB headers ,if used

Modified:
   trunk/buildroot/package/sdl/sdl.mk


Changeset:
Modified: trunk/buildroot/package/sdl/sdl.mk
===================================================================
--- trunk/buildroot/package/sdl/sdl.mk	2009-01-11 20:21:04 UTC (rev 24760)
+++ trunk/buildroot/package/sdl/sdl.mk	2009-01-11 20:24:24 UTC (rev 24761)
@@ -9,6 +9,8 @@
 SDL_CAT:=$(ZCAT)
 SDL_DIR:=$(BUILD_DIR)/SDL-$(SDL_VERSION)
 
+SDL_EXTRA_CFLAGS = -I./include -D_GNU_SOURCE=1 -fvisibility=hidden -D_REENTRANT -D_REENTRANT -DHAVE_LINUX_VERSION_H
+
 ifeq ($(BR2_PACKAGE_SDL_FBCON),y)
 SDL_FBCON=--enable-video-fbcon=yes
 else
@@ -19,6 +21,7 @@
 SDL_DIRECTFB=--enable-video-directfb=yes
 SDL_DIRECTFB_TARGET:=$(STAGING_DIR)/include/directfb
 SDL_DIRECTFB_INCLUDES:=-I$(STAGING_DIR)/usr/include/directfb
+SDL_EXTRA_CFLAGS += $(SDL_DIRECTFB_INCLUDES)
 else
 SDL_DIRECTFB=--enable-video-directfb=no
 endif
@@ -71,12 +74,13 @@
 
 ifeq ($(BR2_PACKAGE_SDL_DIRECTFB),y)
 $(SDL_DIRECTFB_TARGET):
-	ln -s ../usr/include/directfb $(STAGING_DIR)/include/directfb
+	mkdir -p $(STAGING_DIR)/include
+	ln -s ../usr/include/directfb $(SDL_DIRECTFB_TARGET)
 endif
 
 $(SDL_DIR)/.compiled: $(SDL_DIR)/.configured $(SDL_DIRECTFB_TARGET)
 	$(MAKE1) $(TARGET_CONFIGURE_OPTS) \
-		INCLUDE="-I./include $(SDL_DIRECTFB_INCLUDES)" \
+		EXTRA_CFLAGS="$(SDL_EXTRA_CFLAGS)" \
 		LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
 		DESTDIR=$(STAGING_DIR)/usr -C $(SDL_DIR)
 	touch $@
@@ -94,6 +98,8 @@
 
 SDL sdl: uclibc $(TARGET_DIR)/usr/lib/libSDL.so
 
+sdl-unpacked: $(SDL_DIR)/.unpacked
+
 sdl-clean:
 	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(SDL_DIR) uninstall
 	-$(MAKE) -C $(SDL_DIR) clean
