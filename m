From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 23 Jul 2007 05:40:44 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mplayer
Message-ID: <20070723124044.664C930041@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-23 05:40:43 -0700 (Mon, 23 Jul 2007)
New Revision: 19229

Log:
Cleanup of mplayer package

Modified:
   trunk/buildroot/package/mplayer/mplayer.mk


Changeset:
Modified: trunk/buildroot/package/mplayer/mplayer.mk
===================================================================
--- trunk/buildroot/package/mplayer/mplayer.mk	2007-07-23 12:33:22 UTC (rev 19228)
+++ trunk/buildroot/package/mplayer/mplayer.mk	2007-07-23 12:40:43 UTC (rev 19229)
@@ -3,10 +3,10 @@
 # mplayer
 #
 #############################################################
-MPLAYER_VER:=1.0rc1
-MPLAYER_SOURCE:=MPlayer-$(MPLAYER_VER).tar.bz2
+MPLAYER_VERSION:=1.0rc1
+MPLAYER_SOURCE:=MPlayer-$(MPLAYER_VERSION).tar.bz2
 MPLAYER_SITE:=http://www7.mplayerhq.hu/MPlayer/releases
-MPLAYER_DIR:=$(BUILD_DIR)/MPlayer-$(MPLAYER_VER)
+MPLAYER_DIR:=$(BUILD_DIR)/MPlayer-$(MPLAYER_VERSION)
 MPLAYER_CAT:=$(BZCAT)
 MPLAYER_BINARY:=mplayer
 MPLAYER_TARGET_BINARY:=usr/bin/$(MPLAYER_BINARY)
@@ -22,12 +22,13 @@
 
 $(MPLAYER_DIR)/.unpacked: $(DL_DIR)/$(MPLAYER_SOURCE)
 	$(MPLAYER_CAT) $(DL_DIR)/$(MPLAYER_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(MPLAYER_DIR) package/mplayer/ mplayer-$(MPLAYER_VER)\*.patch\*
-	@touch $@
+	toolchain/patch-kernel.sh $(MPLAYER_DIR) package/mplayer/ mplayer-$(MPLAYER_VERSION)\*.patch\*
+	touch $@
 
 $(MPLAYER_DIR)/.configured: $(MPLAYER_DIR)/.unpacked
 	(cd $(MPLAYER_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
 		./configure \
@@ -46,16 +47,16 @@
 		--disable-tv \
 		--enable-dynamic-plugins \
 	);
-	@touch $@
+	touch $@
 
 $(MPLAYER_DIR)/$(MPLAYER_BINARY): $(MPLAYER_DIR)/.configured
 	$(MAKE) -C $(MPLAYER_DIR)
-	@touch -c $@
+	touch -c $@
 
 $(TARGET_DIR)/$(MPLAYER_TARGET_BINARY): $(MPLAYER_DIR)/$(MPLAYER_BINARY)
 	$(INSTALL) -m 0755 -D $(MPLAYER_DIR)/$(MPLAYER_BINARY) $(TARGET_DIR)/$(MPLAYER_TARGET_BINARY)
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/$(MPLAYER_TARGET_BINARY)
-	@touch -c $@
+	touch -c $@
 
 mplayer: uclibc libmad $(TARGET_DIR)/$(MPLAYER_TARGET_BINARY)
 
