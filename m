From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 22 Jul 2010 13:08:24 +0200
Subject: [Buildroot] [git commit master 1/1] mplayer: add optional
	sdl/freetype support
Message-ID: <20100722110848.0C64182DFD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=87e55feec777b03a258b54da05288daa69260dc8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/mplayer/mplayer.mk |   24 +++++++++++++++++++++++-
 1 files changed, 23 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/mplayer/mplayer.mk b/package/multimedia/mplayer/mplayer.mk
index 206c422..ac3a67e 100644
--- a/package/multimedia/mplayer/mplayer.mk
+++ b/package/multimedia/mplayer/mplayer.mk
@@ -11,6 +11,10 @@ MPLAYER_CAT:=$(BZCAT)
 MPLAYER_BINARY:=mplayer
 MPLAYER_TARGET_BINARY:=usr/bin/$(MPLAYER_BINARY)
 
+MPLAYER_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_LIBMAD),libmad) \
+	$(if $(BR2_PACKAGE_ALSA_LIB),alsa-lib)
+
 ifeq ($(BR2_ENDIAN),"BIG")
 MPLAYER_ENDIAN:=--enable-big-endian
 else
@@ -28,6 +32,22 @@ MPLAYER_LARGEFILE:=--disable-largefiles \
 		   --disable-libdvdcss-internal
 endif
 
+ifeq ($(BR2_PACKAGE_SDL),y)
+MPLAYER_SDL:=--enable-sdl --with-sdl-config=$(STAGING_DIR)/usr/bin/sdl-config
+MPLAYER_DEPENDENCIES += sdl
+else
+MPLAYER_SDL:=--disable-sdl
+endif
+
+ifeq ($(BR2_PACKAGE_FREETYPE),y)
+MPLAYER_FREETYPE:= \
+	--enable-freetype \
+	--with-freetype-config=$(STAGING_DIR)/usr/bin/freetype-config
+MPLAYER_DEPENDENCIES += freetype
+else
+MPLAYER_FREETYPE:=--disable-freetype
+endif
+
 ifeq ($(BR2_i386),y)
 # This seems to be required to compile some of the inline asm
 MPLAYER_CFLAGS:=-fomit-frame-pointer
@@ -62,6 +82,8 @@ $(MPLAYER_DIR)/.configured: $(MPLAYER_DIR)/.unpacked
 		--enable-fbdev \
 		$(MPLAYER_ENDIAN) \
 		$(MPLAYER_LARGEFILE) \
+		$(MPLAYER_SDL) \
+		$(MPLAYER_FREETYPE) \
 		--enable-cross-compile \
 		--disable-ivtv \
 		--disable-tv \
@@ -79,7 +101,7 @@ $(TARGET_DIR)/$(MPLAYER_TARGET_BINARY): $(MPLAYER_DIR)/$(MPLAYER_BINARY)
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/$(MPLAYER_TARGET_BINARY)
 	touch -c $@
 
-mplayer: $(if $(BR2_PACKAGE_LIBMAD),libmad) $(if $(BR2_PACKAGE_ALSA_LIB),alsa-lib) $(TARGET_DIR)/$(MPLAYER_TARGET_BINARY)
+mplayer: $(MPLAYER_DEPENDENCIES) $(TARGET_DIR)/$(MPLAYER_TARGET_BINARY)
 
 mplayer-source: $(DL_DIR)/$(MPLAYER_SOURCE)
 
-- 
1.7.1
