From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Thu, 24 Jul 2008 15:21:54 +0200
Subject: [Buildroot] [PATCH 2/5] SDL_net: add new package SDL_net
In-Reply-To: <1216905717-9197-1-git-send-email-hans-christian.egtvedt@atmel.com>
References: <1216905717-9197-1-git-send-email-hans-christian.egtvedt@atmel.com>
Message-ID: <1216905717-9197-2-git-send-email-hans-christian.egtvedt@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a new package SDL_net. SDL_net is a small, low-level,
cross-platform network library, that can be used with the Simple DirectMedia
Layer library (SDL).

http://www.libsdl.org/projects/SDL_net/

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
---
 package/Config.in          |    1 +
 package/sdl_net/Config.in  |    8 +++++
 package/sdl_net/sdl_net.mk |   66 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 75 insertions(+), 0 deletions(-)
 create mode 100644 package/sdl_net/Config.in
 create mode 100644 package/sdl_net/sdl_net.mk

diff --git a/package/Config.in b/package/Config.in
index 2941033..e07d9e3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -349,6 +349,7 @@ source "package/libungif/Config.in"
 source "package/sdl/Config.in"
 source "package/sdl_image/Config.in"
 source "package/sdl_mixer/Config.in"
+source "package/sdl_net/Config.in"
 source "package/sdl_ttf/Config.in"
 source "package/tiff/Config.in"
 
diff --git a/package/sdl_net/Config.in b/package/sdl_net/Config.in
new file mode 100644
index 0000000..2001d23
--- /dev/null
+++ b/package/sdl_net/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_SDL_NET
+	bool "SDL_net"
+	depends on BR2_PACKAGE_SDL
+	help
+	  SDL_net is a small, low-level, cross-platform network library, that
+	  can be used with the Simple DirectMedia Layer library (SDL).
+
+	  http://www.libsdl.org/projects/SDL_net/
diff --git a/package/sdl_net/sdl_net.mk b/package/sdl_net/sdl_net.mk
new file mode 100644
index 0000000..a0108f3
--- /dev/null
+++ b/package/sdl_net/sdl_net.mk
@@ -0,0 +1,66 @@
+#############################################################
+#
+# SDL_net: network addon for SDL
+#
+#############################################################
+SDL_NET_VERSION:=1.2.7
+SDL_NET_SOURCE:=SDL_net-$(SDL_NET_VERSION).tar.gz
+SDL_NET_SITE:=http://www.libsdl.org/projects/SDL_net/release
+SDL_NET_CAT:=$(ZCAT)
+SDL_NET_DIR:=$(BUILD_DIR)/SDL_net-$(SDL_NET_VERSION)
+
+$(DL_DIR)/$(SDL_NET_SOURCE):
+	$(WGET) -P $(DL_DIR) $(SDL_NET_SITE)/$(SDL_NET_SOURCE)
+
+sdl_net-source: $(DL_DIR)/$(SDL_NET_SOURCE)
+
+$(SDL_NET_DIR)/.unpacked: $(DL_DIR)/$(SDL_NET_SOURCE)
+	$(SDL_NET_CAT) $(DL_DIR)/$(SDL_NET_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(CONFIG_UPDATE) $(SDL_NET_DIR)
+	touch $@
+
+$(SDL_NET_DIR)/.configured: $(SDL_NET_DIR)/.unpacked
+	(cd $(SDL_NET_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=$(STAGING_DIR)/usr \
+		--sysconfdir=/etc \
+		--localstatedir=/var \
+		--with-sdl-prefix=$(STAGING_DIR)/usr \
+		--with-sdl-exec-prefix=$(STAGING_DIR)/usr \
+	)
+	touch $@
+
+$(SDL_NET_DIR)/.compiled: $(SDL_NET_DIR)/.configured
+	$(MAKE) -C $(SDL_NET_DIR)
+	touch $@
+
+$(STAGING_DIR)/usr/lib/libSDL_net.so: $(SDL_NET_DIR)/.compiled
+	$(MAKE) -C $(SDL_NET_DIR) install
+
+$(TARGET_DIR)/usr/lib/libSDL_net.so: $(STAGING_DIR)/usr/lib/libSDL_net.so
+	cp -dpf $(STAGING_DIR)/usr/lib/libSDL_net*.so* $(TARGET_DIR)/usr/lib/
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libSDL_net.so
+
+SDL_NET sdl_net: sdl $(TARGET_DIR)/usr/lib/libSDL_net.so
+
+sdl_net-clean:
+	rm -f $(TARGET_DIR)/usr/lib/libSDL_net*.so*
+	-$(MAKE) -C $(SDL_NET_DIR) uninstall
+	-$(MAKE) -C $(SDL_NET_DIR) clean
+
+sdl_net-dirclean:
+	rm -rf $(SDL_NET_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_SDL_NET)),y)
+TARGETS+=sdl_net
+endif
-- 
1.5.4.3
