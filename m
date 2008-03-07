From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri,  7 Mar 2008 05:31:33 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  sdl_mixer
Message-ID: <20080307133133.01E8F1201F3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-07 05:31:33 -0800 (Fri, 07 Mar 2008)
New Revision: 21271

Log:
buildroot: SDL_mixer package

Based on patch from Hebbar.


Added:
   trunk/buildroot/package/sdl_mixer/
   trunk/buildroot/package/sdl_mixer/Config.in
   trunk/buildroot/package/sdl_mixer/sdl_mixer.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-03-07 13:31:24 UTC (rev 21270)
+++ trunk/buildroot/package/Config.in	2008-03-07 13:31:33 UTC (rev 21271)
@@ -313,6 +313,7 @@
 source "package/libpng/Config.in"
 source "package/libungif/Config.in"
 source "package/sdl/Config.in"
+source "package/sdl_mixer/Config.in"
 source "package/sdl_ttf/Config.in"
 source "package/tiff/Config.in"
 

Added: trunk/buildroot/package/sdl_mixer/Config.in
===================================================================
--- trunk/buildroot/package/sdl_mixer/Config.in	                        (rev 0)
+++ trunk/buildroot/package/sdl_mixer/Config.in	2008-03-07 13:31:33 UTC (rev 21271)
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_SDL_MIXER
+	bool "SDL_mixer"
+	default n
+	help
+
+	  SDL_mixer is a sample multi-channel audio mixer library.
+	  It supports any number of simultaneously playing channels of
+	  16 bit stereo audio, plus a single channel of music, mixed
+	  by the popular MikMod MOD, Timidity MIDI, Ogg Vorbis, and
+	  SMPEG MP3 libraries.
+
+	  http://www.libsdl.org/projects/SDL_mixer/

Added: trunk/buildroot/package/sdl_mixer/sdl_mixer.mk
===================================================================
--- trunk/buildroot/package/sdl_mixer/sdl_mixer.mk	                        (rev 0)
+++ trunk/buildroot/package/sdl_mixer/sdl_mixer.mk	2008-03-07 13:31:33 UTC (rev 21271)
@@ -0,0 +1,68 @@
+#############################################################
+#
+# SDL_mixer
+#
+#############################################################
+SDL_MIXER_VERSION:=1.2.8
+SDL_MIXER_SOURCE:=SDL_mixer-$(SDL_MIXER_VERSION).tar.gz
+SDL_MIXER_SITE:=http://www.libsdl.org/projects/SDL_mixer/release/
+SDL_MIXER_CAT:=$(ZCAT)
+SDL_MIXER_DIR:=$(BUILD_DIR)/SDL_mixer-$(SDL_MIXER_VERSION)
+
+$(DL_DIR)/$(SDL_MIXER_SOURCE):
+	$(WGET) -P $(DL_DIR) $(SDL_MIXER_SITE)/$(SDL_MIXER_SOURCE)
+
+sdl_mixer-source: $(DL_DIR)/$(SDL_MIXER_SOURCE)
+
+$(SDL_MIXER_DIR)/.unpacked: $(DL_DIR)/$(SDL_MIXER_SOURCE)
+	$(SDL_MIXER_CAT) $(DL_DIR)/$(SDL_MIXER_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(CONFIG_UPDATE) $(SDL_MIXER_DIR)
+	touch $@
+
+$(SDL_MIXER_DIR)/.configured: $(SDL_MIXER_DIR)/.unpacked $(STAGING_DIR)/usr/lib/libSDL.so
+	(cd $(SDL_MIXER_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--sysconfdir=/etc \
+		--localstatedir=/var \
+		--without-x \
+		--with-freetype-prefix=$(STAGING_DIR)/usr \
+		--with-sdl-prefix=$(STAGING_DIR)/usr \
+		)
+	touch $@
+
+$(SDL_MIXER_DIR)/.compiled: $(SDL_MIXER_DIR)/.configured
+	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(SDL_MIXER_DIR)
+	touch $@
+
+$(STAGING_DIR)/usr/lib/libSDL_mixer.so: $(SDL_MIXER_DIR)/.compiled
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(SDL_MIXER_DIR) install
+	touch -c $@
+
+$(TARGET_DIR)/usr/lib/libSDL_mixer.so: $(STAGING_DIR)/usr/lib/libSDL_mixer.so
+	cp -dpf $(STAGING_DIR)/usr/lib/libSDL_mixer*.so* $(TARGET_DIR)/usr/lib/
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libSDL_mixer*.so*
+
+sdl_mixer: uclibc $(TARGET_DIR)/usr/lib/libSDL_mixer.so
+
+sdl_mixer-clean:
+	rm -f $(TARGET_DIR)/usr/lib/libSDL_mixer*.so*
+	-$(MAKE) DESTDIR=$(STAGING_DIR) -C $(SDL_MIXER_DIR) uninstall
+	-$(MAKE) -C $(SDL_MIXER_DIR) clean
+
+sdl_mixer-dirclean:
+	rm -rf $(SDL_MIXER_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_SDL_MIXER)),y)
+TARGETS+=sdl_mixer
+endif
