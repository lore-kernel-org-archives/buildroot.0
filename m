From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 12 Aug 2007 16:31:36 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sdl
Message-ID: <20070812233136.4F816A684B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-12 16:31:36 -0700 (Sun, 12 Aug 2007)
New Revision: 19475

Log:
Cleanup of SDL to make it build

Modified:
   trunk/buildroot/package/sdl/sdl.mk


Changeset:
Modified: trunk/buildroot/package/sdl/sdl.mk
===================================================================
--- trunk/buildroot/package/sdl/sdl.mk	2007-08-12 23:30:06 UTC (rev 19474)
+++ trunk/buildroot/package/sdl/sdl.mk	2007-08-12 23:31:36 UTC (rev 19475)
@@ -4,6 +4,8 @@
 #
 #############################################################
 SDL_VERSION:=1.2.11
+# 1.2.12 is available, but depends on Pulse Audio 0.9
+# which is not available in buildroot (yet)
 SDL_SOURCE:=SDL-$(SDL_VERSION).tar.gz
 SDL_SITE:=http://www.libsdl.org/release
 SDL_CAT:=$(ZCAT)
@@ -16,7 +18,8 @@
 
 $(SDL_DIR)/.unpacked: $(DL_DIR)/$(SDL_SOURCE)
 	$(SDL_CAT) $(DL_DIR)/$(SDL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(SDL_DIR) package/sdl sdl\*.patch
+	toolchain/patch-kernel.sh $(SDL_DIR) package/sdl sdl-$(SDL_VERSION)\*.patch
+	$(CONFIG_UPDATE) $(SDL_DIR)
 	$(CONFIG_UPDATE) $(SDL_DIR)/build-scripts
 	touch $@
 
@@ -30,28 +33,34 @@
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
 		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
+		--bindir=/bin \
+		--sbindir=/sbin \
 		--libdir=/lib \
-		--libexecdir=/usr/lib \
+		--libexecdir=/lib \
 		--sysconfdir=/etc \
-		--datadir=/usr/share \
+		--datadir=/share \
 		--localstatedir=/var \
 		--includedir=/include \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
+		--mandir=/man \
+		--infodir=/info \
 		--disable-arts \
 		--disable-esd \
 		--disable-nasm \
 		--disable-video-x11 );
 	touch $@
 
-$(SDL_DIR)/.compiled: $(SDL_DIR)/.configured
-	$(MAKE1) -C $(SDL_DIR) 
+$(STAGING_DIR)/include/directfb:
+	ln -s ../usr/include/directfb $(STAGING_DIR)/include/directfb
+
+$(SDL_DIR)/.compiled: $(SDL_DIR)/.configured $(STAGING_DIR)/include/directfb
+	$(MAKE1) $(TARGET_CONFIGURE_OPTS)	\
+		INCLUDE="-I./include -I$(STAGING_DIR)/usr/include/directfb" \
+		LDFLAGS=-L$(STAGING_DIR)/usr \
+		DESTDIR=$(STAGING_DIR)/usr -C $(SDL_DIR) 
 	touch $@
 
 $(STAGING_DIR)/usr/lib/libSDL.so: $(SDL_DIR)/.compiled
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(SDL_DIR) install;
+	$(MAKE) DESTDIR=$(STAGING_DIR)/usr -C $(SDL_DIR) install;
 	touch -c $@
 
 $(TARGET_DIR)/usr/lib/libSDL.so: $(STAGING_DIR)/usr/lib/libSDL.so
