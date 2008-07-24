From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Thu, 24 Jul 2008 15:21:55 +0200
Subject: [Buildroot] [PATCH 3/5] PrBoom: add new package PrBoom
In-Reply-To: <1216905717-9197-2-git-send-email-hans-christian.egtvedt@atmel.com>
References: <1216905717-9197-1-git-send-email-hans-christian.egtvedt@atmel.com>
	<1216905717-9197-2-git-send-email-hans-christian.egtvedt@atmel.com>
Message-ID: <1216905717-9197-3-git-send-email-hans-christian.egtvedt@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a new package PrBoom. PrBoom is a Doom and Doom ][ client which
uses the SDL library for graphics, sound and network. It also supports OpenGL,
but this has not been enabled in this package since few embedded platforms
support OpenGL.

PrBoom allows you to play the good old game on newer hardware. It even supports
higher resolution and better rendring, while still keeping the old style alive.

http://prboom.sourceforge.net/

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
---
 package/Config.in        |    1 +
 package/prboom/Config.in |   11 +++++++
 package/prboom/prboom.mk |   76 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 88 insertions(+), 0 deletions(-)
 create mode 100644 package/prboom/Config.in
 create mode 100644 package/prboom/prboom.mk

diff --git a/package/Config.in b/package/Config.in
index e07d9e3..51e4eda 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -491,6 +491,7 @@ menuconfig BR2_GAMES
 
 if BR2_GAMES
 source "package/lxdoom/Config.in"
+source "package/prboom/Config.in"
 source "package/ace_of_penguins/Config.in"
 source "package/gnuchess/Config.in"
 source "package/xboard/Config.in"
diff --git a/package/prboom/Config.in b/package/prboom/Config.in
new file mode 100644
index 0000000..2835929
--- /dev/null
+++ b/package/prboom/Config.in
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
diff --git a/package/prboom/prboom.mk b/package/prboom/prboom.mk
new file mode 100644
index 0000000..5fec883
--- /dev/null
+++ b/package/prboom/prboom.mk
@@ -0,0 +1,76 @@
+#############################################################
+#
+# PrBoom
+#
+#############################################################
+PRBOOM_VERSION:=2.4.7
+PRBOOM_SOURCE:=prboom-$(PRBOOM_VERSION).tar.gz
+PRBOOM_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/prboom
+PRBOOM_CAT:=zcat
+PRBOOM_DIR:=$(BUILD_DIR)/prboom-$(PRBOOM_VERSION)
+DOOM_SITE:=ftp://ftp.idsoftware.com/idstuff/doom
+PRBOOM_DATA:=doom-1.8.wad.gz
+
+$(DL_DIR)/$(PRBOOM_SOURCE):
+	$(WGET) -P $(DL_DIR) $(PRBOOM_SITE)/$(PRBOOM_SOURCE)
+
+prboom-source: $(DL_DIR)/$(PRBOOM_SOURCE)
+
+$(PRBOOM_DIR)/.unpacked: $(DL_DIR)/$(PRBOOM_SOURCE)
+	$(PRBOOM_CAT) $(DL_DIR)/$(PRBOOM_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(CONFIG_UPDATE) $(PRBOOM_DIR)/autotools
+	touch $@
+
+$(PRBOOM_DIR)/.configured: $(PRBOOM_DIR)/.unpacked
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
+$(PRBOOM_DIR)/src/prboom: $(PRBOOM_DIR)/.configured
+	$(MAKE) -C $(PRBOOM_DIR)
+
+$(TARGET_DIR)/usr/games/prboom: $(PRBOOM_DIR)/src/prboom
+	mkdir -p $(TARGET_DIR)/usr/games
+	mkdir -p $(TARGET_DIR)/usr/share/games/doom
+	cp -dpf $(PRBOOM_DIR)/src/prboom $@
+	cp -dpf $(PRBOOM_DIR)/src/prboom-game-server $(TARGET_DIR)/usr/games/
+	cp -dpf $(PRBOOM_DIR)/data/prboom.wad $(TARGET_DIR)/usr/share/games/doom/
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/games/prboom-game-server
+
+prboom: sdl sdl_net sdl_mixer $(TARGET_DIR)/usr/games/prboom
+
+prboom-clean:
+	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(PRBOOM_DIR) uninstall
+	rm -rf $(TARGET_DIR)/usr/share/games/doom/
+	rm -rf $(TARGET_DIR)/usr/games/
+	-$(MAKE) -C $(PRBOOM_DIR) clean
+
+prboom-dirclean:
+	rm -rf $(PRBOOM_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_PRBOOM)),y)
+TARGETS+=prboom
+endif
-- 
1.5.4.3
