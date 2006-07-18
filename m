From: andersen@uclibc.org <andersen@uclibc.org>
Date: Tue Jul 18 02:00:42 2006
Subject: [Buildroot] svn commit: trunk/buildroot/package/xorg
Message-ID: <20060718075510.BE36A38779@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-07-18 00:19:10 -0700 (Tue, 18 Jul 2006)
New Revision: 15712

Log:
fixup some build and dependancy problems.


Modified:
   trunk/buildroot/package/xorg/xorg.mk


Changeset:
Modified: trunk/buildroot/package/xorg/xorg.mk
===================================================================
--- trunk/buildroot/package/xorg/xorg.mk	2006-07-17 03:53:12 UTC (rev 15711)
+++ trunk/buildroot/package/xorg/xorg.mk	2006-07-18 07:19:10 UTC (rev 15712)
@@ -11,7 +11,7 @@
 	xauth/xauth xinit/xinit xsetroot/xsetroot xset/xset \
 	xterm/xterm mkfontscale/mkfontscale mkfontdir/mkfontdir
 
-XORG_LIBS:= Xft fontconfig freetype expat Xrender Xaw Xmu Xt \
+XORG_LIBS:= Xft fontconfig expat Xrender Xaw Xmu Xt \
 	SM ICE Xpm Xp Xext X11 Xmuu
 
 #############################################################
@@ -27,8 +27,8 @@
 XORG_DIR:=$(BUILD_DIR)/xc
 XORG_LDIR:=$(XORG_DIR)/lib
 XORG_PROGS:=$(XORG_DIR)/programs
-TARGET_BINX:=/usr/X11R6/bin/
-TARGET_LIBX:=/usr/X11R6/lib/
+TARGET_BINX:=/usr/X11R6/bin
+TARGET_LIBX:=/usr/X11R6/lib
 XORG_BINX:=$(TARGET_DIR)$(TARGET_BINX)
 XORG_LIBX:=$(TARGET_DIR)$(TARGET_LIBX)
 XORG_CF:=$(XORG_DIR)/config/cf/cross.def
@@ -49,7 +49,7 @@
 $(DL_DIR)/$(XORG_SOURCE):
 	$(WGET) -P $(DL_DIR) $(XORG_SITE)/$(XORG_SOURCE)
 
-$(XORG_DIR)/.configure: $(DL_DIR)/$(XORG_SOURCE)
+$(XORG_DIR)/.configured: $(DL_DIR)/$(XORG_SOURCE)
 	$(XORG_CAT) $(DL_DIR)/$(XORG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(XORG_DIR) package/xorg/ \*.patch
 	$(SED) 's:REPLACE_STAGING_DIR:$(STAGING_DIR):g' $(XORG_HOST_DEF)
@@ -63,13 +63,14 @@
 	$(SED) 's:#.*define.*HasPam.*YES::g' $(XORG_DIR)/config/cf/linux.cf
 	$(SED) 's:#.*define.*CrossCompiling.*NO:#define CrossCompiling YES:g' $(XORG_DIR)/config/cf/Imake.tmpl
 	$(SED) 's:#.*undef.*CrossCompileDir.*:#define CrossCompileDir$(STAGING_DIR)/bin:g' $(XORG_DIR)/config/cf/Imake.tmpl
-	touch $(XORG_DIR)/.configure
+	touch $(XORG_DIR)/.configured
 
-$(XORG_XSERVER): $(XORG_DIR)/.configure
+$(XORG_XSERVER): $(XORG_DIR)/.configured
 	rm -f $(TARGET_XSERVER) $(XORG_XSERVER)
 	( cd $(XORG_DIR) ; $(MAKE) \
 		PKG_CONFIG=$(STAGING_DIR)/$(PKGCONFIG_TARGET_BINARY) \
 		World XCURSORGEN=xcursorgen MKFONTSCALE=mkfontscale )
+	touch -c $(XORG_XSERVER)
 
 $(TARGET_XSERVER): $(XORG_XSERVER)
 	-mkdir -p $(XORG_BINX)
@@ -88,27 +89,31 @@
 	cp -LRf $(XORG_DIR)/fonts/bdf/misc/*.bdf $(XORG_LIBX)/X11/fonts/misc/
 	( cd $(XORG_LIBX)/X11/fonts/misc/; mkfontdir )
 	(cd $(TARGET_DIR)/usr/bin; ln -snf $(TARGET_BINX) X11)
+	touch -c $(TARGET_XSERVER)
 
-$(XORG_LIBX)/libX11.so.6.2: $(XORG_XSERVER)
+$(XORG_LIBX)/libX11.so.6.2: $(TARGET_XSERVER)
 	-mkdir -p $(XORG_LIBX)
-	for dirs in $(XORG_LIBS) ; do \
-		file=`find $(XORG_LDIR)/$$dirs -type f -iname "lib$$dirs.so*"` ; \
+	set -e; for dirs in $(XORG_LIBS) ; do \
+		file=`find $(XORG_LDIR)/$$dirs -type f -iname "*$$dirs.so*"` ; \
 		$(STRIP) --strip-unneeded $$file ; \
 		cp -f $$file $(XORG_LIBX) ; \
-		file=`find $(XORG_LDIR)/$$dirs -type l -iname "lib$$dirs.so*"` ; \
+		file=`find $(XORG_LDIR)/$$dirs -type l -iname "*$$dirs.so*"` ; \
 		cp -pRf $$file $(XORG_LIBX) ; \
 	done
 	(cd $(TARGET_DIR)/usr/lib; ln -snf $(TARGET_LIBX) X11)
-	echo "$(TARGET_LIBX)" >> $(TARGET_DIR)/etc/ld.so.conf
+	if [ grep -q '$(TARGET_LIBX)' $(TARGET_DIR)/etc/ld.so.conf ] ; then \
+		echo "$(TARGET_LIBX)" >> $(TARGET_DIR)/etc/ld.so.conf; \
+	fi;
+	touch -c $(XORG_LIBX)/libX11.so.6.2
 
 
-$(STAGING_DIR)$(TARGET_LIBX)/libX11.so.6.2: $(XORG_LIBX)/libX11.so.6.2
+$(STAGING_DIR)$(TARGET_LIBX)/libX11.so.6.2: $(XORG_XSERVER)
 	-mkdir -p $(STAGING_DIR)$(TARGET_LIBX)
 	( cd $(XORG_DIR); $(MAKE) \
 		DESTDIR=$(STAGING_DIR) install XCURSORGEN=xcursorgen MKFONTSCALE=mkfontscale )
 	touch -c $(STAGING_DIR)$(TARGET_LIBX)/libX11.so.6.2
 
-xorg: zlib png $(XORG_LIBX)/libX11.so.6.2 $(TARGET_XSERVER) $(STAGING_DIR)$(TARGET_LIBX)/libX11.so.6.2
+xorg: zlib png $(XORG_LIBX)/libX11.so.6.2 $(STAGING_DIR)$(TARGET_LIBX)/libX11.so.6.2
 
 xorg-source: $(DL_DIR)/$(XORG_SOURCE)
 
