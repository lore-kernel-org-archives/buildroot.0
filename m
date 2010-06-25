From: cmchao <cmchao@gmail.com>
Date: Fri, 25 Jun 2010 12:31:51 +0200
Subject: [Buildroot] [git commit master 1/1] sdl_mixer : convert to
	autotools infrastructure & bump to 1.2.11
Message-ID: <20100625103242.51EFD81DB8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9b3219fd493a7b834c4f928242df5166e121c18f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes by Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 * Installation to target is the default
 * No need to strip, done globally

Signed-off-by: cmchao <cmchao@gmail.com>
---
 package/sdl_mixer/sdl_mixer.mk |   67 +++++++--------------------------------
 1 files changed, 12 insertions(+), 55 deletions(-)

diff --git a/package/sdl_mixer/sdl_mixer.mk b/package/sdl_mixer/sdl_mixer.mk
index a097734..8033495 100644
--- a/package/sdl_mixer/sdl_mixer.mk
+++ b/package/sdl_mixer/sdl_mixer.mk
@@ -3,66 +3,23 @@
 # SDL_mixer
 #
 #############################################################
-SDL_MIXER_VERSION:=1.2.8
+SDL_MIXER_VERSION:=1.2.11
 SDL_MIXER_SOURCE:=SDL_mixer-$(SDL_MIXER_VERSION).tar.gz
 SDL_MIXER_SITE:=http://www.libsdl.org/projects/SDL_mixer/release/
-SDL_MIXER_CAT:=$(ZCAT)
-SDL_MIXER_DIR:=$(BUILD_DIR)/SDL_mixer-$(SDL_MIXER_VERSION)
 
-$(DL_DIR)/$(SDL_MIXER_SOURCE):
-	$(call DOWNLOAD,$(SDL_MIXER_SITE),$(SDL_MIXER_SOURCE))
+SDL_MIXER_LIBTOOL_PATCH = NO
+SDL_MIXER_INSTALL_STAGING = YES
+SDL_MIXER_DEPENDENCIES = sdl
+SDL_MIXER_CONF_OPT = --without-x --with-sdl-prefix=$(STAGING_DIR)/usr
 
-sdl_mixer-source: $(DL_DIR)/$(SDL_MIXER_SOURCE)
-
-$(SDL_MIXER_DIR)/.unpacked: $(DL_DIR)/$(SDL_MIXER_SOURCE)
-	$(SDL_MIXER_CAT) $(DL_DIR)/$(SDL_MIXER_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(SDL_MIXER_DIR)/build-scripts
-	touch $@
-
-$(SDL_MIXER_DIR)/.configured: $(SDL_MIXER_DIR)/.unpacked $(STAGING_DIR)/usr/lib/libSDL.so
-	(cd $(SDL_MIXER_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--sysconfdir=/etc \
-		--localstatedir=/var \
-		--without-x \
-		--with-freetype-prefix=$(STAGING_DIR)/usr \
-		--with-sdl-prefix=$(STAGING_DIR)/usr \
-		)
-	touch $@
-
-$(SDL_MIXER_DIR)/.compiled: $(SDL_MIXER_DIR)/.configured
-	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(SDL_MIXER_DIR)
-	touch $@
-
-$(STAGING_DIR)/usr/lib/libSDL_mixer.so: $(SDL_MIXER_DIR)/.compiled
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(SDL_MIXER_DIR) install
-	touch -c $@
-
-$(TARGET_DIR)/usr/lib/libSDL_mixer.so: $(STAGING_DIR)/usr/lib/libSDL_mixer.so
+define SDL_MIXER_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/lib/libSDL_mixer*.so* $(TARGET_DIR)/usr/lib/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libSDL_mixer*.so*
-
-sdl_mixer: sdl $(TARGET_DIR)/usr/lib/libSDL_mixer.so
+endef
 
-sdl_mixer-clean:
+define SDL_MIXER_CLEAN_CMDS
 	rm -f $(TARGET_DIR)/usr/lib/libSDL_mixer*.so*
-	-$(MAKE) DESTDIR=$(STAGING_DIR) -C $(SDL_MIXER_DIR) uninstall
-	-$(MAKE) -C $(SDL_MIXER_DIR) clean
+	-$(MAKE) DESTDIR=$(STAGING_DIR) -C $(@D) uninstall
+	-$(MAKE) -C $(@D) clean
+endef
 
-sdl_mixer-dirclean:
-	rm -rf $(SDL_MIXER_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_SDL_MIXER),y)
-TARGETS+=sdl_mixer
-endif
+$(eval $(call AUTOTARGETS,package,sdl_mixer))
-- 
1.7.1
