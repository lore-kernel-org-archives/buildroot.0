From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Wed, 24 Sep 2008 06:03:22 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/games:  prboom
Message-ID: <20080924130322.DDC39F8008@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-09-24 06:03:22 -0700 (Wed, 24 Sep 2008)
New Revision: 23465

Log:
prboom: add new games package PrBoom

This patch adds a new package PrBoom. PrBoom is a Doom and Doom ][ client which
uses the SDL library for graphics, sound and network. It also supports OpenGL,
but this has not been enabled in this package since few embedded platforms
support OpenGL.

PrBoom allows you to play the good old game on newer hardware. It even supports
higher resolution and better rendring, while still keeping the old style alive.

http://prboom.sourceforge.net/

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Added:
   trunk/buildroot/package/games/prboom/
   trunk/buildroot/package/games/prboom/Config.in
   trunk/buildroot/package/games/prboom/prboom.mk

Modified:
   trunk/buildroot/package/games/Config.in


Changeset:
Modified: trunk/buildroot/package/games/Config.in
===================================================================
--- trunk/buildroot/package/games/Config.in	2008-09-24 12:53:45 UTC (rev 23464)
+++ trunk/buildroot/package/games/Config.in	2008-09-24 13:03:22 UTC (rev 23465)
@@ -10,6 +10,7 @@
 source "package/games/gnuchess/Config.in"
 source "package/games/lxdoom/Config.in"
 source "package/games/magiccube4d/Config.in"
+source "package/games/prboom/Config.in"
 source "package/games/rubix/Config.in"
 source "package/games/vice/Config.in"
 source "package/games/xboard/Config.in"

Added: trunk/buildroot/package/games/prboom/Config.in
===================================================================
--- trunk/buildroot/package/games/prboom/Config.in	                        (rev 0)
+++ trunk/buildroot/package/games/prboom/Config.in	2008-09-24 13:03:22 UTC (rev 23465)
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PRBOOM
+	bool "PrBoom"
+	select BR2_PACKAGE_SDL
+	select BR2_PACKAGE_SDL_MIXER
+	select BR2_PACKAGE_SDL_NET
+	help
+	  PrBoom is a Doom client which allows you to play the good old game on
+	  newer hardware. It even supports higher resolution and better
+	  rendring, while still keeping the old style alive.
+
+	  http://prboom.sourceforge.net/

Added: trunk/buildroot/package/games/prboom/prboom.mk
===================================================================
--- trunk/buildroot/package/games/prboom/prboom.mk	                        (rev 0)
+++ trunk/buildroot/package/games/prboom/prboom.mk	2008-09-24 13:03:22 UTC (rev 23465)
@@ -0,0 +1,50 @@
+#############################################################
+#
+# PrBoom
+#
+#############################################################
+PRBOOM_VERSION:=2.4.7
+
+PRBOOM_DEPENDENCIES = sdl SDL_net sdl_mixer
+
+$(eval $(call AUTOTARGETS,package/games,prboom))
+
+$(PRBOOM_TARGET_EXTRACT):
+	$(ZCAT) $(DL_DIR)/$(PRBOOM_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(CONFIG_UPDATE) $(PRBOOM_DIR)/autotools
+	touch $@
+
+$(PRBOOM_TARGET_CONFIGURE):
+	(cd $(PRBOOM_DIR); \
+		$(TARGET_CONFIGURE_ARGS) \
+		$(TARGET_CONFIGURE_OPTS) \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--oldincludedir=$(STAGING_DIR)/usr/include \
+		--with-sdl-prefix=$(STAGING_DIR)/usr \
+		--with-sdl-exec-prefix=$(STAGING_DIR)/usr \
+		--disable-cpu-opt \
+		--disable-sdltest \
+		--disable-gl \
+		--without-x \
+	)
+ifeq ($(BR2_ENDIAN),"BIG")
+	$(SED) 's,.*#undef WORDS_BIGENDIAN.*,#define WORDS_BIGENDIAN 1,g' $(PRBOOM_DIR)/config.h
+endif
+	touch $@
+
+$(PRBOOM_TARGET_INSTALL_TARGET):
+	$(INSTALL) -D $(PRBOOM_DIR)/src/prboom $(TARGET_DIR)/usr/games/prboom
+	$(INSTALL) -D $(PRBOOM_DIR)/src/prboom-game-server $(TARGET_DIR)/usr/games/prboom-game-server
+	$(INSTALL) -D $(PRBOOM_DIR)/data/prboom.wad $(TARGET_DIR)/usr/share/games/doom/prboom.wad
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/games/prboom
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/games/prboom-game-server
+
+$(PRBOOM_TARGET_CLEAN):
+	rm -rf $(TARGET_DIR)/usr/share/games/doom/prboom.wad
+	rm -rf $(TARGET_DIR)/usr/games/prboom-game-server
+	rm -rf $(TARGET_DIR)/usr/games/prboom
+	-$(MAKE) -C $(PRBOOM_DIR) clean
