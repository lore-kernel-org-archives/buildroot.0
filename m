From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Fri, 16 Nov 2007 07:33:47 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  sdl_ttf
Message-ID: <20071116153347.944BE30040@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-11-16 07:33:46 -0800 (Fri, 16 Nov 2007)
New Revision: 20439

Log:
add SDL_ttf package

Added:
   trunk/buildroot/package/sdl_ttf/
   trunk/buildroot/package/sdl_ttf/Config.in
   trunk/buildroot/package/sdl_ttf/sdl_ttf.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-11-16 14:32:35 UTC (rev 20438)
+++ trunk/buildroot/package/Config.in	2007-11-16 15:33:46 UTC (rev 20439)
@@ -304,6 +304,7 @@
 source "package/libpng/Config.in"
 source "package/libungif/Config.in"
 source "package/sdl/Config.in"
+source "package/sdl_ttf/Config.in"
 source "package/tiff/Config.in"
 
 comment "busybox graphic applications" 

Added: trunk/buildroot/package/sdl_ttf/Config.in
===================================================================
--- trunk/buildroot/package/sdl_ttf/Config.in	                        (rev 0)
+++ trunk/buildroot/package/sdl_ttf/Config.in	2007-11-16 15:33:46 UTC (rev 20439)
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_SDL_TTF
+	bool "SDL_TTF"
+	default n
+	help
+
+	  http://www.libsdl.org/projects/SDL_ttf/

Added: trunk/buildroot/package/sdl_ttf/sdl_ttf.mk
===================================================================
--- trunk/buildroot/package/sdl_ttf/sdl_ttf.mk	                        (rev 0)
+++ trunk/buildroot/package/sdl_ttf/sdl_ttf.mk	2007-11-16 15:33:46 UTC (rev 20439)
@@ -0,0 +1,79 @@
+#############################################################
+#
+# SDL_ttf
+#
+#############################################################
+SDL_TTF_VERSION:=2.0.9
+SDL_TTF_SOURCE:=SDL_ttf-$(SDL_TTF_VERSION).tar.gz
+SDL_TTF_SITE:=http://www.libsdl.org/projects/SDL_ttf/release/
+SDL_TTF_CAT:=$(ZCAT)
+SDL_TTF_DIR:=$(BUILD_DIR)/SDL_ttf-$(SDL_TTF_VERSION)
+
+$(DL_DIR)/$(SDL_TTF_SOURCE):
+	$(WGET) -P $(DL_DIR) $(SDL_TTF_SITE)/$(SDL_TTF_SOURCE)
+
+sdl_ttf-source: $(DL_DIR)/$(SDL_TTF_SOURCE)
+
+$(SDL_TTF_DIR)/.unpacked: $(DL_DIR)/$(SDL_TTF_SOURCE)
+	$(SDL_TTF_CAT) $(DL_DIR)/$(SDL_TTF_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(CONFIG_UPDATE) $(SDL_TTF_DIR)
+	touch $@
+
+$(SDL_TTF_DIR)/.configured: $(SDL_TTF_DIR)/.unpacked
+	(cd $(SDL_TTF_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--exec-prefix=/usr \
+		--bindir=/bin \
+		--sbindir=/sbin \
+		--libdir=/lib \
+		--libexecdir=/lib \
+		--sysconfdir=/etc \
+		--datadir=/share \
+		--localstatedir=/var \
+		--includedir=/include \
+		--mandir=/man \
+		--infodir=/info \
+		--without-x \
+		--with-freetype-prefix=$(STAGING_DIR)/usr \
+		--with-sdl-prefix=$(STAGING_DIR)/usr \
+		)
+	touch $@
+
+$(SDL_TTF_DIR)/.compiled: $(SDL_TTF_DIR)/.configured
+	$(MAKE1) $(TARGET_CONFIGURE_OPTS) \
+		INCLUDE="-I$(STAGING_DIR)/usr/include/SDL" \
+		LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
+		DESTDIR=$(STAGING_DIR)/usr -C $(SDL_TTF_DIR)
+	touch $@
+
+$(STAGING_DIR)/usr/lib/libSDL_ttf.so: $(SDL_TTF_DIR)/.compiled
+	$(MAKE) DESTDIR=$(STAGING_DIR)/usr -C $(SDL_TTF_DIR) install
+	touch -c $@
+
+$(TARGET_DIR)/usr/lib/libSDL_ttf.so: $(STAGING_DIR)/usr/lib/libSDL_ttf.so
+	cp -dpf $(STAGING_DIR)/usr/lib/libSDL_ttf*.so* $(TARGET_DIR)/usr/lib/
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libSDL_ttf.so
+
+SDL sdl_ttf: uclibc $(TARGET_DIR)/usr/lib/libSDL_ttf.so
+
+sdl_ttf-clean:
+	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(SDL_TTF_DIR) uninstall
+	-$(MAKE) -C $(SDL_TTF_DIR) clean
+
+sdl_ttf-dirclean:
+	rm -rf $(SDL_TTF_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_SDL_TTF)),y)
+TARGETS+=sdl_ttf
+endif
