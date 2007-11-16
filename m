From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Fri, 16 Nov 2007 04:37:25 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sdl
Message-ID: <20071116123725.A043A30040@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-11-16 04:37:23 -0800 (Fri, 16 Nov 2007)
New Revision: 20434

Log:
update SDL to 1.2.12, allow video driver selection

Modified:
   trunk/buildroot/package/sdl/Config.in
   trunk/buildroot/package/sdl/sdl.mk


Changeset:
Modified: trunk/buildroot/package/sdl/Config.in
===================================================================
--- trunk/buildroot/package/sdl/Config.in	2007-11-16 12:20:30 UTC (rev 20433)
+++ trunk/buildroot/package/sdl/Config.in	2007-11-16 12:37:23 UTC (rev 20434)
@@ -1,7 +1,27 @@
 config BR2_PACKAGE_SDL
 	bool "SDL"
 	default n
-	select BR2_PACKAGE_DIRECTFB
 	help
 
 	  http://www.libsdl.org/
+
+menu "SDL options selection"
+	depends BR2_PACKAGE_SDL
+
+config BR2_PACKAGE_SDL_FBCON
+	bool "SDL framebuffer console video driver"
+	default y
+
+config BR2_PACKAGE_SDL_DIRECTFB
+	bool "SDL DirectFB video driver"
+	default n
+
+config BR2_PACKAGE_SDL_QTOPIA
+	bool "SDL Qtopia video driver"
+	default n
+
+config BR2_PACKAGE_SDL_X11
+	bool "SDL X11 video driver"
+	default n
+
+endmenu

Modified: trunk/buildroot/package/sdl/sdl.mk
===================================================================
--- trunk/buildroot/package/sdl/sdl.mk	2007-11-16 12:20:30 UTC (rev 20433)
+++ trunk/buildroot/package/sdl/sdl.mk	2007-11-16 12:37:23 UTC (rev 20434)
@@ -3,7 +3,7 @@
 # SDL
 #
 #############################################################
-SDL_VERSION:=1.2.11
+SDL_VERSION:=1.2.12
 # 1.2.12 is available, but depends on Pulse Audio 0.9
 # which is not available in buildroot (yet)
 SDL_SOURCE:=SDL-$(SDL_VERSION).tar.gz
@@ -11,6 +11,32 @@
 SDL_CAT:=$(ZCAT)
 SDL_DIR:=$(BUILD_DIR)/SDL-$(SDL_VERSION)
 
+ifeq ($(BR2_PACKAGE_SDL_FBCON),y)
+SDL_FBCON=--enable-video-fbcon=yes
+else
+SDL_FBCON=--enable-video-fbcon=no
+endif
+
+ifeq ($(BR2_PACKAGE_SDL_DIRECTFB),y)
+SDL_DIRECTFB=--enable-video-directfb=yes
+SDL_DIRECTFB_TARGET:=$(STAGING_DIR)/include/directfb
+SDL_DIRECTFB_INCLUDES:=-I$(STAGING_DIR)/usr/include/directfb
+else
+SDL_DIRECTFB=--enable-video-directfb=no
+endif
+
+ifeq ($(BR2_PACKAGE_SDL_QTOPIA),y)
+SDL_QTOPIA=--enable-video-qtopia=yes
+else
+SDL_QTOPIA=--enable-video-qtopia=no
+endif
+
+ifeq ($(BR2_PACKAGE_SDL_X11),y)
+SDL_X11=--enable-video-x11=yes
+else
+SDL_X11=--enable-video-x11=no
+endif
+
 $(DL_DIR)/$(SDL_SOURCE):
 	$(WGET) -P $(DL_DIR) $(SDL_SITE)/$(SDL_SOURCE)
 
@@ -43,18 +69,25 @@
 		--includedir=/include \
 		--mandir=/man \
 		--infodir=/info \
+		--enable-pulseaudio=no \
 		--disable-arts \
 		--disable-esd \
 		--disable-nasm \
-		--disable-video-x11 )
+		$(SDL_FBCON) \
+		$(SDL_DIRECTFB) \
+		$(SDL_QTOPIA) \
+		$(SDL_X11) \
+		)
 	touch $@
 
-$(STAGING_DIR)/include/directfb:
+ifeq ($(BR2_PACKAGE_SDL_DIRECTFB),y)
+$(SDL_DIRECTFB_TARGET):
 	ln -s ../usr/include/directfb $(STAGING_DIR)/include/directfb
+endif
 
-$(SDL_DIR)/.compiled: $(SDL_DIR)/.configured $(STAGING_DIR)/include/directfb
+$(SDL_DIR)/.compiled: $(SDL_DIR)/.configured $(SDL_DIRECTFB_TARGET)
 	$(MAKE1) $(TARGET_CONFIGURE_OPTS) \
-		INCLUDE="-I./include -I$(STAGING_DIR)/usr/include/directfb" \
+		INCLUDE="-I./include $(SDL_DIRECTFB_INCLUDES)" \
 		LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
 		DESTDIR=$(STAGING_DIR)/usr -C $(SDL_DIR)
 	touch $@
