From: cmchao <cmchao@gmail.com>
Date: Wed, 16 Jun 2010 19:47:16 +0800
Subject: [Buildroot] [PATCH 14/19] sdl_ttf : convert to autotools
	infrastructure
In-Reply-To: <1276688841-5252-1-git-send-email-cmchao@gmail.com>
References: <1276688841-5252-1-git-send-email-cmchao@gmail.com>
Message-ID: <1276688841-5252-15-git-send-email-cmchao@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: cmchao <cmchao@gmail.com>
---
 package/sdl_ttf/sdl_ttf.mk |   76 +++++---------------------------------------
 1 files changed, 8 insertions(+), 68 deletions(-)

diff --git a/package/sdl_ttf/sdl_ttf.mk b/package/sdl_ttf/sdl_ttf.mk
index 21bfc5e..fdec497 100644
--- a/package/sdl_ttf/sdl_ttf.mk
+++ b/package/sdl_ttf/sdl_ttf.mk
@@ -6,74 +6,14 @@
 SDL_TTF_VERSION:=2.0.9
 SDL_TTF_SOURCE:=SDL_ttf-$(SDL_TTF_VERSION).tar.gz
 SDL_TTF_SITE:=http://www.libsdl.org/projects/SDL_ttf/release/
-SDL_TTF_CAT:=$(ZCAT)
-SDL_TTF_DIR:=$(BUILD_DIR)/SDL_ttf-$(SDL_TTF_VERSION)
 
-$(DL_DIR)/$(SDL_TTF_SOURCE):
-	$(call DOWNLOAD,$(SDL_TTF_SITE),$(SDL_TTF_SOURCE))
-
-sdl_ttf-source: $(DL_DIR)/$(SDL_TTF_SOURCE)
-
-$(SDL_TTF_DIR)/.unpacked: $(DL_DIR)/$(SDL_TTF_SOURCE)
-	$(SDL_TTF_CAT) $(DL_DIR)/$(SDL_TTF_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(SDL_TTF_DIR)
-	touch $@
-
-$(SDL_TTF_DIR)/.configured: $(SDL_TTF_DIR)/.unpacked
-	(cd $(SDL_TTF_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/bin \
-		--sbindir=/sbin \
-		--libdir=/lib \
-		--libexecdir=/lib \
-		--sysconfdir=/etc \
-		--datadir=/share \
-		--localstatedir=/var \
-		--includedir=/include \
-		--mandir=/man \
-		--infodir=/info \
-		--without-x \
+SDL_TTF_LIBTOOL_PATCH = NO
+SDL_TTF_INSTALL_STAGING = YES
+SDL_TTF_INSTALL_TARGET = YES
+SDL_TTF_DEPENDENCIES = sdl freetype
+SDL_TTF_CONF_OPT = --without-x \
 		--with-freetype-prefix=$(STAGING_DIR)/usr \
-		--with-sdl-prefix=$(STAGING_DIR)/usr \
-		)
-	touch $@
-
-$(SDL_TTF_DIR)/.compiled: $(SDL_TTF_DIR)/.configured
-	$(MAKE1) $(TARGET_CONFIGURE_OPTS) \
-		INCLUDES="-I$(STAGING_DIR)/usr/include/SDL -I$(STAGING_DIR)/usr/include/freetype2" \
-		LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
-		DESTDIR=$(STAGING_DIR)/usr -C $(SDL_TTF_DIR)
-	touch $@
-
-$(STAGING_DIR)/usr/lib/libSDL_ttf.so: $(SDL_TTF_DIR)/.compiled
-	$(MAKE) DESTDIR=$(STAGING_DIR)/usr -C $(SDL_TTF_DIR) install
-	touch -c $@
-
-$(TARGET_DIR)/usr/lib/libSDL_ttf.so: $(STAGING_DIR)/usr/lib/libSDL_ttf.so
-	cp -dpf $(STAGING_DIR)/usr/lib/libSDL_ttf*.so* $(TARGET_DIR)/usr/lib/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libSDL_ttf.so
-
-sdl_ttf: sdl freetype $(TARGET_DIR)/usr/lib/libSDL_ttf.so
+		--with-sdl-prefix=$(STAGING_DIR)/usr
 
-sdl_ttf-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(SDL_TTF_DIR) uninstall
-	-$(MAKE) -C $(SDL_TTF_DIR) clean
-
-sdl_ttf-dirclean:
-	rm -rf $(SDL_TTF_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_SDL_TTF),y)
-TARGETS+=sdl_ttf
-endif
+SDL_TTF_MAKE_OPT = INCLUDES="-I$(STAGING_DIR)/usr/include/SDL"  LDFLAGS="-L$(STAGING_DIR)/usr/lib"
+$(eval $(call AUTOTARGETS,package,sdl_ttf))
-- 
1.7.0.4
