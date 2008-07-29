From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Tue, 29 Jul 2008 08:46:46 +0200
Subject: [Buildroot] [PATCH v2 3/5] PrBoom: add new package PrBoom
In-Reply-To: <1217314008-22850-2-git-send-email-hans-christian.egtvedt@atmel.com>
References: <1217314008-22850-1-git-send-email-hans-christian.egtvedt@atmel.com>
	<1217314008-22850-2-git-send-email-hans-christian.egtvedt@atmel.com>
Message-ID: <1217314008-22850-3-git-send-email-hans-christian.egtvedt@atmel.com>
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
 package/prboom/Config.in |   11 ++++++++++
 package/prboom/prboom.mk |   50 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+), 0 deletions(-)
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
index 0000000..1a5354a
--- /dev/null
+++ b/package/prboom/prboom.mk
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
+$(eval $(call AUTOTARGETS,package,prboom))
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
-- 
1.5.4.3
