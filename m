From: cmchao <cmchao@gmail.com>
Date: Wed, 16 Jun 2010 19:47:17 +0800
Subject: [Buildroot] [PATCH 15/19] sdl : convert to autotools infrastructure
	& bump to 1.2.14
In-Reply-To: <1276688841-5252-1-git-send-email-cmchao@gmail.com>
References: <1276688841-5252-1-git-send-email-cmchao@gmail.com>
Message-ID: <1276688841-5252-16-git-send-email-cmchao@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: cmchao <cmchao@gmail.com>
---
 package/sdl/sdl.mk |  105 +++++++++++-----------------------------------------
 1 files changed, 22 insertions(+), 83 deletions(-)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 959be7e..facff42 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -3,122 +3,61 @@
 # SDL
 #
 #############################################################
-SDL_VERSION:=1.2.13
+SDL_VERSION:=1.2.14
 SDL_SOURCE:=SDL-$(SDL_VERSION).tar.gz
 SDL_SITE:=http://www.libsdl.org/release
-SDL_CAT:=$(ZCAT)
-SDL_DIR:=$(BUILD_DIR)/SDL-$(SDL_VERSION)
 
+
+SDL_LIBTOOL_PATCH = NO
+SDL_INSTALL_STAGING = YES
+SDL_INSTALL_TARGET = YES
 SDL_EXTRA_CFLAGS = -I./include -D_GNU_SOURCE=1 -fvisibility=hidden -D_REENTRANT -D_REENTRANT -DHAVE_LINUX_VERSION_H
 
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
+SDL_CONF_ENV+= $(SDL_DIRECTFB_INCLUDES)
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
+		--disable-nasm
 
-ifeq ($(BR2_PACKAGE_SDL_DIRECTFB),y)
-$(SDL_DIRECTFB_TARGET):
-	mkdir -p $(STAGING_DIR)/include
-	ln -s -f ../usr/include/directfb $(SDL_DIRECTFB_TARGET)
-endif
-
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
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libSDL.so
+endef
 
-SDL sdl: $(SDL_DEPENDENCIES) $(TARGET_DIR)/usr/lib/libSDL.so
-
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
1.7.0.4
