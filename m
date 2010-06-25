From: cmchao <cmchao@gmail.com>
Date: Fri, 25 Jun 2010 12:31:51 +0200
Subject: [Buildroot] [git commit master 1/1] sdl : convert to autotools
	infrastructure & bump to 1.2.14
Message-ID: <20100625103242.9521281DB8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cce342461a513bcc47635a87da2811f65e9b8b3b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes by Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 * Installation to target is the default
 * Remove SDL_EXTRA_CFLAGS, unused
 * Remove reference to SDL_DIRECTFB_INCLUDES, unused
 * Remove strip, done globally

Signed-off-by: cmchao <cmchao@gmail.com>
---
 package/sdl/sdl.mk |  104 +++++++++------------------------------------------
 1 files changed, 19 insertions(+), 85 deletions(-)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 959be7e..44981ea 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -3,122 +3,56 @@
 # SDL
 #
 #############################################################
-SDL_VERSION:=1.2.13
+SDL_VERSION:=1.2.14
 SDL_SOURCE:=SDL-$(SDL_VERSION).tar.gz
 SDL_SITE:=http://www.libsdl.org/release
-SDL_CAT:=$(ZCAT)
-SDL_DIR:=$(BUILD_DIR)/SDL-$(SDL_VERSION)
 
-SDL_EXTRA_CFLAGS = -I./include -D_GNU_SOURCE=1 -fvisibility=hidden -D_REENTRANT -D_REENTRANT -DHAVE_LINUX_VERSION_H
+SDL_LIBTOOL_PATCH = NO
+SDL_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_SDL_FBCON),y)
-SDL_FBCON=--enable-video-fbcon=yes
+SDL_CONF_OPT+=--enable-video-fbcon=yes
 else
-SDL_FBCON=--enable-video-fbcon=no
+SDL_CONF_OPT+=--enable-video-fbcon=no
 endif
 
 ifeq ($(BR2_PACKAGE_SDL_DIRECTFB),y)
 SDL_DEPENDENCIES += directfb
-SDL_DIRECTFB=--enable-video-directfb=yes
-SDL_DIRECTFB_TARGET:=$(STAGING_DIR)/include/directfb
-SDL_DIRECTFB_INCLUDES:=-I$(STAGING_DIR)/usr/include/directfb
-SDL_EXTRA_CFLAGS += $(SDL_DIRECTFB_INCLUDES)
+SDL_CONF_OPT+=--enable-video-directfb=yes
 else
 SDL_DIRECTFB=--enable-video-directfb=no
 endif
 
 ifeq ($(BR2_PACKAGE_SDL_QTOPIA),y)
-SDL_QTOPIA=--enable-video-qtopia=yes
+SDL_CONF_OPT+=--enable-video-qtopia=yes
 SDL_DEPENDENCIES += qt
 else
-SDL_QTOPIA=--enable-video-qtopia=no
+SDL_CONF_OPT+=--enable-video-qtopia=no
 endif
 
 ifeq ($(BR2_PACKAGE_SDL_X11),y)
-SDL_X11=--enable-video-x11=yes
+SDL_CONF_OPT+=--enable-video-x11=yes
 SDL_DEPENDENCIES += xserver_xorg-server
 else
-SDL_X11=--enable-video-x11=no
+SDL_CONF_OPT+=--enable-video-x11=no
 endif
 
 ifeq ($(BR2_PACKAGE_TSLIB),y)
 SDL_DEPENDENCIES += tslib
 endif
 
-$(DL_DIR)/$(SDL_SOURCE):
-	$(call DOWNLOAD,$(SDL_SITE),$(SDL_SOURCE))
-
-sdl-source: $(DL_DIR)/$(SDL_SOURCE)
-
-$(SDL_DIR)/.unpacked: $(DL_DIR)/$(SDL_SOURCE)
-	$(SDL_CAT) $(DL_DIR)/$(SDL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(SDL_DIR) package/sdl sdl-$(SDL_VERSION)\*.patch
-	$(CONFIG_UPDATE) $(SDL_DIR)
-	$(CONFIG_UPDATE) $(SDL_DIR)/build-scripts
-	touch $@
-
-$(SDL_DIR)/.configured: $(SDL_DIR)/.unpacked
-	(cd $(SDL_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=$(STAGING_DIR)/usr \
-		--sysconfdir=/etc \
-		--localstatedir=/var \
-		--enable-pulseaudio=no \
+SDL_CONF_OPT += --enable-pulseaudio=no \
 		--disable-arts \
 		--disable-esd \
-		--disable-nasm \
-		$(SDL_FBCON) \
-		$(SDL_DIRECTFB) \
-		$(SDL_QTOPIA) \
-		$(SDL_X11) \
-		)
-	touch $@
-
-ifeq ($(BR2_PACKAGE_SDL_DIRECTFB),y)
-$(SDL_DIRECTFB_TARGET):
-	mkdir -p $(STAGING_DIR)/include
-	ln -s -f ../usr/include/directfb $(SDL_DIRECTFB_TARGET)
-endif
+		--disable-nasm
 
-$(SDL_DIR)/.compiled: $(SDL_DIR)/.configured $(SDL_DIRECTFB_TARGET)
-	$(MAKE1) $(TARGET_CONFIGURE_OPTS) \
-		EXTRA_CFLAGS="$(SDL_EXTRA_CFLAGS)" \
-		LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
-		DESTDIR=$(STAGING_DIR)/usr -C $(SDL_DIR)
-	touch $@
+define SDL_POST_INSTALL_STAGING_HOOKS
+       $(SED) 's^libdir=\$${exec_prefix}^libdir=/usr^' \
+               $(STAGING_DIR)/usr/bin/sdl-config
+endef
 
-$(STAGING_DIR)/usr/lib/libSDL.so: $(SDL_DIR)/.compiled
-	$(MAKE) -C $(SDL_DIR) install
-# use correct rpath for linking
-	$(SED) 's^libdir=\$${exec_prefix}^libdir=/usr^' \
-		$(STAGING_DIR)/usr/bin/sdl-config
-	touch -c $@
-
-$(TARGET_DIR)/usr/lib/libSDL.so: $(STAGING_DIR)/usr/lib/libSDL.so
+define SDL_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/lib/libSDL*.so* $(TARGET_DIR)/usr/lib/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libSDL.so
-
-SDL sdl: $(SDL_DEPENDENCIES) $(TARGET_DIR)/usr/lib/libSDL.so
+endef
 
-sdl-unpacked: $(SDL_DIR)/.unpacked
-
-sdl-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(SDL_DIR) uninstall
-	-$(MAKE) -C $(SDL_DIR) clean
-
-sdl-dirclean:
-	rm -rf $(SDL_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_SDL),y)
-TARGETS+=sdl
-endif
+$(eval $(call AUTOTARGETS,package,sdl))
-- 
1.7.1
