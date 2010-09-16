From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] prboom: use correctly the
	autotargets infrastructrure
Message-ID: <20100916113830.2770D8AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=dfe97a1ed459bc078c5fa8f55ebc0ec541b76eb4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/games/prboom/prboom.mk |   49 ++++++++++++++-------------------------
 1 files changed, 18 insertions(+), 31 deletions(-)

diff --git a/package/games/prboom/prboom.mk b/package/games/prboom/prboom.mk
index 5da82f2..228c788 100644
--- a/package/games/prboom/prboom.mk
+++ b/package/games/prboom/prboom.mk
@@ -3,49 +3,36 @@
 # PrBoom
 #
 #############################################################
-PRBOOM_VERSION:=2.4.7
-
+PRBOOM_VERSION = 2.4.7
 PRBOOM_DEPENDENCIES = sdl SDL_net sdl_mixer
 
-$(eval $(call AUTOTARGETS,package/games,prboom))
-
-$(PRBOOM_TARGET_EXTRACT):
-	$(ZCAT) $(DL_DIR)/$(PRBOOM_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(PRBOOM_DIR)/autotools
-	touch $@
-
-$(PRBOOM_TARGET_CONFIGURE):
-	(cd $(PRBOOM_DIR); \
-		$(TARGET_CONFIGURE_ARGS) \
-		$(TARGET_CONFIGURE_OPTS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
+PRBOOM_CONF_OPT = \
 		--oldincludedir=$(STAGING_DIR)/usr/include \
 		--with-sdl-prefix=$(STAGING_DIR)/usr \
 		--with-sdl-exec-prefix=$(STAGING_DIR)/usr \
 		--disable-cpu-opt \
 		--disable-sdltest \
 		--disable-gl \
-		--without-x \
-	)
-ifeq ($(BR2_ENDIAN),"BIG")
+		--without-x
+
+define PRBOOM_BIG_ENDIAN_FIXUP
 	$(SED) 's,.*#undef WORDS_BIGENDIAN.*,#define WORDS_BIGENDIAN 1,g' $(PRBOOM_DIR)/config.h
+endef
+
+ifeq ($(BR2_ENDIAN),"BIG")
+PRBOOM_POST_CONFIGURE_HOOKS += PRBOOM_BIG_ENDIAN_FIXUP
 endif
-	touch $@
 
-$(PRBOOM_TARGET_INSTALL_TARGET):
-	$(INSTALL) -D $(PRBOOM_DIR)/src/prboom $(TARGET_DIR)/usr/games/prboom
-	$(INSTALL) -D $(PRBOOM_DIR)/src/prboom-game-server $(TARGET_DIR)/usr/games/prboom-game-server
-	$(INSTALL) -D $(PRBOOM_DIR)/data/prboom.wad $(TARGET_DIR)/usr/share/games/doom/prboom.wad
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/games/prboom
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/games/prboom-game-server
-	touch $@
+define PRBOOM_INSTALL_TARGET_CMDS
+	$(INSTALL) -D $(@D)/src/prboom $(TARGET_DIR)/usr/games/prboom
+	$(INSTALL) -D $(@D)/src/prboom-game-server $(TARGET_DIR)/usr/games/prboom-game-server
+	$(INSTALL) -D $(@D)/data/prboom.wad $(TARGET_DIR)/usr/share/games/doom/prboom.wad
+endef
 
-$(PRBOOM_TARGET_CLEAN):
+define PRBOOM_UINSTALL_TARGET_CMDS
 	rm -rf $(TARGET_DIR)/usr/share/games/doom/prboom.wad \
 		$(TARGET_DIR)/usr/games/prboom-game-server \
 		$(TARGET_DIR)/usr/games/prboom
-	-$(MAKE) -C $(PRBOOM_DIR) clean
+endef
+
+$(eval $(call AUTOTARGETS,package/games,prboom))
-- 
1.7.1
